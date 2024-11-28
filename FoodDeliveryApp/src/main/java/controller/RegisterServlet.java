package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserDAO;
import DAOImpl.UserDAOImpl;
import model.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
        String name = request.getParameter("username");
        String email = request.getParameter("email");
        String phonenumber = request.getParameter("phonenumber");
        String password = request.getParameter("password");
        String confirm_password = request.getParameter("confirm_password");
        String address = request.getParameter("address");

        UserDAO userDAO = new UserDAOImpl();
        
        // Check if the user already exists based on email, phone number, or username
        User existingUser = userDAO.getUser(email);
        if (existingUser == null) { // If user does not exist, proceed with registration
            // Check if passwords match
            if (password.equals(confirm_password)) {
                User user = new User();
                user.setUsername(name);
                user.setEmail(email);
                user.setPhonenumber(phonenumber);
                user.setPassword(password); // Ensure to hash the password before storing in production
                user.setAddress(address);
                
                // Insert new user into the database
                boolean isRegistered = userDAO.insertUser(user);
                
                if (isRegistered) {
                    response.sendRedirect("login.jsp"); // Redirect to login page after successful registration
                } else {
                    request.setAttribute("error", "Registration failed. Please try again.");
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("error", "Passwords do not match.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("error", "User already exists with this email or phone number.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
