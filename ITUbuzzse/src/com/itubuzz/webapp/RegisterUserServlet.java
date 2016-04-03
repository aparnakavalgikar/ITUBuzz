package com.itubuzz.webapp;
/**
 * International Technological University, San Jose
 * Register a user successfully 
 * Created date : 03/03/2016
 * @ Author  Kavya Suresh Babu
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
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
import com.itubuzz.valueobjects.UserVO;

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
		String dob = null;
		String passYear = null;
		response.setContentType("text/html");  
		PrintWriter out = response.getWriter(); 
		HttpSession session = request.getSession(false); 
        String month = request.getParameter("month");
        String day = request.getParameter("day_of_month");
        String year = request.getParameter("birthday_year");
        dob = year+"-"+month+"-"+day;
        String month_of_passing = request.getParameter("month_of_passing");
        String year_of_passing = request.getParameter("year_of_passing");
        passYear = year_of_passing+"-"+month_of_passing+"-"+"01";
        System.out.println("length of dob : "+dob.length());
        System.out.println("length of yop : "+passYear.length());
        System.out.println(dob);
        System.out.println(passYear);
        
		UserVO user = new UserVO();
		user.setFirst_name(request.getParameter("first_name"));
		if(request.getParameter("middle_name") !=null || dob != null || passYear != null){
			user.setDob(dob);
	        user.setYearOfPassing(passYear);
			if(NameValidator.validateMiddleName(request.getParameter("middle_name"))){
		    user.setMiddle_name(request.getParameter("middle_name"));
		}
	}

        user.setLast_name(request.getParameter("last_name"));
        user.setTrimester(request.getParameter("semester_student"));
        user.setUser_type(request.getParameter("register"));

        	
      String name = user.getFirst_name();
         
        if(session!=null)  
        session.setAttribute("name", name);
		
       /** if(dob != null){
        	if(DateValidator.isThisDateValid(dob,"yyyy-mm-dd")){
        		System.out.println("date validated");
        	}
        }**/
        
        if(user.getUser_type().equalsIgnoreCase("currentStudent")){
        		if(user.getTrimester() != null){
        		user.setE_mailId(request.getParameter("e_mail_id_student"));
        		user.setPasswordNew(request.getParameter("new_password_student"));
        		user.setPasswordReenter(request.getParameter("re_enter_password_student"));
        		user.setDept(request.getParameter("department_student"));
        		if(EMailIdValidator.validateUserEmailId(user.getE_mailId(), user.getUser_type())){
        	        user.setRole("student");
        	    }
        		else {
        			session.invalidate();
                    request.setAttribute("errorMessage", "Please enter a valid EMail Id");
                    RequestDispatcher rd = request.getRequestDispatcher("LoginAndRegister.jsp");
                    rd.forward(request, response); 
        		}
        		}
        		else {
        			session.invalidate();
                    request.setAttribute("errorMessage", "Please select a Trimester");
                    RequestDispatcher rd = request.getRequestDispatcher("LoginAndRegister.jsp");
                    rd.forward(request, response); 
        		}
        	
        	
        }
        else if (user.getUser_type().equalsIgnoreCase("alumni")){
        	user.setDept(request.getParameter("department_alumni"));
        	if(user.getDept() != null && user.getYearOfPassing()  != null){
        		user.setE_mailId(request.getParameter("e_mail_id_alumni"));
        		user.setPasswordNew(request.getParameter("new_password_alumni"));
        		user.setPasswordReenter(request.getParameter("re_enter_password_alumni"));
        	    user.setRole("alumni");;
        }
        	else{
        		session.invalidate();
                request.setAttribute("errorMessage", "Please select a Department and the Year of Passing!");
                RequestDispatcher rd = request.getRequestDispatcher("LoginAndRegister.jsp");
                rd.forward(request, response);    
        	}
        }
        else if (user.getUser_type().equalsIgnoreCase("faculty")){
        	user.setE_mailId(request.getParameter("e_mail_id_faculty"));
        	user.setPasswordNew(request.getParameter("new_password_faculty"));
        	user.setPasswordReenter(request.getParameter("re_enter_password_faculty"));
        	user.setDept(request.getParameter("department_faculty"));
        	if(EMailIdValidator.validateUserEmailId(user.getE_mailId(), user.getDept())){
        	user.setRole("faculty");;
        	}
        	else{
                session.invalidate();
                request.setAttribute("errorMessageEMail", "Invalid E-Mail Id! If you are a Student or Faculty, please enter E-Mail in the format : sample@itu.com !");
                RequestDispatcher rd = request.getRequestDispatcher("LoginAndRegister.jsp");
                rd.forward(request, response);          
            }
        }
        
        	if(user.getPasswordNew().equals(user.getPasswordReenter())){
        		if(PasswordValidator.validateUserPasswords(user.getPasswordNew(),user.getPasswordReenter(),user.getE_mailId())){
                 if(NameValidator.validateUserNames(user.getFirst_name(),user.getMiddle_name(),user.getLast_name())){
                  if(user.getDept() != null){     
        	      try {
					if(RegisterUserDAO.enterUserCredentials(user.getFirst_name(),user.getMiddle_name(),user.getLast_name(),user.getPasswordNew(),user.getE_mailId(),user.getDob(),user.getDept(),user.getTrimester(),user.getYearOfPassing(),user.getRole()))
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
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
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

