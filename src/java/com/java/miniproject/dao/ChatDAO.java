/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.miniproject.dao;

import com.java.miniproject.bean.ChatBean;
import com.java.miniproject.bean.FacultyLoginBean;
import com.java.miniproject.util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Sathish
 */
public class ChatDAO {

    

    
    Connection connection = null;
    PreparedStatement ps = null; 
    String errorMessage = null;
    public void chatBot(ChatBean chatBean) {
        try{
            connection = DBUtil.getDBConnection();
            if(connection == null){
                System.out.println("db Not Connected");
            }
            Date now = new java.util.Date(); 
            Timestamp current = new java.sql.Timestamp(now.getTime()); 
            String dateTimeStamp = new SimpleDateFormat("yyyy-MM-dd") .format(current); 
            String timeStamp = new SimpleDateFormat("HH.mm.ss") .format(current); 
            String query  = "insert into chatting_data (uname,msg,time,date) values (?,?,?,?)";

            ps = connection.prepareStatement(query);
            ps.setString(1,chatBean.getUserName());
            ps.setString(2,chatBean.getMessage());
            ps.setString(3,timeStamp);
            ps.setString(4,dateTimeStamp);
            ps.execute();
            
            
            
           
            
        }

        catch(Exception e){
            //System.err.println(e);
            e.printStackTrace();
        }
        finally {
            errorMessage="error in ChatDAO";
            DBUtil.closeDBConnection(connection, ps, errorMessage);
        }
        
    }
//    public static void main(String[] args) {
////        ChatBean chatBean = new ChatBean();
////        chatBean.setUserName("Mallaiya");
////        chatBean.setMessage("Hello Sathish");
////        new ChatDAO().chatBot(chatBean);
//        new ChatDAO().chatReport();
//    }
    ArrayList<ChatBean> chatPoints = new ArrayList<ChatBean>();
    public ArrayList<ChatBean> chatList() {
        try{
            connection = DBUtil.getDBConnection();
            if(connection == null){
                System.out.println("db Not Connected");
            }
//            Retirval form db
            ResultSet rs = null;
            ChatBean chatBean = null;
            String query  = "select * from chatting_data";
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            System.out.println(rs);
            
            while(rs.next()){
                chatBean = new ChatBean();
                chatBean.setUserName(rs.getString(1));
                chatBean.setMessage(rs.getString(2));
                chatBean.setTime(rs.getString(3));
                chatBean.setDate(rs.getString(4));
                chatPoints.add(chatBean);
                //System.out.println(chatBean.getUserName()+"\t"+chatBean.getMessage()+"\t"+chatBean.getDate()+"\t"+chatBean.getTime());
                
                
            }
            
            
        }

        catch(Exception e){
            //System.err.println(e);
            e.printStackTrace();
        }
        finally {
            errorMessage="error in ChatDAO";
            DBUtil.closeDBConnection(connection, ps, errorMessage);
            //System.out.println(chatPoints);
        }
        
     return chatPoints;   
    }
    ArrayList<ChatBean> chatReport = new ArrayList<ChatBean>();
    public ArrayList<ChatBean> chatReport() {
        try{
            connection = DBUtil.getDBConnection();
            if(connection == null){
                System.out.println("db Not Connected");
            }
//            Retirval form db
            
            ResultSet rs = null;
            ChatBean chatBean = null;
//            String dateOfReport = chatBean.getDateOfReport();
//            String query  = "select * from chatting_data where date=?";
            String query  = "select * from chatting_data";
            ps = connection.prepareStatement(query);
//            ps.setString(1,dateOfReport);
            rs = ps.executeQuery();
            System.out.println(rs);
            while(rs.next()){
                chatBean = new ChatBean();
                chatBean.setUserName(rs.getString(1));
                chatBean.setMessage(rs.getString(2));
                chatBean.setTime(rs.getString(3));
                chatBean.setDate(rs.getString(4));
                chatReport.add(chatBean);
               // System.out.println(chatBean.getUserName()+"\t"+chatBean.getMessage()+"\t"+chatBean.getDate()+"\t"+chatBean.getTime());
                
                
            }
            
            
        }

        catch(Exception e){
            //System.err.println(e);
            e.printStackTrace();
        }
        finally {
            errorMessage="error in ChatDAO";
            DBUtil.closeDBConnection(connection, ps, errorMessage);
            //System.out.println(chatPoints);
        }
        
     return chatReport;
    }
    ArrayList<ChatBean> feedReport = new ArrayList<ChatBean>();
    public ArrayList<ChatBean> feedReport() {
        try{
            connection = DBUtil.getDBConnection();
            if(connection == null){
                System.out.println("db Not Connected");
            }
//            Retirval form db
            
            ResultSet rs = null;
            ChatBean chatBean = null;
//            String dateOfReport = chatBean.getDateOfReport();
//            String query  = "select * from chatting_data where date=?";
            String query  = "select * from feedback";
            ps = connection.prepareStatement(query);
//            ps.setString(1,dateOfReport);
            rs = ps.executeQuery();
            System.out.println(rs);
            while(rs.next()){
                chatBean = new ChatBean();
                chatBean.setUserName(rs.getString(1));
                chatBean.setMessage(rs.getString(4));
                chatBean.setTime(rs.getString(3));
                chatBean.setDate(rs.getString(2));
                feedReport.add(chatBean);
               //System.out.println(chatBean.getUserName()+"\t"+chatBean.getMessage()+"\t"+chatBean.getDate()+"\t"+chatBean.getTime());
                
                
            }
            
            
        }

        catch(Exception e){
            //System.err.println(e);
            e.printStackTrace();
        }
        finally {
            errorMessage="error in ChatDAO";
            DBUtil.closeDBConnection(connection, ps, errorMessage);
            //System.out.println(chatPoints);
        }
        
     return feedReport;
    }
    
}
