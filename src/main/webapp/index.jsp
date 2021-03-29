<%@ page import="java.sql.*"%>
<html>
	<head>
		<title>JDBC Connection example</title>
	</head>
	
	<body>
		<h1>JDBC Connection example</h1>
		
		
		<form action = "createGuest.jsp" method = "post">
			<label for="firstname">First Name:</label>
	        <input type = "text" name = "firstname"/>
	        <br />
	        
	        <label for="lastname">Last Name:</label>
	        <input type = "text" name = "lastname"/>
	        <br />
	         
	        <label for="email">Enter your email:</label>
			<input type="email" id="email" name="email"/>
			<br />
			 
	         <input type = "submit" value = "Submit" />
		</form>
	</body>
</html>
