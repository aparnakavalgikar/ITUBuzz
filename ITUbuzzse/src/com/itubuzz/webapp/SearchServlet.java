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

import com.itubuzz.dao.*;
import com.itubuzz.valueobjects.*;

/**
 * Servlet implementation class SearchServlet
 */
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ArrayList<SearchVO> search_results;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html"); 
		PrintWriter out = response.getWriter(); 
		HttpSession session = request.getSession(false); 
		String searchtext = request.getParameter("search");
		String postorque = request.getParameter("postorque");
		String searchstring = "%"+searchtext.replace(" ", "%")+"%";
		
		if(searchtext.length()>0) {
			if(postorque.matches("post")) 
				search_results = RetrieveSearchDAO.retrieveSearchedPost(searchstring);
			 else if(postorque.matches("que")) 
				search_results = RetrieveSearchDAO.retrieveSearchedQue(searchstring);
			
			session.setAttribute("search_values", search_results);
			session.setAttribute("postorque", postorque);
			RequestDispatcher rd=request.getRequestDispatcher("Search.jsp");      
		    rd.forward(request,response);
			
		} else {
  	    	  session.invalidate();
              request.setAttribute("errorMessage", "Not found");
              RequestDispatcher rd = request.getRequestDispatcher("HomePage.jsp");
              rd.forward(request, response);
  	          }
		
		out.close(); 
	}
}