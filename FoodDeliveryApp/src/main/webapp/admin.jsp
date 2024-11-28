<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        h1,h2 {
        	color: #4CAF50;
        }
        header {
            border-bottom:2px solid #ddd;
            color: white;
            padding: 20px;
            text-align: center;
        }
        .sidebar {
            height: 100%;
            width: 200px;
            position: fixed;
            padding-top: 20px;
            border-right: 2px solid #ddd; /* Vertical line for sidebar */
        }
        .sidebar ul {
            list-style-type: none;
            padding: 0;
        }
        .sidebar ul li {
            text-align: center;
            margin: 10px 0;
            border-bottom: 1px solid #ddd; /* Line between items */
        }
        .sidebar ul li a {
            display: block;
            color: black; /* Change text color to black */
            padding: 14px;
            text-decoration: none;
        }
        .sidebar ul li a:hover {
            background-color: #4CAF50; /* Light grey on hover */
        }
        .container {
            margin-left: 220px; /* Space for the sidebar */
            padding: 20px;
        }
        footer {
            text-align: center;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
        /* Logout Button Styles */
        .logout-button {
            display: inline-block;
            background-color: #4CAF50; /* Red background */
            color: white; /* White text */
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            border-radius: 5px; /* Rounded corners */
            transition: background-color 0.3s, transform 0.3s; /* Transition effects */
            font-size: 16px; /* Font size */
            border: none; /* No border */
            cursor: pointer; /* Pointer cursor */
        }
        .logout-button:hover {
            background-color:  #80AF81; /* Darker red on hover */
            transform: scale(1.05); /* Slightly enlarge on hover */
        }
    </style>
</head>
<body>
    <header>
        <h1>Welcome to the Admin Page</h1>
        <h2>AVACADO</h2>
    </header>
    
    <div class="sidebar">
        <ul>
            <li><a href="addItem.jsp">Add Items</a></li>
            <li><a href="listItem">List Items</a></li>
            <li><a href="viewOrder.jsp">View Orders</a></li>
            <li><a href="feedback.jsp">Feedback</a></li>
        </ul>
    </div>

    <div class="container">
        <p>Use the navigation on the left to manage your app items and view orders.</p>
        <a href="login.jsp" class="logout-button">Logout</a> <!-- Logout button -->
    </div>

    <footer>
        <p>&copy; 2024 AVACADO. All Rights Reserved.</p>
    </footer>
</body>
</html>
