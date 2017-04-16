/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package cl.cesfam.DAO;

import net.sf.ehcache.hibernate.HibernateUtil;
import org.hibernate.Session;

/**
 * 
 * @author **Jorge Carrenca**
 */
public class ComponenteDAO {

     public static boolean add(cl.cesfam.ENTITY.Componente a) throws Exception 
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
    
}
