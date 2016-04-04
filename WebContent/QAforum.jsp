<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList,java.util.Iterator,com.itubuzz.valueobjects.QaforumVO" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>

function displayAnswer(parentid) {
	var parent = document.getElementById(parentid);
	var childs = parent.childNodes;
	var childid = 0;
	var lastChildid = 0;
	var num = 0;
	
    for (i = 0; i < childs.length; i++) {
         if ( childs[i].nodeName == "DIV" ){
        	 console.log("child id is " + childs[i].id);
        	 lastChildid = childs[i].id;
        	 num = num + 1;
         }
    }
	
    console.log(num);
    
    if ( num == 0 ) {
    	var num = num + 1;	
    	childid = parentid.toString().concat(num.toString());
    	console.log("concat is" + childid);
    } else {
    	childid = parseInt(lastChildid) + 1;
    	console.log("addition is " + childid);
    }
    
	var childiv = document.createElement("div");
	childiv.setAttribute('id', childid);
	var node1 = document.createElement("textarea");
	var node2 = document.createElement("button");
	node2.innerHTML = childid;
	
	childiv.appendChild(node1);
	childiv.appendChild(node2);
	
	parent.appendChild(childiv);
	
	node2.onclick = function () {
		var parentid = node2.parentNode.getAttribute('id');
		displayQuestion(parentid);
		console.log(parentid);
	};
}

</script>
</head>

<body>
	<form name="qaforum_form" id="qaforum_form" action="QaforumDataServlet" method="post">
		<div id="1">
			<textarea name="question_text" id="question_text"></textarea>
			<button id ="submit" onclick="displayQuestion(1)">Submit</button> 
			<input type="hidden" name="log_user_id" id="log_user_id" value="<%=session.getAttribute("user_id")%>">
		</div>
	</form>

<p id="TopQuestions">Top Questions</p>

<%
   	@SuppressWarnings("unchecked")
   	ArrayList<QaforumVO> dbooks=(ArrayList<QaforumVO>)session.getAttribute("qaforum_updated_value");
    Iterator<QaforumVO> list=dbooks.iterator();
    while(list.hasNext()) {
       	QaforumVO q=(QaforumVO)list.next();
%>
	
 	<div class="questions">
 		<div class="postby">
     		Posted by: <%= session.getAttribute("name") %><br/> 
     	</div>
        <textarea id="<%= q.question_id %>" name="questiondisplaytext" tabindex="101" readonly="readonly"><%=q.question_text%></textarea>
        <input type="hidden" id="question_id" name="question_id" value="<%= q.question_id %>">
    	<button id="answer" onclick="displayAnswer(<%= q.question_id %>)">Answer</button>
    	<textarea id="reply_text" name="reply_text" style="display:none" class="hide" placeholder="Comment..."></textarea>
    	<input type="submit" id="reply_button" name="reply_button" value="Submit" style="display:none" class="hide">
    </div>	
    <br />

<%
            }

%>
  
</body>
</html>