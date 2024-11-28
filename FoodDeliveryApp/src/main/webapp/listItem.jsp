<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Menu" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu Items</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #343a40;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 0 auto;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #dee2e6;
        }
        th {
            background-color: #508D4E;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        img {
            width: 100px; /* Fixed width for all images */
            height: auto; /* Maintain aspect ratio */
        }
        .no-items {
            text-align: center;
            color: #6c757d;
            font-size: 1.2em;
        }
    </style>
</head>
<body>
    <h1>Menu Items</h1>
    <table>
        <tr>
            <th>Item Name</th>
            <th>Price</th>
            <th>Description</th>
            <th>Image</th>
            <th>Available</th>
        </tr>
        <%
            List<Menu> menuItems = (List<Menu>) request.getAttribute("menuItems");
            if (menuItems != null && !menuItems.isEmpty()) {
                for (Menu item : menuItems) {
                    String imgSrc = ""; // Define image source

                    // Set image based on menuId statically
                    switch (item.getMenuid()) {
                        case 1: imgSrc = "./foodimages/kfc1.jpg"; break;
                        case 2: imgSrc = "./foodimages/kfc2.jpg"; break;
                        case 3: imgSrc = "./foodimages/kfc3.jpg"; break;
                        case 4: imgSrc = "./foodimages/kfc4.jpg"; break;
                        case 5: imgSrc = "./foodimages/kfc5.jpg"; break;
                        default: imgSrc = "./foodimages/kfc6.jpg"; break;
                    }
        %>
        <tr>
            <td><%= item.getItemname() %></td>
            <td>$<%= String.format("%.2f", item.getPrice()) %></td>
            <td><%= item.getDescription() %></td>
            <td><img src="<%= imgSrc %>" alt="<%= item.getItemname() %>" /></td>
            <td><%= item.isIsavailable() ? "Yes" : "No" %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="5" class="no-items">No menu items found.</td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
