package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.UserDAO;
import DAOImpl.UserDAOImpl;
import model.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get email and password from login.jsp
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Create a UserDAO object to access user data
        UserDAO userDAO = new UserDAOImpl();
        User user = userDAO.getUser(email); // Get user by email

        // Check if the entered credentials match the admin credentials
        if ("nisha@gmail.com".equals(email) && "zaynish@123".equals(password)) {
            // If correct, create a session and redirect to the admin page
            HttpSession session = request.getSession();
            session.setAttribute("LogedInuser", user);
            response.sendRedirect("admin.jsp");
        } 
        // Check if user exists and password is correct for non-admin users
        else if (user != null && password.equals(user.getPassword())) {
            // For normal users, create a session and redirect to the home page
            HttpSession session = request.getSession();
            session.setAttribute("LogedInuser", user);
            response.sendRedirect("home");
        } else {
            // If credentials are invalid, show an error message
            request.setAttribute("error", "Invalid user or password. Please try again.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
