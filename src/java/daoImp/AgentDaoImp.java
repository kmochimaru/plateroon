/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daoImp;

import dao.AgentDao;
import entities.Agent;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import security.MD5Hashing;

/**
 *
 * @author PEEPO
 */
public class AgentDaoImp implements AgentDao{

    @Override
    public void addAgent(Agent agent) {
        Transaction transaction = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try{
            transaction = session.beginTransaction();
            session.save(agent);
            transaction.commit();
        }catch(RuntimeException e){
            if(transaction != null){
                transaction.rollback();
            }
            System.out.println(transaction);
            System.out.println("RuntimeException addAgent ====>  "+e);
        } finally{
            session.flush();
            session.close();
        }
    }

    @Override
    public List<Agent> getAllAgent() {
        Transaction transaction = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Agent> list = new ArrayList();
        try{
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM Agent");
            list = query.list();
            transaction.commit();
        }catch(RuntimeException e){
            if(transaction != null){
                transaction.rollback();
            }
            System.out.println("RuntimeException getAllAgent ====>  "+e);
        }finally{
            session.flush();
            session.close();
        }
        
        return list;
    }
    
    @Override
    public List<Agent> getAgentById(String id) {
        Transaction transaction = null; 
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Agent> list = new ArrayList();
        try{
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM Agent WHERE agentId = :agentId");
            query.setParameter("agentId", id);
            list = query.list();
            transaction.commit();
        }catch(RuntimeException e){
            if(transaction != null){
                transaction.rollback();
            }
            System.out.println("RuntimeException getAgentById ====>  "+e);
        }finally{
            session.flush();
            session.close();
        }
        return list;
    }
    
    @Override
    public void updateAgent(Agent agent) {
        Transaction transaction = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try{
            transaction = session.beginTransaction();
            session.update(agent);
            transaction.commit();
        }catch(RuntimeException e){
            if(transaction != null){
                transaction.rollback();
            }
            System.out.println("RuntimeException updateAgent ====>  "+e);
        } finally{
            session.flush();
            session.close();
        }
    }

    @Override
    public void delAgent(Agent agent) {
        Transaction transaction = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try{
            transaction = session.beginTransaction();
            session.delete(agent);
            transaction.commit();
        }catch(RuntimeException e){
            if(transaction != null){
                transaction.rollback();
            }
            System.out.println("RuntimeException delAgent ====>  "+e);
        } finally{
            session.flush();
            session.close();
        }
    }

    @Override
    public boolean isValidLogin(String username, String password) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        String hql = "FROM Agent a WHERE a.username = :username AND a.password = :password";
        Query query = session.createQuery(hql);
        query.setParameter("username", username);
        query.setParameter("password", MD5Hashing.encodeMD5(password));
        List<Agent> list = query.list();
        if(list.size() > 0){
            transaction.commit();
            session.close();
            return true;
        }
        transaction.commit();
        session.close();
        return false;
    }

    @Override
    public void updatePassword(String pass, String agentId) {
        Transaction transaction = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try{
            transaction = session.beginTransaction();
            String hql = "UPDATE Agent SET password = :pass WHERE agentId = :agentId";
            Query query = session.createQuery(hql);
            query.setParameter("pass", pass);
            query.setParameter("agentId", agentId);
            transaction.commit();
        }catch(RuntimeException e){
            if(transaction != null){
                transaction.rollback();
            }
            System.out.println("RuntimeException updatePassword ====>  "+e);
        }finally{
            session.flush();
            session.close();
        }
    }

    @Override
    public boolean isValidIdCard(String idcard) {
        boolean valid = false;
        Transaction transaction = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try{
            transaction = session.beginTransaction();
            String hql = "FROM Agent WHERE idcard = :idcard";
            Query query = session.createQuery(hql);
            query.setParameter("idcard", idcard);
            valid = query.list().size()==1?false:true;
            transaction.commit();
        }catch(RuntimeException e){
            if(transaction != null){
                transaction.rollback();
            }
            System.out.println("RuntimeException isValidIdCard ====>  "+e);
        }finally{
        
        }
        return valid;
    }

    @Override
    public boolean isValidAgentId(String agent_id) {
        boolean valid = false;
        Transaction transaction = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try{
            transaction = session.beginTransaction();
            String hql = "FROM Agent WHERE agentId = :agentId";
            Query query = session.createQuery(hql);
            query.setParameter("agentId", agent_id);
            valid = query.list().size()==1?false:true;
            transaction.commit();
        }catch(RuntimeException e){
            if(transaction != null){
                transaction.rollback();
            }
            System.out.println("RuntimeException isValidAgentId ====>  "+e);
        }finally{
        
        }
        return valid;
    }

    @Override
    public void updateApprove(String agent_id) {
        Transaction transaction = null; 
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Agent> list = new ArrayList();
        try{
            transaction = session.beginTransaction();
            Query query = session.createQuery("UPDATE Agent SET active = 'Y' WHERE agentId = :agentId");
            query.setParameter("agentId", agent_id);
            int result = query.executeUpdate();
            transaction.commit();
        }catch(RuntimeException e){
            if(transaction != null){
                transaction.rollback();
            }
            System.out.println("RuntimeException updateApprove ====>  "+e);
        }finally{
            session.flush();
            session.close();
        }
    }

    @Override
    public List<Agent> getAgentByActiveN() {
        Transaction transaction = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Agent> list = new ArrayList();
        try{
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM Agent WHERE active = 'N' ");
            list = query.list();
            transaction.commit();
        }catch(RuntimeException e){
            if(transaction != null){
                transaction.rollback();
            }
            System.out.println("RuntimeException getAgentByActiveN ====>  "+e);
        }finally{
            session.flush();
            session.close();
        }
        
        return list;
    }

    @Override
    public List<Agent> getAgentByActiveY() {
        Transaction transaction = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Agent> list = new ArrayList();
        try{
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM Agent WHERE active = 'Y' ");
            list = query.list();
            transaction.commit();
        }catch(RuntimeException e){
            if(transaction != null){
                transaction.rollback();
            }
            System.out.println("RuntimeException getAgentByActiveY ====>  "+e);
        }finally{
            session.flush();
            session.close();
        }
        
        return list;
    }

    @Override
    public List<Agent> getAgentByUsername(String username) {
        Transaction transaction = null; 
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Agent> list = new ArrayList();
        try{
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM Agent WHERE username = :username");
            query.setParameter("username", username);
            list = query.list();
            transaction.commit();
        }catch(RuntimeException e){
            if(transaction != null){
                transaction.rollback();
            }
            System.out.println("RuntimeException getAgentByUsername ====>  "+e);
        }finally{
            session.flush();
            session.close();
        }
        return list;
    }

    @Override
    public List<Agent> searchAgent(String amphur, String province) {
        Transaction transaction = null; 
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Agent> list = new ArrayList();
        String hql = "";
        if(amphur.equals("")==false && province.equals("")==false)
            hql="FROM Agent WHERE province = '"+province+"' AND amphur = '"+amphur+"' AND active = 'Y'";
        else if(amphur.equals("")==false && province.equals("")==true)
            hql="FROM Agent WHERE amphur = '"+amphur+"' AND active = 'Y'";
        else if(amphur.equals("")==true && province.equals("")==false)
            hql="FROM Agent WHERE province = '"+province+"' AND active = 'Y'";
        else
            hql="";
        
        try{
            transaction = session.beginTransaction();
            Query query = session.createQuery(hql);
            list = query.list();
            transaction.commit();
        }catch(RuntimeException e){
            if(transaction != null){
                transaction.rollback();
            }
            System.out.println("RuntimeException searchAgent ====>  "+e);
        }finally{
            session.flush();
            session.close();
        }
        return list;
    }
    
}
