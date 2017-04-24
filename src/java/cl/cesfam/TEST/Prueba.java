/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.cesfam.TEST;

import cl.cesfam.ENTITY.Componente;
import cl.cesfam.ENTITY.Composicion;
import cl.cesfam.SERVLET.RequestHelper;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author **Jorge Carrenca**
 */
public class Prueba {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        
//        cl.cesfam.ENTITY.Componente c1 = new Componente("Aspirina");
//        
//        try {
//            if (cl.cesfam.DAO.ComponenteDAO.add(c1)) {
//                System.out.println("Componente Ingresado correctamente");
//            }
//        } catch (Exception ex) {
//             System.out.println("Error al ingresar");
//            Logger.getLogger(Prueba.class.getName()).log(Level.SEVERE, null, ex);
//        }
       
        
//        cl.cesfam.ENTITY.Componente c1 = new Componente();
//	
//	try {
//             
//	    FileInputStream fis = new FileInputStream("C:\\Users\\Francisco\\Desktop\\Analista Programador\\Portafolio De Titulo\\componentes.txt");
//            InputStreamReader is = new InputStreamReader(fis, "ISO-8859-1");
//              BufferedReader bf = new BufferedReader(is);
//		         
//		String temp = "";
//		String bfRead;
//		while((bfRead = bf.readLine()) != null){
//			 c1.setNombreComponente(bfRead);
//                        cl.cesfam.DAO.ComponenteDAO.add(c1);
//                        System.out.println("componente :"+bfRead+" guardado con exito");
//                        
//		}
//		
//		
//		
//	} catch (Exception e) {
//		// TODO: handle exception
//		System.err.println("No se encontro archivo");
//	}
// cl.cesfam.ENTITY.Composicion compo = new cl.cesfam.ENTITY.Composicion();
//          cl.cesfam.ENTITY.Componente componente = new cl.cesfam.ENTITY.Componente();
//         int idMedicamneto = 0;
//         JSONArray composiciones = new JSONArray();
//            JSONObject salida = new JSONObject();
//
//
// try {
//     
//       Session session = cl.cesfam.DAL.NewHibernateUtil.getSessionFactory().openSession();
//         session.beginTransaction();
//        Query query = session.createQuery("from Composicion Composicion where Composicion.medicamento =1");
//        List<cl.cesfam.ENTITY.Composicion> lista = query.list();
//        session.close();
//            if (lista != null) {
//               
//                
//                  
//
//               
//                for (Composicion com : lista) {
//                   JSONObject item = new JSONObject();
//                   componente = cl.cesfam.DAO.ComponenteDAO.getComponenteById(com.getComponente().getIdComponente());
//                   
//                   item.put("id_composicion", com.getIdComposicion());
//                   item.put("nombre", componente.getNombreComponente());
//                   item.put("cantidad", com.getCantidad());
//                    
//                    composiciones.put(item);
//                }
//                
//                salida.put("data", composiciones);
//                
//               
//                    System.out.println("el objeto es :"+salida);
//                   
//                
//                
//            }else{
//            
//            
//            
//            }
//            
////            
////            JSONObject salida = new JSONObject();
////		String action = request.getParameter("action");
////		String id = request.getParameter("rut");
////		
////		if (action.equals("getCliente")) {
////			
////			try {
////				salida.put("data", PruebaConceptoDAO.ObtenerCliente(id));
////			} catch (JSONException e) {
////				// TODO Auto-generated catch block
////				e.printStackTrace();
////			}
////			
////				PrintWriter out = response.getWriter();
////					out.println(salida);
////					out.flush();
////					out.close();
////		
////			
////		}else if (action.equals("getUsuarios")) {
////			
////			try {
////				salida.put("data", PruebaConceptoDAO.ObtenerUsuarios());
////			} catch (JSONException e) {
////				// TODO Auto-generated catch block
////				e.printStackTrace();
////			}
////			
////				PrintWriter out = response.getWriter();
////					out.println(salida);
////					out.flush();
////					out.close();
////		}
////		
////		
////		
////		
////			
////				
////				
////			
////	}//fin doGet
////	
//            
//
//        } catch (Exception ex) {
//            Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
//        }
        
	
	
	
	}//fin main
		
	}
	
	


        
    
    

