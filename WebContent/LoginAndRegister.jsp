<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="icon" href="marca.png" type="image/png">
        <link rel="icon" href="marca.png" type="image/png">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="style.css" type="text/css" />

        <style>
            .loginpage {
                background: url("loginpage.jpg") no-repeat center center fixed;   
  				-webkit-background-size: cover;
  				-moz-background-size: cover;
  				-o-background-size: cover;
  				background-size: cover;
            }
            
            .well {
				background: rgba(255,255,255,0.9);
				background: -moz-linear-gradient(left, rgba(255,255,255,0.9) 0%, rgba(245,237,245,0.9) 35%, rgba(242,233,242,0.9) 60%, rgba(255,250,255,0.9) 100%);
				background: -webkit-gradient(left top, right top, color-stop(0%, rgba(255,255,255,0.9)), color-stop(35%, rgba(245,237,245,0.9)), color-stop(60%, rgba(242,233,242,0.9)), color-stop(100%, rgba(255,250,255,0.9)));
				background: -webkit-linear-gradient(left, rgba(255,255,255,0.9) 0%, rgba(245,237,245,0.9) 35%, rgba(242,233,242,0.9) 60%, rgba(255,250,255,0.9) 100%);
				background: -o-linear-gradient(left, rgba(255,255,255,0.9) 0%, rgba(245,237,245,0.9) 35%, rgba(242,233,242,0.9) 60%, rgba(255,250,255,0.9) 100%);
				background: -ms-linear-gradient(left, rgba(255,255,255,0.9) 0%, rgba(245,237,245,0.9) 35%, rgba(242,233,242,0.9) 60%, rgba(255,250,255,0.9) 100%);
				background: linear-gradient(to right, rgba(255,255,255,0.9) 0%, rgba(245,237,245,0.9) 35%, rgba(242,233,242,0.9) 60%, rgba(255,250,255,0.9) 100%);
				filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#fffaff', GradientType=1 );
				border: 3px solid white;
				border-radius: 10px;
				width: 500px;
                float: none;
                margin-left: auto;
                margin-right: auto;
				
			}
			
			h2 {
				background: #009933; 
				color: #e6e6e6; 
				text-align:center;
				font-family: Lucida Sans Unicode;
				font-style: italic;
				border-radius: 10px;
				float: none;
				margin-left: auto;
				margin-right: auto;
				padding: 2px 0px 6px 0px;
			}
			
			#register_form table {
				width: 400px;
				padding: 0px 0px 0px 20px;
			}
			
		   	input[type=radio] {
    			width: 20px;
    			height: 20px;
			}
			
            .navbar-default {
                background-color: #006600;
            }
            
            .form-control .input-sm #email {
                margin-right: 5px;
            }
            
            .form-control .input-sm #pass {
                margin-right: 5px;
            }
            
            .form-group #student1,
            #alumni1,
            #faculty1 {
                width: 450px;
                float: none;
                margin-left: auto;
                margin-right: auto;
            }
        </style>
        <title>ITUBUZZ</title>

        <% if(null!=request.getAttribute( "passwordSuccessMessage")){ 
        	out.println(request.getAttribute( "passwordSuccessMessage"));
        	} %>
        	
        	
            <script type="text/javascript">
                

                function currentStudentCheck() {
                    if (document.getElementById('student').checked) {
                        document.getElementById('student1').style.display = 'block';
                        document.getElementById('alumni1').style.display = 'none';
                        document.getElementById('faculty1').style.display = 'none';
                    } else if (document.getElementById('alumni').checked) {
                        document.getElementById('student1').style.display = 'none';
                        document.getElementById('alumni1').style.display = 'block';
                        document.getElementById('faculty1').style.display = 'none';
                    } else if (document.getElementById('faculty').checked) {
                        document.getElementById('student1').style.display = 'none';
                        document.getElementById('alumni1').style.display = 'none';
                        document.getElementById('faculty1').style.display = 'block';
                    } else {
                        document.getElementById('student1').style.display = 'none';
                        document.getElementById('alumni1').style.display = 'none';
                        document.getElementById('faculty1').style.display = 'none';
                    }
                }
            </script>

    </head>

    <body class="loginpage">
    <br />
        <div class="container sign-in-up well">
            <h2><img class="logoimage" src="logo.png"></h2>
            <br />
            <br />
            <div class="row">
                <div class="col-md-12">
                    <!-- Nav tabs -->
                    <div class="text-center">
                        <div class="btn-group">
                        
                        
        				<br>
                            <a href="#user" role="tab" data-toggle="tab" class="btn btn-success btn-lg active"><i class="fa fa-user"></i>Sign In</a>
                            <a href="#new" role="tab" data-toggle="tab" class="btn btn-success btn-lg"><i class="fa fa-plus"></i>Sign Up</a>
                        </div>
                    </div>
					<div class="tab-content">
                    <div class="tab-pane fade in active" id="user">
                        <br>	
                        <h3 style="font: italic;color :green;size:10;">
                        <% if(null != request.getAttribute("success_message")) 
        				{
        					out.println(request.getAttribute("success_message"));
        				}%>
        				</h3>
                        
                        <br>
                       <fieldset>
                        <form role="form" id="login_form" action="loginServlet" method="post">
                            <div class="form-group">
                                <div class="right-inner-addon">
                                    <i class="fa fa-envelope"></i>
                                    <input class="form-control input-lg" placeholder="Email Address" type="text" tabindex="1"  id="email"  name="user_name">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="right-inner-addon">
                                    <i class="fa fa-key"></i>
                                    <input class="form-control input-lg" placeholder="Password" type="password" tabindex="2" id="pass"  name="login_password" maxlength="20">
                                    <label class="forgot"><a href="/jsp/ResetPassword.jsp">forgot password?</a>
                                    </label>
                                </div>
                            </div>
                        
                        <div class=" text-center">
                            <button class="btn btn-success btn-lg">Login</button>
                        </div>
                        </form>
                        </fieldset>
                    </div>

                    <div class="tab-pane fade" id="new">
                        <br>
                        
                                				
        				<h3 style="font: italic;color:red">
        				<%
        				if(null != request.getAttribute("errorMessageLogin")) 
        				{
        					out.println(request.getAttribute("errorMessageLogin"));
        				}
        				if(null != request.getAttribute("errorMessage")) 
        				{
        					out.println(request.getAttribute("errorMessage"));
        				}
        				
        				
        				if(null!=request.getAttribute( "errorMessageNames"))
        				{ 
        					out.println(request.getAttribute( "errorMessageNames")); 
        				}
        				
        				if(null!=request.getAttribute( "errorMessageMiddleName"))
        				{ 
        					out.println(request.getAttribute( "errorMessageMiddleName")); 
        			    }
        				
        				
        				if(null!=request.getAttribute( "errorMessageDate"))
        				{ 
        					out.println(request.getAttribute( "errorMessageDate")); 
        			    }
        				
        				if(null!=request.getAttribute( "errorMessageMail")) 
        				{ 
        					out.println(request.getAttribute( "errorMessageMail")); 
        					
        				}
        				
        				if(null!=request.getAttribute( "errorMessageStudentPassword"))
        				{ 
        					out.println(request.getAttribute( "errorMessageStudentPassword")); 
        				}
        				
        				if(null!=request.getAttribute( "errorMessageStudentDept")) 
        				{ 
        					out.println(request.getAttribute( "errorMessageStudentDept")); 
        				}
        				
        				if(null!=request.getAttribute( "errorMessageSem"))
        				{ 
        					out.println(request.getAttribute( "errorMessageSem")); 
        				}
        				
        				if(null!=request.getAttribute( "errorMessageAlumniMail"))
        				{ 
        					out.println(request.getAttribute( "errorMessageAlumniMail")); 
        				}
        				
        				if(null!=request.getAttribute( "errorMessageAlumniPassword"))
        				{
        					out.println(request.getAttribute( "errorMessageAlumniPassword"));
        				}
        				
        				if(null!=request.getAttribute( "errorMessageAlumniDept")) 
        				{ 
        					out.println(request.getAttribute( "errorMessageAlumniDept"));
        				}
        				
        				if(null!=request.getAttribute( "errorMessageYOP"))
        				{ 
        					out.println(request.getAttribute( "errorMessageYOP"));
        				}
        				
        				if(null!=request.getAttribute( "errorMessageFacultyMail")) 
        				{
        					out.println(request.getAttribute( "errorMessageFacultyMail"));
        			    }
        				
        				if(null!=request.getAttribute( "errorMessageFacultyPassword"))
        				{ 
        					out.println(request.getAttribute( "errorMessageFacultyPassword"));
        				}
        				
        				if(null!=request.getAttribute( "errorMessageFacultyDept"))
        				{ 
        					out.println(request.getAttribute( "errorMessageFacultyDept")); 
        				}
        				
        				%>
        				
        				
        				</h3>
        				
        				<br>
                        
                        <h4 class="title">Not a member? Create account!</h4>
                        <fieldset>
                            <form role="form" class="form-group text-center" id="register_form" action="RegisterUserServlet" method="post">
                                <table align="center" border="0" cellspacing="5">
                                   
                                    <tr>
					                    <div class="form-group">
                                            <div class="right-inner-addon">
												<td>First Name*:</td>
												<td>
													<input type="text" class="form-control input-sm" name="first_name" id="first_name" maxlength="20" />
												</td>
												
											</div>
										</div>
									</tr>
									<tr>
										<div class="form-group">
											<div class="right-inner-addon">

												<td>Middle Name:</td>
												<td>
													<input type="text" class="form-control input-sm" name="middle_name" id="middle_name" maxlength="20" />
												</td>
										   </div>
										</div>
									</tr>
                
									<tr>
										<div class="form-group">
											<div class="right-inner-addon">

												<td>Last Name*:</td>
												<td>
													<input type="text" class="form-control input-sm" name="last_name" id="last_name" maxlength="20" />
												</td>
											
											</div>
										</div>
									</tr>
									<tr>
										<div class="form-group">
											<div class="right-inner-addon">
													<td>Date of Birth:</td>
													<td>
														<select class="form-control" name="day_of_month" id="day_of_month">
															<option value="00" selected>Day</option>
															<option value="01">01</option>
															<option value="02">02</option>
															<option value="03">03</option>
															<option value="04">04</option>
															<option value="05">05</option>
															<option value="06">06</option>
															<option value="07">07</option>
															<option value="08">08</option>
															<option value="09">09</option>
															<option value="10">10</option>
															<option value="11">11</option>
															<option value="12">12</option>
															<option value="13">13</option>
															<option value="14">14</option>
															<option value="15">15</option>
															<option value="16">16</option>
															<option value="17">17</option>
															<option value="18">18</option>
															<option value="19">19</option>
															<option value="20">20</option>
															<option value="21">21</option>
															<option value="22">22</option>
															<option value="23">23</option>
															<option value="24">24</option>
															<option value="25">25</option>
															<option value="26">26</option>
															<option value="27">27</option>
															<option value="28">28</option>
															<option value="29">29</option>
															<option value="30">30</option>
															<option value="31">31</option>
														</select>

														<select class="form-control" name="month" id="month">
															<option value="00" selected>Month</option>
															<option value="01">01</option>
															<option value="02">02</option>
															<option value="03">03</option>
															<option value="04">04</option>
															<option value="05">05</option>
															<option value="06">06</option>
															<option value="07">07</option>
															<option value="08">08</option>
															<option value="09">09</option>
															<option value="10">10</option>
															<option value="11">11</option>
															<option value="12">12</option>
														</select>

														<select class="form-control" name="birthday_year" id="birthday_year">
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
											</div>
										</div>
									</tr>
									
									<tr>
										<div class="form-group">
											<div class="right-inner-addon">
												<td>Who I am:</td>
												<td>
													<input class="radio-inline form-control" type="radio" name="register" id="student" onclick="javascript:currentStudentCheck();" value="currentStudent">Student
													<input class="radio-inline form-control" type="radio" name="register" id="alumni" onclick="javascript:currentStudentCheck();" value="alumni">Alumni
													<input class="radio-inline form-control" type="radio" name="register" id="faculty" onclick="javascript:currentStudentCheck();" value="faculty">Faculty
												</td>
											</div>
										</div>
									</tr>
								</table>
								<div class="form-group" id="student1" style="display:none;">
									<table align="center" border="0" cellspacing="5">
										<tr>
											<div class="form-group">
												<div class="right-inner-addon">

													<td>E-mail id*:</td>
													<td>
														<input type="text" class="form-control input-sm" name="e_mail_id_student" id="e_mail_id_student" placeholder="sample@students.itu.edu" />
														 </td>
												</div>
											</div>
										</tr>
										<tr>
											<div class="form-group">
												<div class="right-inner-addon">
													<td>New Password*:</td>
													<td>
														<input type="password" class="form-control input-sm" name="new_password_student" id="new_password_student" maxlength="20" />
													</td>
													
												</div>
											</div>
										</tr>
										<tr>
											<div class="form-group">
												<div class="right-inner-addon">
													<td>Re-enter Password*:</td>
													<td>
														<input type="password" class="form-control input-sm" name="re_enter_password_student" id="re_enter_password_student" maxlength="20" />
													</td>
												</div>
											</div>
										</tr>
										<tr>
											<div class="form-group">
												<div class="right-inner-addon">
													<td>Department* : </td>
													<td>
														<select class="form-control" name="department_student" id="department_student">
															<option value="">--select--</option>
															<option value="Software">MS in Software Engineering</option>
															<option value="Electrical">MS in Computer/Electrical Engineering</option>
															<option value="Digital">MS in Digital Arts</option>
															<option value="EngMgt">MS in Engineering Management</option>
															<option value="IntSc">MS in Interdisciplinary Science</option>
															<option value="MBA">Masters of Business Administration</option>
														</select>
													</td>
													
												</div>
											</div>
										</tr>
										<tr>
											<div class="form-group">
												<div class="right-inner-addon">
													<td>Current Trimester* : </td>
													<td>
														<select class="form-control" name="semester_student" id="semester_student">
															<option value="">--select--</option>
															<option value="sem1"> Trimester I </option>
															<option value="sem2"> Trimester II </option>
															<option value="sem3"> Trimester III </option>
															<option value="sem4"> Trimester IV </option>
														</select>
													</td>
												</div>
											</div>
										</tr>
									</table>
									<br>
									<button type="submit" class="btn btn-success btn-lg">Sign Up</button>

								</div>
								<div class="form-group" id="alumni1" style="display:none;">
									<table align="center" border="0" cellspacing="5">
										<tr>
											<div class="form-group">
												<div class="right-inner-addon">
													<td>E-mail id* :</td>
													<td>
														<input type="text" class="form-control input-sm" name="e_mail_id_alumni" id="e_mail_id_alumni" placeholder="sample@example.com" />
													</td>
													
												</div>
											</div>
										</tr>
										<tr>
											<div class="form-group">
												<div class="right-inner-addon">
													<td>New Password* :</td>
													<td>
														<input type="password" class="form-control input-sm" name="new_password_alumni" id="new_password_alumni" maxlength="20"/>
													</td>
													
												</div>
											</div>
										</tr>
										<tr>
											<div class="form-group">
												<div class="right-inner-addon">
													<td>Re-enter Password* :</td>
													<td>
														<input type="password" class="form-control input-sm" name="re_enter_password_alumni" id="re_enter_password_alumni" maxlength="20" />
													</td>
												</div>
											</div>
										</tr>
										<tr>
											<div class="form-group">
												<div class="right-inner-addon">
													<td>Department* : </td>
													<td>
														<select class="form-control" name="department_alumni" id="department_alumni">
															<option value="0000">--select--</option>
															<option value="Software">MS in Software Engineering</option>
															<option value="Electrical">MS in Computer/Electrical Engineering</option>
															<option value="Digital">MS in Digital Arts</option>
															<option value="EngMgt">MS in Engineering Management</option>
															<option value="IntSc">MS in Interdisciplinary Science</option>
															<option value="MBA">Masters of Business Administration</option>
														</select>
													</td>
													
												</div>
											</div>
										</tr>
										<tr>
											<div class="form-group">
												<div class="right-inner-addon">
													<td>Year of Passing* : </td>
													<td>
														<select class="form-control" name="month_of_passing" id="month_of_passing">
															<option value="00" selected>Month</option>
															<option value="01">01</option>
															<option value="02">02</option>
															<option value="03">03</option>
															<option value="04">04</option>
															<option value="05">05</option>
															<option value="06">06</option>
															<option value="07">07</option>
															<option value="08">08</option>
															<option value="09">09</option>
															<option value="10">10</option>
															<option value="11">11</option>
															<option value="12">12</option>
														</select>
														<select class="form-control" name="year_of_passing" id="year_of_passing">
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
													
												</div>
											</div>
										</tr>
									</table>
									<br>
									<button type="submit" class="btn btn-success btn-lg">Sign Up</button>
								</div>
								<div class="form-group" id="faculty1" style="display:none">
									<table align="center" border="0" cellspacing="5">
										<tr>
											<div class="form-group">
												<div class="right-inner-addon">
													<td>E-mail id* :</td>
													<td>
														<input type="text" class="form-control input-sm" name="e_mail_id_faculty" id="e_mail_id_faculty" placeholder="sample@itu.edu" />
													</td>
										      </div>
											</div>
										</tr>
										<tr>
											<div class="form-group">
												<div class="right-inner-addon">
													<td>New Password* :</td>
													<td>
														<input type="password" class="form-control input-sm" name="new_password_faculty" id="new_password_faculty" maxlength="20"/>
													</td>
												</div>
											</div>
										</tr>
										<tr>
											<div class="form-group">
												<div class="right-inner-addon">
													<td>Re-enter Password* :</td>
													<td>
														<input type="password" class="form-control input-sm" name="re_enter_password_faculty" id="re_enter_password_faculty" maxlength="20"/>
													</td>
												</div>
											</div>
										</tr>
										<tr>
											<div class="form-group">
												<div class="right-inner-addon">
													<td>Department* : </td>
													<td>
														<select name="department_faculty" class="form-control" id="department_faculty">
															<option value="">--select--</option>
															<option value="Software">MS in Software Engineering</option>
															<option value="Electrical">MS in Computer/Electrical Engineering</option>
															<option value="Digital">MS in Digital Arts</option>
															<option value="EngMgt">MS in Engineering Management</option>
															<option value="IntSc">MS in Interdisciplinary Science</option>
															<option value="MBA">Masters of Business Administration</option>
															<option value="Finance">Finance</option>
															<option value="Admission">Admission</option>
															<option value="ISO">International Students Office</option>
															<option value="Library">Library</option>
														</select>
													</td>
												</div>
											</div>
										</tr>
									</table>
									<button type="submit" class="btn btn-success btn-lg">Sign Up</button>
								</div>
							</form>
						</fieldset>
					</div>
					</div>
				</div>
			</div>
		</div>
    </body>

    </html>