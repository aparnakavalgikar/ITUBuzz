<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList,java.util.Iterator,com.itubuzz.valueobjects.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="style.css" type="text/css" />
<title>Insert title here</title>
<script>
onload=function(){
	var e = document.getElementById("refreshed");
	if (e.value == "no")
		e.value="yes";
	else {
		e.value="no";
		location.reload();
	}
}
</script>
</head>

<body>
<input type="hidden" id="refreshed" value="no">
<!-- header starts here -->
  <div id="itu_bar">
    <div id="itu_frame">
      <div id="logo"><img src="logo.png" id="img_logo" alt="logo"/></div>
        <div id="header-main-right">
          <div id="header-main-right-nav">
			<form id="search_form" action="SearchServlet" method="post">
			 <table>
			  <tr>
               <td><input type="text" name="search" id="search" class="searchtext" placeholder="Search ITUBuzz"></td>
               <td><input type="image" src="search.png" alt="Submit" class="searchbutton"></td>
               <td><input type="hidden" name="postorque" value="que"></td>
              </tr>
			 </table>
			</form>
			<table>
			 <tr>
			 <td>
			 <form id="getforumdata" action="GetforumServlet" method="get">
			  <button class="questionbutton"><img src="question_mark.png" id="questionimage"/><br />Ask Question</button>
			 </form>
			 </td>
			  <td>
			   <div class="dropdown">
			  	<button class="profilebutton">
			  		<img src="profilepic.png" id="profileimage"/><br/><%=session.getAttribute("name")%>
			  	</button>
			  	<div class="dropdown-content">
    				<a href="#">Create Group</a>
    				<a href="#">Your Groups</a>
    				<a href="#">Create Events</a>
    				<a href="#">Your Events</a>
    				<a href="#">Edit Profile</a>
    				<a href="#">Log Out</a>
  				</div>
  			   </div>
			  </td> 
		 	 </tr>
			</table>
		 </div>
	  </div>
	</div>
</div>

<input type="hidden" id="refreshed" value="no">
	<form name="qaforum_form" id="qaforum_form" action="QaforumQueServlet" method="post">
		<div id="question_div">
			<textarea name="question_text" id="question_text"></textarea>
			<button id ="submit">Submit</button> 
			<input type="hidden" name="log_user_id" id="log_user_id" value="<%=session.getAttribute("user_id")%>">
		</div>
	</form>

<p id="TopQuestions" style="margin-left:400px;">Top Questions</p>

<%
   	@SuppressWarnings("unchecked")
	ArrayList<QuestionVO> questions=(ArrayList<QuestionVO>)session.getAttribute("all_questions");
    Iterator<QuestionVO> q_list= questions.iterator();
    
    while(q_list.hasNext()) {
		QuestionVO q=(QuestionVO)q_list.next();
%>
		<div id="<%= q.question_id %>" class="question_list">
  			<a id="displayquestion" name="displayquestion" href="GetAnstoQueServlet?question_id=<%= q.question_id %>"><%=q.question_text%></a>
  			<br />
  			<input type="hidden" name="question_id" id="question_id" value="<%= q.question_id %>">
    	</div>	
    	<br />
<%
    }
%>
</body>
</html>