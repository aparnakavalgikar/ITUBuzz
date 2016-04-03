<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ITUBUZZ</title>

<%
    if(null!=request.getAttribute("errorMessagePassword"))
    {
        out.println(request.getAttribute("errorMessagePassword"));
    }
%>

</head>
<body>
<div>
            <form id="reset_form" action="ResetPasswordServlet" method="post">
              <table border="0" align="center">
                <tr>
                  <td >Enter the registered E-Mail id* : </td>
                  <td></td>
                  <td> <input type="text" id="email"  name="user_name"></td>
                </tr>
                <tr>
                </tr>
                <tr>
                <td >Enter new password* :</td>
                <td></td>
                <td> <input type="password"  id="password"  name="new_reset_password" class="inputtext" ></td>
                </tr>
                <tr>
                </tr>
                <tr>
                <td >Re-enter new password* : </td>
                <td></td>
                <td><input type="password"  id="password"  name="reenter_new_reset_password" class="inputtext" ></td>
                </tr>
                <tr>
                </tr>
                <tr>
                <td>
                </td>
                <td ><input type="submit" class="loginbutton" onclick="validateUserCredentials()" value="Submit" /></td>
                </tr>
              </table>
            </form>
          </div>
</body>
</html>