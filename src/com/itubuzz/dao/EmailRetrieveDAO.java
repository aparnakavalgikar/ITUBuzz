package com.itubuzz.dao;
/**
 * International Technological University, San Jose
 * @author Kavya
 * created on : 03/15/2016
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class EmailRetrieveDAO {

	/**
	 * method : retrieveEMailForResetPassword(String e_mail)
	 * @param e_mail
	 * @return
	 * @author Kavya
	 */
	public static boolean retrieveEMailForResetPassword(String e_mail){
		
		    boolean status = false;  
	        Connection conn = null;  
	        PreparedStatement pst = null;  
	        ResultSet rs = null; 
	        String retrievedUserName = null;
	  
	        final String DB_URL="jdbc:mysql://127.0.0.1:3306/itubuzz"; 
	        String driver = "com.mysql.jdbc.Driver";  
	        String userName = "root";  
	        String password = "root";  
	        try {  
	            Class.forName(driver).newInstance();  
	            conn = DriverManager  
	                    .getConnection(DB_URL, userName, password);  
	  
	            pst = conn  
	                    .prepareStatement("select e_mail_id from userLogin where e_mail_id=?");  
	            pst.setString(1, e_mail);  
	            rs = pst.executeQuery();
	            while(rs.next()){
	            	 retrievedUserName = rs.getString("e_mail_id");

	            	 }
	            if(retrievedUserName.equals(e_mail)){
	            	status = true;
	            }
	            else{
	            	status = false;
	            }
	        }catch (Exception e) {  
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
