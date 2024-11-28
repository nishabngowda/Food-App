<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>
    <link rel="stylesheet" href="demo.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
		@import url('https://fonts.googleapis.com/css2?family=Spartan:wght@100;200;300;400;500;600;700;800;900&display=swap');
	* {
	  margin: 0;
	  padding: 0;
	  box-sizing: border-box;
	  font-family: 'Spartan', sans-serif;
	}
	body {
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  min-height: 100vh;
	  background-color: #f0f0f0;
	}
	.container {
	  width: 100%;
	  height: 100vh;
	  display: flex;
	  flex-direction: column;
	  align-items: center;
	  justify-content: center;
	}
	.navbar {
	  position: absolute;
	  top: 20px;
	  right: 20px;
	}
	.nav-link {
	  margin-left: 20px;
	  text-decoration: none;
	  font-weight: 600;
	  color: #508D4E;
	  font-size: 18px;
	}
	.nav-link:hover {
	  text-decoration: underline;
	}
	.content {
	  text-align: center;
	  margin-top: -50px;
	}
	.content h1 {
	  font-size: 48px;
	  color: #508D4E;
	}
	.content p {
	  font-size: 20px;
	  margin-top: 20px;
	  color: #333;
	}
	.btn {
	  margin-top: 60px;
	  padding: 15px 30px;
	  border-radius: 30px;
	  background-color: #508D4E;
	  color: white;
	  text-decoration: none;
	  font-weight: 600;
	  font-size: 18px;
	}
	.btn:hover {
	  background-color: #80AF81;
	}
</style>
</head>
<body>
    <div class="container">
        <div class="navbar">
            <a href="login.jsp" class="nav-link">Login</a>
            <a href="register.jsp" class="nav-link">Sign Up</a>
        </div>

        <div class="content">
            <h1>Welcome to Avacado!</h1>
            <p>Your favorite place to order delicious meals at your fingertips.</p>
        </div>
        <a href="home.jsp" class="btn">Start Order</a>
    </div>
</body>
</html>
