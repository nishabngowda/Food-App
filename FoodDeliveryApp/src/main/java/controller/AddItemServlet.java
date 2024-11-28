package controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MenuDAO;
import DAOImpl.MenuDAOImpl;
import model.Menu;

@WebServlet("/addItem")
public class AddItemServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // Get parameters from the request
	    int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));
	    String itemName = request.getParameter("itemName");
	    float price = Float.parseFloat(request.getParameter("price"));
	    String description = request.getParameter("description");
	    String imgPath = request.getParameter("imgPath");
	    boolean isAvailable = request.getParameter("isAvailable") != null;

	    // Create a Menu object
	    Menu menu = new Menu();
	    menu.setRestaurantId(restaurantId);
	    menu.setItemname(itemName);
	    menu.setPrice(price);
	    menu.setDescription(description);
	    menu.setImgpath(imgPath);
	    menu.setIsavailable(isAvailable);

	    // Call the DAO to add the menu item
	    MenuDAOImpl menuDao = new MenuDAOImpl();
	    menuDao.addMenuItem(menu);

	    // Redirect to the success page with the item name
	    response.sendRedirect("additemSucces.jsp?itemName=" + URLEncoder.encode(itemName, "UTF-8"));
	}


}
