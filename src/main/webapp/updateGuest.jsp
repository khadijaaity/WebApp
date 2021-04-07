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
		<h1>JDBC Connection Update</h1>
		<form method="GET" action="updateGuest.jsp">
			<input type="hidden" value="<%=request.getParameter("id") %>" name="id">
			<input type="text" value="<%=request.getParameter("firstname") %>" name="firstnameUpdated">
			<input type="text" value="<%=request.getParameter("lastname") %>" name="lastnameUpdated">
			<input type="text" value="<%=request.getParameter("email") %>" name="emailUpdated">
			<input type="hidden" value="UPDATE" name="update">
			<button type="submit">Update</button>
		</form>
	
	<% 
	    if(request.getParameter("update") != null){
	        try {
	            String id = request.getParameter("id");
	            String firstnameUpdated = request.getParameter("firstnameUpdated");
	            String lastnameUpdated = request.getParameter("lastnameUpdated");
	            String emailUpdated = request.getParameter("emailUpdated");

	            Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn=DriverManager.getConnection("jdbc:mysql://beb265f3aa4329:3e142473@us-cdbr-east-03.cleardb.com/heroku_0c282ad41a365e8","beb265f3aa4329","3e142473");
				
				out.write("UPDATE!");
				
				Statement st = conn.createStatement();
	            
	            out.write("UPDATE myguests SET firstname='"+firstnameUpdated+"', lastname='"+lastnameUpdated+"', email='"+emailUpdated+"' WHERE id="+id);
	            st.executeUpdate("UPDATE myguests SET firstname='"+firstnameUpdated+"', lastname='"+lastnameUpdated+"', email='"+emailUpdated+"' WHERE id="+id);
	           
	            conn.close();
	            
	            response.sendRedirect(request.getContextPath() + "/showGuests.jsp");
	            
	        }catch(Exception e){
				System.err.println("Got an exception!");
				System.err.println(e.getMessage());
			}
	    }
	%>

		<br>
		<a href="<%= response.encodeURL(request.getContextPath() + "/showGuests.jsp") %>"> Show Guests </a>
		<a href="<%= response.encodeURL(request.getContextPath() + "/index.jsp") %>"> Go to insert Guests </a>
	</body>
</html>