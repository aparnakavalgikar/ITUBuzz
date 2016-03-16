<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<%     
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/itubuzz", "root", "root");
	Statement st = conn.createStatement();
	ResultSet resultset = st.executeQuery("select * from profile"); 	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>My Profile</title>
<link rel="stylesheet" type="text/css" href="styles.css">
<script src="//code.jquery.com/jquery.js"></script>
</head>

<body>

	<div id="header" align="left">
		ITUBuzz
		<input type="text" id="searchtext" placeholder="search post">
		<input type="button" id="searchbutton"><br/>
		<div id="menu" align="right">
			<a href="Profile.html" id="profile">Profile</a> | 
			<a href="#Knowledge Center" id="knowledge">Knowledge</a> | 
			<a href="#logout" id="logout">Logout</a>
		</div>
	</div>

			<div id="profile">
				  <% while(resultset.next()){ %>
	                <%= resultset.getString(1) %> <br/>
    	            Address: <%= resultset.getString(2) %> <br/>
					Email ID: <%= resultset.getString(3) %> <br/>
					Semester: <%= resultset.getString(4) %> <br/>
            <% } %>
			</div>
</body>
</html>