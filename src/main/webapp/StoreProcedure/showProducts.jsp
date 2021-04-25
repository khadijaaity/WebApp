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
		<h1>Show data from database in jsp</h1>
		
		<table>
			<tr>
				<th>id</th>
				<th>nombre</th>
				<th>estado</th>
				<th>precio</th>
				<th>Update</th>
				<th>Delete</th>
			</tr>
		
			<%
			String id = request.getParameter("id");
				try{
					DatabaseProperties databaseProperties = DatabaseProperties.getInstancia();
				      
				    Class.forName(databaseProperties.getDatabaseDriver());  
					Connection conn=DriverManager.getConnection(databaseProperties.getConnectionString(),
							  databaseProperties.getDatabaseUser(),databaseProperties.getDatabasePwd());
					out.write("Connected!");
					
					CallableStatement cStmt = conn.prepareCall("{call obtenerProductosPorEstado(?)}");  
					cStmt.setString(1, "disponible");
				      // execute the query, and get a java resultset
				    
			        cStmt.execute();    
			        final ResultSet rs = cStmt.getResultSet();
				
				while (rs.next()){	
			%>
					<tr>
						<td><%= rs.getInt("id") %></td>
						<td><%= rs.getString("nombre") %></td>
						<td><%= rs.getString("estado") %></td>
						<td><%= rs.getString("precio") %></td>
						<td><a href="<%= response.encodeURL(request.getContextPath() + "/StoreProcedure/updateProduct.jsp?id="+ rs.getInt("id")+"&nombre="+ 
								rs.getString("nombre")+"&estado="+ rs.getString("estado")+"&precio="+ rs.getString("precio")) %>">Update</a></td>
    					<td><a href="<%= response.encodeURL(request.getContextPath() + "/StoreProcedure/deleteProduct.jsp?id="+ rs.getInt("id"))%>">Delete</a></td>

					</tr>
				
			<%
				}
				rs.close();
				cStmt.close();
				conn.close();
			
				}
				catch(Exception e){
					System.err.println("Got an exception!");
					System.err.println(e.getMessage());
				}
			%>
		</table>
		
		<br/>
		<a href="<%= response.encodeURL(request.getContextPath() +"/StoreProcedure/addProduct.jsp") %>">Add Product</a>
		
		<br/>
		<a href="<%= response.encodeURL(request.getContextPath() +"/StoreProcedure/index.jsp") %>">Home</a>
		
	</body>
</html>