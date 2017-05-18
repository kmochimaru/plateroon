/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import daoImp.AgentDaoImp;
import entities.Agent;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import security.MD5Hashing;

/**
 *
 * @author PEEPO
 */
public class AgentController extends HttpServlet {

    Agent bean;
    AgentDaoImp dao;
    String json = "";
    Gson gson = new Gson();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String action = (String)request.getParameter("action")==null?"":(String)request.getParameter("action");
        
        if(action.equals("Approve")){
            dao = new AgentDaoImp();
            dao.updateApprove(request.getParameter("agentId"));
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<!DOCTYPE HTML>");
            out.println("<html>");
            out.println(" <body>");
            out.println(" <script>window.location.replace(document.referrer)</script>");
            out.println(" </body>");
            out.println("</html>");
        }else if(action.equals("Disapproved")){
            bean = new Agent();
            dao  = new AgentDaoImp();
            bean.setAgentId(request.getParameter("agentId"));
            dao.delAgent(bean);
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
        List <Agent> list = new ArrayList();
        
        String action = (String)request.getParameter("action")==null?"":(String)request.getParameter("action");
        if(action.equals("add")){
            bean = new Agent();
            dao  = new AgentDaoImp();
            bean.setUsername(request.getParameter("agentId"));
            bean.setPassword(MD5Hashing.encodeMD5(request.getParameter("idCard")));
            bean.setActive("N");
            bean.setFirstname(request.getParameter("fistName"));
            bean.setLastnames(request.getParameter("lastName"));
            bean.setIdcard(request.getParameter("idCard"));
            bean.setBirthday(request.getParameter("birthday"));
            bean.setNationality(request.getParameter("nationality"));
            bean.setGender(request.getParameter("gender"));
            bean.setAgentId(request.getParameter("agentId"));
            bean.setAgentCode(request.getParameter("agentCode"));
            bean.setExpiredDate(request.getParameter("expiredDate"));
            bean.setDegreeId(request.getParameter("degreeId"));
            bean.setAddress(request.getParameter("address"));
            bean.setDistrict(request.getParameter("district"));
            bean.setAmphur(request.getParameter("amphoe"));
            bean.setProvince(request.getParameter("province"));
            bean.setZipcode(request.getParameter("zipcode"));
            bean.setPhonenumberMain(request.getParameter("phoneMain"));
            bean.setPhonenumberReserve(request.getParameter("phoneReserve"));
            bean.setRelatedpersons(request.getParameter("relationship"));
            bean.setRelationshipRelatedpersons(request.getParameter("relationshipRelatedpersons"));
            bean.setPhonenumberRelatedpersons(request.getParameter("phonenumberRelatedpersons"));
            dao.addAgent(bean);
            response.setContentType("text/html");
            response.setStatus(HttpServletResponse.SC_OK);
        }else if(action.equals("activeN")){
            dao = new AgentDaoImp();
            list = dao.getAgentByActiveN();
            json = gson.toJson(list);
            response.setContentType("application/json");
            response.getWriter().write(json);
           
        }else if(action.equals("activeY")){
            dao = new AgentDaoImp();
            list = dao.getAgentByActiveY();
            json = gson.toJson(list);
            response.setContentType("application/json");
            response.getWriter().write(json);
        
        }else if(action.equals("read")){
            dao = new AgentDaoImp();
            list = dao.getAllAgent();
            json = gson.toJson(list);
            response.setContentType("application/json");
            response.getWriter().write(json);
        }else if(action.equals("update")){
            bean = new Agent();
            dao  = new AgentDaoImp();
            bean.setUsername(request.getParameter("username"));     //Get parameter hide
            bean.setPassword(request.getParameter("password"));     //Get parameter hide
            bean.setActive("Y");
            bean.setFirstname(request.getParameter("fistName"));
            bean.setLastnames(request.getParameter("lastName"));
            bean.setIdcard(request.getParameter("idCard"));
            bean.setBirthday(request.getParameter("birthday"));
            bean.setNationality(request.getParameter("nationality"));
            bean.setGender(request.getParameter("gender"));
            bean.setAgentId(request.getParameter("agentId"));
            bean.setAgentCode(request.getParameter("agentCode"));
            bean.setExpiredDate(request.getParameter("expiredDate"));
            bean.setDegreeId(request.getParameter("degreeId"));
            bean.setAddress(request.getParameter("address"));
            bean.setDistrict(request.getParameter("district"));
            bean.setAmphur(request.getParameter("amphoe"));
            bean.setProvince(request.getParameter("province"));
            bean.setZipcode(request.getParameter("zipcode"));
            bean.setPhonenumberMain(request.getParameter("phoneMain"));
            bean.setPhonenumberReserve(request.getParameter("phoneReserve"));
            bean.setRelatedpersons(request.getParameter("relationship"));
            bean.setRelationshipRelatedpersons(request.getParameter("relationshipRelatedpersons"));
            bean.setPhonenumberRelatedpersons(request.getParameter("phonenumberRelatedpersons"));
            dao.updateAgent(bean);
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