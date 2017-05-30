/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import com.sun.org.apache.bcel.internal.generic.AASTORE;
import daoImp.AgentDaoImp;
import daoImp.DegreeDaoImp;
import entities.Agent;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import security.MD5Hashing;

/**
 *
 * @author PEEPO
 */
public class AgentController extends HttpServlet {

    Agent bean;
    AgentDaoImp dao;
    DegreeDaoImp degreeDao;
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
            dao.updateApprove(request.getParameter("agentCode"));
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
            bean.setAgentCode(request.getParameter("agentCode"));
            dao.delAgent(bean);
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<!DOCTYPE HTML>");
            out.println("<html>");
            out.println(" <body>");
            out.println(" <script>window.location.replace(document.referrer)</script>");
            out.println(" </body>");
            out.println("</html>");
            
        }else if(action.equals("checkAgent")){
            //request.getSession().removeAttribute("checkAgent");
            boolean valid = false;
            String agentCode = request.getParameter("agentCode");
            dao = new AgentDaoImp();
            List<Agent> list = new ArrayList();
            list = dao.isValidAgentCode(agentCode);
            if(list == null){
                json = gson.toJson(false);
            }else{
                int year =0;
                String DATE = "";
                try{
                    /*
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    SimpleDateFormat sdf2 = new SimpleDateFormat("MM-dd");
             
                    //convert พ.ศ. to ค.ศ.
                    Date date = new Date();
                    Calendar c = Calendar.getInstance();
                    //year = c.get(Calendar.YEAR)-543;    //พ.ศ.
                    year = c.get(Calendar.YEAR);        //ค.ศ.  server  ใช้ ค.ศ.
                    DATE = year+"-"+String.valueOf(sdf2.format(date));
                    
                    //formate type date compare 
                    Date date1 = sdf.parse(list.get(0).getExpiredDate());
                    sdf.format(date1);
                    Date date2 = sdf.parse(DATE);
                    sdf.format(date2); */
                    
                    Locale lc = new Locale("en","EN");
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", lc);
             
                    //formate type date compare 
                    Date date1 = sdf.parse(list.get(0).getExpiredDate());
                    sdf.format(date1);
                    Date date2 = new Date();
                    sdf.format(date2);
                    
                    //request.getSession().setAttribute("DATE", sdf.format(date2));  //debug date
                    //List<Agent> checkAgent = new ArrayList();
                    //checkAgent = dao.getAgentByAgentCode(agentCode);
                
                    
                    if (date1.compareTo(date2) > 0) {
                        json = gson.toJson(list); 
                    } else if (date1.compareTo(date2) < 0 || date1.compareTo(date2) == 0) {
                        json = gson.toJson("expire");
                    } else {
                        System.out.println("How to get here?");
                    }
                }catch(Exception e){
                    System.out.println("Exception date ===> " + e);
                }
                
                
            }
            
            response.setContentType("application/json");
            response.getWriter().write(json); 
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        List <Agent> list = new ArrayList();
        String action = (String)request.getParameter("action")==null?"":(String)request.getParameter("action");
        String amphoe =  request.getParameter("amphoe")==null?"":request.getParameter("amphoe");
        String province = request.getParameter("province")==null?"":request.getParameter("province");

        if(action.equals("add")){
            bean = new Agent();
            dao  = new AgentDaoImp();
            degreeDao = new DegreeDaoImp();
            bean.setUsername(degreeDao.getDegreeById(request.getParameter("degreeId")).get(0).getDegreeName().charAt(0)+request.getParameter("agentId"));
            bean.setPassword(MD5Hashing.encodeMD5(request.getParameter("idCard")));
            bean.setActive("N");
            bean.setFirstname(request.getParameter("fistName"));
            bean.setLastnames(request.getParameter("lastName"));
            bean.setIdcard(request.getParameter("idCard"));
            bean.setBirthday(request.getParameter("birthday"));
            bean.setNationality(request.getParameter("nationality"));
            bean.setGender(request.getParameter("gender"));
            bean.setAgentId(degreeDao.getDegreeById(request.getParameter("degreeId")).get(0).getDegreeName().charAt(0)+request.getParameter("agentId"));
            
            if(session.getAttribute("createBy").equals("admin")){
                bean.setAgentCode(bean.getAgentId());
            }else{
                bean.setAgentCode(session.getAttribute("createBy")+"-"+bean.getAgentId());
            }
            
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
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<!DOCTYPE HTML>");
            out.println("<html>");
            out.println(" <body>");
            out.println(" <script>window.location.replace(document.referrer)</script>");
            out.println(" </body>");
            out.println("</html>");
            
        }else if(action.equals("readByUsername")){
            dao = new AgentDaoImp();
            list = dao.getAgentByUsername(request.getSession().getAttribute("username").toString());
            json = gson.toJson(list);
            response.setContentType("application/json");
            response.getWriter().write(json);
            
        }else if(action.equals("searchAgent")){
            dao = new AgentDaoImp();
            list = dao.searchAgent(amphoe, province);
            request.getSession().setAttribute("searchSize", list.size());
            if(list.size() > 0)
                request.getSession().setAttribute("search", list);
            else
                request.getSession().setAttribute("search", false);
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<!DOCTYPE HTML>");
            out.println("<html>");
            out.println(" <body>");
            out.println(" <script>window.location.replace(document.referrer)</script>");
            out.println(" </body>");
            out.println("</html>");
            
        }else if(action.equals("member")){
            dao = new AgentDaoImp();
            list = dao.getMemberByAgentCode(request.getSession().getAttribute("agentId").toString());
            json = gson.toJson(list);
            response.setContentType("application/json");
            response.getWriter().write(json);
            
        }else if(action.equals("change")){
            dao = new AgentDaoImp();
            dao.updateUsernamePass(
                    request.getParameter("username"), 
                    MD5Hashing.encodeMD5(request.getParameter("password")), 
                    request.getParameter("agentCode")
            );
            request.getSession().invalidate();
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<!DOCTYPE HTML>");
            out.println("<html>");
            out.println(" <body>");
            out.println(" <script>window.location.href='login.jsp'</script>");
            out.println(" </body>");
            out.println("</html>");
        }
    }

}
