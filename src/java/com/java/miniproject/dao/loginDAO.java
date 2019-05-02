/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.miniproject.dao;

import com.java.miniproject.bean.LoginBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.java.miniproject.util.DBUtil;
import com.java.miniproject.servelet.ServeletLogin;

/**
 *
 * @author Sathish
 */
public class loginDAO {
        Connection connection = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String result="INVALID";
        String errorMessage = null;
        
        public String loginValidate(LoginBean loginBean) {
            String email = loginBean.getEmail();
            String pass = loginBean.getPass();
            String uname = "";
            String mem = "";
            try{
                connection = DBUtil.getDBConnection();
                if(connection == null){
                    System.out.println("db Not Connected");
                }
                String query  = "select stud_name,mail,password,member from student";
                
                ps = connection.prepareStatement(query);
                //System.out.println(ps);
                rs = ps.executeQuery();
                //System.out.println(rs);
                while(rs.next()){
                    if(email.equals(rs.getString("mail")) && pass.equals(rs.getString("password"))){
                        uname = rs.getString("stud_name");
                        mem = rs.getString("member");
                        result = "SUCCESS";
                        loginBean.setUname(uname);
                        loginBean.setMember(mem);
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
//        public static void main(String args[]){
//            loginDAO obj = new loginDAO();
//            LoginBean loginBean = new LoginBean();
//            loginBean.setEmail("sathishbalucs@gmail.com");
//            loginBean.setPass("bgsathish");
//            obj.loginValidate(loginBean);
////            String email = loginBean.getEmail();
////            String pass = loginBean.getPass();
////            System.out.println(email+" "+pass);
//            //System.out.println(loginBean.getPass());
//        }
}
