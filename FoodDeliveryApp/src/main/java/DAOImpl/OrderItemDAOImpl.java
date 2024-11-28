package DAOImpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.OrderItem;

public class OrderItemDAOImpl {
    private Connection con;

    public OrderItemDAOImpl() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tapfoods", "root", "Zaynish@123");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Insert each item into orderitem table
    public void insertOrderItem(OrderItem orderItem) {
        String query = "INSERT INTO orderitem (orderid, menuid, quantity, itemtotal) VALUES (?, ?, ?, ?)";
        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setInt(1, orderItem.getOrderid());
            pstmt.setInt(2, orderItem.getMenuid());
            pstmt.setInt(3, orderItem.getQuantity());
            pstmt.setDouble(4, orderItem.getItemtotal());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
