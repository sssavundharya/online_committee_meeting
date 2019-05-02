/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.miniproject.util;

/**
 *
 * @author Sathish
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBUtil {    
    
     public static Connection getDBConnection() throws Exception{
         
         Connection connection = null;
         Class.forName("com.mysql.cj.jdbc.Driver");
         try{
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/commitee", "root", "");
         }         
         catch(Exception e){
             e.printStackTrace();
         }        
         return connection;         
    }
    public static void closeDBConnection(Connection connection, PreparedStatement preparedStatement, ResultSet resultSet , String errorMessage ){
        try{
            if(connection != null){
                connection.close();
            }
            if(preparedStatement != null){
                preparedStatement.close();
            }
            if(resultSet != null){
                resultSet.close();
            }
            if( errorMessage != null) {
            	
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public static void main(String[] args) {
		
    	DBUtil dbUtil = new DBUtil();
    	try {
    		dbUtil.getDBConnection();
    		
    	}	    	
    	catch(Exception e) {
    		System.out.println("error");
    	}
    	
	}

    public static void closeDBConnection(Connection connection, PreparedStatement ps, String errorMessage) {
        try{
            if(connection != null){
                connection.close();
            }
            if(ps != null){
                ps.close();
            }
            if( errorMessage != null) {
            	
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
       
    }
}
