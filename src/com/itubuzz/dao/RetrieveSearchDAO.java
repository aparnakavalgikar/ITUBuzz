package com.itubuzz.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.itubuzz.valueobjects.*;

public class RetrieveSearchDAO {

	public static ArrayList<SearchVO> retrieveSearchedData(String searchString) {

			Connection conn = null;  
		    PreparedStatement pst = null;  
		    ResultSet rs = null;  

		    
		    final String DB_URL="jdbc:mysql://127.0.0.1:3306/itubuzz"; 
		    String driver = "com.mysql.jdbc.Driver";  
		    String userName = "root";  
		    String password = "root"; 
		    ArrayList<SearchVO> search_list=new ArrayList<SearchVO>();
		    try {  
		        Class.forName(driver).newInstance();  
		        conn = DriverManager  
		                .getConnection(DB_URL, userName, password);  
		        String query = "select * from posts  where post_text  like \'" + searchString + "\';";
		        System.out.println("\nMakarand\n"+query);
		        PreparedStatement ps=conn.prepareStatement(query);  
		        		
		        rs = ps.executeQuery();
		       
		        while(rs.next())
		        {
		        	SearchVO s = new SearchVO();
		            s.search_id = rs.getInt(1);
		            s.search_value = rs.getString(2);
		            search_list.add(s);
		        
		            System.out.println("Search list is "+ search_list.size());
		            System.out.println(search_list.toString());
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
		    return search_list;  
	}
}
