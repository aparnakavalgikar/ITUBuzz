package com.itubuzz.webapp;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itubuzz.dao.*;
import com.itubuzz.valueobjects.*;


/**
 * Servlet implementation class PostDataServlet
 */
public class PostDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ArrayList<PostVO> all_post_data;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostDataServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String post_text = null;
		response.setContentType("text/html"); 
		PrintWriter out = response.getWriter(); 
		HttpSession session = request.getSession(false); 
		post_text = request.getParameter("post_text");	
		String user_id = request.getParameter("log_user_id");
		
		if(post_text.length()>0){
			if(PostDAO.postdataCred(post_text,user_id)){ 
				 all_post_data = new ArrayList<PostVO>();
				 all_post_data = RetrievePostDAO.retrievePostedData();
				 session.setAttribute("all_posts", all_post_data);
				 System.out.println("In Qaforum data" + all_post_data.toString());
				 RequestDispatcher rd=request.getRequestDispatcher("HomePage.jsp");      
		         rd.forward(request,response);
	             }    
			}
			else {
  	    	  session.invalidate();
                 request.setAttribute("errorMessage", "Please type a post");
                 RequestDispatcher rd = request.getRequestDispatcher("HomePage.jsp");
                 rd.forward(request, response);
  	          }
		
		out.close(); 
	}
}