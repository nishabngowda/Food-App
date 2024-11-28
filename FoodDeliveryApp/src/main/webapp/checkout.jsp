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
    <title>Checkout</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #508D4E;
        }

        .container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .cart-section, .payment-section {
            width: 48%; /* Two equal columns */
            padding: 20px;
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        /* Cart Section */
        .cart-section table {
            width: 100%;
            border-collapse: collapse;
        }

        .cart-section th, .cart-section td {
            padding: 15px;
            text-align: left;
            border: 1px solid #ddd;
        }

        .cart-section th {
            background-color: #508D4E;
            color: white;
        }

        .cart-section tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .cart-section .total {
            font-weight: bold;
            font-size: 1.2em;
            margin-top: 20px;
            text-align: right;
        }

        /* Payment Section */
        .payment-section h2 {
            margin-bottom: 15px;
        }

        .payment-options select {
            padding: 10px;
            width: 100%;
            margin-bottom: 20px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        .address-section input, textarea {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .card-details {
            display: none; /* Initially hidden */
            margin-top: 20px;
        }

        .card-details input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .confirm-button {
            text-align: right;
            margin-top: 20px;
        }

        .confirm-button button {
            background: #508D4E;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .confirm-button button:hover {
            background: #80AF81;
        }
    </style>
</head>
<body>

    <h1>Checkout</h1>

    <div class="container">
        <!-- Left Side: Cart Items -->
        <div class="cart-section">
            <h2>Your Cart</h2>
            <table>
                <tr>
                    <th>Item Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Subtotal</th>
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
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="4">Your cart is empty.</td>
                </tr>
                <%
                }
                %>
            </table>

            <div class="totalamount">
                Total Amount: <%= total %>
            </div>
        </div>

        <!-- Right Side: Payment Options and Address -->
        <div class="payment-section">
            <form action="confirmOrder" method="post">
    <h2>Payment Options</h2>
    <div class="paymentmode">
        <select id="paymentOption" name="payment" required>
            <option value="cash">Cash on Delivery</option>
            <option value="card">Credit/Debit Card</option>
        </select>
    </div>

    <div class="address-section">
        <h2>Shipping Address</h2>
        <textarea name="address" rows="4" placeholder="Enter your address" required></textarea>
    </div>

    <div class="confirm-button">
        <input type="hidden" name="totalamount" value="<%= total %>">
        <button type="submit">Confirm Order</button>
    </div>
</form>

        </div>
    </div>

</body>
</html>
