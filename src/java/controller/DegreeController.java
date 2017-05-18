/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import daoImp.DegreeDaoImp;
import entities.Degree;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PEEPO
 */
public class DegreeController extends HttpServlet {

    DegreeDaoImp dao;
    Degree bean;
    List<Degree> list;
    String json="";
    Gson gson = new Gson();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        list = new ArrayList<>();
        String action = request.getParameter("action")==null?"":request.getParameter("action");
        if(action.equals("del")){
            bean = new Degree();
            bean.setDegreeId(Integer.parseInt(request.getParameter("degreeId")));
            dao = new DegreeDaoImp();
            dao.delDegree(bean);
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<!DOCTYPE HTML>");
            out.println("<html>");
            out.println(" <body>");
            out.println(" <script>window.location.replace(document.referrer)</script>");
            out.println(" </body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        list = new ArrayList<>();
        String action = request.getParameter("action")==null?"":request.getParameter("action");
        
        if(action.equals("read")){
            dao  = new DegreeDaoImp();
            list = dao.getAllDegree();
            json = gson.toJson(list);
            response.setContentType("application/json");
            response.getWriter().write(json);
        }else if(action.equals("add")){
            bean = new Degree();
            bean.setDegreeId(Integer.parseInt(request.getParameter("degreeId")));
            bean.setDegreeName(request.getParameter("degreeName"));
            dao = new DegreeDaoImp();
            dao.addDegree(bean);
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<!DOCTYPE HTML>");
            out.println("<html>");
            out.println(" <body>");
            out.println(" <script>window.location.replace(document.referrer)</script>");
            out.println(" </body>");
            out.println("</html>");
        }else if(action.equals("update")){
            bean = new Degree();
            bean.setDegreeId(Integer.parseInt(request.getParameter("degreeId")));
            bean.setDegreeName(request.getParameter("degreeName"));
            dao = new DegreeDaoImp();
            dao.updateDegree(bean);
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<!DOCTYPE HTML>");
            out.println("<html>");
            out.println(" <body>");
            out.println(" <script>window.location.replace(document.referrer)</script>");
            out.println(" </body>");
            out.println("</html>");
        }
    }

}
