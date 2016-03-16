<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %> 
<%@ page import="java.sql.*"%>

<%
	response.setContentType("text/plain");
	String post = request.getParameter("post");
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/itubuzz", "root", "root");
	Statement st = conn.createStatement();
	String sql = "insert into posts values ('" + post + "')";
	st.executeUpdate(sql);
	response.getWriter().print(post);
%>
    
<!DOCTYPE html>
<head>
	<meta charset="utf-8">
	<title></title>
</head>
<body></body>
</html>