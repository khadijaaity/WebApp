<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>  
<%@ page import="com.webapp.configuration.DatabaseProperties"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css"  href="../css/style.css"/>
	</head>
	<body>
		<h1>JDBC Connection example</h1>
		
		<%
			try {
				
				DatabaseProperties databaseProperties = DatabaseProperties.getInstancia();
			      
				 Class.forName(databaseProperties.getDatabaseDriver()); 
				  Connection conn=DriverManager.getConnection(databaseProperties.getConnectionString(),
						  databaseProperties.getDatabaseUser(),databaseProperties.getDatabasePwd());
				  
				  out.write(databaseProperties.getPropiedad("server") + " Connected!");
				  out.write("<br/>");
				 
				  //Reiniciar el puto eclipse
				  String environment = System.getenv("Entorno");
				  out.write("The environment is : "  + environment);
				  
				  out.write("<br/>");
			
			} catch(Exception e){
				out.println("SQLExcemption caught: " +e.getMessage());
			}
		%>
		
		<br/>
		<a href="<%= response.encodeURL(request.getContextPath() +"/StoreProcedure/addProduct.jsp") %>">Add Product</a>
		
		<br/>
		<a href="<%= response.encodeURL(request.getContextPath() +"/StoreProcedure/showProducts.jsp") %>">Show Products</a>
		
	</body>
</html>