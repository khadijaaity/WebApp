<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>   
<%@ page import="com.webapp.configuration.DatabaseProperties"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css"  href="css/style.css"/>
	</head>
	
	<body>
		<h1>Retrieve data from database in jsp</h1>
		
		<table>
			<tr>
				<th>id</th>
				<th>firstname</th>
				<th>lastname</th>
				<th>email</th>
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
					
					String query = "SELECT * FROM Myguests";
				      // create the java statement
				    Statement st = conn.createStatement();
				      
				      // execute the query, and get a java resultset
				    ResultSet rs = st.executeQuery(query);
				
				while (rs.next()){	
			%>
					<tr>
						<td><%= rs.getInt("id") %></td>
						<td><%= rs.getString("firstname") %></td>
						<td><%= rs.getString("lastname") %></td>
						<td><%= rs.getString("email") %></td>
						<td><a href="<%= response.encodeURL(request.getContextPath() + "/updateGuest.jsp?id="+ rs.getInt("id")+"&firstname="+ 
								rs.getString("firstname")+"&lastname="+ rs.getString("lastname")+"&email="+ rs.getString("email")) %>">Update</a></td>
    					<td><a href="<%= response.encodeURL(request.getContextPath() + "/deleteGuest.jsp?id="+ rs.getInt("id"))%>">Delete</a></td>

					</tr>
				
			<%
				}
				rs.close();
				st.close();
				conn.close();
			
				}
				catch(Exception e){
					System.err.println("Got an exception!");
					System.err.println(e.getMessage());
				}
			%>
		</table>
		
		<br/>
		<a href="<%= response.encodeURL(request.getContextPath() +"/addGuest.jsp") %>">Add Guest</a>
		
		<br/>
		<a href="<%= response.encodeURL(request.getContextPath() +"/index.jsp") %>">Home</a>
		
	</body>
</html>