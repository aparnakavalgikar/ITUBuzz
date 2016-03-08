package com.itubuzz.webapp;
/**
 * International Technological University, San Jose
 * Register a user successfully 
 * Created date : 03/03/2016
 * @ Author  Kavya Suresh Babu
 */
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itubuzz.dao.RegisterUserDAO;
import com.itubuzz.validators.EMailIdValidator;
import com.itubuzz.validators.NameValidator;
import com.itubuzz.validators.PasswordValidator;

/**
 * Servlet implementation class RegisterUserServlet
 */
public class RegisterUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

    public RegisterUserServlet() {
        super();
       
    	}
        // TODO Auto-generated constructor stub
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}





	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 * This method allows us to receive all the user input data and call all the required validations for the entered user values
	 * Edited on : 03/07/2016
	 * @author Kavya
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String role = null;
		
		response.setContentType("text/html");  
		PrintWriter out = response.getWriter(); 
		
		String firstName = request.getParameter("first_name");
        String middleName = request.getParameter("middle_name");
        String lastName = request.getParameter("last_name");
        String eMailId = request.getParameter("e_mail_id");
        String newPassword = request.getParameter("new_password");
        String reEnterPassword = request.getParameter("re_enter_password");
        String month = request.getParameter("month");
        String day = request.getParameter("day_of_month");
        String year = request.getParameter("birthday_year");
        String date = month+"/"+day+"/"+year;
        String dept = request.getParameter("department");
        String sem = request.getParameter("semester");
        String month_of_passing = request.getParameter("month_of_passing");
        String year_of_passing = request.getParameter("year_of_passing");
        String passYear = month_of_passing+"/"+year_of_passing;
        String userType = request.getParameter("register");
        System.out.println("birth date is :"+date);
        System.out.println("radio button selected is : "+userType);
        System.out.println("year of passing is :"+passYear);
        
        
        

        
        String name = firstName+" "+lastName;
        HttpSession session = request.getSession(false);  
        if(session!=null)  
        session.setAttribute("name", name);
		
        if(userType.equalsIgnoreCase("currentStudent")){
        	if(EMailIdValidator.validateUserEmailId(eMailId, userType)){
        		if(sem != null){
        	role = "student";
        	}
        		else {
        			session.invalidate();
                    request.setAttribute("errorMessage", "Please select a Trimester");
                    RequestDispatcher rd = request.getRequestDispatcher("LoginAndRegister.jsp");
                    rd.forward(request, response); 
        		}
        	}
        	else{
                session.invalidate();
                request.setAttribute("errorMessageEMail", "Invalid E-Mail Id! If you are a Student or Faculty, please enter E-Mail in the format : sample@itu.com !");
                RequestDispatcher rd = request.getRequestDispatcher("LoginAndRegister.jsp");
                rd.forward(request, response);          
            }
        }
        else if (userType.equalsIgnoreCase("alumni")){
        	if(dept != null && passYear  != null){
        	role = "Alumni";
        }
        	else{
        		session.invalidate();
                request.setAttribute("errorMessage", "Please select a Department and the Year of Passing!");
                RequestDispatcher rd = request.getRequestDispatcher("LoginAndRegister.jsp");
                rd.forward(request, response);    
        	}
        }
        else if (userType.equalsIgnoreCase("faculty")){
        	if(EMailIdValidator.validateUserEmailId(eMailId, userType)){
        	role = "Faculty";
        	}
        	else{
                session.invalidate();
                request.setAttribute("errorMessageEMail", "Invalid E-Mail Id! If you are a Student or Faculty, please enter E-Mail in the format : sample@itu.com !");
                RequestDispatcher rd = request.getRequestDispatcher("LoginAndRegister.jsp");
                rd.forward(request, response);          
            }
        }
        
        	if(newPassword.equals(reEnterPassword)){
        		if(PasswordValidator.validateUserPasswords(newPassword, reEnterPassword,eMailId)){
                 if(NameValidator.validateUserNames(firstName,middleName,lastName)){
                  if(dept != null){
        	      if(RegisterUserDAO.enterUserCredentials(firstName,middleName,lastName,newPassword,eMailId,dept,sem,role))
        			{
        		      RequestDispatcher rd=request.getRequestDispatcher("RegisterLogin.jsp");    
   	                  rd.forward(request,response); 
        			}
        	      else{
        	    	  session.invalidate();
                       request.setAttribute("errorMessage", "Mandatory fields cannot be Empty! Please enter valid values");
                       RequestDispatcher rd = request.getRequestDispatcher("LoginAndRegister.jsp");
                       rd.forward(request, response);
        	          }
                  }
        	      else{
        	    	  session.invalidate();
                      request.setAttribute("errorMessage", "Please select a Valid Department");
                      RequestDispatcher rd = request.getRequestDispatcher("LoginAndRegister.jsp");
                      rd.forward(request, response);
                  }
                  }
               else {
            	   session.invalidate();
                     request.setAttribute("errorMessageName", "Invalid FirstName, MiddleName or LastName! Names cannot be Empty nor contain numbers and special characters!");
            RequestDispatcher rd = request.getRequestDispatcher("LoginAndRegister.jsp");
            rd.forward(request, response);
		}
        }
        else{
        	session.invalidate();
            request.setAttribute("errorMessagePassword1", " Password Specifications are as follows : "+"\n"+"  a) Password must not be the same as your Email-id "+"\n"+ "b) Password be of minimum 8 characters and a maximum of 20 characters "+"\n"+" c) Password should contain atleast one upper case alphabet"+"\n"+"  d) Password should contain atleast one lower case alphabet "+"\n"+"e) Password should contain atleast one number"+"\n"+" f) Password should contain atleast one special character ");
            RequestDispatcher rd = request.getRequestDispatcher("LoginAndRegister.jsp");
            rd.forward(request, response);          
        }
        	}
        		else{
        			session.invalidate();
                    request.setAttribute("errorMessagePassword2", " Password fields cannot be null or same as your Email-id! You have entered Invalid values for Passwords! Enter a password of minimum 8 characters !");
                    RequestDispatcher rd = request.getRequestDispatcher("LoginAndRegister.jsp");
                    rd.forward(request, response);          
                }
        
        	
        out.close(); 
     }	            

}

