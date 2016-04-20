<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList,java.util.Iterator,com.itubuzz.valueobjects.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title> ITUBuzz - Your ITU Social Network </title>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style.css" type="text/css" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="style.css" type="text/css" />
  	<link rel="stylesheet" href="dist/css/paper.min.css">
  	<link rel="stylesheet" href="css/demo.css">
  	<link rel="stylesheet" href="css/timeline.css">
	<link rel="stylesheet" type="text/css" href="css/overlay-apple.css">
	<link rel="stylesheet" href="css/TextboxList.css" type="text/css" media="screen" charset=ISO-8859-1>
	<script type="text/javascript" src="js/GrowingInput.js" charset="utf-8"></script>
	<script type="text/javascript" src="js/TextboxList.js" charset="utf-8"></script>
	<script type="text/javascript" src="dist/js/vendor/jquery.min.js"></script>
    <script type="text/javascript" src="dist/js/paper.min.js"></script>
	<script type="text/javascript" src="js/handlebars-v2.0.0.js"></script>
	<script type="text/javascript" src="js/jquery.autosize.min.js"></script>
	<script type="text/javascript" src="js/timeline.js"></script>
	<script src="./js/jquery-1.12.2.min.js"></script>
    <script src="./js/jquery.tools.min.js"></script>
	
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
	var username = username;
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
 <nav class="navbar navbar-default" role="navigation">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a id="logo" class="navbar-brand">ITUBuzz</a>
      </div>
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav navbar-right">
          <li class="dropdown">
            <a id="notification" href="#" class="dropdown-toggle navbar-icons" data-toggle="dropdown">
              <i class="fa fa-bell-o"></i>
            </a>
            <ul id="notifications" class="dropdown-menu" role="menu">
              <script id="notifications-template" type="text/x-handlebars-template">
                <li class="dropdown-title">
                  <h5><b>Notifications</b></h5>
                </li>
                {{#each notifications}}
                <li>
                  <a href="#">
                    <h5><b>This is title {{title}}</b></h5>
                    {{{post}}}
                  </a>
                </li>
                {{/each}}
                <li>
                  <a href="#" class="text-center">
                    <span><b><i class="fa fa-bars"></i> More</b></span>
                  </a>
                </li>
              </script>
            </ul>
          </li>
          <li class="dropdown">
            <a id="inbox" href="#" class="dropdown-toggle navbar-icons" data-toggle="dropdown">
              <i class="fa fa-inbox"></i>
            </a>
            <ul id="messages" class="dropdown-menu" role="menu">
              <script id="messages-template" type="text/x-handlebars-template">
                <li class="dropdown-title">
                  <h5><b>Messages</b></h5>
                </li>
                {{#each messages}}
                <li>
                  <a href="#">
                    <h6><b>{{user}}</b></h6>
                    {{{message}}}
                  </a>
                </li>
                {{/each}}
                <li>
                  <a href="#" class="text-center">
                    <span><b><i class="fa fa-bars"></i> More</b></span>
                  </a>
                </li>
              </script>
            </ul>
          </li>
		  <li>
			<a href="PostLoopServlet?log_user_id=<%=session.getAttribute("user_id")%>" id="postloop" class="btn btn-info btn-lg">
			<span class="glyphicon glyphicon-home"></span> Home
			<input type="hidden" name="home_name" id="home_name"  value="<%=request.getAttribute("home_name")%>">
			</a>
		  </li>
          <li>
            <a href="#"><img class="navbar-avatar" src="https://en.gravatar.com/userimage/23763355/e7bbf514106dc2fd9ddb4e8160a72e8c.png" alt="Profile"> 
			<br /> <%=session.getAttribute("log_user_name")%> </a>
          </li>
		  <li><a href="LogOut.jsp" id="logout"><span class="glyphicon glyphicon-log-out"></span></a></li>    
        </ul>
        <form class="navbar-form navbar-right" role="search">
          <div class="form-group">
            <div class="input-group">
              <input type="text" class="form-control" placeholder="Search">
              <div class="input-group-addon"><i class="fa fa-search"></i></div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </nav>

  <div class="container">
    <div class="row">
      <div class="col-lg-3 col-md-3">
        <div class="card">
          <div class="cover" data-fade="1500" data-duration="2500">
            <ul class="cover-pics">
              <li><img src="../assets/img/img-1.jpg"></li>
              <li><img src="../assets/img/img-2.jpg"></li>
              <li><img src="../assets/img/img-3.jpg"></li>
              <li><img src="../assets/img/img-4.jpg"></li>
              <li><img src="../assets/img/img-5.jpg"></li>
              <li><img src="../assets/img/img-6.jpg"></li>
              <li><img src="../assets/img/img-7.jpg"></li>
              <li><img src="../assets/img/img-8.jpg"></li>
            </ul>
            <!-- This is where the profile picture will come. We need to merge code here and replace this avatar. --> 
            <img src="https://www.digiserved.com/Images/svg/avatar_placeholder.svg" alt="user picture" class="avatar">
          </div>
          <div class="about">
            <h3 class="name">User Name</h3>
            <label id="location"><i class="fa fa-map-marker"></i> City, State</label>
          </div>
        </div><br>
        <div class="panel panel-default">
          <div class="panel-heading">
          </div>
          <div class="panel-body">
            <ul id="trends" class="panel-list">
              <a class="list-group-item" href="createGroup" rel="#createGroupContainer"><i class="fa fa-group fa-fw"></i>&nbsp; Create Group</a>
			  	<div class="apple_overlay" id="createGroupContainer">
					Create Group<br><br>
					<div>
						<table >
						<tr>
							<td align="right">Group Name: </td>
							<td><input type="text" name="group_name" value=""/></td>
						</tr>
						<tr>
							<td align="right">Members :    </td>
							<td><div class="form_tags"><input type="text" name="members" value="" id="form_tags_input_2" autocomplete="off" style="display: none;">
					</div></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td><input type="submit" name="btnCreateGroup" value="Create Group"/></td>
						</tr>
						</table>
					</div>
				</div>

              <a class="list-group-item" href="#"><i class="fa fa-link fa-fw"></i>&nbsp; Related Links</a>
              <a class="list-group-item" href="GetforumServlet" id="knowledge"><i class="fa fa-file-text-o fa-fw"></i>&nbsp; Ask Questions</a>
			  <a class="list-group-item" href="#"><i class="fa fa-group fa-fw"></i>&nbsp; Edit Profile</a>
           </ul>
          </div>
        </div>
      </div>
      <div class="col-lg-6 col-md-5">
        <div id="microposts" class="feed">
          
            
            <div class="micropost">
              <div class="content">
                <div class="avatar-content">
                  <img src={{avatar}} alt={{avatar}}>
                </div>
                <div class="question-content">
                  
                  
                  <div class="question">
<%
					QuestionVO question=(QuestionVO)session.getAttribute("question_data");
%>                  <span class="name">
					<input type="hidden" id="log_user_name" name="log_user_name" value="<%=question.log_user_name %>">
				  </span>

					<p id="displayquestion"><b>Question by <%= question.log_user_name %></b> : "<u><%= question.question_text %></u>"</p>
					<div id="<%= question.question_id %>" class="qaforum">
						<a id="answer" href="#" onclick="displayAnswer(<%= question.question_id %>, <%= question.log_user_id %>)">Click to submit an answer
		
						</a>
						<br>
						<br>
						<br>
						<br>
						
		<input type="hidden"  name="log_user_name" id="log_user_name" value="<%= session.getAttribute("log_user_name") %>">
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

				  </div>
                </div>
                
              </div>
              <div class="actions">
                <div class="actions-content">
                  <a href="#">
                    <i class="fa fa-arrow-left"></i>
                  </a>
                  <a href="#">
                    <i class="fa fa-retweet"></i>
                  </a>
                  <a href="#">
                    <i class="fa fa-heart"></i>
                  </a>
                </div>
              </div>
            </div>
            

        </div>
      </div>
	  <div class="col-lg-3 col-md-4">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title"><b>Most Popular</b></h3>
          </div>
          <div class="panel-body">
            <ul id="suggestions" class="panel-list">
              <script id="suggestions-template" type="text/x-handlebars-template">
                {{#each suggestions}}
                <li>
                  <a href="#">
                    <div class="row">
                      <div class="col-lg-3 col-md-3 col-xs-2">
                        <img src={{avatar}} alt="" class="avatar">
                      </div>
                      <div class="col-lg-5 col-md-5 col-xs-3">
                        <span class="name">{{name}}</span>
                        <span class="username">{{username}}</span>
                      </div>
                      <div class="col-lg-4 col-md-4 col-md-offset-0 col-xs-4 col-xs-offset-3">
                        <button class="btn btn-success btn-sm">
                          Follow
                        </button>
                      </div>
                    </div>
                  </a>
                </li>
                {{/each}}
              </script>
            </ul>
          </div>
        </div>
      </div>
	</div>
</div>










<input type="hidden" id="refreshed" value="no">
<!-- header starts here -->

</body>
</html>
