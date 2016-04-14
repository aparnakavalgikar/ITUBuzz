package com.itubuzz.webapp;
/**
 * International Technological University, San Jose
 * Fetch Profile 
 * Created date : 03/18/2016
 * @ Author  Poorvisha Muthusamy
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itubuzz.dao.FetchProfileDetailsDAO;

/**
 * Servlet implementation for fetching user profile details
 */
public class FetchProfileServlet extends HttpServlet {
	 private static final long serialVersionUID = 1L;
	 /**
	  * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	  * edited on : 03/18/2016
	  * @author Poorvisha Muthusamy
	  */
	
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  response.setContentType("text/html");
		  PrintWriter out = response.getWriter();
		  HttpSession session = request.getSession(false); 
		  RequestDispatcher rd = null;
		  if(session != null && null != session.getAttribute("emailId")){
			  String eMail = (String) session.getAttribute("emailId");
			  String name = (String) session.getAttribute("name");
			  session.setAttribute("name", name);
			  Map < String, String > user = null;
			
			  if (FetchProfileDetailsDAO.fetchProfile(eMail)) {
				   user = FetchProfileDetailsDAO.UserDetails();
				   session.setAttribute("firstName", user.get("firstName"));
				   session.setAttribute("middleName", user.get("middleName"));
				   session.setAttribute("lastName", user.get("lastName"));
				   session.setAttribute("eMailId", user.get("eMailId"));
				   session.setAttribute("sem", user.get("sem"));
				   session.setAttribute("dept", user.get("dept"));
				   session.setAttribute("role", user.get("role"));
				   session.setAttribute("dob_day", user.get("dob_day"));
				   session.setAttribute("dob_month", user.get("dob_month"));
				   session.setAttribute("dob_year", user.get("dob_year"));
				   session.setAttribute("yop_day", user.get("yop_day"));
				   session.setAttribute("yop_month", user.get("yop_month"));
				   session.setAttribute("yop_year", user.get("yop_year"));
				
				   rd = request.getRequestDispatcher("ViewProfile.jsp");
				   rd.forward(request, response);
			  } else {
				   rd = request.getRequestDispatcher("HomePage.jsp");
				   rd.include(request, response);
			  }
		  }else{
			  rd = request.getRequestDispatcher("LoginAndRegister.jsp");
			  rd.forward(request, response);
		  }
		  out.close();
	 
}
}