package controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import DAOImpl.MenuDAOImpl;
import model.Menu;

// Use @WebServlet to map the URL path to this servlet

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {
    private MenuDAOImpl menuDAO;

    protected void service(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Initialize MenuDAO
        menuDAO = new MenuDAOImpl();

        // Retrieve the restaurant ID from the request
        String restaurantIdStr = request.getParameter("restaurantId");
        int restaurantId = Integer.parseInt(restaurantIdStr);

        // Get menu list from DAO based on restaurant ID
        List<Menu> menuList = menuDAO.getMenuByRestaurantId(restaurantId);

        // Store the menuList in session
        HttpSession session = request.getSession();
        session.setAttribute("menuList", menuList);

        // Forward to menu.jsp to display the menu items
        RequestDispatcher dispatcher = request.getRequestDispatcher("menu.jsp");
        dispatcher.forward(request, response);
    }
}
