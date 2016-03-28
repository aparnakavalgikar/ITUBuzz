package com.itubuzz.webapp;
/**
 * International Technological University, San Jose
 * To Update a user profile successfully 
 * Created date : 03/18/2016
 * @ Author  Poorvisha Muthusamy
 */
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.itubuzz.dao.UpdateProfileDAO;

/**
 * Servlet implementation class ProfileUpdateServlet
 */
@MultipartConfig
public class ProfileUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SLASH = "/";
       
    /**
     * @see HttpServlet#HttpServlet()
     */

    public ProfileUpdateServlet() {
        super();
       
    	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 * Edited on : 03/18/2016
	 * @author Poorvisha Muthusamy
	 */
	
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if(session != null && null != session.getAttribute("emailId")){
			String eMailId = (String) session.getAttribute("emailId");
	        String userType = (String) session.getAttribute("role");
			String role = null;		
			response.setContentType("text/html");  
			PrintWriter out = response.getWriter(); 		
			String firstName = request.getParameter("first_name");
	        String middleName = request.getParameter("middle_name");
	        String lastName = request.getParameter("last_name");
	        eMailId = eMailId.replace(SLASH, "");
	        String month = request.getParameter("month");
	        String day = request.getParameter("day_of_month");
	        String year = request.getParameter("birthday_year");
	        String date = year+"-"+month+"-"+day;
	        String dept = request.getParameter("department");
	        String sem = request.getParameter("semester");
	        String month_of_passing = request.getParameter("month_of_passing");
	        String year_of_passing = request.getParameter("year_of_passing");
	        String passYear = year_of_passing+"-"+month_of_passing+"-"+"01";
	        System.out.println("birth date is :"+date);
	        System.out.println("radio button selected is : "+userType);
	        System.out.println("year of passing is :"+passYear);
	        Part filePart = request.getPart("photo");
	        
	      //  HttpSession session = request.getSession(false); 
			
	        /*if(userType.equalsIgnoreCase("student")){
	        	role = "student";
	        }
	        else if (userType.equalsIgnoreCase("alumni")){
	        	role = "Alumni";
	        }
	        else if (userType.equalsIgnoreCase("faculty")){
	        	role = "Faculty";
	        }*/
	        role = userType;
	        
	        if(role.equalsIgnoreCase("student")){
	        	if(UpdateProfileDAO.updateStudentProfileDetails(firstName,middleName,lastName,eMailId,date,dept,sem,filePart))
	    		{
	        		RequestDispatcher rd=request.getRequestDispatcher("HomePage.jsp");    
	                rd.forward(request,response); 
	    		}
	        }else if(role.equalsIgnoreCase("Alumni")){
	        	if(UpdateProfileDAO.updateAlumniProfileDetails(firstName,middleName,lastName,eMailId,date,dept,passYear,filePart))
	    		{
	        		RequestDispatcher rd=request.getRequestDispatcher("HomePage.jsp");    
	                rd.forward(request,response); 
	    		}
	        }else if(role.equalsIgnoreCase("Faculty")){
	        	if(UpdateProfileDAO.updateFacultyProfileDetails(firstName,middleName,lastName,eMailId,date,dept,filePart))
	    		{
	        		RequestDispatcher rd=request.getRequestDispatcher("HomePage.jsp");    
	                rd.forward(request,response); 
	    		}
	        }
	        out.close();
		}else{
			RequestDispatcher rd=request.getRequestDispatcher("LoginAndRegister.jsp");    
            rd.forward(request,response); 
		}
      }
        
	}	            
