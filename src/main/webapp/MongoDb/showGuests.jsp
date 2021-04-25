<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.mongodb.MongoClient" %>
<%@ page import="com.mongodb.MongoClientURI" %>
<%@ page import="com.mongodb.client.MongoDatabase" %>
<%@ page import="com.mongodb.client.MongoCollection" %>
<%@ page import="org.bson.Document" %>
<%@ page import="com.mongodb.client.MongoCursor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>JDBC connection example</title>
		<link rel="stylesheet" type="text/css"  href="../css/style.css"/>
	</head>
	
	<body>
		<h1>Retrieve data from database in jsp</h1>
		
		<table>
			<tr>
				<td>id</td>
				<td>nombre</td>
				<td>apellidos</td>
				<td>dni</td>
				<td>Update</td>
				<td>Delete</td>
			</tr>
		
			
		<%
			MongoClientURI uri = new MongoClientURI(
					 "mongodb+srv://root:root@cluster0.kw0ip.mongodb.net/netmind?w=majority");
			
			MongoClient mongoClient = new MongoClient(uri);
			MongoDatabase database = mongoClient.getDatabase("netmind");
			MongoCollection<Document> collection=database.getCollection("alumno");
			MongoCursor<Document> cursor = collection.find().iterator();
			StringBuilder str = new StringBuilder();
			try {
				
				str.append("");
			    while (cursor.hasNext()) {
			   			Document dc=cursor.next();
			   			
			   			str.append("<tr><td>"+dc.getInteger("_id") +"</td>");
			   			str.append("<td>"+dc.getString("nombre") +"</td>");
			   			str.append("<td>"+dc.getString("apellidos") +"</td>");
			   			str.append("<td>"+dc.getString("dni") +"</td>");
			   			str.append("<td><a href='"+response.encodeURL(request.getContextPath()+"/MongoDb/updateGuest.jsp?_id="+dc.getInteger("_id"))+"'>Update</a></td>");
			   			str.append("<td><a href='"+response.encodeURL(request.getContextPath()+"/MongoDb/deleteGuest.jsp?_id="+dc.getInteger("_id"))+"'>Delete</a></td></tr>");
			    }
			} finally {
				mongoClient.close();
			    cursor.close();
			    str.append("</table>");
			    out.write(str.toString());
			}
		
		%>
		
		</table>
		<br/>
		<br/>
		<a href="<%=response.encodeURL(request.getContextPath()+"/MongoDb/index.jsp") %>">Return</a>
	</body>
</html>