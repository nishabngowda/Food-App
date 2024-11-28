<%@ page import="java.util.List" %>
<%@ page import="model.Menu" %>

<%
    // Retrieve the menu list from the session
    List<Menu> menuList = (List<Menu>) session.getAttribute("menuList");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            background-color: #D6EFD8;
        }

        /* Restaurant Header */
        .restaurant-header {
            background-color: #fff;
            padding: 20px;
            border-bottom: 1px solid #ddd;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            background-color: #D6EFD8;
        }

        .restaurant-header h1 {
            margin: 0;
            font-size: 2em;
            font-weight: bold;
            color: #333;
        }

        .restaurant-header p {
            margin: 5px 0;
            font-size: 1em;
            color: #777;
        }

        /* Menu Section */
        .menu-section {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            
        }

        .menu-section h2 {
            font-size: 1.8em;
            margin-bottom: 20px;
            color: #333;
        }

        /* Menu Item */
        .menu-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            margin-bottom: 15px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }

        .menu-item img {
            width: 100px;
            height: 80px;
            object-fit: cover;
            border-radius: 8px;
        }

        .menu-item-details {
            flex-grow: 1;
            margin-left: 20px;
        }

        .menu-item-details h3 {
            margin: 0;
            font-size: 1.5em;
            color: #333;
        }

        .menu-item-details p {
            margin: 5px 0;
            color: #777;
        }

        /* Price, Quantity, and Add to Cart Section */
        .menu-item-actions {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .menu-item-price {
            font-size: 1.5em;
            font-weight: bold;
            color: #333;
        }

        .quantity-input {
            width: 60px;
            padding: 5px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1em;
            text-align: center;
        }

        .add-to-cart-btn {
            padding: 10px 20px;
            background-color:#508D4E;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1em;
            text-decoration: none;
        }

        .add-to-cart-btn:hover {
            background-color: #80AF81;
        }

        /* Responsive Layout */
        @media (max-width: 768px) {
            .menu-item {
                flex-direction: column;
                text-align: center;
            }

            .menu-item img {
                width: 100%;
                height: auto;
                margin-bottom: 10px;
            }

            .menu-item-details {
                margin-left: 0;
            }

            .menu-item-actions {
                justify-content: center;
                margin-top: 10px;
            }
        }
    </style>
</head>
<body>

    <!-- Restaurant Header -->
    <div class="restaurant-header">
        <h1>KFC</h1>
        <p>Indian, 45 mins, 4.5 </p>
    </div>

    <!-- Menu Section -->
    <div class="menu-section">
		
        <%
        // Check if the menuList is available
        if (menuList != null) {
        	for (Menu menu : menuList) { 
        		String imgSrc = ""; // Define image source

        	    // Set image based on restaurantId statically
        	    if (menu.getMenuid() == 1) {
        	        imgSrc = "./foodimages/kfc1.jpg";
        	    } else if (menu.getMenuid() == 2) {
        	        imgSrc = "./foodimages/kfc2.jpg";
        	    } else if (menu.getMenuid() == 3) {
        	        imgSrc = "./foodimages/kfc3.jpg";
        	    } else if (menu.getMenuid() == 4) {
        	        imgSrc = "./foodimages/kfc4.jpg";
        	    } else if (menu.getMenuid() == 5) {
        	        imgSrc = "./foodimages/kfc5.jpg";
        	    } else {
        	        imgSrc = "./foodimages/kfc6.jpg";
        	    }
        	%>
                <div class="menu-item">
                    <img src="<%= imgSrc %>" alt="<%= menu.getItemname() %>">
                    <div class="menu-item-details">
                        <h3><%= menu.getItemname() %></h3>
                        <p><%= menu.getDescription() %></p>
                    </div>
                    <div class="menu-item-actions">
                        <div class="menu-item-price"><%= menu.getPrice() %></div>
                       <form action="cart" method="post">
   						 <input type="hidden" name="menuId" value="<%= menu.getMenuid() %>">
    					 <input type="hidden" name="action" value="add">
    					 Quantity: <input type="number" name="quantity" value="1" min="1" class="quantity-input">
    					 <button type="submit" class="add-to-cart-btn">Add to cart</button>
						</form>

                    </div>
                </div>
            <% } %>
        <%
        } else { 
        %>
            <p>No menu available for this restaurant.</p>
        <%
        }
        %>
    </div>

</body>
</html>
