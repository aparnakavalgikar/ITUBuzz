<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList,java.util.Iterator,com.itubuzz.valueobjects.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title> ITUBuzz - Your ITU Social Network </title>
  <link rel="stylesheet" href="style.css" type="text/css" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="dist/css/paper.min.css">
  <link rel="stylesheet" href="css/demo.css">
  <link rel="stylesheet" href="css/timeline.css">
  <script type="text/javascript" src="dist/js/vendor/jquery.min.js"></script>
  <script type="text/javascript" src="dist/js/paper.min.js"></script>
  <script type="text/javascript" src="js/handlebars-v2.0.0.js"></script>
  <script type="text/javascript" src="js/jquery.autosize.min.js"></script>
  <script type="text/javascript" src="js/timeline.js"></script>


<title>ITUBUZZ</title>
<%
	if(null!=request.getAttribute("errorMessage"))
    {
        out.println(request.getAttribute("errorMessage"));
    }
%>
<script src="js/jquery-1.12.2.min.js"></script>
    <script src="js/jquery.tools.min.js"></script>
    <script src="js/TextboxList.js"></script>
	<link rel="stylesheet" type="text/css" href="css/overlay-apple.css">
	<link rel="stylesheet" type="text/css" href="css/TextboxList.css">
	<!-- required stylesheet for TextboxList -->
	<link rel="stylesheet" href="css/TextboxList.css" type="text/css" media="screen" charset=ISO-8859-1>
	<!-- required for TextboxList -->
	<script src="js/GrowingInput.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/TextboxList.js" type="text/javascript" charset="utf-8"></script>	
	
<style type="text/css" media="screen">
		.textboxlist { width: 400px; }
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

function displayReply(parentid) {
	var userid = document.getElementById("log_user_id").value;
	var replyname = document.getElementById("log_user_name").value;
	var parent = document.getElementById(parentid);
	var num = 0;
	
	var rootparent = document.getElementById(parentid);
	
   	while (rootparent.parentNode.getAttribute('id') != null) {
    		rootparent = rootparent.parentNode;
    		num = num + 1;		
   	}
   	
   	var leftspace = null;
   	
	if ( num == 0)
		leftspace = "margin-left: 0px;";
	 else 
		leftspace = "margin-left: 50px;";


   	var rootparentid = rootparent.getAttribute('id');

    var childid = nextChildid(parentid);
    
    var form = document.createElement("form");
	form.setAttribute('action', 'ReplyDataServlet');
    form.setAttribute('method', 'post');
    form.setAttribute('autocomplete','off');
    
	var childiv = document.createElement("div");
	childiv.setAttribute('id', childid);
	childiv.setAttribute('style', leftspace);
	
	var node1 = document.createElement("textarea");
	node1.setAttribute('name', 'reply_text');
	node1.setAttribute('id', 'reply_text');
	node1.setAttribute('autocomplete','off');
	node1.setAttribute('placeholder','Comment...');
	node1.setAttribute('style','width:60%;height:50px');
	
	var node2 = document.createElement("br");
	
	var node3 = document.createElement("button");
	node3.setAttribute('id', 'nextreplybutton');
	node3.innerHTML = "Submit";

	var node4 = document.createElement("input");
	node4.setAttribute('type', 'hidden');
	node4.setAttribute('name', 'immparent_id');
	node4.setAttribute('id', 'immparent_id');
	node4.setAttribute('value', parentid);

	var node5 = document.createElement("input");
	node5.setAttribute('type', 'hidden');
	node5.setAttribute('name', 'log_post_id');
	node5.setAttribute('id', 'log_post_id');
	node5.setAttribute('value', rootparentid);
	
	var node6 = document.createElement("input");
	node6.setAttribute('type', 'hidden');
	node6.setAttribute('name', 'reply_id');
	node6.setAttribute('id', 'reply_id');
	node6.setAttribute('value', childid);
	
	var node7 = document.createElement("input");
	node7.setAttribute('type', 'hidden');
	node7.setAttribute('name', 'log_user_id');
	node7.setAttribute('id', 'log_user_id');
	node7.setAttribute('value', userid);
	
	var node8 = document.createElement("input");
	node8.setAttribute('type', 'hidden');
	node8.setAttribute('name', 'reply_user_name');
	node8.setAttribute('id', 'reply_user_name');
	node8.setAttribute('value', replyname);
	
	childiv.appendChild(node1);
	childiv.appendChild(node2);
	childiv.appendChild(node3);
	childiv.appendChild(node4);
	childiv.appendChild(node5);
	childiv.appendChild(node6);
	childiv.appendChild(node7);
	childiv.appendChild(node8);
	
	form.appendChild(childiv);	
	parent.appendChild(form);
		
	node3.onclick = function () {
		var parentid = node3.parentNode.getAttribute('id');
		displayReply(parentid);
	};
}


function displayReplyTree(rootparentid, childid, reply_text, immparentid, userid, replyname) {
		
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
	node1.innerHTML = replyname;
	
	var node2 = document.createElement("span");
	node2.setAttribute('id', 'displayreply');
	node2.innerHTML = reply_text;
	
	var node3 = document.createElement("br");
	
	var node4 = document.createElement("a");
	node4.setAttribute('id', 'nextreplybutton');
	node4.setAttribute('href','#');
	node4.innerHTML = "Comment";
	
	childiv.appendChild(node1);
	childiv.appendChild(node2);
	childiv.appendChild(node3);
	childiv.appendChild(node4);
	
	parent.appendChild(childiv);
			
	node4.onclick = function () {
		var parentid = node4.parentNode.getAttribute('id');
		displayReply(parentid);
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
                    <h5><b>{{title}}</b></h5>
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
            <a href="#"><img class="navbar-avatar" src="https://en.gravatar.com/userimage/23763355/e7bbf514106dc2fd9ddb4e8160a72e8c.png" alt="Profile"> Your Name </a>
          </li>
        </ul>

        <form class="navbar-form navbar-right" role="search" id="search_form" action="SearchServlet" method="post">
			<table align="left">
				<tr>
					<div class="form-group">
						<div class="input-group">
							<td><input type="text" class="form-control" placeholder="Search"></td>
							<td><div class="input-group-addon"><i class="fa fa-search"></i></div></td>
						</div>
					</div>
				</tr>
				<tr>
					<div class="form-group">
						<div class="input-group">
							<td ><a href="FetchProfileServlet" id="profile"><%=session.getAttribute("name")%></a> | 
							<a href="LogOut.jsp" id="logout">Logout</a></td>
						</div>
					</div>
				</tr>
			</table>
        </form>
      </div>
    </div>
  </nav>

  <div class="container">
    <div class="row">
      <div class="col-md-3 col-md-3">
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
        </div>
		<br>

		<table width="100%">
			<tr valign="top">
				<td width="20%" >
					<div class="panel panel-default">
						<div class="panel-heading"></div>
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
									<input type="hidden" id="user_name_login" name="user_name_login" value="<%=session.getAttribute("name")%>">
								</ul>
							</div>
					</div>
				</td>
			</tr>
		</table>
      </div>
	<div class="col-md-6 col-md-5">
			<div class="panel panel-default">
			  <div id="new-micropost" class="panel-body">
				<form role="form" name="post_form" id="post_form" action="PostDataServlet" method="post" autocomplete="off">
				  <div class="form-group">
					<textarea name="post_text" id="post_text" style="width:575px;align:center;height:150px;" rows="1" cols="10" class="form-control" placeholder="Share your thoughts"></textarea>
				  </div>
				  <button id="post" class="btn btn-success">
					<i class="fa fa-send-o"></i> <b>Post</b>
				  </button>
				  <input type="hidden" name="log_user_id" id="log_user_id" value="<%=session.getAttribute("user_id")%>">
				  <input type="hidden" name="log_user_name" id="log_user_name" value="<%=session.getAttribute("log_user_name")%>">
				</form>
			  </div>				
			</div>
			
			<h3>Recent Activity</h3>
			
<%
					@SuppressWarnings("unchecked")
					ArrayList<PostVO> posts=(ArrayList<PostVO>)session.getAttribute("all_posts");
					Iterator<PostVO> p_list= posts.iterator();
		
					while(p_list.hasNext()) {
						PostVO p=(PostVO)p_list.next();
%>
				<div id="microposts" class="feed">
					<script id="microposts-template" type="text/x-handlebars-template">
						{{#each microposts}}
						<div class="micropost">
						  <div class="content">
							<div class="avatar-content">
							  <img src={{avatar}} alt={{avatar}}>
							</div>
							<div class="post-content">
							  <span class="name">{{name}}
							  <p style="color:blue;">Posted By : <%=p.post_user_name %></p></td>
							  </span>
							  <span class="username">{{username}}</span>
							  <div class="post">{{{post}}}
								<div id="<%= p.post_id %>" class="post" style="text-align:justify;width:575px;">
									<p id="displaypost" align="center" style="text-align:justify;width:575px;"><%=p.post_text%></p>
									<hr>
									<a href="#" id="replybutton" onclick="displayReply(<%=p.post_id %>)" >Comment</a>
									<a href="#" id="likebutton">Like</a>
									<hr>
									<input type="hidden" name="post_id" value="<%=p.post_id%>">
									<input type="hidden" name="log_user_id" value="<%=p.log_user_id %>">
									<input type ="hidden" name="reply_user_name" value="<%=p.post_user_name%>">
								</div>   	
							  </div>
							</div>
							<div class="right-content">
							  <span>{{time}}</span>
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
						{{/each}}
					</script>
				</div>
	</div>
<%
    }

					@SuppressWarnings("unchecked")
					ArrayList<ReplyVO> replies=(ArrayList<ReplyVO>)session.getAttribute("all_replies");
					Iterator<ReplyVO> r_list= replies.iterator();
	
					if (r_list.hasNext()) {
						while (r_list.hasNext()) {
							ReplyVO r=(ReplyVO)r_list.next();
							Iterator<PostVO> pr_list= posts.iterator();
    		
							while(pr_list.hasNext()) {
								PostVO p=(PostVO)pr_list.next();	

								if ( p.post_id == r.post_id ) {
    			
%>
								<script> displayReplyTree(<%= r.post_id %>, <%= r.reply_id%>, "<%= r.reply_text%>", <%= r.immparent_id %>,<%= r.log_user_id%>,"<%=r.log_reply_name%>"); </script>
								<br />
<%
								} 
							}
						}
					}
%>
		<div class="col-md-3 col-md-4">
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
