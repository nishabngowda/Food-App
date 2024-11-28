package controller;

import model.Order;
import model.OrderItem;
import model.User;
import model.CartItem;
import DAOImpl.OrderDAOImpl;
import DAOImpl.OrderItemDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.List;

@WebServlet("/confirmOrder")
public class ConfirmOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form parameters
        String paymentMode = request.getParameter("payment");
        String address = request.getParameter("address");
        double totalAmount = Double.parseDouble(request.getParameter("totalamount"));

        // Simulate restaurant ID and user ID (replace with actual session data)
        int restaurantId = 1; // Get this dynamically from session
        int userId = 1; // Get this dynamically from session

        // Get the current date and time
        java.util.Date orderDate = new java.util.Date();
        String status = "Pending";

        // Retrieve the cart from the session
        List<CartItem> cart = (List<CartItem>) request.getSession().getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            request.setAttribute("errorMessage", "Your cart is empty.");
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
            return;
        }

        Connection con = null;
        PreparedStatement pstmtOrder = null;
        PreparedStatement pstmtOrderHistory = null;

        try {
            // Establish a connection
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tapfoods", "root", "Zaynish@123");

            // Insert the order into the ordertable
            String orderQuery = "INSERT INTO ordertable (restaurantid, userid, orderdate, totalamount, status, paymentmode) VALUES (?, ?, ?, ?, ?, ?)";
            pstmtOrder = con.prepareStatement(orderQuery, Statement.RETURN_GENERATED_KEYS);
            pstmtOrder.setInt(1, restaurantId);
            pstmtOrder.setInt(2, userId);
            pstmtOrder.setTimestamp(3, new java.sql.Timestamp(orderDate.getTime())); // Current date
            pstmtOrder.setDouble(4, totalAmount);
            pstmtOrder.setString(5, status);
            pstmtOrder.setString(6, paymentMode);

            int rowsInserted = pstmtOrder.executeUpdate();

            if (rowsInserted > 0) {
                // Get the generated order ID
                ResultSet generatedKeys = pstmtOrder.getGeneratedKeys();
                int orderId = 0;
                if (generatedKeys.next()) {
                    orderId = generatedKeys.getInt(1);
                }

                // Insert order history record
                String orderHistoryQuery = "INSERT INTO orderhistory (orderid, userid, orderdate, totalamount, status) VALUES (?, ?, ?, ?, ?)";
                pstmtOrderHistory = con.prepareStatement(orderHistoryQuery);
                pstmtOrderHistory.setInt(1, orderId);
                pstmtOrderHistory.setInt(2, userId);
                pstmtOrderHistory.setTimestamp(3, new java.sql.Timestamp(orderDate.getTime())); // Current date
                pstmtOrderHistory.setDouble(4, totalAmount);
                pstmtOrderHistory.setString(5, status);

                // Execute the order history insertion
                pstmtOrderHistory.executeUpdate();

                // Insert each cart item into the orderitem table using OrderItemDAOImpl
                OrderItemDAOImpl orderItemDAO = new OrderItemDAOImpl();
                for (CartItem item : cart) {
                    OrderItem orderItem = new OrderItem();
                    orderItem.setOrderid(orderId);
                    orderItem.setMenuid(item.getMenuId());
                    orderItem.setQuantity(item.getQuantity());
                    orderItem.setItemtotal(item.getSubtotal());

                    // Insert order item using DAO
                    orderItemDAO.insertOrderItem(orderItem);
                }

                // Clear the cart from the session after successful order
                request.getSession().removeAttribute("cart");

                // Redirect to the order confirmation page
                response.sendRedirect("orderConfirm.jsp");
            } else {
                // Handle insertion failure
                request.setAttribute("errorMessage", "Order could not be processed.");
                request.getRequestDispatcher("checkout.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error.");
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        } finally {
            try {
                if (pstmtOrder != null) pstmtOrder.close();
                if (pstmtOrderHistory != null) pstmtOrderHistory.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
