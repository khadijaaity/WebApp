<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css"  href="css/style.css"/>
	</head>
	<body>
	<h1>DELETE data from database in jsp</h1>
		<%
			try{
				String id = request.getParameter("id");
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn=DriverManager.getConnection("jdbc:mysql://beb265f3aa4329:3e142473@us-cdbr-east-03.cleardb.com/heroku_0c282ad41a365e8","beb265f3aa4329","3e142473");
				
				Statement st = conn.createStatement();
				
				out.write("DELETE FROM myguests WHERE id="+id);
		        st.executeUpdate("DELETE FROM myguests WHERE id="+id);
		        
		        conn.close();
		        
		        response.sendRedirect(request.getContextPath() + "/showGuests.jsp");
				
				out.write("Deleted Successfully!");
			
	
			}catch(Exception e){
				System.err.println("Got an exception!");
				System.err.println(e.getMessage());
			}
		%>

	</body>
</html>