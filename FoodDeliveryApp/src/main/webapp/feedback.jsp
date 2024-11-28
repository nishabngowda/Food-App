<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback - TapFoods</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        header {
            background-color: #508D4E;
            color: white;
            padding: 20px;
            text-align: center;
        }

        .container {
            max-width: 800px;
            margin: 30px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h2 {
            color: #333;
            font-size: 2rem;
            margin-bottom: 10px;
        }

        p {
            font-size: 1.2rem;
            margin: 10px 0;
        }

        blockquote {
            border-left: 5px solid #508D4E;
            padding-left: 15px;
            font-style: italic;
            color: #555;
            margin: 20px 0;
            font-size: 1.2rem;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #508D4E;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

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
        <h1>Your Feedback</h1>
    </header>

    <div class="container">
        <h2>Thank You for Your Feedback!</h2>
        <p>Your message:</p>
        <blockquote>
            <%= session.getAttribute("feedbackMessage") %>
        </blockquote>
        
        <p><a href="contactus.jsp">Back to Contact Us</a></p>
        
        <% 
            // Clear the session attribute to avoid showing the message again
            session.removeAttribute("feedbackMessage"); 
        %>
    </div>

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
