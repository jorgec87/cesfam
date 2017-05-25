/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package cl.cesfam.DAO;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 * 
 * @author **Jorge Carrenca**
 */
public class EstadoCaducarDAO {
    
     public static  boolean update(cl.cesfam.ENTITY.EstadoCaducar a) throws Exception {
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
     
      public static  cl.cesfam.ENTITY.EstadoCaducar getEstadoById(int id) throws Exception {
            Session session = cl.cesfam.DAL.NewHibernateUtil.getSessionFactory().openSession();
            try {
                session.beginTransaction();
                cl.cesfam.ENTITY.EstadoCaducar tmp = (cl.cesfam.ENTITY.EstadoCaducar) 
                        session.createCriteria(cl.cesfam.ENTITY.EstadoCaducar.class).add(Restrictions.eq("idEstadoCaducar", id)).uniqueResult();
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
