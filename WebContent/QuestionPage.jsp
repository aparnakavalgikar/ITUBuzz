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
	node1.setAttribute('name', 'answer_text')
	node1.setAttribute('id', 'answer_text')
	
	var node2 = document.createElement("br");
	
	var node3 = document.createElement("button");
	node3.setAttribute('id', 'replybutton');
	node3.innerHTML = "Reply";

	var node4 = document.createElement("input");
	node4.setAttribute('type', 'hidden');
	node4.setAttribute('name', 'immparent_id');
	node4.setAttribute('id', 'immparent_id');
	node4.setAttribute('value', parentid);

	var node5 = document.createElement("input");
	node5.setAttribute('type', 'hidden');
	node5.setAttribute('name', 'log_question_id');
	node5.setAttribute('id', 'log_question_id');
	node5.setAttribute('value', rootparentid);
	
	var node6 = document.createElement("input");
	node6.setAttribute('type', 'hidden');
	node6.setAttribute('name', 'answer_id');
	node6.setAttribute('id', 'answer_id');
	node6.setAttribute('value', childid);
	
	var node7 = document.createElement("input");
	node7.setAttribute('type', 'hidden');
	node7.setAttribute('name', 'log_user_id');
	node7.setAttribute('id', 'log_user_id');
	node7.setAttribute('value', userid);
	
	childiv.appendChild(node1);
	childiv.appendChild(node2);
	childiv.appendChild(node3);
	childiv.appendChild(node4);
	childiv.appendChild(node5);
	childiv.appendChild(node6);
	childiv.appendChild(node7);
	
	form.appendChild(childiv);	
	parent.appendChild(form);
		
	node3.onclick = function () {
		var parentid = node3.parentNode.getAttribute('id');
		displayAnswer(parentid, userid);
	};
}


function displayAnswerTree(rootparentid, childid, answer_text, immparentid, userid) {
	
	var leftspace = null;
	
	if ( rootparentid == immparentid)
		leftspace = "margin-left: 0px;";
	 else 
		leftspace = "margin-left: 50px;";

	var parent = document.getElementById(immparentid);
	var childiv = document.createElement("div");
	childiv.setAttribute('id', childid);
	childiv.setAttribute('style', leftspace);
			
	var node1 = document.createElement("textarea");
	node1.setAttribute('name', 'displayanswer');
	node1.setAttribute('readonly', 'readonly');
	node1.innerHTML = answer_text;
	
	var node2 = document.createElement("br");
			
	var node3 = document.createElement("button");
	node3.setAttribute('id', 'replybutton');
	node3.innerHTML = "Reply";
		
	childiv.appendChild(node1);
	childiv.appendChild(node2);
	childiv.appendChild(node3);
	
	parent.appendChild(childiv);
			
	node3.onclick = function () {
		var parentid = node3.parentNode.getAttribute('id');
		displayAnswer(parentid, userid);
	};
	
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
    				<a href="CreateGroup.jsp">Create Group</a>
    				<a href="#">Your Groups</a>
    				<a href="#">Create Events</a>
    				<a href="#">Your Events</a>
    				<a href="FetchProfileServlet" id="profile">Edit Profile</a>
    				<a href="LogoutServlet" id="logout">Log Out</a>
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
<%
   	QuestionVO question=(QuestionVO)session.getAttribute("question_data");
%>
	<div id="<%= question.question_id %>" class="qaforum">
		<p id="displayquestion"><%= question.question_text %></p>
		<button id="answer" onclick="displayAnswer(<%= question.question_id %>, <%= question.log_user_id %>)">Answer</button>
<%
	ArrayList<AnswerVO> answers=(ArrayList<AnswerVO>)session.getAttribute("all_answers");
	Iterator<AnswerVO> a_list= answers.iterator();

    if(a_list.hasNext()) {
    	while (a_list.hasNext()) {
    		AnswerVO a=(AnswerVO)a_list.next();			
%>
    		<script> displayAnswerTree(<%= a.question_id %>, <%= a.answer_id%>, "<%= a.answer_text%>", <%= a.immparent_id %>,<%= a.log_user_id%>); </script>
        	<br />
<% 
       	}
	} 
%>
	</div>
</body>
</html>