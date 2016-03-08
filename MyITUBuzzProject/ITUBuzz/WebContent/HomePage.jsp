<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome <%=session.getAttribute("name")%></title>  
</head>  
<body> 
<table border=0 align="left">
<tr>
<td>Hello ,  <%=session.getAttribute("name")%></td>  
 </tr>
</table> 
<table border=0 align="right">
<tr>
<td><%=session.getAttribute("calendar")%> |
</td>
<td><a href="LogOut.jsp"> LogOut</a></td>  
 </tr>
</table> 

</body>  

</html>