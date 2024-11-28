package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAOImpl.RestaurantDAOImpl;
import model.Restaurant;
import DAO.RestaurantDAO;

/**
 * Servlet implementation class HomeServlet
 */
@WebServlet("/home")
public class HomeServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RestaurantDAO restaurantDAO = new RestaurantDAOImpl();
		ArrayList<Restaurant> restaurantList = restaurantDAO.getALLRestaurant();
		HttpSession session = request.getSession();
		//adding restaurants to session 
		session.setAttribute("restaurantList", restaurantList);
		//sending redirct to home.jsp
		response.sendRedirect("home.jsp");
	}

}
