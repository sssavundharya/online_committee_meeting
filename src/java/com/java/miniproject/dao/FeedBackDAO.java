/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.miniproject.dao;

import com.java.miniproject.bean.FeedBackBean;
import com.java.miniproject.util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Sathish
 */
public class FeedBackDAO {
    Connection connection = null;
    PreparedStatement ps = null;
//    ResultSet rs = null;
    String result="INVALID";
    String errorMessage = null;
    public String fillingFeedBack(FeedBackBean feedBackBean) {
        Date now = new java.util.Date(); 
        Timestamp current = new java.sql.Timestamp(now.getTime()); 
        String dateTimeStamp = new SimpleDateFormat("yyyy-MM-dd") .format(current); 
        String timeStamp = new SimpleDateFormat("HH.mm.ss") .format(current); 
        String uname = feedBackBean.getUsername();
        String message = feedBackBean.getMessage();
        System.out.println(feedBackBean);
        try{
            connection = DBUtil.getDBConnection();
            if(connection == null){
                System.out.println("db Not Connected");
            }
            String query  = "insert into feedback (username,date,time,message) values (?,?,?,?)";
            ps = connection.prepareStatement(query);
            ps.setString(1,uname);
            ps.setString(2,dateTimeStamp);
            ps.setString(3,timeStamp);
            ps.setString(4,message);
            //System.out.println(ps);
            int rs = ps.executeUpdate();
                result = "SUCCESS";
                return result;
            
            
        }

        catch(Exception e){
            e.printStackTrace();
        }
        finally {
            System.out.println(result);
            errorMessage="error in adminDAO";
            DBUtil.closeDBConnection(connection, ps, errorMessage);
        }
        return result;
    }
    
}
