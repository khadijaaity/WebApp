<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>  
<%@ page import="com.webapp.configuration.DatabaseConfiguration"%>
<%@ page import="com.webapp.configuration.DatabaseProperties"%>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>JDBC Connection example</title>
		<link rel="stylesheet" type="text/css"  href="css/style.css"/>
	</head>
	
	<body>
		<h1>JDBC Connection example</h1>
		
		<%
			try {
				
				DatabaseProperties databaseProperties = DatabaseProperties.getInstancia();
	  			out.write(databaseProperties.getPropiedad("server"));

				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn=DriverManager.getConnection("jdbc:mysql://beb265f3aa4329:3e142473@us-cdbr-east-03.cleardb.com/heroku_0c282ad41a365e8","beb265f3aa4329","3e142473");
				
				out.write("Connected!");
				out.write("<br/>");
				
				String environment = System.getenv("Entorno");
				out.write("The environment is: " + environment);
				
				out.write("<br/>");
				
				DatabaseConfiguration dc = new DatabaseConfiguration();
				out.write(dc.getPropValues(environment));
			
			} catch(Exception e){
				out.println("SQLExcemption caught: " +e.getMessage());
			}
		%>
		
		<br/>
		<a href="<%= response.encodeURL(request.getContextPath() +"/addGuest.jsp") %>">Add Guest</a>
		
		<br/>
		<a href="<%= response.encodeURL(request.getContextPath() +"/showGuests.jsp") %>">Show Guests</a>
		
	</body>
</html>
