/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.cesfam.SERVLET;

import cl.cesfam.ENTITY.Composicion;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Query;
import org.hibernate.Session;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author **Jorge Carrenca**
 */
public class RequestHelper extends HttpServlet {

    
    private static String ACTION_REGISTRAR_REMEDIO = "registrarRemedio";
    private static String ACTION_OBTENER_COMPOSICION = "obtenercomposicion";
    private static String ACTION_REGISTRAR_COMPOSICION = "RegistrarComposicion";
    private static String ACTION_ELIMINAR_COMPOSICION = "EliminarComposicion";
    private static String ACTION_OBTENER_MEDICAMENTOS = "ObtenerMedicamentos";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
      	
             String action = ""; 
            if (request.getParameter("accion") != null) 
            { action = request.getParameter("accion");}      
            System.out.println("procesando peticion [" + request.getRequestURL()+ action + "]");
            
           if (action.equals(ACTION_REGISTRAR_REMEDIO)) {
		RegistrarMedicamento(request, response);
           }else if (action.equals(ACTION_OBTENER_COMPOSICION)) {
		ObtenerComposicion(request, response); 
           }else if (action.equals(ACTION_REGISTRAR_COMPOSICION)) {
		RegistrarComposicion(request, response); 
           }else if (action.equals(ACTION_ELIMINAR_COMPOSICION)) {
		EliminarComposicion(request, response); 
           }else if (action.equals(ACTION_OBTENER_MEDICAMENTOS)) {
		ObtenerMedicamentos(request, response); 
           }    
            
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    //      METODO DE CREACION MEDICAMENTO 
    public static void RegistrarMedicamento(HttpServletRequest request, HttpServletResponse response) {
      try {
                cl.cesfam.ENTITY.Medicamento medicamento = new cl.cesfam.ENTITY.Medicamento();

                //Nombre De medicamento
                if (request.getParameter("txtNombreMed") != null) {
                     medicamento.setNombreMedicamento(request.getParameter("txtNombreMed"));
                }
                //Nombre De medicamento
                if (request.getParameter("radioInline") != null) {
                     medicamento.setPresentacion(Integer.parseInt(request.getParameter("radioInline")));
                }
                //Contenido De Envase
                if (request.getParameter("txtContenido") != null) {
                     medicamento.setContenidoEnvase(Integer.parseInt(request.getParameter("txtContenido")));
                }
                //Nombre De medicamento
                if (request.getParameter("txtFabricante") != null) {
                     medicamento.setFabricante(request.getParameter("txtFabricante"));
                }
                
                cl.cesfam.ENTITY.Stock stock = new cl.cesfam.ENTITY.Stock(0,0);

                if (cl.cesfam.DAO.StockDAO.add(stock)) 
                {
                    Session session = cl.cesfam.DAL.NewHibernateUtil.getSessionFactory().openSession();
                    session.beginTransaction();
                    Query query = session.createQuery("select max(cc.idStock) from Stock cc");
                     List<Integer> lista = query.list();
                    System.out.println(lista);
                    session.close(); 
                    stock.setIdStock(lista.get(0));
                    medicamento.setStock(stock);
                }
                
                if (cl.cesfam.DAO.MedicamentoDAO.add(medicamento)) 
                {
                    medicamento = cl.cesfam.DAO.MedicamentoDAO.getMedicamentoByName(medicamento.getNombreMedicamento());
                       response.setContentType("text/plain");
                       String res = Integer.toString(medicamento.getIdMedicamento());
                       response.getWriter().write(res);
                }
                else
                {
                       response.setContentType("text/plain");
                       String res = "false";
                       response.getWriter().write(res);
                }
            } catch (Exception e) {
                e.getMessage();            
            }
    }

        //      METODO DE CREACION COMPOSICION
    public static void RegistrarComposicion(HttpServletRequest request, HttpServletResponse response) {
      try {
                cl.cesfam.ENTITY.Composicion composicion = new cl.cesfam.ENTITY.Composicion();
                 JSONObject salida = new JSONObject();

                //medicamento
                if (request.getParameter("ddlMedicamentos") != null) {
                     composicion.setMedicamento(cl.cesfam.DAO.MedicamentoDAO.getMedicamentoById(Integer.parseInt(request.getParameter("ddlMedicamentos"))));
                }
                //Cantidad de composicion
                if (request.getParameter("txtMg") != null) {
                     composicion.setCantidad(Integer.parseInt(request.getParameter("txtMg")));
                }
                //composicion
                if (request.getParameter("ddlComponentes") != null) {
                     composicion.setComponente(cl.cesfam.DAO.ComponenteDAO.getComponenteById(Integer.parseInt(request.getParameter("ddlComponentes"))));
                }
                if (cl.cesfam.DAO.ComposicionDAO.add(composicion)) 
                {
                    cl.cesfam.ENTITY.Componente componenteTMP = cl.cesfam.DAO.ComponenteDAO.getComponenteById(Integer.parseInt(request.getParameter("ddlComponentes")));
                    Session session = cl.cesfam.DAL.NewHibernateUtil.getSessionFactory().openSession();
                    session.beginTransaction();
                    Query query = session.createQuery("select max(cc.idComposicion) from Composicion cc");
                     List<Integer> lista = query.list();
                    System.out.println(lista);
                    session.close();  
                    
                    salida.put("id_composicion", lista.get(0));
                    salida.put("nombre_componente", componenteTMP.getNombreComponente());
                    salida.put("mg", composicion.getCantidad());
                    PrintWriter out = response.getWriter();
                    System.out.println("el objeto es :"+salida);
                    out.println(salida);
                    out.flush();
                    
                }
                else
                {
                       response.setContentType("text/plain");
                       String res2 = "false";
                       response.getWriter().write(res2);
                }
            } catch (Exception e) {
                e.getMessage();            
            }
    }
//    FIN REGISTRAR COMPOSICION
    
//        INICIO ELIMINAR COMPOSICION
   public static void EliminarComposicion(HttpServletRequest request, HttpServletResponse response) {
      try {
                cl.cesfam.ENTITY.Composicion composicion = new cl.cesfam.ENTITY.Composicion();
                int id = 0;
                //medicamento
                if (request.getParameter("id") != null) {
                    id = Integer.parseInt(request.getParameter("id"));
                }
                
                composicion = cl.cesfam.DAO.ComposicionDAO.getComposicionByIdComposicion(id);
                
                 if (cl.cesfam.DAO.ComposicionDAO.delete(composicion)) 
                {
                       response.setContentType("text/plain");
                       String res = "true";
                       response.getWriter().write(res);

                }
                else
                {
                       response.setContentType("text/plain");
                       String res = "false";
                       response.getWriter().write(res);
                }
            } catch (Exception e) {
                e.getMessage();            
            }
    } //        FIN ELIMINAR COMPOSICION
   
   
   //        METODO QUE OBTIENE  COMPOSICION
    public static void ObtenerComposicion(HttpServletRequest request, HttpServletResponse response) {
        
         cl.cesfam.ENTITY.Composicion compo = new cl.cesfam.ENTITY.Composicion();
          cl.cesfam.ENTITY.Componente componente = new cl.cesfam.ENTITY.Componente();
         int idMedicamneto = 0;
         JSONArray composiciones = new JSONArray();
            JSONObject salida = new JSONObject();
         
          if (request.getParameter("id") != null) {
                   idMedicamneto = Integer.parseInt(request.getParameter("id"));
                }
         
          
        try {

               Session session = cl.cesfam.DAL.NewHibernateUtil.getSessionFactory().openSession();
               session.beginTransaction();
               Query query = session.createQuery("from Composicion Composicion where Composicion.medicamento = "+idMedicamneto);
               List<cl.cesfam.ENTITY.Composicion> lista = query.list();
               session.close();
            if (lista != null) {
                
                for (Composicion com : lista) {
                   JSONObject item = new JSONObject();
                   componente = cl.cesfam.DAO.ComponenteDAO.getComponenteById(com.getComponente().getIdComponente());
                   
                   item.put("id_composicion", com.getIdComposicion());
                   item.put("nombre", componente.getNombreComponente());
                   item.put("cantidad", com.getCantidad());
                    
                    composiciones.put(item);
                }
                
                salida.put("data", composiciones);
                
                try (PrintWriter out = response.getWriter()) {
                    System.out.println("el objeto es :"+salida);
                    out.println(salida);
                    out.flush();
                }               
            }else{
            }
 
        } catch (Exception ex) {
            Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }   //        METODO QUE OBTIENE  COMPOSICION

     //        METODO QUE OBTIENE  MEDICAMENTOS
    private void ObtenerMedicamentos(HttpServletRequest request, HttpServletResponse response) {
         JSONArray medicamentos = new JSONArray();
            JSONObject salida = new JSONObject();
        
        
        
        try {
            if (cl.cesfam.DAO.MedicamentoDAO.getList() != null) {
            for(cl.cesfam.ENTITY.Medicamento tmp: cl.cesfam.DAO.MedicamentoDAO.getList()){
                cl.cesfam.ENTITY.Stock stock = cl.cesfam.DAO.StockDAO.getStockById(tmp.getStock().getIdStock());
              JSONObject item = new JSONObject();
               item.put("nombre", tmp.getNombreMedicamento());
               item.put("fabricante", tmp.getFabricante());
               item.put("presentacion", tmp.getPresentacion());
               item.put("contenido", tmp.getContenidoEnvase());
               item.put("stock", stock.getStock());
               
               medicamentos.put(item);
            
            }
                
                salida.put("data", medicamentos); 
                PrintWriter out = response.getWriter();
                System.out.println("el objeto es :"+salida);
                out.println(salida);
                out.flush();
                
            }else{
                
                salida.put("data", medicamentos); 
                PrintWriter out = response.getWriter();
                System.out.println("el objeto es :"+salida);
                out.println(salida);
                out.flush();
            
            }
            
         
        } catch (Exception ex) {
            Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        
       
    }

    
    
    
}// FIN SERVLET
