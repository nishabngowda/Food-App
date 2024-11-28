<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - TapFoods</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        header {
            background-color: #508D4E;
            color: white;
            padding: 10px 0;
            text-align: center;
        }

        h1 {
            font-size: 2.5rem;
            margin-bottom: 20px;
        }

        form {
            max-width: 600px;
            margin: 0 auto;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        .form-group textarea {
            resize: vertical;
            height: 150px;
        }

        .form-group button {
            background-color: #508D4E;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .form-group button:hover {
            background-color: #80AF81;
        }

        .contact-info {
            margin-top: 30px;
            text-align: center;
        }

        .contact-info p {
            font-size: 1.1rem;
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
        <h1>Contact Us</h1>
    </header>

    <div class="container">
        <section class="contact-section">
            <h2>We'd love to hear from you!</h2>
            <p>If you have any questions, feedback, or just want to get in touch, feel free to fill out the form below.</p>

            <form action="submitContactForm" method="POST">
                <div class="form-group">
                    <label for="name">Your Name:</label>
                    <input type="text" id="name" name="name" placeholder="Enter your name" required>
                </div>

                <div class="form-group">
                    <label for="email">Your Email:</label>
                    <input type="email" id="email" name="email" placeholder="Enter your email" required>
                </div>

                <div class="form-group">
                    <label for="message">Your Message:</label>
                    <textarea id="message" name="message" placeholder="Write your message here..." required></textarea>
                </div>

                <div class="form-group">
                    <button type="submit">Send Message</button>
                </div>
            </form>

            <div class="contact-info">
                <p>Or reach out to us directly at:</p>
                <p>Email: support@tapfoods.com | Phone: +123-456-7890</p>
                <p>Address: 123 TapFoods Street, Food City, Country</p>
            </div>
        </section>
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
