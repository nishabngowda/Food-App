package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/updateOrderStatus")
public class UpdateOrderStatusServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        String newStatus = request.getParameter("status");

        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            // Connect to the database
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tapfoods", "root", "Zaynish@123");

            // Update the status of the order
            String query = "UPDATE orderhistory SET status = ? WHERE orderid = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, newStatus);
            pstmt.setInt(2, orderId);
            pstmt.executeUpdate();

            // Redirect back to view orders page
            response.sendRedirect("viewOrders.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // You can handle errors here
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
