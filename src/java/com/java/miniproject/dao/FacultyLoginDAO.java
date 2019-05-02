/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.miniproject.dao;

import com.java.miniproject.bean.FacultyLoginBean;
import com.java.miniproject.util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Sathish
 */
public class FacultyLoginDAO {

    Connection connection = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String result="INVALID";
    String errorMessage = null;
        
    public String loginValidate(FacultyLoginBean facLoginBean) {
        String uname = "";
        String email = facLoginBean.getMail();
        String pass = facLoginBean.getPass();
        System.out.println(email+" "+pass);
        try{
            connection = DBUtil.getDBConnection();
            if(connection == null){
                System.out.println("db Not Connected");
            }
            String query  = "select fac_name,mail,password from faculty";

            ps = connection.prepareStatement(query);
            //System.out.println(ps);
            rs = ps.executeQuery();
            //System.out.println(rs);
            while(rs.next()){
                if(email.equals(rs.getString("mail")) && pass.equals(rs.getString("password"))){
                    uname= rs.getString("fac_name");
                    result = "SUCCESS";
                    facLoginBean.setUname(uname);
                    return result;
                }
            }
            
        }

        catch(Exception e){
            //System.err.println(e);
            e.printStackTrace();
        }
        finally {
            System.out.println(result);
            errorMessage="error in adminDAO";
            DBUtil.closeDBConnection(connection, ps, rs, errorMessage);
        }
        return result;
    }
           
    
}
