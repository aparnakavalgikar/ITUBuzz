package com.itubuzz.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class QaforumDAO {

	public static boolean forumdataCred(String question_text,String user_id  ) {
		// TODO Auto-generated method stub
		 boolean status = false;  
	        Connection conn = null;  
	        PreparedStatement pst = null;  
	        ResultSet rs = null;
	        
	        Integer userId = Integer.parseInt((user_id));
	        
	        final String DB_URL="jdbc:mysql://127.0.0.1:3306/itubuzz"; 
	        String driver = "com.mysql.jdbc.Driver";  
	        String userName = "root";  
	        String password = "root";  
	        try {  
	            Class.forName(driver).newInstance();  
	            conn = DriverManager  
	                    .getConnection(DB_URL, userName, password);  
	  
	            PreparedStatement ps=conn.prepareStatement(  
	            		"insert into questions(question_text, log_user_id) values(?,?)", Statement.RETURN_GENERATED_KEYS);  
       			  
	            		ps.setString(1, question_text);
	            		ps.setInt(2, userId);
	            		ps.executeUpdate();
	            
	           
	            rs = ps.getGeneratedKeys();
                if(rs != null && rs.next()){
                    status = true;
                }
	  
	        } catch (Exception e) {  
	            System.out.println(e);
	            
	        } finally {  
	            if (conn != null) {  
	                try {  
	                    conn.close();  
	                } catch (SQLException e) {  
	                    e.printStackTrace();  
	                }  
	            }  
	            if (pst != null) {  
	                try {  
	                    pst.close();  
	                } catch (SQLException e) {  
	                    e.printStackTrace();  
	                }  
	            }  
	            if (rs != null) {  
	                try {  
	                    rs.close();  
	                } catch (SQLException e) {  
	                    e.printStackTrace();  
	                }  
	            }  
	        }  
	        return status;  
	}

	public static boolean forumdataCred(String answer_id, String answer_text, String immparent_id, String question_id, String user_id) {
		// TODO Auto-generated method stub
		 	boolean status = false;  
	        Connection conn = null;  
	        PreparedStatement pst = null;  
	        ResultSet rs = null;
	        
	        Long answerId = Long.parseLong((answer_id));
	        Long immparentId = Long.parseLong((immparent_id));
	        Integer questionId = Integer.parseInt((question_id));
	        Integer userId = Integer.parseInt((user_id));
	        
	        final String DB_URL="jdbc:mysql://127.0.0.1:3306/itubuzz"; 
	        String driver = "com.mysql.jdbc.Driver";  
	        String userName = "root";  
	        String password = "root";  
	        
	        try {  
	            Class.forName(driver).newInstance();  
	            conn = DriverManager  
	                    .getConnection(DB_URL, userName, password);  
	  
	            PreparedStatement ps=conn.prepareStatement(  
	            		"insert into answers(answer_id, answer_text, immparent_id, question_id, log_user_id) values(?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);  
       			  
	            		ps.setLong(1, answerId);
	            		ps.setString(2, answer_text);
	            		ps.setLong(3, immparentId);
	            		ps.setInt(4, questionId);
	            		ps.setInt(5, userId);
	            		ps.executeUpdate();
	           
	            rs = ps.getGeneratedKeys();

                if(rs != null && rs.next()){
                    status = true;
                }
	  
	        } catch (Exception e) {  
	            System.out.println(e);  
	        } finally {  
	            if (conn != null) {  
	                try {  
	                    conn.close();  
	                } catch (SQLException e) {  
	                    e.printStackTrace();  
	                }  
	            }  
	            if (pst != null) {  
	                try {  
	                    pst.close();  
	                } catch (SQLException e) {  
	                    e.printStackTrace();  
	                }  
	            }  
	            if (rs != null) {  
	                try {  
	                    rs.close();  
	                } catch (SQLException e) {  
	                    e.printStackTrace();  
	                }  
	            }  
	        }  
	        return status;  
	}
}