package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/submitContactForm")
public class SubmitContactFormServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Retrieve form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        // Here you can process the data (e.g., save it to a database, send an email, etc.)
        // For demonstration, we're just printing to the console
        System.out.println("Name: " + name);
        System.out.println("Email: " + email);
        System.out.println("Message: " + message);

        // Store the message in the session to display on the feedback page
        HttpSession session = request.getSession();
        session.setAttribute("feedbackMessage", message);

        // Redirect to the feedback page
        response.sendRedirect("feedback.jsp");
    }
}

