<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css"  href="../css/style.css"/>
	</head>
	
	<body>
	
		<form action = "createGuest.jsp" method = "GET">
			<label for="nombre">NOMBRE:</label>
	        <input type = "text" name = "nombre"/><br />
	        
	        <label for="apellidos">APELLIDOS:</label>
	        <input type = "text" name = "apellidos"/><br />
	         
	        <label for="dni">DNI:</label>
			<input type="text" id="dni" name="dni"/><br />
			 
	        <input type = "submit" value = "Submit" />
		</form>
		
		<br/>
		<br/>
		<a href="<%=response.encodeURL(request.getContextPath()+"/MongoDb/index.jsp") %>">Return</a>
		 
	</body>
</html>