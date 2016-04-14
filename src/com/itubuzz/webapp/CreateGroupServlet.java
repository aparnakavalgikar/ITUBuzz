package com.itubuzz.webapp;
/**
 * International Technological University, San Jose
 * Register a user successfully 
 * Created date : 03/27/2016
 * @ Author  Priyanka Mudiganti
 */
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import javax.servlet.http.HttpSession;

import com.itubuzz.dao.CreateGroupDAO;

/**
 * Servlet implementation class RegisterUserServlet
 */
public class CreateGroupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

    public CreateGroupServlet() {
        super();
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");  
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(false); 
		String groupName = request.getParameter("group_name");
        String members = request.getParameter("members");
        if(session != null && null != session.getAttribute("emailId")){
			  String eMail = (String) session.getAttribute("emailId");
		members = members.concat(","+eMail);
        }
		System.out.println("the members are : "+members);
        
		int groupId = CreateGroupDAO.createGroup(groupName);
		
		if(groupId != -1){
			int numberOfRecordsCreated = CreateGroupDAO.assignUsersToGroup(groupId,members);
			System.out.println(numberOfRecordsCreated+" users has been assigned to the group groupName");
			request.setAttribute("success_createGroup", "Successfully created a/an "+groupName+" group with members  : "+members);
			RequestDispatcher rd=request.getRequestDispatcher("CreateGroup.jsp");    
			   rd.forward(request,response);
		}

        out.close(); 
     }
}

