package com.itubuzz.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ResetPasswordDAO {

	
	
	public static String resetPassword(String email, String password1, String password2){
		// TODO Auto-generated method stub
		    String status = "Unable to Reset Password! Please try again later";
		    Connection conn = null;  
	        PreparedStatement pst = null; 
	         
	          
	  
	        final String DB_URL="jdbc:mysql://127.0.0.1:3306/itubuzz"; 
	        String driver = "com.mysql.jdbc.Driver";  
	        String userName = "root";  
	        String password = "root";  
	        try {  
	            Class.forName(driver).newInstance();  
	            conn = DriverManager  
	                    .getConnection(DB_URL, userName, password);  
	            
	            	    if(email != null && password1 != null && password2 != null){
	            PreparedStatement ps=conn.prepareStatement(  
	            		" UPDATE userLogin SET password=? WHERE e_mail_id=?");  
	            		
	            		
	            		ps.setString(1,password1);
	            		ps.setString(2, email);

	            		
	            		 ps.executeUpdate(); 
	            		
	            		
	                   
	                         status = "Successfully updated password ! Please login to continue";
	                         conn.close();
	                     }
	                     
	        
	            	     
	            	    
	            	   
	            	    
		
	}
	        catch (Exception e) {  
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
	           
	            }  
	         
	        return status;  
	} 
}
