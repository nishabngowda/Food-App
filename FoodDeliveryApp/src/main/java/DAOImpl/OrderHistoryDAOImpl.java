package DAOImpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.OrderHistory;

public class OrderHistoryDAOImpl {
    private Connection con;

    // Constructor to initialize the connection
    public OrderHistoryDAOImpl() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tapfoods", "root", "Zaynish@123");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Method to retrieve order history by user ID
    public List<OrderHistory> getOrderHistoryByUserId(int userId) {
        List<OrderHistory> orderHistoryList = new ArrayList<>();
        String query = "SELECT * FROM orderhistory WHERE userid = ?";
        
        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                OrderHistory orderHistory = new OrderHistory();
                orderHistory.setOrderHistoryId(rs.getInt("orderhistoryid"));
                orderHistory.setOrderId(rs.getInt("orderid"));
                orderHistory.setUserId(rs.getInt("userid"));
                orderHistory.setOrderDate(rs.getTimestamp("orderdate"));  // Using Timestamp to match the datetime field
                orderHistory.setTotalAmount(rs.getFloat("totalamount"));
                orderHistory.setStatus(rs.getString("status"));
                
                orderHistoryList.add(orderHistory);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return orderHistoryList;
    }
}
