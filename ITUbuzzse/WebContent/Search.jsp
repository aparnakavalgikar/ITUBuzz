<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList,java.util.Iterator,com.itubuzz.valueobjects.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="style.css" type="text/css" />
<title>ITUBUZZ</title>
<%
	if(null!=request.getAttribute("errorMessage"))
    {
        out.println(request.getAttribute("errorMessage"));
    }
%>

<script type="text/javascript">
function displayReply() {
	var selectedobj=document.getElementById('reply_text');
	if(selectedobj.className=='hide'){  //check if classname is hide 
	    selectedobj.style.display = "block";
	    selectedobj.className ='show';
	  }else{
	    selectedobj.style.display = "none";
	    selectedobj.className ='hide';
	 }

	var selectedobj=document.getElementById('reply_button');
	if(selectedobj.className=='hide'){  //check if classname is hide 
	    selectedobj.style.display = "block";
	    selectedobj.className ='show';
	  }else{
	    selectedobj.style.display = "none";
	    selectedobj.className ='hide';
	 }
}

document.getElementById("date").innerHTML = Date();
</script>
  
</head>

<body class="home">
<!-- header starts here -->
  <div id="itu_bar">
    <div id="itu_frame">
      <div id="logo"><img src="logo.png" id="img_logo" alt="logo"/></div>
        <div id="header-main-right">
          <div id="header-main-right-nav">
			<form id="search_form" action="SearchServlet" method="post" >
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
			 		<button class="questionbutton" onclick="window.document.location.href='Question.jsp'"><img src="question_mark.png" id="questionimage"/><br />Ask Question</button>
			 		<input type="hidden" name="loggedInUser" id="loggedInUser" value="<%=session.getAttribute("name")%>">
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

<hr />

	<div id="article">
		<div id="tagname">Most Popular</div>
	</div>
	<div id="aside">
		<div id="tagname">Chat</div>	
	</div>

<%
	String postorque = (String)session.getAttribute("postorque");
	if (postorque.matches("post")) {
   		@SuppressWarnings("unchecked")
   		ArrayList<SearchVO> dbooks=(ArrayList<SearchVO>)session.getAttribute("search_values");
    	Iterator<SearchVO> list=dbooks.iterator();
    
    	if (!list.hasNext()){
%>
			<div class="post">
        		<textarea  id="postdisplaytext" name="postdisplaytext" tabindex="101" readonly="readonly">Sorry, No matching results found..</textarea>
			</div>
    		<br />
<% 
    	}
    	else {
    		while(list.hasNext()) {
    			SearchVO b=(SearchVO)list.next();
%>
 				<div class="post">
 					<div class="postby">
     					Posted by: <%= session.getAttribute("name") %><br/> 
     				</div>
        			<textarea  id="postdisplaytext" name="postdisplaytext" tabindex="101" readonly="readonly"><%=b.search_value%></textarea>
        			<input type="hidden" id="post_id" name="post_id" value="<%= b.search_value %>">
    				<button id="like" onclick="displayCounter()">Like</button>
    				<button id="reply" onclick="displayReply()">Reply</button>
    				<textarea id="reply_text" name="reply_text" style="display:none" class="hide" placeholder="Comment..."></textarea>
    				<input type="submit" id="reply_button" name="reply_button" value="Submit" style="display:none" class="hide">
    			</div>	
    			<br />    			

<%
    		}
    	}
    } else if (postorque.matches("que")) {
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
    }
    %>

</body>
</html>