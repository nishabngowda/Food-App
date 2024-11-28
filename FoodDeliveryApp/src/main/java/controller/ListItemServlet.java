package controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MenuDAO;
import DAOImpl.MenuDAOImpl;
import model.Menu;

@WebServlet("/listItem")
public class ListItemServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MenuDAO menuDAO = new MenuDAOImpl();
        
        // Get all menu items
        List<Menu> menuItems = menuDAO.getAllMenuItems();
        
        // Set the menu items as a request attribute
        request.setAttribute("menuItems", menuItems);
        
        // Forward to the JSP page
        request.getRequestDispatcher("listItem.jsp").forward(request, response);
    }
}
