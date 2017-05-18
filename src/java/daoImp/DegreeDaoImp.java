/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daoImp;

import dao.DegreeDao;
import entities.Agent;
import entities.Degree;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author PEEPO
 */
public class DegreeDaoImp implements DegreeDao{

    @Override
    public void addDegree(Degree degree) {
        Transaction transaction = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try{
            transaction = session.beginTransaction();
            session.save(degree);
            transaction.commit();
        }catch(RuntimeException e){
            if(transaction != null){
                transaction.rollback();
            }
            System.out.println(transaction);
            System.out.println("RuntimeException addDegree ====>  "+e);
        } finally{
            session.flush();
            session.close();
        }
    }

    @Override
    public void updateDegree(Degree degree) {
        Transaction transaction = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try{
            transaction = session.beginTransaction();
            session.update(degree);
            transaction.commit();
        }catch(RuntimeException e){
            if(transaction != null){
                transaction.rollback();
            }
            System.out.println(transaction);
            System.out.println("RuntimeException updateDegree ====>  "+e);
        } finally{
            session.flush();
            session.close();
        }
    }

    @Override
    public List<Degree> getAllDegree() {
        Transaction transaction = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Degree> list = new ArrayList();
        try{
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM Degree");
            list = query.list();
            transaction.commit();
        }catch(RuntimeException e){
            if(transaction != null){
                transaction.rollback();
            }
            System.out.println("RuntimeException getAllDegree ====>  "+e);
        }finally{
            session.flush();
            session.close();
        }
        
        return list;
    }

    @Override
    public void delDegree(Degree degree) {
        Transaction transaction = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try{
            transaction = session.beginTransaction();
            session.delete(degree);
            transaction.commit();
        }catch(RuntimeException e){
            if(transaction != null){
                transaction.rollback();
            }
            System.out.println("RuntimeException delDegree ====>  "+e);
        } finally{
            session.flush();
            session.close();
        }
    }

    @Override
    public void isDegree(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
