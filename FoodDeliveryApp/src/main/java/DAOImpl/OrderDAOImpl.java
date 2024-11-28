package DAOImpl;

import model.Order;
import model.CartItem;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class OrderDAOImpl {
    private Connection con;

    public OrderDAOImpl() {
        // Set up the database connection
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tapfoods", "root", "Zaynish@123");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean saveOrder(Order order, List<CartItem> cart) {
        String insertOrderQuery = "INSERT INTO ordertable (restaurantid, userid, orderdate, totalamount, status, paymentmode) VALUES (?, ?, ?, ?, ?, ?)";
        String insertOrderItemQuery = "INSERT INTO orderitem (orderid, menuid, quantity, itemtotal) VALUES (?, ?, ?, ?)";
        boolean orderSuccess = false;

        try {
            con.setAutoCommit(false); // Start transaction

            // Insert the order
            PreparedStatement pstmt = con.prepareStatement(insertOrderQuery, PreparedStatement.RETURN_GENERATED_KEYS);
            pstmt.setInt(1, order.getRestaurantId());
            pstmt.setInt(2, order.getUserId());
            pstmt.setTimestamp(3, order.getOrderDate());
            pstmt.setDouble(4, order.getTotalAmount());
            pstmt.setString(5, order.getStatus());
            pstmt.setString(6, order.getPaymentMode());
            pstmt.executeUpdate();

            // Retrieve the generated order ID
            ResultSet rs = pstmt.getGeneratedKeys();
            int orderId = 0;
            if (rs.next()) {
                orderId = rs.getInt(1);
            }

            // Insert the cart items as order items
            for (CartItem item : cart) {
                PreparedStatement itemPstmt = con.prepareStatement(insertOrderItemQuery);
                itemPstmt.setInt(1, orderId);
                itemPstmt.setInt(2, item.getMenuId());
                itemPstmt.setInt(3, item.getQuantity());
                itemPstmt.setDouble(4, item.getSubtotal());
                itemPstmt.executeUpdate();
            }

            con.commit(); // Commit the transaction
            orderSuccess = true;
        } catch (SQLException e) {
            try {
                con.rollback(); // Rollback transaction in case of error
            } catch (SQLException rollbackException) {
                rollbackException.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                con.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return orderSuccess;
    }
}
