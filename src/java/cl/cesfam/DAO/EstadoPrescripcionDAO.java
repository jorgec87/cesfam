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
public class EstadoPrescripcionDAO {
   public static  cl.cesfam.ENTITY.EstadoPrescripcion getEstadoPrescripcionyId(int id) throws Exception {
            Session session = cl.cesfam.DAL.NewHibernateUtil.getSessionFactory().openSession();
            try {
                session.beginTransaction();
                cl.cesfam.ENTITY.EstadoPrescripcion tmp = (cl.cesfam.ENTITY.EstadoPrescripcion) 
                        session.createCriteria(cl.cesfam.ENTITY.EstadoPrescripcion.class).add(Restrictions.eq("idEstadoPrescripcion", id)).uniqueResult();
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
