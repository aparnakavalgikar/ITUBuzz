package com.itubuzz.webapp;
/**
 * International Technological University, San Jose
 * Login successfully 
 * Created date : 03/03/2016
 * @ Author  Kavya Suresh Babu
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itubuzz.dao.LoginDAO;
import com.itubuzz.dao.RetrievePostDAO;
import com.itubuzz.valueobjects.Post;

/**
 * Servlet implementation class Login
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ArrayList<Post> complete_post_data;
	
    /**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 * this method allows us to get the email id and password entered by the user and compare it with valid database entries
	 * edited on : 03/07/2016
	 * @author Kavya
	 */
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 response.setContentType("text/html"); 
		    
		    
	        PrintWriter out = response.getWriter();    
	          
	        String eMail=request.getParameter("user_name");    
	        String password=request.getParameter("login_password"); 
	        
	        String name = null;
	        complete_post_data = new ArrayList<Post>();
	        complete_post_data = RetrievePostDAO.retrievePostedData();
			System.out.println(complete_post_data.toString());
            
	       if(LoginDAO.validate(eMail, password)){ 
	    	   HttpSession session = request.getSession(false);  
	           if(session!=null)  {
	        	   if(complete_post_data != null){
	               name = LoginDAO.UserNameDetails();
	           session.setAttribute("name", name);   
	           session.setAttribute("post_updated_value", complete_post_data);
	            RequestDispatcher rd=request.getRequestDispatcher("HomePage.jsp");    
	            rd.forward(request,response);  
	        	   }
	}
	       else{    
	                
	            RequestDispatcher rd=request.getRequestDispatcher("LoginAndRegister.jsp");    
	            rd.include(request,response);    
	        }    
	           
	       }
	        out.close();   

	
    }
    
    
	

}
