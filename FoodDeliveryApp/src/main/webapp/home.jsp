<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Restaurant" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Avocado</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
       body {
font-family: Arial, sans-serif;
margin-left: 7%;
margin-right: 7%;
padding: 0;
box-sizing: border-box;
background-color: #D6EFD8; /* Light background color */
}
	


       .navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 20px;
    color: #1A5319;
   	font-weight: 600;
    
}
.below-navbar-image img {
    width: 100%;
    height: 80vh;
    object-fit: cover;
    border-radius: 1.5%;
}

.overlay-text {
    position: absolute;
    color: white;
    font-weight: 1000;
    text-align: left;
    top: 50%;
    left: 10%;
    font-size: 30px;
}
	

.logo {
    font-size: 24px;
    font-weight: 1000;
}

.nav-items {
    display: flex;
    align-items: center;
}

.search-container {
    display: flex;
    align-items: center;
    margin-right: 20px;
}

.search-input {
    padding: 5px;
    border: none;
    border-radius: 3px;
    outline: none;
    width: 300px;
	height:20px;
}

.search-btn {
    padding: 5px 10px;
    background-color: #1A5319;
    border: none;
    color: white;
    border-radius: 3px;
    cursor: pointer;
	height:25px;
}

.nav-link {
    color: #1A5319;
    margin-left: 15px;
    text-decoration: none;
    font-size: 16px;
}

.nav-link i {
    margin-right: 5px;
}

.nav-link:hover {
    color: #ddd;
}


        h2 {
            font-size:30px;
            margin: 20px 40px;
            color: #1A5319; 
        }

      
	.restaurant-list {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
}
        .restaurant {
            width: 27%;
 margin-bottom: 20px;
 padding: 10px;
 border: 1px solid #ddd;
 border-radius: 10px;
 box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
 text-align: center;
 background-color: #D6EFD8; /* Light green background for the restaurant cards */
        }

        .restaurant:hover {
            transform: scale(1.05);
        }

        .restaurant img {
            max-width: 100%;
            border-radius: 5px;
        }

        .restaurant h3 {
            margin: 10px 0;
            font-size: 1.5em;
        }

        .restaurant p {
            color: #666;
        }

        .restaurant a {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 15px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .restaurant a:hover {
            background-color: #45a049;
        }
        
        	/* Footer */
	footer {
    background-color: #508D4E;
    color: white;
    padding: 40px 0;
    text-align: center;
    border-radius:10px;
}

.footer-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    max-width: 1200px;
    margin: 0 auto;
}

.footer-section {
    flex: 1;
    margin: 10px;
    min-width: 150px;
}

.footer-section h3 {
    margin-bottom: 15px;
    font-size: 18px;
}

.footer-section ul {
    list-style: none;
    padding: 0;
}

.footer-section ul li {
    margin-bottom: 10px;
}

.footer-section ul li a {
    color: #ffffff;
    text-decoration: none;
    transition: color 0.3s;
}

.footer-section ul li a:hover {
    color: #1A5319;
}

.footer-section img {
    width: 120px;
    margin: 10px 0;
}

.social-icons a img {
    width: 30px;
    margin: 0 10px;
    transition: transform 0.3s;
}

.restaurant img {
    height: 200px; /* Set a fixed height */
    object-fit: cover; /* Ensures the image is scaled and cropped if necessary */
    border-radius: 5px;
}

.social-icons a img:hover {
    transform: scale(1.1);
}
.astore{
	height: 30px;
}
        .changecontent::after{
    content: ' ';
    color: #1A5319;
    text-shadow: 0px 1px 1px black;
    animation: changetext 12s infinite linear;
}
@keyframes changetext{
    0%{content: "Pasta";}
    10%{content: "Pizza";}
    20%{content: "south Indian";}
    30%{content: "North Indian";}
    40%{content: "Italian";}
    50%{content: "Veg";}
    60%{content: "Non-Veg";}
    70%{content: "Noodles";}
    80%{content: "Chicken";}
    90%{content: "Sweets";}
    100%{content: "Coffee";}
        
    </style>
</head>
<body>
    <header>
       <nav class="navbar">
    <div class="logo">AVOCADO</div>
    
    <div class="nav-items">
        <!-- Search bar -->
        <div class="search-container">
            <input type="text" placeholder="Search" class="search-input">
            <button class="search-btn"><i class="fas fa-search"></i></button>
        </div>
        
        <% 
        User loggedInUser = (User) session.getAttribute("LogedInuser");
        if (loggedInUser != null) {
        %>
            <a href="cart.jsp" class="nav-link"><i class="fas fa-shopping-cart"></i> View Cart</a>
            <a href="orderHistory.jsp" class="nav-link">Order History</a>
            <a href="login.jsp" class="nav-link">Logout</a>
        <% 
        } else { 
        %>
            <a href="login.jsp" class="nav-link"><i class="fas fa-sign-in-alt"></i> Login</a>
            <a href="register.jsp" class="nav-link"><i class="fas fa-user-plus"></i> Sign Up</a>
        <% } %>
    </div>
</nav>

    </header>
    <!-- Image Below Navbar -->
<div class="below-navbar-image">
    <img src="./foodimages/backg.jpg" alt="Image Below Navbar">
    <div class="overlay-text">
        <% if (loggedInUser != null) { %>
            <!-- If the user is logged in, display the username -->
            <div class="overlay-text1" style="color: #1A5319;">
                Welcome, <%= loggedInUser.getUsername() %> <i class="far fa-heart" style="color: #1A5319;"></i>
            </div>
        <% } else { %>
            <!-- If no user is logged in, display a generic message -->
            <div class="overlay-text1" style="color: #1A5319;">
                Welcome to Avocado! <i class="far fa-heart" style="color: #1A5319;"></i>
            </div>
        <% } %>
        <div class="overlay-text2">Order your</div>
        <div class="overlay-text3">Favorite <span class="changecontent"></span> here!</div>
    </div>
</div>

    <h2>Featured Restaurants</h2>
    <section class="restaurant-list">
        <%
        //it retrives the user object from the session
            List<Restaurant> restaurantList = (List<Restaurant>) session.getAttribute("restaurantList");
            if(restaurantList != null) {
            	 for (Restaurant restaurant : restaurantList) {
            	    String imgSrc = ""; // Define image source

            	    // Set image based on restaurantId statically
            	    if (restaurant.getRestaurantid() == 1) {
            	        imgSrc = "./foodimages/KFC.jpeg"; // Use leading slash for root-relative path
            	    } else if (restaurant.getRestaurantid() == 2) {
            	        imgSrc = "./foodimages/imperial.jpeg"; // Ensure this path is correct
            	    } else if (restaurant.getRestaurantid() == 3) {
            	        imgSrc = "./foodimages/kanti.jpeg"; // Ensure this path is correct
            	    } else if (restaurant.getRestaurantid() == 4) {
            	        imgSrc = "./foodimages/niloufer.jpeg"; // Ensure this path is correct
            	    } else if (restaurant.getRestaurantid() == 5) {
            	        imgSrc = "./foodimages/Tacos.jpeg"; // Ensure this path is correct
            	    } else {
            	        imgSrc = "./foodimages/polar.jpeg"; // Ensure this path is correct
            	    }
            

        %>
        <div class="restaurant">
            <img src="<%= imgSrc%>" alt="Image of <%=restaurant.getRestaurantname() %>" />
            <h3><%=restaurant.getRestaurantname() %></h3>
            <p><%=restaurant.getCusinetype() %> - <%=restaurant.getDeliverytime() %> mins</p>
            <p><%= restaurant.getAddress() %></p>
            <p>Ratings - <%= restaurant.getRatings() %></p>
            
            <%-- displaying menu items using restaurant id --%>
			<a href="menu?restaurantId=<%=restaurant.getRestaurantid()%>">View Menu</a>
            
        </div>
        <%
                }
            }
        %>
    </section>
    <footer>
    <div class="footer-container">
        <div class="footer-section">
            <h3>Company</h3>
            <ul>
                <li><a href="#">About Us</a></li>
                <li><a href="#">Careers</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
        </div>

        <div class="footer-section">
            <h3>Help & Support</h3>
            <ul>
                <li><a href="#">FAQs</a></li>
                <li><a href="#">Privacy Policy</a></li>
                <li><a href="#">Terms & Conditions</a></li>
            </ul>
        </div>

        <div class="footer-section">
            <h3>Download App</h3>
           <img src="./foodimages/gplay.jpeg" alt="Dominos" class="astore">
            <img src="./foodimages/astore.jpeg" alt="Dominos" class="astore">
        </div>

        <div class="footer-section social-icons">
            <h3>Connect with Us</h3>
            
            <p>+91 9108822384 <br> 
            <a href="mailto:nishabnnishabn@gmail.com">nishabnnishabn@gmail.com</a></p>
        </div>
    </div>
</footer>
</body>
</html>
