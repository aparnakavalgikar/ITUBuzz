package com.itubuzz.dao;

import java.sql.Connection;  
import java.sql.DriverManager;  
import java.sql.PreparedStatement;  
import java.sql.ResultSet;  
import java.sql.SQLException; 

import javax.servlet.http.HttpSession;

public class LoginDAO { 
	
	static String first_name = null;
    static String last_name = null;
    
    
    
    public static boolean validate(String eMail, String password1) {          
        boolean status = false;  
        Connection conn = null;  
        PreparedStatement pst = null;  
        ResultSet rs = null;  
  
        final String DB_URL="jdbc:mysql://127.0.0.1:3306/itubuzz"; 
        String driver = "com.mysql.jdbc.Driver";  
        String userName = "root";  
        String password = "root";  
        try {  
            Class.forName(driver).newInstance();  
            conn = DriverManager  
                    .getConnection(DB_URL, userName, password);  
  
            pst = conn  
                    .prepareStatement("select * from usertest where email_id=? and password=?");  
            pst.setString(1, eMail);  
            pst.setString(2, password1);  
  
            rs = pst.executeQuery();
            
            
            
            if(rs != null && rs.next()){
            	first_name = rs.getString("first_name");
            	last_name = rs.getString("last_name");
                
				
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
    
    
    public static String UserNameDetails(){
    	String name = null;
    	name = first_name+" "+last_name;
        
    	return name;
    }
}  
