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
 * Servlet implementation class GetforumServlet
 */

public class GetforumServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ArrayList<QuestionVO> all_question_data = null;
	private ArrayList<AnswerVO> all_answer_data = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetforumServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 	
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        String name = null;
        String loggedInUserId = request.getParameter("loggedInUser");
        if(session.getAttribute("name")!=null){
        name =  session.getAttribute("name").toString();
        }
        System.out.println("setting name in knowledge forum for navigation : "+name);
		 session.setAttribute("session_name", name);
        
        all_question_data = new ArrayList<QuestionVO>();
        all_question_data = RetrieveQaforumDAO.retrieveQueData();
		
        all_answer_data = new ArrayList<AnswerVO>();
        all_answer_data = RetrieveQaforumDAO.retrieveAnsData();
        
		if(all_question_data != null){         
			   session.setAttribute("all_questions", all_question_data);
			   
			   if(all_answer_data != null){
				   session.setAttribute("all_answers", all_answer_data);
			   }
			   session.setAttribute("name", loggedInUserId);
			   RequestDispatcher rd=request.getRequestDispatcher("QAforum.jsp");    
			   rd.forward(request,response);

		   }
		out.close();
	}
   
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}