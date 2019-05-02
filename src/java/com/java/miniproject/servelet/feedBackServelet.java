/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.miniproject.servelet;

import com.java.miniproject.bean.FeedBackBean;
import com.java.miniproject.dao.FeedBackDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sathish
 */
public class feedBackServelet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet feedBackServelet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet feedBackServelet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
    }

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
        processRequest(request, response);
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
        processRequest(request, response);
        String username = (String) request.getSession(false).getAttribute("username");
        String responseText = "";
        String mes = request.getParameter("message");
        Date dNow = new Date();
//        SimpleDateFormat ft = new SimpleDateFormat ("yyyy.MM.dd");
//        SimpleDateFormat ft1 = new SimpleDateFormat ("hh:mm:ss a");
//        String date =  ft.format(dNow);
//        String time =  ft1.format(dNow);
//        String mes = "sadfsdf";
//        String date = "1324";
//        String time = "7e732";
        
        //String username = "sathish";
        FeedBackBean feedBackBean = new FeedBackBean();
        feedBackBean.setUsername(username);
        feedBackBean.setMessage(mes);
//        feedBackBean.setDate(date);
//        feedBackBean.setTime(time);
         String result = new FeedBackDAO().fillingFeedBack(feedBackBean);
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet feedBackServelet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet feedBackServelet at " + feedBackBean.getUsername() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
       
        
        switch(result){
            case "SUCCESS":
                responseText = "Feed back Suuccessfully Submitted";
                response.sendRedirect("feedBackform.jsp?message="+responseText);
                break;
            case "INVALID":
                responseText = "Try Again";
                response.sendRedirect("feedBackform.jsp?message="+responseText);
                break;
        }
        
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
