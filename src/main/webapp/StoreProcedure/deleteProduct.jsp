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
	<h1>DELETE data from database in jsp</h1>
		<%
			try {
				String id = request.getParameter("id");
		        DatabaseProperties databaseProperties = DatabaseProperties.getInstancia();
			      
		        Class.forName(databaseProperties.getDatabaseDriver()); 
				Connection conn=DriverManager.getConnection(databaseProperties.getConnectionString(),
						  databaseProperties.getDatabaseUser(),databaseProperties.getDatabasePwd());
		        Statement st = conn.createStatement();
				
				out.write("DELETE FROM productos WHERE id="+id);
		        st.executeUpdate("DELETE FROM productos WHERE id="+id);
		        
		        conn.close();
		        
		        response.sendRedirect(request.getContextPath() + "/StoreProcedure/showProducts.jsp");
				
				out.write("Deleted Successfully!");
			
	
			}catch(SQLException e){
		        e.printStackTrace();
		    }
		%>
	</body>
</html>