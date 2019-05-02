/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.miniproject.dao;

import com.java.miniproject.bean.MailBean;
import com.java.miniproject.util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Sathish
 */
public class MailSendingDAO {
    Connection connection = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String result="INVALID";
        String errorMessage = null;
    private Object email;
    public String sendingMail(MailBean mailBean) {
        String mail = mailBean.getMail();
        String pass =mailBean.getPass();
        String sub = mailBean.getSub();
        String text =mailBean.getText();
        System.out.println(mail+" "+pass+" "+sub+" "+text);
        try{
                connection = DBUtil.getDBConnection();
                if(connection == null){
                    System.out.println("db Not Connected");
                }
                String query  = "select mail from student where member=1";
                ps = connection.prepareStatement(query);
                System.out.println(ps);
                rs = ps.executeQuery();
                System.out.println(rs);
                while(rs.next()){
                    
                     System.out.println(rs.getString("mail"));
                     try{
                        String host ="smtp.gmail.com" ;
                        String user = mail;
                        String password = pass;
                        String to = rs.getString("mail");
                        String from = mail;
                        String subject = sub;
                        String messageText = text;
                        boolean sessionDebug = false;
                        Properties props = System.getProperties();
                        props.put("mail.smtp.starttls.enable", "true");
                        props.put("mail.smtp.host", host);
                        props.put("mail.smtp.port", "587");
                        props.put("mail.smtp.auth", "true");
                        props.put("mail.smtp.starttls.required", "true");

                        java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
                        Session mailSession = Session.getDefaultInstance(props, null);
                        mailSession.setDebug(sessionDebug);
                        Message msg = new MimeMessage(mailSession);
                        msg.setFrom(new InternetAddress(from));
                        InternetAddress[] address = {new InternetAddress(to)};
                        msg.setRecipients(Message.RecipientType.TO, address);
                        msg.setSubject(subject); msg.setSentDate(new Date());
                        msg.setText(messageText);
                        javax.mail.Transport transport=mailSession.getTransport("smtp");
                       transport.connect(host, user, password);
                       transport.sendMessage(msg, msg.getAllRecipients());
                       transport.close();
                       System.out.println("message send successfully");
                       result = "SUCCESS";
                    }catch(Exception ex)
                    {
                        System.out.println(ex);
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
//    public static void main(String args[]){
//        MailSendingDAO obj = new MailSendingDAO();
//        MailBean besning = new MailBean();
//        besning.setMail("sathishbalucs@gmail.com");
//        besning.setPass("98425588833");
//        besning.setSub("subject");
//        besning.setText("sdf");
//        obj.sendingMail(besning);
//    }
    
}
