/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
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
        String json = "";
        Gson gson = new Gson();
        AgentDaoImp dao = new AgentDaoImp();
        String username = request.getParameter("username");                     
        String password = request.getParameter("password"); 
        
        response.setContentType("application/json");
        if(username.equals("admin")==true && password.equals("adminabc")==true){
            session.setAttribute("username", "ผู้ดูแลระบบ");
            json = gson.toJson("admin");
            //response.sendRedirect("admin/dashboard.jsp");
        }else{
            System.out.println("chk db");
            chk = dao.isValidLogin(username, password);
            if(chk){
                session.setAttribute("username", username);
                json = gson.toJson("true");
            }else{
                session.setAttribute("username", null);
                json = gson.toJson("false");
            }
        }
        response.getWriter().write(json);
    }

}
