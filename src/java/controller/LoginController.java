/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daoImp.AgentDaoImp;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author PEEPO
 */
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        boolean chk = false;
        AgentDaoImp dao = new AgentDaoImp();
        String username = request.getParameter("username");                     
        String password = request.getParameter("password"); 
        
        if(username.equals("admin")==true && password.equals("adminabc")==true){
            session.setAttribute("username", "ผู้ดูแลระบบ");
            response.sendRedirect("admin/dashboard.jsp");
        }else{
            chk = dao.isValidLogin(username, password);
            if(chk){
                session.setAttribute("username", username);
                response.sendRedirect("index.jsp");
            }else{
                session.setAttribute("username", null);
                response.sendRedirect("login.jsp");
            }
        }
    }

}
