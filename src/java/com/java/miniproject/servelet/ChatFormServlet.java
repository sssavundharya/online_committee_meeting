/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.miniproject.servelet;

import com.java.miniproject.bean.ChatBean;
import com.java.miniproject.bean.FacultyLoginBean;
import com.java.miniproject.dao.ChatDAO;
import com.java.miniproject.dao.FacultyLoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sathish
 */
public class ChatFormServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
//        out.print("Hi");
        String username = (String) request.getSession(false).getAttribute("username");
        ArrayList<ChatBean> chatList = null; 
        String responseText  = "";
        chatList = new ChatDAO().chatList();
        for(int i=0;i<chatList.size();i++){
            responseText+=chatList.get(i).getUserName()+"|";
            responseText+=chatList.get(i).getMessage()+"|";
            responseText+=chatList.get(i).getDate()+"|";
            responseText+=chatList.get(i).getTime()+"|";
        }
        out.print(responseText);
        
        request.setAttribute("user", username);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String userMessage = request.getParameter("message");
        out.print(userMessage);
        ChatBean chatBean = new ChatBean();
        String username = (String) request.getSession(false).getAttribute("username");
        chatBean.setUserName(username);
        chatBean.setMessage(userMessage);
        ChatDAO chatDao =  new ChatDAO();
        chatDao.chatBot(chatBean);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
