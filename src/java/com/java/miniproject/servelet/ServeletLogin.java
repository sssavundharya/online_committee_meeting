package com.java.miniproject.servelet;
import com.java.miniproject.bean.LoginBean;
import com.java.miniproject.dao.loginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class ServeletLogin extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        String username = "";
        String member = "";
        String responseText = "";
        String mail = request.getParameter("email");
        String pass = request.getParameter("pass");
        LoginBean loginBean = new LoginBean();
        loginBean.setEmail(mail);
        loginBean.setPass(pass);
        String result = new loginDAO().loginValidate(loginBean);
        response.setContentType("text/html;charset=UTF-8");
        switch(result){
            case "SUCCESS":
               HttpSession session = request.getSession();
               session.setAttribute("mail",mail);
                responseText ="logged in successfully";
                username = loginBean.getUname();
                member = loginBean.getMember();
                HttpSession uname = request.getSession();
                uname.setAttribute("username", username);
                response.sendRedirect("StudentHomePage.jsp?message="+username+","+member);
                break;
            case "INVALID":
                responseText = "Email or Password is incorrect";
                response.sendRedirect("studentLoginPage.jsp?message="+responseText);
                break;
        }
        
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
