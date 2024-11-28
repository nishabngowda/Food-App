<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Orders</title>
    <link rel="stylesheet" href="styles.css"> <!-- Include your CSS file -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px 15px;
            text-align: center;
            border: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        select {
            padding: 6px;
            border-radius: 4px;
            border: 1px solid #ccc;
            background-color: white;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 8px 16px;
            cursor: pointer;
            border-radius: 4px;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .container {
            max-width: 1200px;
            margin: auto;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Order History</h2>
        <table>
            <tr>
                <th>Order ID</th>
                <th>User ID</th>
                <th>Order Date</th>
                <th>Total Amount</th>
                <th>Status</th>
                <th>Change Status</th>
            </tr>
            <%
                Connection con = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tapfoods", "root", "Zaynish@123");
                    
                    String query = "SELECT * FROM orderhistory";
                    pstmt = con.prepareStatement(query);
                    rs = pstmt.executeQuery();
                    
                    while (rs.next()) {
                        int orderId = rs.getInt("orderid");
                        int userId = rs.getInt("userid");
                        Timestamp orderDate = rs.getTimestamp("orderdate");
                        double totalAmount = rs.getDouble("totalamount");
                        String status = rs.getString("status");
            %>
                        <tr>
                            <td><%= orderId %></td>
                            <td><%= userId %></td>
                            <td><%= orderDate %></td>
                            <td><%= totalAmount %></td>
                            <td><%= status %></td>
                            <td>
                                <!-- Form to update order status -->
                                <form action="updateOrderStatus" method="post">
    <input type="hidden" name="orderId" value="<%= orderId %>">
    <select name="status">
        <option value="Pending" <%= "Pending".equals(status) ? "selected" : "" %>>Pending</option>
        <option value="Processing" <%= "Processing".equals(status) ? "selected" : "" %>>Processing</option>
        <option value="Shipped" <%= "Shipped".equals(status) ? "selected" : "" %>>Shipped</option>
        <option value="Delivered" <%= "Delivered".equals(status) ? "selected" : "" %>>Delivered</option>
        <option value="Cancelled" <%= "Cancelled".equals(status) ? "selected" : "" %>>Cancelled</option>
    </select>
    <input type="submit" value="Update Status">
</form>

                            </td>
                        </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    if (con != null) con.close();
                }
            %>
        </table>
    </div>
</body>
</html>
