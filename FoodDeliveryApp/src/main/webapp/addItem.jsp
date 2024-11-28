<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Item</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        header {
            background-color: #4CAF50;
            color: white;
            padding: 20px;
            text-align: center;
        }
        .container {
            max-width: 600px;
            margin: 40px auto;
            padding: 20px;
            background: white;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="number"],
        input[type="text"],
        textarea {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-bottom: 20px; /* Space between fields */
            font-size: 16px;
        }
        textarea {
            resize: vertical; /* Allow vertical resizing only */
            min-height: 100px; /* Minimum height for the textarea */
        }
        input[type="checkbox"] {
            margin: 10px 0; /* Margin for checkbox */
        }
        input[type="submit"] {
            background-color: #4CAF50; /* Green background */
            color: white; /* White text */
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer; /* Pointer cursor */
            font-size: 16px;
            transition: background-color 0.3s; /* Transition effect */
        }
        input[type="submit"]:hover {
            background-color: #45a049; /* Darker green on hover */
        }
        .success-message {
            display: none; /* Hidden by default */
            text-align: center;
            margin: 20px 0;
            font-size: 18px;
            color: #4CAF50;
            border: 1px solid #4CAF50;
            padding: 10px;
            border-radius: 5px;
            background-color: #e7f9e7;
        }
        .success-icon {
            margin-right: 10px;
            color: #4CAF50; /* Green color */
        }
        .back-link {
            text-align: center;
            margin-top: 20px;
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
    <header>
        <h1>Add New Menu Item</h1>
    </header>
    
    <div class="container">
        <!-- Display success message if available -->
        <%
            String successMessage = (String) request.getAttribute("successMessage");
            if (successMessage != null) {
        %>
            <div class="success-message">
                <span class="success-icon">✔️</span><%= successMessage %>
            </div>
        <%
            }
        %>

        <form action="addItem" method="post">
            <label for="restaurantId">Restaurant ID:</label>
            <input type="number" id="restaurantId" name="restaurantId" required>

            <label for="itemName">Item Name:</label>
            <input type="text" id="itemName" name="itemName" required>

            <label for="price">Price:</label>
            <input type="text" id="price" name="price" required>

            <label for="description">Description:</label>
            <textarea id="description" name="description" required></textarea>

            <label for="imgPath">Image Path:</label>
            <input type="text" id="imgPath" name="imgPath">

            <label for="isAvailable">Available:</label>
            <input type="checkbox" id="isAvailable" name="isAvailable">

            <input type="submit" value="Add Item">
        </form>
        
        <div class="back-link">
            <p><a href="admin.jsp">Back to Admin Page</a></p>
        </div>
    </div>
</body>
</html>
