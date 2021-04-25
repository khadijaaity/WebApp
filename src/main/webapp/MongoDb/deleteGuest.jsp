<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
            <%@ page import="java.sql.*" %>
<%@ page import="com.mongodb.MongoClient" %>
<%@ page import="com.mongodb.MongoClientURI" %>
<%@ page import="com.mongodb.client.MongoDatabase" %>
<%@ page import="com.mongodb.client.MongoCollection" %>
<%@ page import="org.bson.Document" %>
<%@page import="com.mongodb.client.model.Filters"%>
<%@ page import="com.mongodb.client.MongoCursor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>JDBC connection example</title>
		<link rel="stylesheet" type="text/css"  href="../css/style.css"/>
	</head>
	
	<body>
		<%
			String _id=request.getParameter("_id");
			
			MongoClientURI uri = new MongoClientURI(
					 "mongodb+srv://root:root@cluster0.kw0ip.mongodb.net/netmind?w=majority");			
			MongoClient mongoClient = new MongoClient(uri);
			MongoDatabase database = mongoClient.getDatabase("netmind");
			MongoCollection<Document> collection=database.getCollection("alumno");
			collection.findOneAndDelete(Filters.eq("_id",Integer.parseInt(_id)));
			out.write("Usuario borrado correctamente!");
			
			mongoClient.close();
				
				
			
		%>
		
		<br/>
		<br/>
		<a href="<%=response.encodeURL(request.getContextPath()+"/MongoDb/showGuests.jsp") %>">Return</a>
		
	</body>
</html>