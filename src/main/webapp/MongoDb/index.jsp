<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<%@ page import="com.webapp.configuration.DatabaseProperties"%>
<%@ page import="com.mongodb.ConnectionString"%>
<%@ page import="com.mongodb.client.MongoClients"%>
<%@ page import="com.mongodb.client.MongoClient"%>
<%@ page import="com.mongodb.client.MongoDatabase"%>
<%@ page import="com.mongodb.MongoClientSettings"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>JDBC connection example</title>
		<link rel="stylesheet" type="text/css"  href="../css/style.css"/>
	</head>

<body>
	<h1>JDBC connection example</h1>
	
	<%
	
	  try {
		  DatabaseProperties databaseProperties = DatabaseProperties.getInstancia();    
		  
		  ConnectionString connString = new ConnectionString(
				  databaseProperties.getMongoDbConnectionString()
				);
				MongoClientSettings settings = MongoClientSettings.builder()
				    .applyConnectionString(connString)
				    .retryWrites(true)
				    .build();
				MongoClient mongoClient = MongoClients.create(settings);
				MongoDatabase database = mongoClient.getDatabase("alumno");
		 		out.write("Conectado a MongoDb Cluster de Atlas");
		
	  }
	  catch(Exception e) {
	    out.println("SQLException caught: " +e.getMessage());
	  }
	%>
			<br/>
			<br/>
			<a href="<%= response.encodeURL(request.getContextPath() +"/MongoDb/addGuest.jsp") %>">Add Guest</a>
			
			<br/>
			<a href="<%= response.encodeURL(request.getContextPath() +"/MongoDb/showGuests.jsp") %>">Show Guests</a>
	</body>
</html>
