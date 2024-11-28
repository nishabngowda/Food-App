<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback - TapFoods</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Your Feedback</h1>
    </header>

    <div class="container">
        <h2>Thank You for Your Feedback!</h2>
        <p>Your message:</p>
        <blockquote>
            <%= session.getAttribute("feedbackMessage") %>
        </blockquote>
        
        <p><a href="contactus.jsp">Back to Contact Us</a></p>
        
        <% 
            // Clear the session attribute to avoid showing the message again
            session.removeAttribute("feedbackMessage"); 
        %>
    </div>

    <footer class="footer">
        <p>© 2024 TapFoods. All rights reserved. | <a href="about.jsp">About Us</a></p>
    </footer>
</body>
</html>
