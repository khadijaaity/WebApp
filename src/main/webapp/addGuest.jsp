<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="ISO-8859-1">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css"  href="css/style.css"/>
	</head>
	
	<body>
	
		<form action = "createGuest.jsp" method = "post">
			<label for="firstname">First Name:</label>
	        <input type = "text" name = "firstname"/><br />
	        
	        <label for="lastname">Last Name:</label>
	        <input type = "text" name = "lastname"/><br />
	         
	        <label for="email">Enter your email:</label>
			<input type="email" id="email" name="email"/><br />
			 
	        <input type = "submit" value = "Submit" />
		</form>
	</body>
</html>