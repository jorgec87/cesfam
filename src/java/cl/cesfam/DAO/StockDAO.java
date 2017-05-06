package cl.cesfam.DAO;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Administrador
 */
public class StockDAO {
    
     public static boolean add(cl.cesfam.ENTITY.Stock a) throws Exception 
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
     
     public static  cl.cesfam.ENTITY.Stock getStockById(int id) throws Exception {
            Session session = cl.cesfam.DAL.NewHibernateUtil.getSessionFactory().openSession();
            try {
                session.beginTransaction();
                cl.cesfam.ENTITY.Stock tmp = (cl.cesfam.ENTITY.Stock) 
                        session.createCriteria(cl.cesfam.ENTITY.Stock.class).add(Restrictions.eq("idStock", id)).uniqueResult();
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