<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList,java.util.Iterator,com.itubuzz.valueobjects.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="style.css" type="text/css" />
<title>ITUBUZZ</title>
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

<script src="./js/jquery-1.12.2.min.js"></script>
    <script src="./js/jquery.tools.min.js"></script>
    <script src="./js/TextboxList.js"></script>
	<link rel="stylesheet" type="text/css" href="./css/overlay-apple.css">
	<link rel="stylesheet" type="text/css" href="./css/TextboxList.css">
	<!-- required stylesheet for TextboxList -->
	<link rel="stylesheet" href="./css/TextboxList.css" type="text/css" media="screen" charset=ISO-8859-1>
	<!-- required for TextboxList -->
	<script src="./js/GrowingInput.js" type="text/javascript" charset="utf-8"></script>
	<script src="./js/TextboxList.js" type="text/javascript" charset="utf-8"></script>	
	
<style type="text/css" media="screen">
		.textboxlist { width: 400px; bgcolor: #a8a69f; }
	</style>
	
<script type="text/javascript">

$(function(){
	// With custom adding keys 
	var t2 = $('#form_tags_input_2').textboxlist({bitsOptions:{editable:{addKeys: [188]}}});
});

$(document).ready(function() {
	  $("a[rel]").overlay({effect: 'apple'});
      });

</script>

</head>

<body>
<input type="hidden" id="refreshed" value="no">
<!-- header starts here -->
    <div>
    <div>
      <div>
     <div>      
     <form id="search_form" action="SearchServlet" method="post"> 
<table align="left">

		<tr>
		<td>ITUBUZZ</td>
		
		<td><input type="text" id="searchtext"></td>
		<td><input type="button" id="searchbutton" value="Search"><br/></td>
		
		</tr>
		
</table>
</form>
</div>
</div>
</div>
</div>

<table align="right">
<tr>
			<td ><td ><a href="PostLoopServlet?log_user_id=<%=session.getAttribute("user_id")%>" id="postloop">Home
			<input type="hidden" name="home_name" id="home_name"  value="<%=request.getAttribute("home_name")%>">
			</a>  | 
			<a href="LogOut.jsp" id="logout">Logout</a></td>
		 </tr>
</table>
	      
<br>
<br>
<br>
<hr />

      <br>
      <br>
      <br>
      
<table width="100%">
  <tr valign="top">
    <td width="20%" >
    <div>
       	<a href=""> What's trending</a><br>
		<a href="">News Feed</a><br>
		<a href="">Related Links</a><br>
		<form action="createGroup" method="post">
	<a href="#" rel="#createGroupContainer">Create Group</a>
	<div class="apple_overlay" id="createGroupContainer">
		Create Group<br><br>
		<div>
			<table >
			<tr>
				<td align="right">Group Name: </td>
				<td><input type="text" name="group_name" value=""/><td>
			</tr>
			<tr>
				<td align="right">Members :    </td>
				<td>		<div class="form_tags"><input type="text" name="members" value="" id="form_tags_input_2" autocomplete="off" style="display: none;">
		</div></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><input type="submit" name="btnCreateGroup" value="Create Group"/></td>
			</tr>
			</table>
		</div>
	</div>
	</form> 
	<br>
	</div>
    </td>

<td width="60%">  
<input type="hidden" id="refreshed" value="no">
	<form name="qaforum_form" id="qaforum_form" action="QaforumQueServlet" method="post">
            
		<div id="question_div" style="width:575px;align:center;height:150px;">
		<p>Post a Question </p>
			<textarea name="question_text" id="question_text" style="width:60%;"></textarea>
			
			<%
			if(null!=request.getAttribute("errorMessageQuestion"))
		    {
		        out.println(request.getAttribute("errorMessageQuestion"));
		    }
			%>
			<br>
			<br>
			
			<button id ="submit">Submit</button> 
			<input type="hidden" name="log_user_id" id="log_user_id" value="<%=session.getAttribute("user_id")%>">
			<input type="hidden" name="log_user_name" id="log_user_name" value="<%=session.getAttribute("log_user_name")%>">
		</div>
	</form>

<p id="TopQuestions">Top Questions</p>

<%
   	@SuppressWarnings("unchecked")
	ArrayList<QuestionVO> questions=(ArrayList<QuestionVO>)session.getAttribute("all_questions");
    Iterator<QuestionVO> q_list= questions.iterator();
    
    while(q_list.hasNext()) {
		QuestionVO q=(QuestionVO)q_list.next();
%>
		<div id="<%= q.question_id %>" class="question_list">
		<p>Question by : <%=q.log_user_name%> </p>
  			<a id="displayquestion" name="displayquestion" href="GetAnstoQueServlet?question_id=<%= q.question_id %>&logged_user_id=<%= q.log_user_id%>"><%=q.question_text%>
  			<input type="hidden" name="question_id" id="question_id" value="<%= q.question_id %>">
  			<input type="hidden" name="log_user_name" id="log_user_name" value="<%=session.getAttribute("session_name")%>">
  			</a>
  			<br />
  			
    	</div>	
    	<br />
<%
    }
%>
</td>
</tr>
</table>

</body>
</html>