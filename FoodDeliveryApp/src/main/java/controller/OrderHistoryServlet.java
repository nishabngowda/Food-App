package controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAOImpl.OrderHistoryDAOImpl;
import model.OrderHistory;

@WebServlet("/orderHistory")
public class OrderHistoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));  // Assuming userId is passed as a request parameter
        
        OrderHistoryDAOImpl orderHistoryDAO = new OrderHistoryDAOImpl();
        List<OrderHistory> orderHistoryList = orderHistoryDAO.getOrderHistoryByUserId(userId);
        
        request.setAttribute("orderHistoryList", orderHistoryList);  // Set order history list as request attribute
        request.getRequestDispatcher("/orderHistory.jsp").forward(request, response);  // Forward to JSP
    }
}
