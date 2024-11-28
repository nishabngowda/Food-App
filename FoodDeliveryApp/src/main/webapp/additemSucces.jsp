<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Item Added Successfully</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Full viewport height */
            margin: 0;
            background-color: #f4f4f4;
        }
        .message-container {
            text-align: center;
            padding: 20px;
            background-color: white;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #4CAF50; /* Green */
        }
        .success-icon {
            font-size: 50px; /* Larger size for the checkmark */
            color: #4CAF50; /* Green color */
        }
        .back-link {
            margin-top: 20px;
            font-size: 18px;
        }
        .back-link a {
            text-decoration: none;
            color: #4CAF50; /* Green color */
            font-weight: bold;
        }
        .back-link a:hover {
            text-decoration: underline; /* Underline on hover */
        }
    </style>
</head>
<body>
    <div class="message-container">
        <span class="success-icon">✔️</span>
        <h1>Item Added Successfully!</h1>
        <p>Your item "<%= request.getParameter("itemName") %>" has been added.</p>
        <div class="back-link">
            <p><a href="addItem.jsp">Add Another Item</a></p>
            <p><a href="admin.jsp">Back to Admin Page</a></p>
        </div>
    </div>
</body>
</html>
