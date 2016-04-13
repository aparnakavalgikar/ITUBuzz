<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList,java.util.Iterator,com.itubuzz.valueobjects.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="style.css" type="text/css" />
<title>ITUBUZZ</title>


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


onload=function(){
	var e = document.getElementById("refreshed");
	if (e.value == "no")
		e.value="yes";
	else {
		e.value="no";
		location.reload();
	}
}
function nextChildid(parentid) {
	var childs = document.getElementById(parentid).childNodes;
	var childid = 0;
	var lastChildid = 0;
	var num = 0;
	
    for (i = 0; i < childs.length; i++) {
         if ( childs[i].nodeName == "DIV" ){
        	 lastChildid = childs[i].id;
        	 num = num + 1;
         }
    }
	
        
    if ( num == 0 ) {
   		var num = 1;	
   		childid = parentid.toString().concat(num.toString());
    } else {
    	childid = parseInt(lastChildid) + 1;
    }	
    
    return childid;
}
function displayAnswer(parentid, userid) {
	console.log("In displayAnswer User id is" + userid);
	var parent = document.getElementById(parentid);
	var rootparent = document.getElementById(parentid);
	var username = document.getElementById("log_user_name").value;
	var num = 0;
	
   	while (rootparent.parentNode.getAttribute('id') != null) {
    		rootparent = rootparent.parentNode;
   	}
	if ( num == 0)
		leftspace = "margin-left: 0px;";
	 else 
		leftspace = "margin-left: 50px;";
   	var rootparentid = rootparent.getAttribute('id');
    var childid = nextChildid(parentid);
    
    var form = document.createElement("form");
	form.setAttribute('action', 'QaforumAnsServlet');
    form.setAttribute('method', 'post');
    
	var childiv = document.createElement("div");
	childiv.setAttribute('id', childid);
	childiv.setAttribute('style', leftspace);
	
	var node1 = document.createElement("textarea");
	node1.setAttribute('name', 'answer_text');
	node1.setAttribute('id', 'answer_text');
	node1.setAttribute('placeholder','Comment...');
	node1.setAttribute('style','width:60%;height:50px');
	
	var node2 = document.createElement("button");
	node2.setAttribute('id', 'replybutton');
	node2.innerHTML = "Submit";
	
	var node3 = document.createElement("input");
	node3.setAttribute('type', 'hidden');
	node3.setAttribute('name', 'immparent_id');
	node3.setAttribute('id', 'immparent_id');
	node3.setAttribute('value', parentid);
	
	var node4 = document.createElement("input");
	node4.setAttribute('type', 'hidden');
	node4.setAttribute('name', 'log_question_id');
	node4.setAttribute('id', 'log_question_id');
	node4.setAttribute('value', rootparentid);
	
	var node5 = document.createElement("input");
	node5.setAttribute('type', 'hidden');
	node5.setAttribute('name', 'answer_id');
	node5.setAttribute('id', 'answer_id');
	node5.setAttribute('value', childid);
	
	var node6 = document.createElement("input");
	node6.setAttribute('type', 'hidden');
	node6.setAttribute('name', 'log_user_id');
	node6.setAttribute('id', 'log_user_id');
	node6.setAttribute('value', userid);
	
	var node7 = document.createElement("input");
	node7.setAttribute('type', 'hidden');
	node7.setAttribute('name', 'log_user_name');
	node7.setAttribute('id', 'log_user_name');
	node7.setAttribute('value', username);
	
	childiv.appendChild(node1);
	childiv.appendChild(node2);
	childiv.appendChild(node3);
	childiv.appendChild(node4);
	childiv.appendChild(node5);
	childiv.appendChild(node6);
	childiv.appendChild(node7);
	
	
	form.appendChild(childiv);	
	parent.appendChild(form);
		
	node2.onclick = function () {
		var parentid = node2.parentNode.getAttribute('id');
		displayAnswer(parentid, userid);
	};
}
function displayAnswerTree(rootparentid, childid, answer_text, immparentid, userid, username) {
	
	var leftspace = null;
	
	if ( rootparentid == immparentid)
		leftspace = "margin-left: 0px;";
	 else 
		leftspace = "margin-left: 50px;";
	var parent = document.getElementById(immparentid);
	var childiv = document.createElement("div");
	childiv.setAttribute('id', childid);
	childiv.setAttribute('style', leftspace);
			
	var node1 = document.createElement("p");
	node1.setAttribute('id','displayName');
	node1.setAttribute('style','color:#007f00;');
	node1.innerHTML = username;
	
	var node2 = document.createElement("span");
	node2.setAttribute('id', 'displayanswer');
	node2.setAttribute('name','displayanswer');
	node2.innerHTML = answer_text;
			
	
	var node3 = document.createElement("br");
			
	var node4 = document.createElement("a");
	node4.setAttribute('id', 'replybutton');
	node4.setAttribute('href','#');
	node4.innerHTML = "Reply";
		
	childiv.appendChild(node1);
	childiv.appendChild(node2);
	childiv.appendChild(node3);
	childiv.appendChild(node4);
	
	parent.appendChild(childiv);
			
	node4.onclick = function () {
		var parentid = node4.parentNode.getAttribute('id');
		displayAnswer(parentid, userid);
	};
	
	
}
</script>
</head>

<body>
<input type="hidden" id="refreshed" value="no">
<!-- header starts here -->
   <body>
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
			<td ><td ><a href="PostLoopServlet?log_user_id=<%=session.getAttribute("user_id")%>" id="postloop">Home</a>  | 
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
		</div>
		</td>
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
<table align="center" width="100%">
<tr>
<%
   	QuestionVO question=(QuestionVO)session.getAttribute("question_data");
%>
<tr>
<tr>
<td width="100%">
	<div id="<%= question.question_id %>" class="qaforum">
		<p id="displayquestion"><b>Question by <%= question.log_user_name %></b> : "<u><%= question.question_text %></u>"</p>
		<a id="answer" href="#" onclick="displayAnswer(<%= question.question_id %>, <%= question.log_user_id %>)">Click to submit an answer
		
		</a>
		<br>
		<br>
		<br>
		<br>
		
		<input type="hidden" id="log_user_name" name="log_user_name" value="<%=question.log_user_name %>">
		</div>
		


<%
@SuppressWarnings("unchecked")
	ArrayList<AnswerVO> answers=(ArrayList<AnswerVO>)session.getAttribute("all_answers");
	Iterator<AnswerVO> a_list= answers.iterator();
    if(a_list.hasNext()) {
    	while (a_list.hasNext()) {
    		AnswerVO a=(AnswerVO)a_list.next();			
%>

			<br>
		<br>
		<br>
		<br>
    		<script> displayAnswerTree(<%= a.question_id %>, <%= a.answer_id%>, "<%= a.answer_text%>", <%= a.immparent_id %>,<%= a.log_user_id%>, "<%= a.log_user_name%>"); </script>
        	<br />
<% 
       	}
	} 
%>
</td>
<td>

</td>
</tr>
</table>
</tr>
</table>
</body>
</html>