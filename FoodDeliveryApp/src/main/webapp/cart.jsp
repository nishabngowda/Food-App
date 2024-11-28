<%@ page import="java.util.List" %>
<%@ page import="model.CartItem" %>

<%
    // Retrieve the cart from the session
    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 20px;
        }

        h1 {
            margin: 0; /* Remove default margin */
        }

        nav {
            padding: 10px 20px; /* Padding for the nav */
            display: flex; /* Flexbox for horizontal alignment */
            justify-content: space-between; /* Align items on both sides */
            align-items: center; /* Align items vertically */
        }

        .logo {
            font-size: 24px;
            font-weight: 1000;
            color: #508D4E;
        }

        nav ul {
            list-style: none; /* Remove bullet points */
            padding: 0; /* Remove default padding */
            margin: 0; /* Remove default margin */
            display: flex; /* Flexbox for horizontal layout */
        }

        nav ul li {
            margin: 0 25px; /* Space between nav items */
        }

        nav ul li a {
            color:  #508D4E; /* White text for nav links */
            text-decoration: none; /* Remove underline from links */
            font-weight: 900; /* Make the font slightly bolder */
        }

        nav ul li a:hover {
            text-decoration: underline; /* Underline on hover */
        }

        h2 {
            text-align: right;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color:  #508D4E;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #e9ecef;
        }

        form {
            display: inline;
        }

        input[type="submit"] {
            background-color:  #508D4E;
            color: white;
            border: none;
            padding: 8px 12px;
            cursor: pointer;
            border-radius: 4px; /* Rounded corners */
        }

        input[type="submit"]:hover {
            background-color: #80AF81; /* Darker red on hover */
        }

        .total {
            font-weight: bold;
            font-size: 1.2em;
            margin-top: 20px;
            text-align: right;
        }

        .proceed-button {
            text-align: right; /* Align the button to the right */
            margin-top: 20px; /* Adds some space above the button */
        }

        .proceed-button button {
            background: #508D4E; /* Button background color */
            color: white; /* Text color */
            padding: 10px 20px; /* Button padding */
            border: none; /* Removes default border */
            border-radius: 5px; /* Rounded corners */
            cursor: pointer; /* Pointer cursor on hover */
            transition: background 0.3s; /* Transition effect */
        }

        .proceed-button button:hover {
            background: #80AF81; /* Darker color on hover */
        }
	
    </style>
</head>
<body>

    <header>
        <nav>
            <div class="logo">AVOCADO</div> <!-- Logo on the left -->
            <ul>
                <li><a href="home.jsp">Home</a></li>
                <li><a href="about.jsp">About</a></li>
                <li><a href="contactUs.jsp">Contact</a></li>
            </ul>
        </nav>
    </header>

    <table>
        <tr>
            <th>Item Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Subtotal</th>
            <th>Action</th>
        </tr>

        <%
        double total = 0.0;
        if (cart != null && !cart.isEmpty()) {
            for (CartItem item : cart) {
                double subtotal = item.getSubtotal();
                total += subtotal;
        %>
        <tr>
            <td><%= item.getItemName() %></td>
            <td><%= item.getPrice() %></td>
            <td><%= item.getQuantity() %></td>
            <td><%= subtotal %></td>
            <td>
                <form action="cart" method="post">
                    <input type="hidden" name="menuId" value="<%= item.getMenuId() %>">
                    <input type="hidden" name="action" value="remove">
                    <input type="submit" value="Remove">
                </form>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="5">Your cart is empty.</td>
        </tr>
        <%
        }
        %>
    </table>

    <div class="total">
        Total Amount: <%= total %>
    </div>

    <div class="proceed-button">
        <form action="checkout.jsp" method="post">
            <button type="submit">Proceed to Pay</button>
        </form>
    </div>

</body>
</html>
