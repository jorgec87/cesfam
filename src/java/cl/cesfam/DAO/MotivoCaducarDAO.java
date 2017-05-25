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
public class MotivoCaducarDAO {

     public static  List<cl.cesfam.ENTITY.MotivoCaducar> getList() throws Exception {
            Session session = cl.cesfam.DAL.NewHibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            try {
                List<cl.cesfam.ENTITY.MotivoCaducar> lista = (List<cl.cesfam.ENTITY.MotivoCaducar>) session.createCriteria(cl.cesfam.ENTITY.MotivoCaducar.class).list();
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
    
     public static  cl.cesfam.ENTITY.MotivoCaducar getMotivoById(int id) throws Exception {
            Session session = cl.cesfam.DAL.NewHibernateUtil.getSessionFactory().openSession();
            try {
                session.beginTransaction();
                cl.cesfam.ENTITY.MotivoCaducar tmp = (cl.cesfam.ENTITY.MotivoCaducar) 
                        session.createCriteria(cl.cesfam.ENTITY.MotivoCaducar.class).add(Restrictions.eq("idMotivoCaducar", id)).uniqueResult();
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
