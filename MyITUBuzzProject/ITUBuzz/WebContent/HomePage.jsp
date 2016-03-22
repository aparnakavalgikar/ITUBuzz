<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.ArrayList,java.util.Iterator, com.itubuzz.valueobjects.Post" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>ITUBUZZ</title>
<%
    if(null!=request.getAttribute("errorMessage"))
    {
        out.println(request.getAttribute("errorMessage"));
    }

 
%>



  
</head>
<body>
<div >
<table align="left">
		<tr >
		<td>ITUBUZZ</td>
		<td><input type="text" id="searchtext" ></td>
		<td><input type="button" id="searchbutton" value="Search"><br/></td>
		</tr>
</table>
<table align="right">
<tr>
			<td ><a href="Profile.jsp" id="profile"><%=session.getAttribute("name")%></a> | 
			<a href="#Knowledge Center" id="knowledge">Knowledge</a> | 
			<a href="#logout" id="logout">Logout</a></td>
		 </tr>
</table>
	</div>

<br>
<br>
<hr>
<br>
	
	
<form id="post_form" action="PostDataServlet" method="post" onsubmit="return window.Event &amp;&amp; Event.__inlineSubmit &amp;&amp; Event.__inlineSubmit(this,event)">
<table width="100%" border="0">
  <tr valign="top">
    <td bgcolor="#999999" width="20%">
       <a href=""> What's trending</a><br>
	<a href="">Create Group</a><br>
	<a href="">News Feed</a><br>
    </td>
    <td bgcolor="" height="200" width="100" align="center">
       <div id="section">
				<textarea name="post_text" id="post_text" style="width:450px;height:150px;" onchange="jspFunction()" ></textarea><br>
				<button type="submit" id="postbutton" onclick="showInput()" value="Post">Post</button>
				
		</div>
	
    <td bgcolor="#999999" width="20%">
      <a href="">Related Links</a><br>
	<a href="">See Who is Online</a><br>
    </td>
   </tr> 
</table>

</form>


              <table align="center" border="0">
                <tr>
          <% 
          
          @SuppressWarnings("unchecked")
			ArrayList<Post> dbooks=(ArrayList<Post>)session.getAttribute("post_updated_value");
		    Iterator<Post> list=dbooks.iterator();
        while(list.hasNext())
        {
            Post b=(Post)list.next();
    %>
    </tr>
    <tr>
        <td><%=b.post_value%></td>
         
    </tr>
    <%
        }
    %>
          
                
                

</table>


</body>
</html>