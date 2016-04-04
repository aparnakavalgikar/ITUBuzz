<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>ITUBUZZ</title>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
      <script type="text/javascript">
         function currentUserTypeCheck() {
             if (document.getElementById('role_hidden').value == "student") {
                 document.getElementById('student1').style.display = 'block';
                 document.getElementById('alumni1').style.display = 'none';
                 document.getElementById('faculty1').style.display = 'none';
             }
             else if (document.getElementById('role_hidden').value == "alumni"){
             	document.getElementById('student1').style.display = 'none';
                 document.getElementById('alumni1').style.display = 'block';
                 document.getElementById('faculty1').style.display = 'none';
             }
             else if (document.getElementById('role_hidden').value == "faculty"){
             	document.getElementById('student1').style.display = 'none';
                 document.getElementById('alumni1').style.display = 'none';
                 document.getElementById('faculty1').style.display = 'block';
             }
             else{
             	document.getElementById('student1').style.display = 'none';
                 document.getElementById('alumni1').style.display = 'none';
                 document.getElementById('faculty1').style.display = 'none';
             }
         }
         
         
         function DisableUserfieldsOnViewProfile()
         {
        	var fields = ['first_name','middle_name','last_name','e_mail_id','day_of_month','month','birthday_year','department','semester','month_of_passing','year_of_passing'];
        	for(j=0;j<fields.length;j++){
	        	var n = document.getElementsByName(fields[j]);
	          	for(i = 0;i < n.length; ++i) {
	                 n[i].disabled = true;      
	             }
        	}
        	/*document.getElementById('first_name').disabled = true;
         	document.getElementById('middle_name').disabled = true;
         	document.getElementById('last_name').disabled = true;
         	document.getElementById('eMailId').disabled = true;
         	document.getElementById('day_of_month').disabled = true;
         	document.getElementById('month').disabled = true;
         	document.getElementById('birthday_year').disabled = true;
         	document.getElementById('dept').disabled = true;
         	document.getElementById('sem').disabled = true;
         	document.getElementById('month_of_passing').disabled = true;
         	document.getElementById('year_of_passing').disabled = true;
         	document.getElementById('cancel').style.visibility = "hidden";
         	document.getElementById('save').style.visibility = "hidden";
         	*/
        	var buttonfields = ['cancel','save'];
        	for(j=0;j<buttonfields.length;j++){
	        	var n = document.getElementsByName(buttonfields[j]);
	          	for(i = 0;i < n.length; i++) {
	                 n[i].style.visibility = "hidden";     
	             }
        	}
         	
         	
         }
         function EnableUserfieldsOnEditProfile()
         {
        	var fields = ['first_name','middle_name','last_name','day_of_month','month','birthday_year','department','semester','month_of_passing','year_of_passing','e_mail_id'];
         	for(j=0;j<fields.length;j++){
 	        	var n = document.getElementsByName(fields[j]);
 	          	for(i = 0;i < n.length; ++i) {
 	                 n[i].disabled = false;      
 	             }
         	}
         	/*document.getElementById('first_name').disabled = false;
         	document.getElementById('middle_name').disabled = false;
         	document.getElementById('last_name').disabled = false;
         	document.getElementById('eMailId').disabled = true;
         	document.getElementById('day_of_month').disabled = false;
         	document.getElementById('month').disabled = false;
         	document.getElementById('birthday_year').disabled = false;
         	document.getElementById('dept').disabled = false;
         	document.getElementById('sem').disabled = false;
         	document.getElementById('month_of_passing').disabled = false;
         	document.getElementById('year_of_passing').disabled = false;
         	document.getElementById('cancel').style.visibility = "visible";
         	document.getElementById('save').style.visibility = "visible";
         	document.getElementById('upload').style.visibility = "visible";*/
         	var buttonfields = ['cancel','save','upload'];
        	for(j=0;j<buttonfields.length;j++){
	        	var n = document.getElementsByName(buttonfields[j]);
	          	for(i = 0;i < n.length; ++i) {
	                 n[i].style.visibility = "visible";     
	             }
        	}
         	var editbuttons = document.getElementsByName('edit');
         	for(i = 0;i < editbuttons.length; ++i) {
         		editbuttons[i].style.visibility = "hidden";       
             }
         	var email = document.getElementsByName('e_mail_id');
         	for(i = 0;i < email.length; ++i) {
         		email[i].disabled = true;      
             }
         	
         }
         function validateForm()
         {
        	 if (document.getElementById('role_hidden').value == "student") {
        		var firstName = $('#student1 #first_name').val();
              	var lastName = $('#student1 #last_name').val()
              	var dept = $('#student1 #dept').val();
              	var sem = $('#student1 #sem').val();
             }
             else if (document.getElementById('role_hidden').value == "alumni"){
            	var firstName = $('#alumni1 #first_name').val();
              	var lastName = $('#alumni1 #last_name').val()
              	var dept = $('#alumni1 #dept').val();
              	var yop_month = $('#alumni1 #month_of_passing').val();
          		var yop_year = $('#alumni1 #year_of_passing').val();
             }
             else if (document.getElementById('role_hidden').value == "faculty"){
            	var firstName = $('#faculty1 #first_name').val();
              	var lastName = $('#faculty1 #last_name').val()
              	var dept = $('#faculty1 #dept').val();
             }
        	
         	var status = true;
         	document.getElementById('errors').innerHTML = "";
         	if (firstName == null || firstName == "") {
         		document.getElementById('errors').innerHTML +="*Please enter your First Name*"+"<br>";
         		status = false;
             }
         	if (lastName == null || lastName == "") {
         		document.getElementById('errors').innerHTML +="*Please enter your Last Name*"+"<br>";
         		status = false;
             }
         	if (dept == null || dept == "" || dept=="Select") {
         		document.getElementById('errors').innerHTML +="*Please enter your Department*"+"<br>";
         		status = false;
             }
         	if(document.getElementById('role_hidden').value == "student")
         		{
         	if (sem == null || sem == "" || sem == "Select") {
         		document.getElementById('errors').innerHTML +="*Please enter Current Trimester*"+"<br>";
         		status = false;
             }
         		}
         	if(document.getElementById('role_hidden').value == "alumni")
         		{
         		if((yop_month == null || yop_month == "" ||yop_month == "00") ||(yop_year == null || yop_year == "" ||yop_year == "0000") )
         		{
             		document.getElementById('errors').innerHTML +="*Please enter Year Of Passing*"+"<br>";
             		status = false;
                 }
         		}
         	return status;
         }
         
         function readURL(input) {
             if (input.files && input.files[0]) {
                 var reader = new FileReader();
         
                 reader.onload = function (e) {
                 	console.log(e.target.result);
                 	var files = document.getElementsByName('profilepic');
                	if (document.getElementById('role_hidden').value == "student") {
                        files[0].src=e.target.result;
                    }
                    else if (document.getElementById('role_hidden').value == "alumni"){
                    	files[1].src=e.target.result;
                    }
                    else if (document.getElementById('role_hidden').value == "faculty"){
                    	files[2].src=e.target.result;
                    }
                     //document.getElementById('profilepic').src=e.target.result;
                 };
         
                 reader.readAsDataURL(input.files[0]);
             }
         }
         
         function fileopen()
         {
        	var files = document.getElementsByName('photo');
        	if (document.getElementById('role_hidden').value == "student") {
                files[0].click();
            }
            else if (document.getElementById('role_hidden').value == "alumni"){
            	files[1].click();
            }
            else if (document.getElementById('role_hidden').value == "faculty"){
            	files[2].click();
            }
         }
         
         
         function selectedValues() {
         	
         	var dob_month = "<%=session.getAttribute("dob_month")%>";
         	var dob_day = "<%=session.getAttribute("dob_day")%>";
         	var dob_year = "<%=session.getAttribute("dob_year")%>";
         	var yop_month = "<%=session.getAttribute("yop_month")%>";
         	var yop_year = "<%=session.getAttribute("yop_year")%>";
         	var dept = "<%=session.getAttribute("dept")%>";
         	var sem = "<%=session.getAttribute("sem")%>";
         	var eMailId = "<%=session.getAttribute("eMailId")%>";
         	//var img = document.createElement('img');
         	//imgPath="${pageContext.request.contextPath}/images/${eMailId}";
         	
         	
         	if(document.getElementById('role_hidden').value == "student"){
         		$('#student1 #day_of_month').val(dob_day);
         		$('#student1 #month').val(dob_month);
         		$('#student1 #birthday_year').val(dob_year);
         		$('#student1 #dept').val(dept);
         		$('#student1 #sem').val(sem);
         		DisableUserfieldsOnViewProfile();
         		currentUserTypeCheck();
         		$('#student1 #eMailId').prop('disabled', true);
         		//document.getElementById('eMailId').disabled = true;
         		
         	}else if(document.getElementById('role_hidden').value == "alumni"){	
         		$('#alumni1 #day_of_month').val(dob_day);
         		$('#alumni1 #month').val(dob_month);
         		$('#alumni1 #birthday_year').val(dob_year);
         		$('#alumni1 #dept').val(dept);
         		$('#alumni1 #month_of_passing').val(yop_month);
         		$('#alumni1 #year_of_passing').val(yop_year);
         		currentUserTypeCheck();
         		$('#alumni1 #eMailId').prop('disabled', true);
         		DisableUserfieldsOnViewProfile();
         	}else if(document.getElementById('role_hidden').value == "faculty"){
         		$('#faculty1 #day_of_month').val(dob_day);
         		$('#faculty1 #month').val(dob_month);
         		$('#faculty1 #birthday_year').val(dob_year);
         		$('#faculty1 #dept').val(dept);
         		DisableUserfieldsOnViewProfile();
         		currentUserTypeCheck();
         		$('#faculty1 #eMailId').prop('disabled', true);
         		
         	}
         	
         	//document.body.appendChild(img);
         	
         }
         
         
         function ClearFieldsOnCancelClick()
         {
        	document.location = "/ITUBuzz/FetchProfileServlet";
         }
         
      </script>
   </head>
   <body>
      <br>
      <br>
      <br>
      <hr>
      <br>
      <br>
      <br>
      <br>
      <form name ="myForm"  action="ProfileUpdateServlet" onsubmit="return validateForm()" method="post" enctype="multipart/form-data">
         <table border="0" align="center">
            <tr>
               <td>
                  <input type="hidden" id="role_hidden" name="user_type" size="20" value=<%=session.getAttribute("role")%>>
               </td>
            </tr>
         </table>
         <br>
         <br>
         <div id ="errors">
         </div>
         <div id= "student1" style="display:none">
            <table align="center">
               <tr>
                  <td>Profile Photo:</td>
                  <td>
                     <input type="button" value="Upload" id="upload" name ="upload" style='visibility: hidden;' onclick ="fileopen()">
                     <input type="file" name="photo" id="photo" size="50" style='visibility: hidden;' onchange="readURL(this);" >
                     <img name="profilepic" id="profilepic" alt="ProfileImage" align="left" src="${pageContext.request.contextPath}/images/${eMailId}" width="160" height="160">
                  </td>
               </tr>
               <tr>
                  <td >First Name* :</td>
                  <td><input type="text" name="first_name" id="first_name" size="20" value=<%=session.getAttribute("firstName")%>></td>
               </tr>
               <tr>
                  <td>Middle Name : </td>
                  <td><input type="text" name="middle_name" id="middle_name" size="20" value=<%=session.getAttribute("middleName")%>></td>
               </tr>
               <tr>
                  <td>Last Name* :</td>
                  <td> <input type="text" name="last_name" id="last_name" value=<%=session.getAttribute("lastName")%>></td>
               </tr>
               <tr>
                  <td>E-mail id* :</td>
                  <td> <input type="text" id="eMailId" name="e_mail_id" value=<%=session.getAttribute("eMailId")%>></td>
               </tr>
               <tr align="left">
                  <td>Date of Birth :</td>
                  <td >
                     <select name="day_of_month" id="day_of_month">
                        <option value="00" selected>Day</option>
                        <option value ="01">01</option>
                        <option value ="02">02</option>
                        <option value ="03">03</option>
                        <option value ="04">04</option>
                        <option value ="05">05</option>
                        <option value ="06">06</option>
                        <option value ="07">07</option>
                        <option value ="08">08</option>
                        <option value ="09">09</option>
                        <option value ="10">10</option>
                        <option value ="11">11</option>
                        <option value ="12">12</option>
                        <option value ="13">13</option>
                        <option value ="14">14</option>
                        <option value ="15">15</option>
                        <option value ="16">16</option>
                        <option value ="17">17</option>
                        <option value ="18">18</option>
                        <option value ="19">19</option>
                        <option value ="20">20</option>
                        <option value ="21">21</option>
                        <option value ="22">22</option>
                        <option value ="23">23</option>
                        <option value ="24">24</option>
                        <option value ="25">25</option>
                        <option value ="26">26</option>
                        <option value ="27">27</option>
                        <option value ="28">28</option>
                        <option value ="29">29</option>
                        <option value ="30">30</option>
                        <option value ="31">31</option>
                     </select>
                     <select name="month" id="month">
                        <option value="00" selected>Month</option>
                        <option value ="01">01</option>
                        <option value ="02">02</option>
                        <option value ="03">03</option>
                        <option value ="04">04</option>
                        <option value ="05">05</option>
                        <option value ="06">06</option>
                        <option value ="07">07</option>
                        <option value ="08">08</option>
                        <option value ="09">09</option>
                        <option value ="10">10</option>
                        <option value ="11">11</option>
                        <option value ="12">12</option>
                     </select>
                     <select  name="birthday_year" id="birthday_year">
                        <option value="0000" selected>Year</option>
                        <option value="2016">2016</option>
                        <option value="2015">2015</option>
                        <option value="2014">2014</option>
                        <option value="2013">2013</option>
                        <option value="2012">2012</option>
                        <option value="2011">2011</option>
                        <option value="2010">2010</option>
                        <option value="2009">2009</option>
                        <option value="2008">2008</option>
                        <option value="2007">2007</option>
                        <option value="2006">2006</option>
                        <option value="2005">2005</option>
                        <option value="2004">2004</option>
                        <option value="2003">2003</option>
                        <option value="2002">2002</option>
                        <option value="2001">2001</option>
                        <option value="2000">2000</option>
                        <option value="1999">1999</option>
                        <option value="1998">1998</option>
                        <option value="1997">1997</option>
                        <option value="1996">1996</option>
                        <option value="1995">1995</option>
                        <option value="1994">1994</option>
                        <option value="1993">1993</option>
                        <option value="1992">1992</option>
                        <option value="1991">1991</option>
                        <option value="1990">1990</option>
                        <option value="1989">1989</option>
                        <option value="1988">1988</option>
                        <option value="1987">1987</option>
                        <option value="1986">1986</option>
                        <option value="1985">1985</option>
                        <option value="1984">1984</option>
                        <option value="1983">1983</option>
                        <option value="1982">1982</option>
                        <option value="1981">1981</option>
                        <option value="1980">1980</option>
                        <option value="1979">1979</option>
                        <option value="1978">1978</option>
                        <option value="1977">1977</option>
                        <option value="1976">1976</option>
                        <option value="1975">1975</option>
                        <option value="1974">1974</option>
                        <option value="1973">1973</option>
                        <option value="1972">1972</option>
                        <option value="1971">1971</option>
                        <option value="1970">1970</option>
                        <option value="1969">1969</option>
                        <option value="1968">1968</option>
                        <option value="1967">1967</option>
                        <option value="1966">1966</option>
                        <option value="1965">1965</option>
                        <option value="1964">1964</option>
                        <option value="1963">1963</option>
                        <option value="1962">1962</option>
                        <option value="1961">1961</option>
                        <option value="1960">1960</option>
                        <option value="1959">1959</option>
                        <option value="1958">1958</option>
                        <option value="1957">1957</option>
                        <option value="1956">1956</option>
                        <option value="1955">1955</option>
                        <option value="1954">1954</option>
                        <option value="1953">1953</option>
                        <option value="1952">1952</option>
                        <option value="1951">1951</option>
                        <option value="1950">1950</option>
                        <option value="1949">1949</option>
                        <option value="1948">1948</option>
                        <option value="1947">1947</option>
                        <option value="1946">1946</option>
                        <option value="1945">1945</option>
                        <option value="1944">1944</option>
                        <option value="1943">1943</option>
                        <option value="1942">1942</option>
                        <option value="1941">1941</option>
                        <option value="1940">1940</option>
                        <option value="1939">1939</option>
                        <option value="1938">1938</option>
                        <option value="1937">1937</option>
                        <option value="1936">1936</option>
                        <option value="1935">1935</option>
                        <option value="1934">1934</option>
                        <option value="1933">1933</option>
                        <option value="1932">1932</option>
                        <option value="1931">1931</option>
                        <option value="1930">1930</option>
                        <option value="1929">1929</option>
                        <option value="1928">1928</option>
                        <option value="1927">1927</option>
                        <option value="1926">1926</option>
                        <option value="1925">1925</option>
                        <option value="1924">1924</option>
                        <option value="1923">1923</option>
                        <option value="1922">1922</option>
                        <option value="1921">1921</option>
                        <option value="1920">1920</option>
                        <option value="1919">1919</option>
                        <option value="1918">1918</option>
                        <option value="1917">1917</option>
                        <option value="1916">1916</option>
                        <option value="1915">1915</option>
                        <option value="1914">1914</option>
                        <option value="1913">1913</option>
                        <option value="1912">1912</option>
                        <option value="1911">1911</option>
                        <option value="1910">1910</option>
                        <option value="1909">1909</option>
                        <option value="1908">1908</option>
                        <option value="1907">1907</option>
                        <option value="1906">1906</option>
                        <option value="1905">1905</option>
                     </select>
                  </td>
               </tr>
               <tr>
                  <td>Department* : </td>
                  <td>
                     <select  name="department" id="dept" >
                        <option  value="Select">--select--</option>
                        <option  value="Software">MS in Software Engineering</option>
                        <option  value="Electrical">MS in Computer/Electrical Engineering</option>
                        <option  value="Digital">MS in Digital Arts</option>
                        <option  value="EngMgt">MS in Engineering Management</option>
                        <option  value="IntSc">MS in Interdisciplinary Science</option>
                        <option  value="MBA">Masters of Business Administration</option>
                     </select>
                  </td>
               </tr>
               <tr>
                  <td>Current Trimester* : </td>
                  <td>
                     <select name="semester" id="sem">
                        <option  value="Select">--select--</option>
                        <option  value="sem1">  Trimester I  </option>
                        <option  value="sem2">  Trimester II  </option>
                        <option  value="sem3">  Trimester III  </option>
                        <option  value="sem4">  Trimester IV  </option>
                     </select>
                  </td>
               </tr>
            </table>
            <br>
            <center>
               <input type="submit" name="save" id="save" value="Save"/>
               <input type="button" name="cancel" id="cancel" value="Cancel" onclick="ClearFieldsOnCancelClick()"/>
               <input type="button" name="edit" id="edit" value="Edit" onclick="EnableUserfieldsOnEditProfile()"/>
            </center>
         </div>
         </form>
         <form name ="myForm"  action="ProfileUpdateServlet" onsubmit="return validateForm()" method="post" enctype="multipart/form-data">
         <div id= "alumni1" style="display:none">
            <table align="center" >
               <tr>
                  <td>Profile Photo:</td>
                  <td>
                     <input type="button" value="Upload" id="upload" name="upload" style='visibility: hidden;'  onclick ="fileopen()">
                     <input type="file" name="photo" id="photo" size="50" style='visibility: hidden;' onchange="readURL(this);">
                     <img name="profilepic" alt="ProfileImage" align="left" src="${pageContext.request.contextPath}/images/${eMailId}" width="160" height="160">
                  </td>
               </tr>
               <tr>
                  <td >First Name* :</td>
                  <td><input type="text" name="first_name" id ="first_name" size="20" value=<%=session.getAttribute("firstName")%>></td>
               </tr>
               <tr>
                  <td>Middle Name : </td>
                  <td><input type="text" name="middle_name" id="middle_name" size="20" value=<%=session.getAttribute("middleName")%>></td>
               </tr>
               <tr>
                  <td>Last Name* :</td>
                  <td> <input type="text" name="last_name" id="last_name" value=<%=session.getAttribute("lastName")%>></td>
               </tr>
               <tr>
                  <td>E-mail id* :</td>
                  <td> <input type="text" id = "eMailId" name="e_mail_id" value=<%=session.getAttribute("eMailId")%>></td>
               </tr>
               <tr align="left">
                  <td>Date of Birth :</td>
                  <td >
                     <select name="day_of_month" id="day_of_month">
                        <option value="00" selected>Day</option>
                        <option value ="01">01</option>
                        <option value ="02">02</option>
                        <option value ="03">03</option>
                        <option value ="04">04</option>
                        <option value ="05">05</option>
                        <option value ="06">06</option>
                        <option value ="07">07</option>
                        <option value ="08">08</option>
                        <option value ="09">09</option>
                        <option value ="10">10</option>
                        <option value ="11">11</option>
                        <option value ="12">12</option>
                        <option value ="13">13</option>
                        <option value ="14">14</option>
                        <option value ="15">15</option>
                        <option value ="16">16</option>
                        <option value ="17">17</option>
                        <option value ="18">18</option>
                        <option value ="19">19</option>
                        <option value ="20">20</option>
                        <option value ="21">21</option>
                        <option value ="22">22</option>
                        <option value ="23">23</option>
                        <option value ="24">24</option>
                        <option value ="25">25</option>
                        <option value ="26">26</option>
                        <option value ="27">27</option>
                        <option value ="28">28</option>
                        <option value ="29">29</option>
                        <option value ="30">30</option>
                        <option value ="31">31</option>
                     </select>
                     <select name="month" id="month">
                        <option value="00" selected>Month</option>
                        <option value ="01">01</option>
                        <option value ="02">02</option>
                        <option value ="03">03</option>
                        <option value ="04">04</option>
                        <option value ="05">05</option>
                        <option value ="06">06</option>
                        <option value ="07">07</option>
                        <option value ="08">08</option>
                        <option value ="09">09</option>
                        <option value ="10">10</option>
                        <option value ="11">11</option>
                        <option value ="12">12</option>
                     </select>
                     <select  name="birthday_year" id="birthday_year">
                        <option value="0000" selected>Year</option>
                        <option value="2016">2016</option>
                        <option value="2015">2015</option>
                        <option value="2014">2014</option>
                        <option value="2013">2013</option>
                        <option value="2012">2012</option>
                        <option value="2011">2011</option>
                        <option value="2010">2010</option>
                        <option value="2009">2009</option>
                        <option value="2008">2008</option>
                        <option value="2007">2007</option>
                        <option value="2006">2006</option>
                        <option value="2005">2005</option>
                        <option value="2004">2004</option>
                        <option value="2003">2003</option>
                        <option value="2002">2002</option>
                        <option value="2001">2001</option>
                        <option value="2000">2000</option>
                        <option value="1999">1999</option>
                        <option value="1998">1998</option>
                        <option value="1997">1997</option>
                        <option value="1996">1996</option>
                        <option value="1995">1995</option>
                        <option value="1994">1994</option>
                        <option value="1993">1993</option>
                        <option value="1992">1992</option>
                        <option value="1991">1991</option>
                        <option value="1990">1990</option>
                        <option value="1989">1989</option>
                        <option value="1988">1988</option>
                        <option value="1987">1987</option>
                        <option value="1986">1986</option>
                        <option value="1985">1985</option>
                        <option value="1984">1984</option>
                        <option value="1983">1983</option>
                        <option value="1982">1982</option>
                        <option value="1981">1981</option>
                        <option value="1980">1980</option>
                        <option value="1979">1979</option>
                        <option value="1978">1978</option>
                        <option value="1977">1977</option>
                        <option value="1976">1976</option>
                        <option value="1975">1975</option>
                        <option value="1974">1974</option>
                        <option value="1973">1973</option>
                        <option value="1972">1972</option>
                        <option value="1971">1971</option>
                        <option value="1970">1970</option>
                        <option value="1969">1969</option>
                        <option value="1968">1968</option>
                        <option value="1967">1967</option>
                        <option value="1966">1966</option>
                        <option value="1965">1965</option>
                        <option value="1964">1964</option>
                        <option value="1963">1963</option>
                        <option value="1962">1962</option>
                        <option value="1961">1961</option>
                        <option value="1960">1960</option>
                        <option value="1959">1959</option>
                        <option value="1958">1958</option>
                        <option value="1957">1957</option>
                        <option value="1956">1956</option>
                        <option value="1955">1955</option>
                        <option value="1954">1954</option>
                        <option value="1953">1953</option>
                        <option value="1952">1952</option>
                        <option value="1951">1951</option>
                        <option value="1950">1950</option>
                        <option value="1949">1949</option>
                        <option value="1948">1948</option>
                        <option value="1947">1947</option>
                        <option value="1946">1946</option>
                        <option value="1945">1945</option>
                        <option value="1944">1944</option>
                        <option value="1943">1943</option>
                        <option value="1942">1942</option>
                        <option value="1941">1941</option>
                        <option value="1940">1940</option>
                        <option value="1939">1939</option>
                        <option value="1938">1938</option>
                        <option value="1937">1937</option>
                        <option value="1936">1936</option>
                        <option value="1935">1935</option>
                        <option value="1934">1934</option>
                        <option value="1933">1933</option>
                        <option value="1932">1932</option>
                        <option value="1931">1931</option>
                        <option value="1930">1930</option>
                        <option value="1929">1929</option>
                        <option value="1928">1928</option>
                        <option value="1927">1927</option>
                        <option value="1926">1926</option>
                        <option value="1925">1925</option>
                        <option value="1924">1924</option>
                        <option value="1923">1923</option>
                        <option value="1922">1922</option>
                        <option value="1921">1921</option>
                        <option value="1920">1920</option>
                        <option value="1919">1919</option>
                        <option value="1918">1918</option>
                        <option value="1917">1917</option>
                        <option value="1916">1916</option>
                        <option value="1915">1915</option>
                        <option value="1914">1914</option>
                        <option value="1913">1913</option>
                        <option value="1912">1912</option>
                        <option value="1911">1911</option>
                        <option value="1910">1910</option>
                        <option value="1909">1909</option>
                        <option value="1908">1908</option>
                        <option value="1907">1907</option>
                        <option value="1906">1906</option>
                        <option value="1905">1905</option>
                     </select>
                  </td>
               </tr>
               <tr>
                  <td>Department* : </td>
                  <td>
                     <select name="department" id="dept">
                        <option  value="Select">--select--</option>
                        <option  value="Software">MS in Software Engineering</option>
                        <option  value="Electrical">MS in Computer/Electrical Engineering</option>
                        <option  value="Digital">MS in Digital Arts</option>
                        <option  value="EngMgt">MS in Engineering Management</option>
                        <option  value="IntSc">MS in Interdisciplinary Science</option>
                        <option  value="MBA">Masters of Business Administration</option>
                     </select>
                  </td>
               </tr>
               <tr>
                  <td>Year of Passing* : </td>
                  <td>
                     <select name="month_of_passing" id="month_of_passing">
                        <option value="00" selected>Month</option>
                        <option value ="01">01</option>
                        <option value ="02">02</option>
                        <option value ="03">03</option>
                        <option value ="04">04</option>
                        <option value ="05">05</option>
                        <option value ="06">06</option>
                        <option value ="07">07</option>
                        <option value ="08">08</option>
                        <option value ="09">09</option>
                        <option value ="10">10</option>
                        <option value ="11">11</option>
                        <option value ="12">12</option>
                     </select>
                     <select  name="year_of_passing" id="year_of_passing">
                        <option value="0000" selected>Year</option>
                        <option value="2016">2016</option>
                        <option value="2015">2015</option>
                        <option value="2014">2014</option>
                        <option value="2013">2013</option>
                        <option value="2012">2012</option>
                        <option value="2011">2011</option>
                        <option value="2010">2010</option>
                        <option value="2009">2009</option>
                        <option value="2008">2008</option>
                        <option value="2007">2007</option>
                        <option value="2006">2006</option>
                        <option value="2005">2005</option>
                        <option value="2004">2004</option>
                        <option value="2003">2003</option>
                        <option value="2002">2002</option>
                        <option value="2001">2001</option>
                        <option value="2000">2000</option>
                        <option value="1999">1999</option>
                        <option value="1998">1998</option>
                        <option value="1997">1997</option>
                        <option value="1996">1996</option>
                        <option value="1995">1995</option>
                        <option value="1994">1994</option>
                        <option value="1993">1993</option>
                        <option value="1992">1992</option>
                        <option value="1991">1991</option>
                        <option value="1990">1990</option>
                        <option value="1989">1989</option>
                        <option value="1988">1988</option>
                        <option value="1987">1987</option>
                        <option value="1986">1986</option>
                        <option value="1985">1985</option>
                        <option value="1984">1984</option>
                        <option value="1983">1983</option>
                        <option value="1982">1982</option>
                        <option value="1981">1981</option>
                        <option value="1980">1980</option>
                        <option value="1979">1979</option>
                        <option value="1978">1978</option>
                        <option value="1977">1977</option>
                        <option value="1976">1976</option>
                        <option value="1975">1975</option>
                        <option value="1974">1974</option>
                        <option value="1973">1973</option>
                        <option value="1972">1972</option>
                        <option value="1971">1971</option>
                        <option value="1970">1970</option>
                        <option value="1969">1969</option>
                        <option value="1968">1968</option>
                        <option value="1967">1967</option>
                        <option value="1966">1966</option>
                        <option value="1965">1965</option>
                        <option value="1964">1964</option>
                        <option value="1963">1963</option>
                        <option value="1962">1962</option>
                        <option value="1961">1961</option>
                        <option value="1960">1960</option>
                        <option value="1959">1959</option>
                        <option value="1958">1958</option>
                        <option value="1957">1957</option>
                        <option value="1956">1956</option>
                        <option value="1955">1955</option>
                        <option value="1954">1954</option>
                        <option value="1953">1953</option>
                        <option value="1952">1952</option>
                        <option value="1951">1951</option>
                        <option value="1950">1950</option>
                        <option value="1949">1949</option>
                        <option value="1948">1948</option>
                        <option value="1947">1947</option>
                        <option value="1946">1946</option>
                        <option value="1945">1945</option>
                        <option value="1944">1944</option>
                        <option value="1943">1943</option>
                        <option value="1942">1942</option>
                        <option value="1941">1941</option>
                        <option value="1940">1940</option>
                        <option value="1939">1939</option>
                        <option value="1938">1938</option>
                        <option value="1937">1937</option>
                        <option value="1936">1936</option>
                        <option value="1935">1935</option>
                        <option value="1934">1934</option>
                        <option value="1933">1933</option>
                        <option value="1932">1932</option>
                        <option value="1931">1931</option>
                        <option value="1930">1930</option>
                        <option value="1929">1929</option>
                        <option value="1928">1928</option>
                        <option value="1927">1927</option>
                        <option value="1926">1926</option>
                        <option value="1925">1925</option>
                        <option value="1924">1924</option>
                        <option value="1923">1923</option>
                        <option value="1922">1922</option>
                        <option value="1921">1921</option>
                        <option value="1920">1920</option>
                        <option value="1919">1919</option>
                        <option value="1918">1918</option>
                        <option value="1917">1917</option>
                        <option value="1916">1916</option>
                        <option value="1915">1915</option>
                        <option value="1914">1914</option>
                        <option value="1913">1913</option>
                        <option value="1912">1912</option>
                        <option value="1911">1911</option>
                        <option value="1910">1910</option>
                        <option value="1909">1909</option>
                        <option value="1908">1908</option>
                        <option value="1907">1907</option>
                        <option value="1906">1906</option>
                        <option value="1905">1905</option>
                     </select>
                  </td>
               </tr>
            </table>
            <br>
            <center>
               <input type="submit" name="save" id="save" value="Save"/>
               <input type="submit" name="cancel" id="cancel" value="Cancel" onclick="ClearFieldsOnCancelClick()"/>
               <input type="button" name="edit" id="edit" value="Edit" onclick="EnableUserfieldsOnEditProfile()"/>
            </center>
         </div>
         </form>
         <form name ="myForm"  action="ProfileUpdateServlet" onsubmit="return validateForm()" method="post" enctype="multipart/form-data">
         <div id= "faculty1" style="display:none">
            <table align="center">
               <tr>
                  <td>Profile Photo:</td>
                  <td>
                     <input type="button" value="Upload" id="upload" name="upload" style='visibility: hidden;'  onclick ="fileopen()">
                     <input type="file" name="photo" id="photo" size="50" style='visibility: hidden;'onchange="readURL(this);">
                     <img name="profilepic" alt="ProfileImage" align="left" src="${pageContext.request.contextPath}/images/${eMailId}" width="160" height="160">
                  </td>
               </tr>
               <tr>
                  <td >First Name* :</td>
                  <td><input type="text" name="first_name" id= "first_name" size="20" value=<%=session.getAttribute("firstName")%>></td>
               </tr>
               <tr>
                  <td>Middle Name : </td>
                  <td><input type="text" name="middle_name" id="middle_name" size="20" value=<%=session.getAttribute("middleName")%>></td>
               </tr>
               <tr>
                  <td>Last Name* :</td>
                  <td> <input type="text" name="last_name"  id="last_name" value=<%=session.getAttribute("lastName")%>></td>
               </tr>
               <tr>
                  <td>E-mail id* :</td>
                  <td> <input type="text" id="eMailId" name="e_mail_id" value=<%=session.getAttribute("eMailId")%>></td>
               </tr>
               <tr align="left">
                  <td>Date of Birth :</td>
                  <td >
                     <select name="day_of_month" id="day_of_month">
                        <option value="00" selected>Day</option>
                        <option value ="01">01</option>
                        <option value ="02">02</option>
                        <option value ="03">03</option>
                        <option value ="04">04</option>
                        <option value ="05">05</option>
                        <option value ="06">06</option>
                        <option value ="07">07</option>
                        <option value ="08">08</option>
                        <option value ="09">09</option>
                        <option value ="10">10</option>
                        <option value ="11">11</option>
                        <option value ="12">12</option>
                        <option value ="13">13</option>
                        <option value ="14">14</option>
                        <option value ="15">15</option>
                        <option value ="16">16</option>
                        <option value ="17">17</option>
                        <option value ="18">18</option>
                        <option value ="19">19</option>
                        <option value ="20">20</option>
                        <option value ="21">21</option>
                        <option value ="22">22</option>
                        <option value ="23">23</option>
                        <option value ="24">24</option>
                        <option value ="25">25</option>
                        <option value ="26">26</option>
                        <option value ="27">27</option>
                        <option value ="28">28</option>
                        <option value ="29">29</option>
                        <option value ="30">30</option>
                        <option value ="31">31</option>
                     </select>
                     <select name="month" id="month">
                        <option value="00" selected>Month</option>
                        <option value ="01">01</option>
                        <option value ="02">02</option>
                        <option value ="03">03</option>
                        <option value ="04">04</option>
                        <option value ="05">05</option>
                        <option value ="06">06</option>
                        <option value ="07">07</option>
                        <option value ="08">08</option>
                        <option value ="09">09</option>
                        <option value ="10">10</option>
                        <option value ="11">11</option>
                        <option value ="12">12</option>
                     </select>
                     <select  name="birthday_year" id="birthday_year">
                        <option value="0000" selected>Year</option>
                        <option value="2016">2016</option>
                        <option value="2015">2015</option>
                        <option value="2014">2014</option>
                        <option value="2013">2013</option>
                        <option value="2012">2012</option>
                        <option value="2011">2011</option>
                        <option value="2010">2010</option>
                        <option value="2009">2009</option>
                        <option value="2008">2008</option>
                        <option value="2007">2007</option>
                        <option value="2006">2006</option>
                        <option value="2005">2005</option>
                        <option value="2004">2004</option>
                        <option value="2003">2003</option>
                        <option value="2002">2002</option>
                        <option value="2001">2001</option>
                        <option value="2000">2000</option>
                        <option value="1999">1999</option>
                        <option value="1998">1998</option>
                        <option value="1997">1997</option>
                        <option value="1996">1996</option>
                        <option value="1995">1995</option>
                        <option value="1994">1994</option>
                        <option value="1993">1993</option>
                        <option value="1992">1992</option>
                        <option value="1991">1991</option>
                        <option value="1990">1990</option>
                        <option value="1989">1989</option>
                        <option value="1988">1988</option>
                        <option value="1987">1987</option>
                        <option value="1986">1986</option>
                        <option value="1985">1985</option>
                        <option value="1984">1984</option>
                        <option value="1983">1983</option>
                        <option value="1982">1982</option>
                        <option value="1981">1981</option>
                        <option value="1980">1980</option>
                        <option value="1979">1979</option>
                        <option value="1978">1978</option>
                        <option value="1977">1977</option>
                        <option value="1976">1976</option>
                        <option value="1975">1975</option>
                        <option value="1974">1974</option>
                        <option value="1973">1973</option>
                        <option value="1972">1972</option>
                        <option value="1971">1971</option>
                        <option value="1970">1970</option>
                        <option value="1969">1969</option>
                        <option value="1968">1968</option>
                        <option value="1967">1967</option>
                        <option value="1966">1966</option>
                        <option value="1965">1965</option>
                        <option value="1964">1964</option>
                        <option value="1963">1963</option>
                        <option value="1962">1962</option>
                        <option value="1961">1961</option>
                        <option value="1960">1960</option>
                        <option value="1959">1959</option>
                        <option value="1958">1958</option>
                        <option value="1957">1957</option>
                        <option value="1956">1956</option>
                        <option value="1955">1955</option>
                        <option value="1954">1954</option>
                        <option value="1953">1953</option>
                        <option value="1952">1952</option>
                        <option value="1951">1951</option>
                        <option value="1950">1950</option>
                        <option value="1949">1949</option>
                        <option value="1948">1948</option>
                        <option value="1947">1947</option>
                        <option value="1946">1946</option>
                        <option value="1945">1945</option>
                        <option value="1944">1944</option>
                        <option value="1943">1943</option>
                        <option value="1942">1942</option>
                        <option value="1941">1941</option>
                        <option value="1940">1940</option>
                        <option value="1939">1939</option>
                        <option value="1938">1938</option>
                        <option value="1937">1937</option>
                        <option value="1936">1936</option>
                        <option value="1935">1935</option>
                        <option value="1934">1934</option>
                        <option value="1933">1933</option>
                        <option value="1932">1932</option>
                        <option value="1931">1931</option>
                        <option value="1930">1930</option>
                        <option value="1929">1929</option>
                        <option value="1928">1928</option>
                        <option value="1927">1927</option>
                        <option value="1926">1926</option>
                        <option value="1925">1925</option>
                        <option value="1924">1924</option>
                        <option value="1923">1923</option>
                        <option value="1922">1922</option>
                        <option value="1921">1921</option>
                        <option value="1920">1920</option>
                        <option value="1919">1919</option>
                        <option value="1918">1918</option>
                        <option value="1917">1917</option>
                        <option value="1916">1916</option>
                        <option value="1915">1915</option>
                        <option value="1914">1914</option>
                        <option value="1913">1913</option>
                        <option value="1912">1912</option>
                        <option value="1911">1911</option>
                        <option value="1910">1910</option>
                        <option value="1909">1909</option>
                        <option value="1908">1908</option>
                        <option value="1907">1907</option>
                        <option value="1906">1906</option>
                        <option value="1905">1905</option>
                     </select>
                  </td>
               </tr>
               <tr>
                  <td>Department* : </td>
                  <td>
                     <select  name="department" id="dept" >
                        <option  value="Select">--select--</option>
                        <option  value="Software">MS in Software Engineering</option>
                        <option  value="Electrical">MS in Computer/Electrical Engineering</option>
                        <option  value="Digital">MS in Digital Arts</option>
                        <option  value="EngMgt">MS in Engineering Management</option>
                        <option  value="IntSc">MS in Interdisciplinary Science</option>
                        <option  value="MBA">Masters of Business Administration</option>
                     </select>
                  </td>
               </tr>
            </table>
            <br>
            <center>
               <input type="submit" name="save" id="save" value="Save"/>
               <input type="button" name="cancel" id="cancel" value="Cancel" onclick="ClearFieldsOnCancelClick()"/>
               <input type="button" name="edit" id="edit" value="Edit" onclick="EnableUserfieldsOnEditProfile()"/>
            </center>
            <script type="text/javascript">
               selectedValues();
            </script>
         </div>
      </form>
   </body>
</html>