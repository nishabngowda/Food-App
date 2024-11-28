<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.OrderHistory" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order History</title>
    <style>
        /* Add your styles here */
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        
        table, th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }
        
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>

<h2>Order History</h2>

<table>
    <thead>
        <tr>
            <th>Order History ID</th>
            <th>Order ID</th>
            <th>User ID</th>
            <th>Order Date</th>
            <th>Total Amount</th>
            <th>Status</th>
        </tr>
    </thead>
    <tbody>
        <%
            List<OrderHistory> orderHistoryList = (List<OrderHistory>) request.getAttribute("orderHistoryList");
            if (orderHistoryList != null) {
                for (OrderHistory order : orderHistoryList) {
        %>
        <tr>
            <td><%= order.getOrderHistoryId() %></td>
            <td><%= order.getOrderId() %></td>
            <td><%= order.getUserId() %></td>
            <td><%= order.getOrderDate() %></td>
            <td><%= order.getTotalAmount() %></td>
            <td><%= order.getStatus() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="6">No order history found.</td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>



</body>
</html>
