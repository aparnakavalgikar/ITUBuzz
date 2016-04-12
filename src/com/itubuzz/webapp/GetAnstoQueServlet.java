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
 * Servlet implementation class GetAnstoQueServlet
 */
public class GetAnstoQueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private QuestionVO question_data = null;
	private ArrayList<AnswerVO> all_answer_data = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetAnstoQueServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
		String question_id = request.getParameter("question_id");
		question_data = new QuestionVO();
		question_data = RetrieveQaforumDAO.retrieveQueData(Integer.parseInt(question_id));
		
        all_answer_data = new ArrayList<AnswerVO>();
        all_answer_data = RetrieveQaforumDAO.retrieveAnstoQueData(Integer.parseInt(question_id));
        
		if(session!=null)  {
			session.setAttribute("question_data", question_data);
			
			if(all_answer_data != null){
				session.setAttribute("all_answers", all_answer_data);
        	}
        		   
    		RequestDispatcher rd=request.getRequestDispatcher("QuestionPage.jsp");    
    		rd.forward(request,response);

        	} else	{    
            RequestDispatcher rd=request.getRequestDispatcher("QAforum.jsp");    
            rd.include(request,response);    
        }
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
