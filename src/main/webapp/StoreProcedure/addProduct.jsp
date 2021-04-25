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
	
		<form action = "createProduct.jsp" method = "post">
			<label for="nombre">Nombre del producto:</label>
	        <input type = "text" name = "nombre"/><br />
	        
	        <label for="estado">Estado</label>
	        <input type = "text" name = "estado"/><br />
	         
	        <label for="precio">Precio</label>
			<input type="text" id="precio" name="precio"/><br />
			 
	        <input type = "submit" value = "Submit" />
		</form>
	</body>
</html>