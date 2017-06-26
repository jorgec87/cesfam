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
public class EstadoReservaDAO 
{
             public static  List<cl.cesfam.ENTITY.EstadoReserva> getList() throws Exception {
            Session session = cl.cesfam.DAL.NewHibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            try {
                List<cl.cesfam.ENTITY.EstadoReserva> lista = (List<cl.cesfam.ENTITY.EstadoReserva>) 
                        session.createCriteria(cl.cesfam.ENTITY.EstadoReserva.class).list();
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
             
                   public static  cl.cesfam.ENTITY.EstadoReserva getEstadoReservaById(int id) throws Exception {
            Session session = cl.cesfam.DAL.NewHibernateUtil.getSessionFactory().openSession();
            try {
                session.beginTransaction();
                cl.cesfam.ENTITY.EstadoReserva tmp = (cl.cesfam.ENTITY.EstadoReserva) 
                        session.createCriteria(cl.cesfam.ENTITY.EstadoReserva.class).add(Restrictions.eq("idEstadoReserva", id)).uniqueResult();
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
