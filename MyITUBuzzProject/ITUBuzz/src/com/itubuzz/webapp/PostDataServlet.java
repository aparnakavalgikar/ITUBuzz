package com.itubuzz.webapp;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itubuzz.dao.PostDAO;
import com.itubuzz.dao.RetrievePostDAO;
import com.itubuzz.valueobjects.Post;



/**
 * Servlet implementation class PostDataServlet
 */
public class PostDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ArrayList<Post> complete_post_data;
	

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
		// TODO Auto-generated method stub
		
		response.setContentType("text/html"); 
		PrintWriter out = response.getWriter(); 
		HttpSession session = request.getSession(false); 
		String post_value = request.getParameter("post_text");
		
		System.out.println(post_value);
		if(post_value.length()>0){
			if(PostDAO.postdataCred(post_value)){ 
				 complete_post_data = new ArrayList<Post>();
			     complete_post_data = RetrievePostDAO.retrievePostedData();
				 session.setAttribute("post_recent_val", post_value);
				 session.setAttribute("post_updated_value", complete_post_data);
				 RequestDispatcher rd=request.getRequestDispatcher("HomePage.jsp");      
		         rd.forward(request,response); 
	             }    
			}
			else{
  	    	  session.invalidate();
                 request.setAttribute("errorMessage", "Please type a post");
                 RequestDispatcher rd = request.getRequestDispatcher("HomePage.jsp");
                 rd.forward(request, response);
  	          }
		
		out.close(); 
	}
	

}
