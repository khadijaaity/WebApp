<%@page import="com.mongodb.client.model.Filters"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.mongodb.MongoClient" %>
<%@ page import="com.mongodb.MongoClientURI" %>
<%@ page import="com.mongodb.client.MongoDatabase" %>
<%@ page import="com.mongodb.client.MongoCollection" %>
<%@ page import="org.bson.Document" %>
<%@ page import="com.mongodb.client.model.Filters.*" %>

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
		
		
		try(MongoClient mongoClient = new MongoClient(uri)){
			MongoDatabase database = mongoClient.getDatabase("netmind");
			MongoCollection<Document> collection=database.getCollection("alumno");
		
		MongoCursor<Document> cursor = collection.find(Filters.eq("_id",Integer.parseInt(_id))).iterator();
		String nombre="";
		String apellidos="";
		String dni="";
		
		out.print(cursor.hasNext());
		 while(cursor.hasNext()){
			Document dc=cursor.next();
			out.print(dc.getString("nombre"));
			nombre=dc.getString("nombre");
			apellidos=dc.getString("apellidos");
			dni=dc.getString("dni");
		}
		
			
		
	%>
		<form action = "updateinfoGuest.jsp" method = "POST">
			<input type = "hidden" name="_id" value = "<%= _id %>" />
	        
	        <label for="nombre">NOMBRE:</label>
	        <input type = "text" name = "nombre" value="<%= nombre %>" required><br />
	         
	        <label for="apellidos">APELLIDOS:</label>
	        <input type = "text" name = "apellidos" value="<%= apellidos %>" required /><br />
	         
	        <label for="dni">DNI:</label>
	        <input type = "text" name = "dni" value="<%= dni %>" required  /><br />
	         
	        <input type = "submit" value = "Submit" />
	     </form>
	     
	     <br/>
	     <br/>
	     <a href="<%=response.encodeURL(request.getContextPath()+"/MongoDb/showGuests.jsp") %>">Return</a>
	      <%
		}finally{
			
	    }
		%>
	</body>
</html>