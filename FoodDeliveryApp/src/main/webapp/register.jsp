<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <link rel="stylesheet" href="signup.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
    <style>
    	@import url('https://fonts.googleapis.com/css2?family=Spartan:wght@100;200;300;400;500;600;700;800;900&display=swap');

		*{
		  margin: 0;
		  padding: 0;
		  box-sizing: border-box;
		  font-family: 'Spartan', sans-serif;
		}
		
		body{
		  display: flex;
		  justify-content: center;
		  align-items: center;
		  min-height: 100vh;
		}
		
		.container{
		  position: relative;
		  width: 750px;
		  height: 500px;
		  border-radius: 2%;
		  border: 2px solid #80AF81;
		  box-shadow: 0 0 25px #80AF81;
		}
		
		.container .form-box{
		  position: absolute;
		  top: 0;
		  width: 50%;
		  height: 100%;
		  display: flex;
		  justify-content: center;
		  flex-direction: column;
		}
		
		.form-box.Signup{
		  left: 0;
		  padding: 0 40px;
		}
		
		.form-box h2{
		  font-size: 32px;
		  text-align: center;
		}
		
		.form-box .input-box{
		  position: relative;
		  width: 120%;
		  height: 30px;
		  margin-top: 25px;
		}
		
		.input-box input{
		  width: 100%;
		  height: 100%;
		  background: transparent;
		  border: none;
		  outline: none;
		  font-size: 16px;
		  color: black;
		  font-weight: 600;
		  border-bottom: 2px solid black;
		  padding-right: 23px;
		}
		
		.input-box label{
		  position: absolute;
		  top: 50%;
		  left: 0;
		  transform: translateY(-50%);
		  font-size: 16px;
		  transition: .5s;
		}
		
		.input-box input:focus ~ label,
		.input-box input:valid ~ label{
		  top: -5px;
		  color: #80AF81;
		  font-weight:600;
		}
		
		.input-box i{
		  position: absolute;
		  top: 50%;
		  right: 0;
		  font-size: 18px;
		  transform: translateY(-50%);
		}
		
		.input-box input:focus ~ i,
		.input-box input:valid ~ i{
		  color: #80AF81;
		}
		
		.btn{
		  position: relative;
		  width: 100%;
		  height: 45px;
		  border-radius: 40px;
		  background-color: #508D4E;
		  cursor: pointer;
		  font-size: 16px;
		  font-weight: 600;
		  color: white;
		  border: none;
		}
		.btn:hover{
			background-color: #80AF81;
		}
		
		.regi-link{
		  font-size: 14px;
		  text-align: center;
		  margin: 20px 0 10px;
		}
		
		.regi-link a{
		  text-decoration: none;
		  color: #80AF81;
		  font-weight:600;
		}
		
		.regi-link a:hover{
		  text-decoration: underline;
		}
		
		.container .info-content {
		  position: absolute;
		  top: 0;
		  right: 0;
		  width: 50%;
		  height: 100%;
		  display: flex;
		  justify-content: center;
		  align-items: center;
		}
		
		.container .info-content img {
		  max-width: 100%;
		  max-height: 100%;
		  border-radius: 2%;
		  object-fit: cover;
		}
    	
    </style>
</head>
<body>
    <div class="container">
        <div class="form-box Signup">
            <h2>Sign Up</h2>
            <form action="register" method="post">
            	<div class="input-box">
                    <input type="username" name="username" required>
                    <label for="">Username</label>
                    <i class="fa-solid fa-user"></i>
                </div>
                <div class="input-box">
                    <input type="email" name="email" required>
                    <label for="">Email</label>
                    <i class="fa-solid fa-envelope"></i>
                </div>
                <div class="input-box">
                    <input type="phone" name="phonenumber" pattern="[0-9]{10}" required>
                    <label for="">Phone Number</label>
                    <i class="fa-solid fa-phone"></i>
                </div>
                <div class="input-box">
                    <input type="password" name="password" required>
                    <label for="">Password</label>
                    <i class="fa-solid fa-lock"></i>
                </div>
                <div class="input-box">
                    <input type="password" name="confirm_password" required>
                    <label for="">Confirm Password</label>
                    <i class="fa-solid fa-lock"></i>
                </div>
                <div class="input-box">
                    <input type="text" name="address" required>
                    <label for="">Address</label>
                    <i class="fa-solid fa-map-marker-alt"></i>
                </div>
                <div class="input-box">
                    <button class="btn" type="submit">Sign Up</button>
                </div>
                <div class="regi-link">
                    <p>Already have an account? <a href="login.jsp">Login</a></p>
                </div>
            </form>
        </div>
        <div class="info-content">
            <img src="${pageContext.request.contextPath}/images/download (3).jpeg" alt="Background Image">
        </div>
    </div>
</body>
</html>
