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
 * @author **Jorge Carrenca**
 */
public class FormularioMedicamentoDAO {

       public static boolean add(cl.cesfam.ENTITY.FormularioMedicamento a) throws Exception 
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
    
     public static  List<cl.cesfam.ENTITY.FormularioMedicamento> getList() throws Exception {
            Session session = cl.cesfam.DAL.NewHibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            try {
                List<cl.cesfam.ENTITY.FormularioMedicamento> lista = (List<cl.cesfam.ENTITY.FormularioMedicamento>) session.createCriteria(cl.cesfam.ENTITY.FormularioMedicamento.class).list();
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
    
    
       public static  boolean delete(cl.cesfam.ENTITY.FormularioMedicamento a) throws Exception {
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
     
      public static  boolean update(cl.cesfam.ENTITY.FormularioMedicamento a) throws Exception {
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
      
 
      
      public static  cl.cesfam.ENTITY.FormularioMedicamento getFormularioMedicamentoById(int id) throws Exception {
            Session session = cl.cesfam.DAL.NewHibernateUtil.getSessionFactory().openSession();
            try {
                session.beginTransaction();
                cl.cesfam.ENTITY.FormularioMedicamento tmp = (cl.cesfam.ENTITY.FormularioMedicamento) 
                        session.createCriteria(cl.cesfam.ENTITY.FormularioMedicamento.class).add(Restrictions.eq("idFormularioMedicamento", id)).uniqueResult();
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
