/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.miniproject.bean;

/**
 *
 * @author Sathish
 */
public class FacultyLoginBean {
    private String uname;
    private String mail;
    private String pass;
    public void setUname(String uname) {
        this.uname = uname;
    }
    public String getUname() {
            return uname;
        }
    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
    
}
