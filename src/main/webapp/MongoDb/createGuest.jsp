<%@page import="com.mongodb.client.model.Sorts"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="com.mongodb.MongoClient" %>
    <%@ page import="com.mongodb.MongoClientURI" %>
    <%@ page import="com.mongodb.client.MongoDatabase" %>
    <%@ page import="com.mongodb.client.MongoCollection" %>
     <%@ page import="org.bson.Document" %>
<%@ page import="com.mongodb.client.model.Sorts.*" %>
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
			String nombre=request.getParameter("nombre");
			String apellidos=request.getParameter("apellidos");
			String dni=request.getParameter("dni");
			
			
				MongoClientURI uri = new MongoClientURI(
						 "mongodb+srv://root:root@cluster0.kw0ip.mongodb.net/netmind?w=majority");
				
				
				MongoClient mongoClient = new MongoClient(uri);
				MongoDatabase database = mongoClient.getDatabase("netmind");
				MongoCollection<Document> collection=database.getCollection("alumno");
				Document doc = new Document("_id",(collection.find().sort(Sorts.descending("_id")).limit(1).first().getInteger("_id")+1))
						.append("nombre", nombre)
		                .append("apellidos", apellidos)
		                .append("dni", dni);
		        collection.insertOne(doc);
			
				mongoClient.close();
		%>
		
		<br/>
		<br/>
		<a href="<%=response.encodeURL(request.getContextPath()+"/MongoDb/index.jsp") %>">Return</a>
	</body>
</html>