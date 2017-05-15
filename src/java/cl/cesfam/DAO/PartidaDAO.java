/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.cesfam.DAO;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Francisco
 */
public class PartidaDAO {
    public static boolean add(cl.cesfam.ENTITY.Partida a) throws Exception 
        {
            Session sessionA = cl.cesfam.DAL.NewHibernateUtil.getSessionFactory().openSession();
            sessionA.beginTransaction();
            try {
                sessionA.save(a);
                sessionA.getTransaction().commit();
                sessionA.close();
                return true;
            } catch (Exception e) {
                sessionA.getTransaction().rollback();
                sessionA.close();
                System.err.println(e.getMessage());
                throw e;
            }
        }
    
     public static  List<cl.cesfam.ENTITY.Partida> getList() throws Exception {
            Session session = cl.cesfam.DAL.NewHibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            try {
                List<cl.cesfam.ENTITY.Partida> lista = (List<cl.cesfam.ENTITY.Partida>) 
                session.createCriteria(cl.cesfam.ENTITY.Partida.class).list();
                session.getTransaction().commit();
                return lista;
            } catch (Exception e) {
                session.getTransaction().rollback();
                session.close();
                System.err.println(e.getMessage());
                throw e;
            } finally {
                session.close();
            }
        }
    
    
       public static  boolean delete(cl.cesfam.ENTITY.Partida a) throws Exception {
            Session session = cl.cesfam.DAL.NewHibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            try {
                session.delete(a);
                session.getTransaction().commit();
                session.close();
                return true;
            } catch (Exception e) {
                session.getTransaction().rollback();
                session.close();
                System.err.println(e.getMessage());
                throw e;
            }
        }
     
      public static  boolean update(cl.cesfam.ENTITY.Partida a) throws Exception {
            Session session = cl.cesfam.DAL.NewHibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            try {
                session.update(a);
                session.getTransaction().commit();
                session.close();
                return true;
            } catch (Exception e) {
                session.getTransaction().rollback();
                session.close();
                System.err.println(e.getMessage());
                throw e;
            }
        }
      
      
      public static cl.cesfam.ENTITY.Partida getPartidaById(int id) throws Exception {
            Session session = cl.cesfam.DAL.NewHibernateUtil.getSessionFactory().openSession();
            try {
                session.beginTransaction();
                cl.cesfam.ENTITY.Partida tmp = (cl.cesfam.ENTITY.Partida) session.createCriteria(cl.cesfam.ENTITY.Partida.class).add(Restrictions.eq("idPartida", id)).uniqueResult();
                session.getTransaction().commit();
                session.close();
                return tmp;
            } catch (Exception e) {
                System.err.print(e.getMessage());
                session.close();
                throw e;
            }
        }
}
