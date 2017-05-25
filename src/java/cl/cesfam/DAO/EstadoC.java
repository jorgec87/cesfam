/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.cesfam.DAO;

import java.util.List;
import org.hibernate.Session;

/**
 *
 * @author Francisco
 */
public class EstadoC {
    public static  List<cl.cesfam.ENTITY.EstadoCaducar> getList() throws Exception {
            Session session = cl.cesfam.DAL.NewHibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            try {
                List<cl.cesfam.ENTITY.EstadoCaducar> lista = (List<cl.cesfam.ENTITY.EstadoCaducar>) session.createCriteria(cl.cesfam.ENTITY.EstadoCaducar.class).list();
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
}
