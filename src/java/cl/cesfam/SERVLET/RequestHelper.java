/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.cesfam.SERVLET;

import cl.cesfam.ENTITY.Composicion;
import cl.cesfam.ENTITY.Medicamento;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.json.JSONException;
import org.json.JSONObject;

public class RequestHelper extends HttpServlet {

    
    private static String ACTION_REGISTRAR_REMEDIO = "registrarRemedio";
    private static String ACTION_REGISTRAR_PARTIDA = "registrarPartida";
    private static String ACTION_REGISTRAR_DETALLE_PARTIDA = "registrarDetallePartida";
    private static String ACTION_OBTENER_COMPOSICION = "obtenercomposicion";
    private static String ACTION_REGISTRAR_COMPOSICION = "RegistrarComposicion";
    private static String ACTION_ELIMINAR_COMPOSICION = "EliminarComposicion";
    private static String ACTION_OBTENER_MEDICAMENTOS = "ObtenerMedicamentos";
    private static String ACTION_OBTENER_MEDICAMENTOS_STOCK = "ObtenerMedicamentosStock";
    private static String ACTION_CADUCAR_MEDICAMENTO = "CaducarMedicamento";
    private static String ACTION_OBTENER_CADUCADOS = "ObtenerCaducados";
    private static String ACTION_DESECHAR_MEDICAMENTO = "DesecharMedicamento";
    
    //  http://localhost:8083/CESFAM/RequestHelper?accion=ObtenerCaducados
    
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
           }else if (action.equals(ACTION_REGISTRAR_PARTIDA)) {
		RegistrarPartida(request, response); 
           }else if (action.equals(ACTION_REGISTRAR_DETALLE_PARTIDA)) {
		RegistrarDetallePartida(request, response); 
           }else if (action.equals(ACTION_OBTENER_COMPOSICION)) {
		ObtenerComposicion(request, response); 
           }else if (action.equals(ACTION_REGISTRAR_COMPOSICION)) {
		RegistrarComposicion(request, response); 
           }else if (action.equals(ACTION_ELIMINAR_COMPOSICION)) {
		EliminarComposicion(request, response); 
           }else if (action.equals(ACTION_OBTENER_MEDICAMENTOS)) {
		ObtenerMedicamentos(request, response); 
           }else if (action.equals(ACTION_OBTENER_MEDICAMENTOS_STOCK)) {
		ObtenerMedicamentosStock(request, response); 
           }else if (action.equals(ACTION_CADUCAR_MEDICAMENTO)) {
		CaducarMedicamento(request, response); 
           }else if (action.equals(ACTION_OBTENER_CADUCADOS)) {
		ObtenerCaducados(request, response); 
           }else if (action.equals(ACTION_DESECHAR_MEDICAMENTO)) {
		DesecharMedicamento(request, response); 
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
                
                medicamento.setStock(0);
                medicamento.setStockCritico(0);
                
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
//      METODO DE CREACION PARTIDA
    public static void RegistrarPartida(HttpServletRequest request, HttpServletResponse response) {    
try {
                cl.cesfam.ENTITY.Partida partida = new cl.cesfam.ENTITY.Partida();

                //nombre de partida
                if (request.getParameter("txtNombrePartida") != null) 
                {
                     partida.setNombrePartida(request.getParameter("txtNombrePartida"));
                }
              
                if (cl.cesfam.DAO.PartidaDAO.add(partida)) 
                {
                cl.cesfam.ENTITY.Partida partidaTMP = cl.cesfam.DAO.PartidaDAO.getPartidaByNombre(partida.getNombrePartida());
                       response.setContentType("text/plain");
                       String res = Integer.toString(partidaTMP.getIdPartida());
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
//      METODO DE CREACION PARTIDA
    public static void RegistrarDetallePartida(HttpServletRequest request, HttpServletResponse response) {    
try {
                cl.cesfam.ENTITY.DetallePartida detPartida = new cl.cesfam.ENTITY.DetallePartida();
                cl.cesfam.ENTITY.Medicamento medicamento = new cl.cesfam.ENTITY.Medicamento();
                cl.cesfam.ENTITY.Partida partida = new cl.cesfam.ENTITY.Partida();
               
                //nombre de partida
    if (request.getParameter("txtCantidadPartida") != null) {
        detPartida.setCantidad(Integer.parseInt(request.getParameter("txtCantidadPartida")));
    }
   
        
           Date startDate= new Date();
           detPartida.setFechaIngreso(startDate);
        
    
    if (request.getParameter("txtFechaVencimiento") != null) {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yy");
            Date fechaV = sdf.parse(request.getParameter("txtFechaVencimiento"));     
            detPartida.setFechaVencimiento(fechaV);
        } catch (Exception e) {
            e.getMessage();
        }
    }
      //Medicamento
                if (request.getParameter("ddlMedicamentos") != null) {
                    try {
                        medicamento = cl.cesfam.DAO.MedicamentoDAO.getMedicamentoById(Integer.parseInt(request.getParameter("ddlMedicamentos")));
                        detPartida.setMedicamento(medicamento);
                        
                    } catch (Exception ex) {
                        Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                
      //Partida
                if (request.getParameter("ddlPartida") != null) {
                    try {
                        partida = cl.cesfam.DAO.PartidaDAO.getPartidaById(Integer.parseInt(request.getParameter("ddlPartida")));
                        detPartida.setPartida(partida);
                        
                    } catch (Exception ex) {
                        Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                    
              
                if (cl.cesfam.DAO.DetallePartidaDAO.add(detPartida)) 
                {
                       medicamento.setStock(Integer.parseInt(request.getParameter("txtCantidadPartida")) + medicamento.getStock());
                       cl.cesfam.DAO.MedicamentoDAO.update(medicamento);
                       response.setContentType("text/plain");
                       String res = Integer.toString(detPartida.getIdDetallePartida());
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
//METODO DE CREACION COMPOSICION
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
    private static void ObtenerMedicamentos(HttpServletRequest request, HttpServletResponse response) {
         JSONArray medicamentos = new JSONArray();
            JSONObject salida = new JSONObject();
        
        
        
        try {
            if (cl.cesfam.DAO.MedicamentoDAO.getList() != null) {
            for(cl.cesfam.ENTITY.Medicamento tmp: cl.cesfam.DAO.MedicamentoDAO.getList()){
              JSONObject item = new JSONObject();
               item.put("nombre", tmp.getNombreMedicamento());
               item.put("fabricante", tmp.getFabricante());
               item.put("presentacion", tmp.getPresentacion());
               item.put("contenido", tmp.getContenidoEnvase());
               item.put("stock", tmp.getStock());
               item.put("stockCritico", tmp.getStockCritico());
               
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
    
//        METODO QUE OBTIENE  MEDICAMENTOS
    private static void ObtenerMedicamentosStock(HttpServletRequest request, HttpServletResponse response) {
        JSONObject salida = new JSONObject();
        
        
                    Session session = cl.cesfam.DAL.NewHibernateUtil.getSessionFactory().openSession();
                    session.beginTransaction();
                    Query query = session.createQuery("select count(cc.idMedicamento) from Medicamento cc");
                     List<Integer> lista = query.list();
                    System.out.println(lista);
                    
                   
                   
                   Query query2 = session.createQuery("select count(cc.idMedicamento) from Medicamento cc where cc.stock = 0");
                    List<Integer> lista1 = query2.list();
                    System.out.println(lista);
                    session.close();  
        
                try {
                    salida.put("total_medicamentos", lista.get(0));
                    salida.put("total_sin_stock", lista1.get(0));
                    PrintWriter out = response.getWriter();
                    System.out.println("el objeto es :"+salida);
                    out.println(salida);
                    out.flush();
                } catch (JSONException ex) {
                    Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
                } catch (IOException ex) {
                    Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
                }

        
        
        
    }
    
//        METODO QUE CADUCA  MEDICAMENTOS
    private static void CaducarMedicamento(HttpServletRequest request, HttpServletResponse response) {
       
        cl.cesfam.ENTITY.Caducar caducar = new cl.cesfam.ENTITY.Caducar();
         cl.cesfam.ENTITY.Partida partida = new cl.cesfam.ENTITY.Partida();
          cl.cesfam.ENTITY.Medicamento medicamento = new cl.cesfam.ENTITY.Medicamento();
           cl.cesfam.ENTITY.FuncionarioFarmacia funcionario = new cl.cesfam.ENTITY.FuncionarioFarmacia();

                //Catidad de caducacion
                if (request.getParameter("txtCantidad") != null) {
                     caducar.setCantidad(Integer.parseInt(request.getParameter("txtCantidad")));
                }
                //Fecha caducacion
                java.util.Date fecha = new Date();
                caducar.setFechaCaducar(fecha);
                 //Motivo caducacion
                if (request.getParameter("ddlMotivo") != null) {
            try {
                caducar.setMotivoCaducar(cl.cesfam.DAO.MotivoCaducarDAO.getMotivoById(Integer.parseInt(request.getParameter("ddlMotivo")) ));
            } catch (Exception ex) {
                Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
            }
                }
            try {
                //Estado 1 Caducado, 2 Desechado
                caducar.setEstadoCaducar(cl.cesfam.DAO.EstadoCaducarDAO.getEstadoById(1));
            } catch (Exception ex) {
                Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
            }
                     //Partida caducacion
                if (request.getParameter("ddlPartida") != null) {
                    try {
                        partida = cl.cesfam.DAO.PartidaDAO.getPartidaById(Integer.parseInt(request.getParameter("ddlPartida")));
                        caducar.setPartida(partida);
                        
                    } catch (Exception ex) {
                        Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                
                 //Medicamento caducacion
                if (request.getParameter("ddlMedicamentos") != null) {
                    try {
                        medicamento = cl.cesfam.DAO.MedicamentoDAO.getMedicamentoById(Integer.parseInt(request.getParameter("ddlMedicamentos")));
                        caducar.setMedicamento(medicamento);
                        
                    } catch (Exception ex) {
                        Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                
                 //funcionario caducacion
                if (request.getParameter("idFuncionario") != null) {
                    try {
                        funcionario = cl.cesfam.DAO.FuncionarioFarmaciaDAO.getFuncionarioById(Integer.parseInt(request.getParameter("idFuncionario")));
                        caducar.setFuncionarioFarmacia(funcionario);
                        
                    } catch (Exception ex) {
                        Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
           
                
                     
            try {
                if (cl.cesfam.DAO.CaducarDAO.add(caducar)) 
                {
                        response.setContentType("text/plain");
                        String res = "true";
                        response.getWriter().write(res);
             
                
            } else
                {
                       response.setContentType("text/plain");
                       String res = "false";
                       response.getWriter().write(res);
                }
                
             } catch (IOException ex) {
                 Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
             } catch (Exception ex) {
                     Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
            }
                
    }
    
//        METODO QUE OBTIENE  CADUCADOS
    private static void ObtenerCaducados(HttpServletRequest request, HttpServletResponse response) {
            JSONArray caducados = new JSONArray();
            JSONObject caducado = new JSONObject();
            
                    Session session = cl.cesfam.DAL.NewHibernateUtil.getSessionFactory().openSession();
                    session.beginTransaction();
                    Query query = session.createQuery("select (select me.nombreMedicamento from Medicamento me where me.idMedicamento = ca.medicamento),\n" +
                    "(select fu.primerNombreFuncionario||' '||fu.apellidoPaternoFuncionario from FuncionarioFarmacia fu where fu.idFuncionario = ca.funcionarioFarmacia),\n" +
                    "(select pa.nombrePartida from Partida pa where pa.idPartida = ca.partida),\n" +
                    "(select mo.nombreMotivoCaducar from MotivoCaducar mo where mo.idMotivoCaducar = ca.motivoCaducar),\n" +  
                    "(select es.nombreEstado from EstadoCaducar es where es.idEstadoCaducar = ca.estadoCaducar),\n" +         
                    "ca.cantidad,\n" +
                    "ca.fechaCaducar,\n" +
                    "ca.idCaducar\n" +
                    "from Caducar ca where ca.estadoCaducar = 1  order by ca.fechaCaducar");
                    List<Object[]> lista = query.list();
                    session.close();
                    
                   if(lista != null){
                try {
                    for (Object[] item : lista) {
                        
                        for (int i = 0; i < 1; i++) {
                           
                            try {
                                JSONObject objeto = new JSONObject();
                                objeto.put("medicamento", (String)item[0]);
                                objeto.put("funcionario", (String)item[1]);
                                objeto.put("partida", (String)item[2]);
                                objeto.put("motivo", (String)item[3]);
                                objeto.put("estado", (String)item[4]);
                                objeto.put("cantidad", (int)item[5]);
                                DateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                                String fecha = df.format((Date)item[6]);
                                objeto.put("fecha",fecha );
                                objeto.put("id_caducar", (int)item[7]);
                                
                                caducados.put(objeto);
                                
                            } catch (JSONException ex) {
                                Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
                            }
                        }
                        
                    } // fin foercha
                    
                    caducado.put("data", caducados);
                    PrintWriter out = response.getWriter();
                    System.out.println("el objeto es :"+caducado);
                    out.println(caducado);
                    out.flush();
                } catch (JSONException ex) {
                    Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
                } catch (IOException ex) {
                    Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
                }
                 }else{
                    
                    
                    
                    }
     
        
        
    }
    
//        METODO QUE DESECHA MEDICAMENTOS
    private static void DesecharMedicamento(HttpServletRequest request, HttpServletResponse response) {
      
            try {
                cl.cesfam.ENTITY.Caducar caducar = new cl.cesfam.ENTITY.Caducar();
                cl.cesfam.ENTITY.Medicamento medicamento = new  Medicamento();
                int id = 0;
                //medicamento
                if (request.getParameter("id") != null) {
                    id = Integer.parseInt(request.getParameter("id"));
                }
                System.out.println("desechando medicamento .............. id : "+id);
                
                caducar = cl.cesfam.DAO.CaducarDAO.getCaducarById(id);
                caducar.setEstadoCaducar(cl.cesfam.DAO.EstadoCaducarDAO.getEstadoById(2));
                medicamento = cl.cesfam.DAO.MedicamentoDAO.getMedicamentoById(caducar.getMedicamento().getIdMedicamento());
                 if (cl.cesfam.DAO.CaducarDAO.update(caducar)) 
                {     medicamento.setStock((medicamento.getStock() - caducar.getCantidad() ));
                      cl.cesfam.DAO.MedicamentoDAO.update(medicamento);
                       response.setContentType("text/plain");
                       String res = "true";
                       response.getWriter().write(res);
                    System.out.println("desechando correctamente");
                }
                else
                {
                       response.setContentType("text/plain");
                       String res = "false";
                       response.getWriter().write(res);
                       System.out.println("Error al desechar");
                }
            } catch (Exception e) {
                e.getMessage();            
            }
        
        
        
        
        
    }

    
    
    
}// FIN SERVLET
