<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List,java.util.ArrayList,java.util.Iterator,com.itubuzz.valueobjects.*" %>

<html>
	<script type="text/javascript" charset="utf-8">
		var id = <%=request.getParameter("id")%>;
	</script>

	<script src="./js/jquery-1.12.2.min.js"></script>
    <script src="./js/jquery.tools.min.js"></script>
	<link rel="stylesheet" type="text/css" href="./css/overlay-apple.css">
	<!--  <link rel="stylesheet" type="text/css" href="./css/TextboxList.css">-->
	<!-- required stylesheet for TextboxList -->
	<link rel="stylesheet" href="./css/TextboxList.css" type="text/css" media="screen" charset=ISO-8859-1>
	<!-- required for TextboxList -->
	<script src="./js/GrowingInput.js" type="text/javascript" charset="utf-8"></script>
	<script src="./js/TextboxList.js" type="text/javascript" charset="utf-8"></script>	
	<script src="./js/EmailValidator.js" type="text/javascript" charset="utf-8"></script>
	<script src="./js/MemberService1.js" type="text/javascript" charset="utf-8"></script>	
	<title>ITUBUZZ-GROUP - <%=request.getParameter("name")%></title>	
	<!-- sample initialization -->
	<%
	if(null!=request.getAttribute("errorMessage"))
    {
        out.println(request.getAttribute("errorMessage"));
    }

	if(null!=request.getAttribute("success_createGroup"))
    {
        out.println(request.getAttribute("success_createGroup"));
    }
	%>
	
	
	<script type="text/javascript" charset="utf-8">
	
		$(function(){
			// With custom adding keys 
			var t2 = $('#form_tags_input_2').textboxlist({bitsOptions:{editable:{addKeys: [188]}}});
			
		});

		$(document).ready(function() {
		  $("a[rel]").overlay({effect: 'apple'});
	    });
		
		jQuery(document).ready(function(){
			fetchExistingMembers(id);
		});
		
////////////////////////////////
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
			var groupname = document.getElementById("log_group_name").value;
			var groupid = document.getElementById("log_group_id").value;
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
			form.setAttribute('action', 'GroupReplyDataServlet');
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

			var node9 = document.createElement("input");
			node9.setAttribute('type', 'hidden');
			node9.setAttribute('name', 'log_group_name');
			node9.setAttribute('id', 'log_group_name');
			node9.setAttribute('value', groupname);

			var node10 = document.createElement("input");
			node10.setAttribute('type', 'hidden');
			node10.setAttribute('name', 'log_group_id');
			node10.setAttribute('id', 'log_group_id');
			node10.setAttribute('value', groupid);
			
			childiv.appendChild(node1);
			childiv.appendChild(node2);
			childiv.appendChild(node3);
			childiv.appendChild(node4);
			childiv.appendChild(node5);
			childiv.appendChild(node6);
			childiv.appendChild(node7);
			childiv.appendChild(node8);
			childiv.appendChild(node9);
			childiv.appendChild(node10);
			
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
			var replyname = replyname;
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
///////////////////////////////
	</script>
	<style type="text/css" media="screen">
		.textboxlist { width: 400px; }
	</style>
	
	<body background="../images/TableBg.png">
	<input type="hidden" id="refreshed" value="no">
	
	<div id="itu_bar" style="background: #5a926a;">
    <div id="itu_frame">
      <div id="logo"><img src="logo.png" id="img_logo" alt="logo"/></div>
        <div id="header-main-right">
          <div id="header-main-right-nav"></div>
        </div>
      </div>
    </div>
      <hr>
      <br>
      <br>
      <h3>RECENT ACTIVITY</h3>
      <table align="left">
      <tr>
      <td>
      <div>
      	<%= (String)session.getAttribute("name") %> has created the group&nbsp;<%=request.getParameter("name") %>
      
      </div>
      </td>
      </tr>
      <tr>
      <td>
       <h4>Add Members to the group</h4>
		<div>
			<table >
			<tr>
				<td align="right">Members :    </td>
				<td>		<div class="form_tags"><input type="text" name="members" value="" id="form_tags_input_2" autocomplete="off" style="display: none;">
					</div></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><input type="button" name="btnAddMembers" value="Add Members" onclick="javascript:validateEmailAddress(true,'addMembers');"/></td>
			</tr>
			</table>
		</div>
		<div id="emailerrmsg">
		</div>
		</td>
		</tr>
		<tr>
			<td colspan=2>
				&nbsp;
			</td>
		</tr>
		<tr>
			<td colspan=2>
			
		<form name="post_form" id="post_form" action="GroupPostDataServlet" method="post">
    	<div>
			<textarea name="post_text" id="post_text" style="width:575px;align:center;height:150px;"></textarea>
			<br>
			<br>
			<input type="submit" id="postbutton" value="Post">
			<input type="hidden" name="log_user_id" id="log_user_id" value="<%=session.getAttribute("user_id")%>">
			<input type="hidden" name="log_user_name" id="log_user_name" value="<%=session.getAttribute("name")%>">
			<input type="hidden" name="log_group_id" id="log_group_id" value="<%=request.getParameter("id")%>">
			<input type="hidden" name="log_group_name" id="log_group_name" value="<%=request.getParameter("name")%>">
		</div>
		</form>			
				
			</td>
		</tr>
		<tr>
			<td colspan=2>
			
			<h3>Recent Activity</h3>
<!-- ------------------ -->

<table align="center" width="100%" cellpadding="5">
    
<%
   	@SuppressWarnings("unchecked")
	List<GroupPostVO> posts=(ArrayList<GroupPostVO>)session.getAttribute("all_group_posts");
	
	if(posts!=null && !posts.isEmpty()){
	    for(GroupPostVO p : posts) {
%>
   	<tr >
   	 <td ><p style="color:blue;">Posted By : <%=p.post_user_name %></p></td>
   	 </tr>
   	 <tr >
   	 <td width="60%">
   	 <div id="<%= p.post_id %>" class="post" style="text-align:justify;width:575px;">
   	  			<p id="displaypost" align="center" style="text-align:justify;width:575px;"><%=p.post_text%></p>
   	  			<hr>
   	     		<a href="#" id="replybutton" onclick="displayReply(<%=p.post_id %>)" >Comment</a>
   	            <hr>
   	    		<input type="hidden" name="post_id" value="<%=p.post_id%>">
   	         <input type="hidden" name="log_user_id" value="<%=p.log_user_id %>">
   	         <input type ="hidden" name="reply_user_name" value="<%=p.post_user_name%>">
			<input type="hidden" name="log_group_id" id="log_group_id" value="<%=request.getParameter("id")%>">
			<input type="hidden" name="log_group_name" id="log_group_name" value="<%=request.getParameter("name")%>">

   	 </div>   	
   	    	<br/>
<%
   	    }
	}
	
   	@SuppressWarnings("unchecked")
	ArrayList<GroupReplyVO> replies=(ArrayList<GroupReplyVO>)session.getAttribute("all_group_replies");
    
	
    if (replies!=null && !replies.isEmpty()) {
    	for(GroupReplyVO r: replies) {
    		
    		if(posts!=null && !posts.isEmpty())
			for(GroupPostVO p : posts) {
	    		if ( p.post_id == r.post_id ) {
    			
%>
   	 				<script> displayReplyTree(<%= r.post_id %>, <%= r.reply_id%>, "<%= r.reply_text%>", <%= r.immparent_id %>,<%= r.log_user_id%>, "<%= r.log_reply_name%>"); </script>
   	 				
        			<br />
<%
       			} 
			}
    	}
    }
%>
</td>
</tr>
</table>


<!-- ----------------------- -->			
			</td>
		</table>
		<table align="center">
		<tr>
		<td>
			<span id="count"></span>
		</td> 
		<td>
			&nbsp; Members added to the group</h3>
		</td>
		</tr>
		<tr >
		<td colspan=2>
			<div id="membersDiv"></div>
		</td>
		</tr>
		</table>
	</body>
</html>