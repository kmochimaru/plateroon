/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import daoImp.AgentDaoImp;
import daoImp.DegreeDaoImp;
import entities.Agent;
import entities.Degree;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
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
        DegreeDaoImp degreeDao = new DegreeDaoImp();
        AgentDaoImp dao = new AgentDaoImp();
        List<Agent> list = new ArrayList();
        String username = request.getParameter("username");                     
        String password = request.getParameter("password"); 
        
        response.setContentType("application/json");
        if(username.equals("admin")==true && password.equals("adminabc")==true){
            session.setAttribute("username", "ผู้ดูแลระบบ");
            session.setAttribute("degreeId", 0);
            session.setAttribute("createBy", "admin");                                  //add by admin
            json = gson.toJson("admin");
            //response.sendRedirect("admin/dashboard.jsp");
        }else{
            chk = dao.isValidLogin(username, password);
            if(chk){
                list = dao.getAgentByUsername(username);
                session.setAttribute("degreeId", list.get(0).getDegreeId());
                session.setAttribute("degreeName", degreeDao.getDegreeById(list.get(0).getDegreeId()).get(0).getDegreeName());
                session.setAttribute("createBy", list.get(0).getAgentCode());             //add by agent code
                session.setAttribute("username", username);
                System.out.println(session.getAttribute("degreeId"));
                System.out.println(session.getAttribute("degreeName"));
                System.out.println(session.getAttribute("createBy"));
                json = gson.toJson("true");
            }else{
                session.setAttribute("username", null);
                json = gson.toJson("false");
            }
        }
        response.getWriter().write(json);
    }

}
