package com.itubuzz.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.itubuzz.valueobjects.Post;


public class RetrievePostDAO {
 
	
	
	public static ArrayList<Post> retrievePostedData(){
	
	
    Connection conn = null;  
    PreparedStatement pst = null;  
    ResultSet rs = null;  

    
    final String DB_URL="jdbc:mysql://127.0.0.1:3306/itubuzz"; 
    String driver = "com.mysql.jdbc.Driver";  
    String userName = "root";  
    String password = "root"; 
    ArrayList<Post> post_list=new ArrayList<Post>();
    try {  
        Class.forName(driver).newInstance();  
        conn = DriverManager  
                .getConnection(DB_URL, userName, password);  

        PreparedStatement ps=conn.prepareStatement(  
        		"select * from post order by post_id desc");  
        		
        rs = ps.executeQuery();
       
        while(rs.next())
        {
            Post p = new Post();
            
            p.post_id = rs.getInt(1);
            p.post_value = rs.getString(2);
        
            post_list.add(p);
            
        
            System.out.println("post list is "+post_list.size());
            System.out.println(post_list.toString());
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
    return post_list;  
} 
}

	

