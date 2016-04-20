<html>
	<script src="./js/jquery-1.12.2.min.js"></script>
    <script src="./js/jquery.tools.min.js"></script>
	<link rel="stylesheet" type="text/css" href="./css/overlay-apple.css">
	<link rel="stylesheet" type="text/css" href="./css/TextboxList.css">
	<script src="./js/GrowingInput.js" type="text/javascript" charset="utf-8"></script>
	<script src="./js/TextboxList.js" type="text/javascript" charset="utf-8"></script>
		
	<script type="text/javascript" charset="utf-8">		
		$(function(){
			// With custom adding keys 
			var t2 = $('#form_tags_input_2').textboxlist({bitsOptions:{editable:{addKeys: [188]}}});
		});
	</script>
	<style type="text/css" media="screen">
		.textboxlist { width: 400px; }
	</style>
	<script>
	$(document).ready(function() {
	  $("a[rel]").overlay({effect: 'apple'});
        });

	</script>
	<body>
	<div id="itu_bar" style="background: #5a926a;">
    <div id="itu_frame">
      <div id="logo"><img src="logo.png" id="img_logo" alt="logo"/></div>
        <div id="header-main-right">
          <div id="header-main-right-nav">
          <div>
          <a href="HomePage.jsp" >Home</a>
          </div>
          </div>
          </div>
          </div>
          </div>
      <hr>
      <br>
      <br>
      <br>
     
      <br>
      <br>
      <br>
      <br>
	<%
	if(null!=request.getAttribute("success_createGroup"))
    {
        out.println(request.getAttribute("success_createGroup"));
    }
%>
	</body>
</html>