<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css"  href="css/style.css"/>
	</head>
	
	<body>
	
		<%
		
			String firstname=request.getParameter("firstname");
			String lastname=request.getParameter("lastname");
			String email=request.getParameter("email");
		
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn=DriverManager.getConnection("jdbc:mysql://beb265f3aa4329:3e142473@us-cdbr-east-03.cleardb.com/heroku_0c282ad41a365e8","beb265f3aa4329","3e142473");
				out.write("Connected! ");
				
				Statement st = conn.createStatement();
				
				int i=st.executeUpdate("INSERT INTO MyGuests (firstname, lastname, email)" + "VALUES('"+firstname+"','"+lastname+"','"+email+"')");
				
				out.write(" guest is successfully inserted!");
				conn.close();
				
				
			}
			catch (SQLException e) {
				out.println("SQL Exception caught: " +e.getMessage());
			}
		%>
	</body>
</html>