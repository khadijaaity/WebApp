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
		<h1>JDBC Connection Update</h1>
		<form method="GET" action="updateProduct.jsp">
			<input type="hidden" value="<%=request.getParameter("id") %>" name="id">
			<input type="text" value="<%=request.getParameter("nombre") %>" name="nombreUpdated">
			<input type="text" value="<%=request.getParameter("estado") %>" name="estadoUpdated">
			<input type="text" value="<%=request.getParameter("precio") %>" name="precioUpdated">
			<input type="hidden" value="UPDATE" name="update">
			<button type="submit">Update</button>
		</form>
	
	<% 
	    if(request.getParameter("update") != null){
	        try {
	            String id = request.getParameter("id");
	            String nombreUpdated = request.getParameter("nombreUpdated");
	            String estadoUpdated = request.getParameter("estadoUpdated");
	            String precioUpdated = request.getParameter("precioUpdated");

	            DatabaseProperties databaseProperties = DatabaseProperties.getInstancia();
	    	      
	            Class.forName(databaseProperties.getDatabaseDriver());
	    		Connection conn=DriverManager.getConnection(databaseProperties.getConnectionString(),
	    				  databaseProperties.getDatabaseUser(),databaseProperties.getDatabasePwd());
	            Statement st = conn.createStatement();
	            
	            out.write("UPDATE productos SET nombre='"+nombreUpdated+"', lastname='"+estadoUpdated+"', email='"+precioUpdated+"' WHERE id="+id);
	            st.executeUpdate("UPDATE productos SET nombre='"+nombreUpdated+"', lastname='"+estadoUpdated+"', email='"+precioUpdated+"' WHERE id="+id);
	           
	            conn.close();
	            
	            response.sendRedirect(request.getContextPath() + "/StoreProcedure/showProducts.jsp");
	            
	        }catch(Exception e){
				System.err.println("Got an exception!");
				System.err.println(e.getMessage());
			}
	    }
	%>

		<br>
		<a href="<%= response.encodeURL(request.getContextPath() + "/StoreProcedure/showProducts.jsp") %>"> Show Products </a>
		<a href="<%= response.encodeURL(request.getContextPath() + "/StoreProcedure/index.jsp") %>"> Go to insert Products </a>
	</body>
</html>