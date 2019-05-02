/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.miniproject.dao;

import com.java.miniproject.bean.ManageStudentBean;
import com.java.miniproject.util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Sathish
 */
public class ManageStudeDAO {
    
    public String manage(ManageStudentBean manageStudBean) {
        Connection connection = null;
        PreparedStatement ps = null;
        //ResultSet rs = null;
        String result="";
        String errorMessage = null;
        int reg = Integer.parseInt(manageStudBean.getReg());
        int  mem = Integer.parseInt((manageStudBean.getMem()));
        try{
                connection = DBUtil.getDBConnection();
                if(connection == null){
                    System.out.println("db Not Connected");
                }
                String query  = "update student set member=? where stud_id=?";
                ps = connection.prepareStatement(query);
                ps.setInt(1,mem);
                ps.setInt(2, reg);
                int rs = ps.executeUpdate();
                if(rs==0){
                    result = "INVALID";
                }else{
                    result = "SUCCESS";
                }
                
                
            }
            
            catch(Exception e){
                e.printStackTrace();
            }
            finally {
                System.out.println(result);
                errorMessage="error in adminDAO";
                DBUtil.closeDBConnection(connection, ps, errorMessage);
            }
            if(result.equals("SUCCESS")){
                return result;
            }
            return "INVALID";
    }
    
}
