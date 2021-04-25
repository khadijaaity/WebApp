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
	
		<%
			String nombre=request.getParameter("nombre");
			String estado=request.getParameter("estado");
			String precio=request.getParameter("precio");
		
			try {
				DatabaseProperties databaseProperties = DatabaseProperties.getInstancia();
			      
				 Class.forName(databaseProperties.getDatabaseDriver()); 
				Connection conn=DriverManager.getConnection(databaseProperties.getConnectionString(),
						  databaseProperties.getDatabaseUser(),databaseProperties.getDatabasePwd());
				out.write("Connected!");
				
				Statement st=conn.createStatement();
				
				int i=st.executeUpdate("INSERT INTO productos (nombre, estado, precio)" + "VALUES('"+nombre+"','"+estado+"','"+precio+"')");
				
				out.println("Data is successfully inserted!");
				conn.close();
				
				
			}
			catch (SQLException e) {
				out.println("SQL Exception caught: " +e.getMessage());
			}
		%>
	</body>
</html>