/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.cesfam.SERVLET;

import cl.cesfam.DAO.PacienteDAO;

import cl.cesfam.ENTITY.Composicion;
import cl.cesfam.ENTITY.EstadoPrescripcion;
import cl.cesfam.ENTITY.FuncionarioFarmacia;
import cl.cesfam.ENTITY.Medicamento;
import cl.cesfam.ENTITY.Paciente;
import cl.cesfam.ENTITY.Prescripcion;
import cl.cesfam.UTIL.ParametersUtil;
import static cl.cesfam.automa.AutomatizadoEmail.makeDairlyJob;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
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
import org.quartz.Scheduler;
import org.quartz.SchedulerException;

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
    private static String ACTION_EMITIR_RESERVA = "emitirReserva";
    private static String ACTION_OBTENER_RESERVAS = "ObtenerReservas";
    private static String ACTION_OBTENER_PENDIENTES="ObtenerPendientes";
    private static String ACTION_OBTENER_REMEDIOS_PENDIENTES="ObtenerRemediosPendientes";
    private static String ACTION_OBTENER_PACIENTE = "ObtenerPaciente";
    private static String ACTION_CREAR_FORMULARIO_MEDICAMENTO = "formularioMedicamento";
    private static String ACTION_CREAR_PRESCRIPCION = "crearPrescripcion";
    private static String ACTION_ELIMINAR_PRESCRIPCION = "eliminarPrescripcion";
    private static String ACTION_OBTENER_PRESCRIPCIONES = "obtenerPrescripciones";
    private static String ACTION_GENERAR_RECETA = "generarReceta";
    private static String ACTION_AUTENTICAR = "autenticar_android";
     private static String ACTION_OBTENER_MEDICAMENTOS_RESERVADOS = "obtenerReservados";
     private static String ACTION_ACTIVAR_EMAIL = "ActivarEmail";
     private static String ACTION_DETENER_EMAIL = "DetenerEmail";
    
     
     private static Scheduler scheduler = null;
    
    
    //  http://localhost:8083/CESFAM/RequestHelper?accion=obtenerPrescripciones
   // http://localhost:8083/CESFAM/RequestHelper?accion=autenticar_android&txtRut=16.797.436.8&txtPass=1234
  // http://localhost:8083/CESFAM/RequestHelper?accion=obtenerReservados
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
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
           }else if (action.equals(ACTION_OBTENER_PACIENTE)) {
		ObtenerPaciente(request, response); 
           }else if (action.equals(ACTION_EMITIR_RESERVA)) {
		EmitirReserva(request, response); 
           }else if (action.equals(ACTION_OBTENER_RESERVAS)) {
		ObtenerReservas(request, response);   
           }else if (action.equals(ACTION_OBTENER_PENDIENTES)) {
		ObtenerPendientes(request, response);   
           }else if (action.equals(ACTION_OBTENER_REMEDIOS_PENDIENTES)) {
		ObtenerRemediosPendientes(request, response);   
           }else if (action.equals(ACTION_CREAR_FORMULARIO_MEDICAMENTO)) {
		CrearFormularioMedicamento(request, response);   
           }else if (action.equals(ACTION_CREAR_PRESCRIPCION)) {
		CrearPrescripcion(request, response);   
           }else if (action.equals(ACTION_ELIMINAR_PRESCRIPCION)) {
		EliminarPrescripcion(request, response);   
           }else if (action.equals(ACTION_OBTENER_PRESCRIPCIONES)) {
		ObtenerPrescripciones(request, response);   
           }else if (action.equals(ACTION_GENERAR_RECETA)) {
		generarReceta(request, response);
           }else if (action.equals(ACTION_AUTENTICAR)) {
		AutenticarAndroid(request, response);   
           }else if (action.equals(ACTION_OBTENER_MEDICAMENTOS_RESERVADOS)) {
		obtenerMedicametosReservados(request, response);   
           }else if (action.equals(ACTION_ACTIVAR_EMAIL)) {
		   ActivarEmail(request, response);   
           }else if (action.equals(ACTION_DETENER_EMAIL)) {
		  DetenerEmail(request, response);   
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
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
             ParametersUtil.MostrarParametros(request);
            
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
                    
                   
                   
                   Query query2 = session.createQuery("select count(cc.idMedicamento) from Medicamento cc where cc.stock < 1");
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

    private void EmitirReserva(HttpServletRequest request, HttpServletResponse response) 
    {
        try
        {
            ParametersUtil.MostrarParametros(request);
            
                cl.cesfam.ENTITY.Reserva reserva = new cl.cesfam.ENTITY.Reserva();
                cl.cesfam.ENTITY.EstadoReserva eReserva = new cl.cesfam.ENTITY.EstadoReserva();
                cl.cesfam.ENTITY.Medicamento medicamento = new cl.cesfam.ENTITY.Medicamento();
                cl.cesfam.ENTITY.Paciente paciente = new cl.cesfam.ENTITY.Paciente();
               
//cantidad a reservar
    if (request.getParameter("txtCantidadReserva") != null) {
        reserva.setCantidad(Integer.parseInt(request.getParameter("txtCantidadReserva")));
    }
//fecha de reserva   
   Date startDate= new Date();
           reserva.setFechaEventoReserva(startDate);
        
//Medicamento
                if (request.getParameter("ddlMedicamentos") != null) {
                    try {
                        medicamento = cl.cesfam.DAO.MedicamentoDAO.getMedicamentoById(Integer.parseInt(request.getParameter("ddlMedicamentos")));
                        reserva.setMedicamento(medicamento);
                        
                    } catch (Exception ex) {
                        Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                
//Paciente
                if (request.getParameter("ddlPaciente") != null) {
                    try {
                        paciente = cl.cesfam.DAO.PacienteDAO.getPacienteById(Integer.parseInt(request.getParameter("ddlPaciente")));
                        reserva.setPaciente(paciente);
                        
                    } catch (Exception ex) {
                        Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                
                 try {
                        eReserva = cl.cesfam.DAO.EstadoReservaDAO.getEstadoReservaById(1);
                        System.out.println(eReserva.getIdEstadoReserva()+eReserva.getNombreEstado());
                        
                        reserva.setEstadoReserva(eReserva);
                        reserva.setObservacion(" ");
  
                    } catch (Exception ex) {
                        Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
                    }  
                if (cl.cesfam.DAO.ReservaDAO.add(reserva)) 
                {
                       response.setContentType("text/plain");
                       String res = Integer.toString(reserva.getIdReserva());
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

    private void ObtenerReservas(HttpServletRequest request, HttpServletResponse response) {
         JSONArray caducados = new JSONArray();
            JSONObject caducado = new JSONObject();
            
                    Session session = cl.cesfam.DAL.NewHibernateUtil.getSessionFactory().openSession();
                    session.beginTransaction();
                    Query query = session.createQuery("");
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
    
        //        METODO QUE OBTIENE PRESCRIPCIONES PENDIENTES
    private static void ObtenerPendientes(HttpServletRequest request, HttpServletResponse response) {
            JSONArray pendientes = new JSONArray();
            JSONObject pendiente = new JSONObject();
            
                    Session session = cl.cesfam.DAL.NewHibernateUtil.getSessionFactory().openSession();
                    session.beginTransaction();
                   Query query = session.createQuery(
                    "select (select re.nombreMedicamento from Medicamento re where re.idMedicamento = pre.formularioMediamento),\n" +
                    "(select pac.primerNombrePaciente||' '||pac.apellidoPaternoPaciente from Paciente pac where pac.idPaciente = pre.formularioMediamento),\n" +
                    "(select pac.rutPaciente from Paciente pac where pac.idPaciente = pre.formularioMediamento),\n" +
                    "pre.periodo,\n" +
                    "pre.frecuencia,\n" +
                    "pre.duracionTratamiento\n" +
                    "from Prescripcion pre where pre.estadoPrescripcion = 0");
                    List<Object[]> lista = query.list();
                    session.close();
                    
                   if(lista != null){
                try {
                    for (Object[] item : lista) {
                        
                        for (int i = 0; i < 1; i++) {
                            try {
                                JSONObject objeto = new JSONObject();
                                objeto.put("medicamento", (String)item[0]);
                                objeto.put("paciente", (String)item[1]);
                                objeto.put("rutPaciente", (String)item[2]);
                                objeto.put("periodo", (int)item[3]);
                                objeto.put("frecuencia", (int)item[4]);
                                objeto.put("duracion", (int)item[5]);
                                pendientes.put(objeto);
                                
                            } catch (JSONException ex) {
                                Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
                            }
                        } 
                    } // fin foercha         
                    pendiente.put("data", pendientes);
                    PrintWriter out = response.getWriter();
                    System.out.println("el objeto es :"+pendiente);
                    out.println(pendiente);
                    out.flush();
                } catch (JSONException ex) {
                    Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
                } catch (IOException ex) {
                    Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
                }
                 }else{
                    
                    
                    
                    }
     
        
        
    }
    // FIN METODO QUE ENTREGA PRESCRIPCIONES PENDIENTES
    
    // Inicio metodo que OBTIENE remedios pendientes.
    
     private static void ObtenerRemediosPendientes(HttpServletRequest request, HttpServletResponse response) {
            JSONArray pendientes = new JSONArray();
            JSONObject pendiente = new JSONObject();
            
                    Session session = cl.cesfam.DAL.NewHibernateUtil.getSessionFactory().openSession();
                    session.beginTransaction();
                   Query query = session.createQuery(
                    "select (select pac.primerNombrePaciente||' '||pac.apellidoPaternoPaciente from Paciente pac where pac.idPaciente = pre.formularioMediamento),\n" +
                    "(select pac.rutPaciente from Paciente pac where pac.idPaciente = pre.formularioMediamento),\n" +
                    "pre.periodo,\n" +
                    "pre.frecuencia,\n" +
                    "pre.duracionTratamiento\n" +
                    "from Prescripcion pre where pre.estadoPrescripcion = 0");
                    List<Object[]> lista = query.list();
                    session.close();
                    
                   if(lista != null){
                try {
                    for (Object[] item : lista) {
                        
                        for (int i = 0; i < 1; i++) {
                           
                            try {
                                JSONObject objeto = new JSONObject();
                                objeto.put("paciente", (String)item[0]);
                                objeto.put("rutPaciente", (String)item[1]);
                                objeto.put("periodo", (int)item[2]);
                                objeto.put("frecuencia", (int)item[3]);
                                objeto.put("duracion", (int)item[4]);
                                pendientes.put(objeto);
                                
                            } catch (JSONException ex) {
                                Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
                            }
                        }
                        
                    } // fin foercha
                    
                    pendiente.put("data", pendientes);
                    PrintWriter out = response.getWriter();
                    System.out.println("el objeto es :"+pendiente);
                    out.println(pendiente);
                    out.flush();
                } catch (JSONException ex) {
                    Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
                } catch (IOException ex) {
                    Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
                }
                 }else{
                    
                    
                    
                    }
     
        
        
    }
    
    
    
    // Fin metodo que entrega remedios pendientes
    



    private void ObtenerPaciente(HttpServletRequest request, HttpServletResponse response) {
       
          JSONObject salida = new JSONObject();
          Paciente paciente = null;
            
          try {
              
                //rut paciente
                if (request.getParameter("txtRut") != null) {
                    paciente = PacienteDAO.getPacienteByRut(request.getParameter("txtRut"));
                }
                
                if(paciente != null){
                    salida.put("nombre", paciente.getPrimerNombrePaciente()+" "+paciente.getApellidoPaternoPaciente()+" "+paciente.getApellidoMaternoPaciente());
                    salida.put("rut", paciente.getRutPaciente());
                    salida.put("email", paciente.getEmailPaciente());
                    salida.put("telefono", paciente.getTelefonoPaciente());
                    PrintWriter out = response.getWriter();
                    System.out.println("el objeto es :"+salida);
                    out.println(salida);
                    out.flush();
                }else{
                       response.setContentType("text/plain");
                       String res = "false";
                       response.getWriter().write(res);
                
                }
                } catch (JSONException ex) {
                    Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
                } catch (IOException ex) {
                    Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
                } catch (Exception ex) {
            Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
        }

        
        
    }


  
    
   
 // INICIO METODO QUE CREA FORMULARIO DE MEDICAMENTOS
    private static void CrearFormularioMedicamento(HttpServletRequest request, HttpServletResponse response) throws ParseException, Exception {
       
                 
      
                cl.cesfam.ENTITY.FormularioMedicamento formulario = new cl.cesfam.ENTITY.FormularioMedicamento();
                 JSONObject salida = new JSONObject();
             

                //medicamento
                if (request.getParameter("id_medico") != null) {
                     formulario.setMedicoIdMedico(Integer.parseInt(request.getParameter("id_medico")));
                }
                //Cantidad de composicion
                if (request.getParameter("rut_paciente") != null) {
                    Paciente pa = cl.cesfam.DAO.PacienteDAO.getPacienteByRut(request.getParameter("rut_paciente"));
                     formulario.setPacienteIdPaciente(pa.getIdPaciente());
                }
                 //Fecha caducacion
                java.util.Date fecha_actual = new Date();
                formulario.setFechaFormularioMedicamento(fecha_actual);
                 //Motivo caducacion
                //requiere evaluzacion
                if (request.getParameter("requiere_evaluacion") != null &&  request.getParameter("requiere_evaluacion").equals("1")) {
                   
                         formulario.setRequiereProximaEvaluacion(1);
                         //fecha proxima evaluacion
                        if (request.getParameter("fecha_proxima_evaluacion") != null) {
                             SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yy");
                             Date fecha = sdf.parse(request.getParameter("fecha_proxima_evaluacion"));
                             formulario.setFechaProximaEvaluacion(fecha);
                        }
                    }else{
                        formulario.setRequiereProximaEvaluacion(0);
                     }
               
                if (cl.cesfam.DAO.FormularioMedicamentoDAO.add(formulario)) 
                {
                   
                    Session session = cl.cesfam.DAL.NewHibernateUtil.getSessionFactory().openSession();
                    session.beginTransaction();
                    Query query = session.createQuery("select max(cc.idFormularioMedicamento) from FormularioMedicamento cc");
                     List<Integer> lista = query.list();
                    System.out.println(lista);
                    session.close();  
                    
                    salida.put("id_formulario_medicamento", lista.get(0));
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
        
     }
    

    //INICIO METODO QUE CREA PRECRIPCION 
    private static void CrearPrescripcion(HttpServletRequest request, HttpServletResponse response) {
              ParametersUtil.MostrarParametros(request);
              System.out.println();
              Prescripcion pre = new Prescripcion();
              JSONObject salida = new JSONObject();
              Integer permanete = null;
              
        try {


              //estado de prescripcion
               EstadoPrescripcion estado = cl.cesfam.DAO.EstadoPrescripcionDAO.getEstadoPrescripcionyId(1);
               pre.setEstadoPrescripcion(estado);
                
               //formuario de medicamento
                if (request.getParameter("id_formulario") != null) {
                    pre.setFormularioMediamento(cl.cesfam.DAO.FormularioMedicamentoDAO.getFormularioMedicamentoById(Integer.parseInt(request.getParameter("id_formulario"))));
                }
                //medicamento
                if (request.getParameter("id_medicamento") != null) {
                  pre.setMedicamento(cl.cesfam.DAO.MedicamentoDAO.getMedicamentoById(Integer.parseInt(request.getParameter("id_medicamento"))));
                }
                
                //private TipoPrescripcion tipoPrescripcion PENDIENTE
                if (request.getParameter("permanente") != null) {
                  permanete = Integer.parseInt(request.getParameter("permanente"));
                  pre.setTipoPrescripcion(cl.cesfam.DAO.TipoPrescripcionDAO.getTipoPrescripcionById(permanete));
                 }
                
                if(permanete == 2){
                //periodo de prescripcio
                if (request.getParameter("periodo") != null) {
                  pre.setPeriodo(Integer.parseInt(request.getParameter("periodo").split(" ")[1]) );
                }
                }
                
                //frecuencia de prescripcion
                 if (request.getParameter("frecuencia") != null) {
                     
                   pre.setFrecuencia(Integer.parseInt(request.getParameter("frecuencia").split(" ")[1]) );
                }
                 
                  //cantidad de medicamentos
                 if (request.getParameter("cantidad") != null) {
                   pre.setCantidad(Integer.parseInt(request.getParameter("cantidad")) );
                }
                 
                  //duracion de tratamientoPENDIENTE
                 if (cl.cesfam.DAO.PrescripcionDAO.add(pre)) 
                {
                   
                   Session session = cl.cesfam.DAL.NewHibernateUtil.getSessionFactory().openSession();
                    session.beginTransaction();
                    Query query = session.createQuery("select max(cc.idPrescripcion) from Prescripcion cc");
                     List<Integer> lista = query.list();
                    System.out.println(lista);
                    session.close();  
                    
                    salida.put("id_prescripcion", lista.get(0));
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
        
          } catch (Exception ex) {
            Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
              //estado de prescripcion
         }
              
       }

    private void EliminarPrescripcion(HttpServletRequest request, HttpServletResponse response) {
      try {
                cl.cesfam.ENTITY.Prescripcion pre = new cl.cesfam.ENTITY.Prescripcion();
                int id = 0;
                //medicamento
                if (request.getParameter("id") != null) {
                    id = Integer.parseInt(request.getParameter("id"));
                }
                
                pre = cl.cesfam.DAO.PrescripcionDAO.getPrescripcionById(id);
                
                 if (cl.cesfam.DAO.PrescripcionDAO.delete(pre)) 
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
    }

    private void ObtenerPrescripciones(HttpServletRequest request, HttpServletResponse response) {
            JSONArray formularios = new JSONArray();
            JSONObject salida = new JSONObject();
            DateFormat df_fecha_hora = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            DateFormat df_fecha = new SimpleDateFormat("dd/MM/yyyy");
            
                    Session session = cl.cesfam.DAL.NewHibernateUtil.getSessionFactory().openSession();
                    session.beginTransaction();
                   Query query = session.createQuery("select  \n" +
                    "fo.idFormularioMedicamento ,\n" +
                    "(select pa.primerNombrePaciente||' '||pa.apellidoPaternoPaciente from Paciente pa where pa.idPaciente = fo.pacienteIdPaciente ),\n" +
                    "(select pa.rutPaciente from Paciente pa where pa.idPaciente = fo.pacienteIdPaciente ),\n" +
                    "fo.requiereProximaEvaluacion ,\n" +
                    "fo.fechaProximaEvaluacion ,\n" +
                    "fo.fechaFormularioMedicamento \n" +
                    "from FormularioMedicamento fo\n" +
                    "WhERE rownum<=5\n" +
                    "order by fo.fechaFormularioMedicamento  asc ");
                    List<Object[]> lista = query.list();
                    session.close();
                    
                   if(lista != null){
                try {
                    for (Object[] item : lista) {
                        
                        for (int i = 0; i < 1; i++) {

                            try {
                                JSONObject objeto = new JSONObject();
                                String fecha_prox = null;
                                objeto.put("folio", (int)item[0]);
                                objeto.put("nombre_paciente", (String)item[1]);
                                objeto.put("rut", (String)item[2]);
                                objeto.put("proxima_evaluacion", (int)item[3]);
                                if((Date)item[4] != null){
                                 fecha_prox = df_fecha.format((Date)item[4]);
                                 }
                                objeto.put("fecha_proxima_evaluacion",fecha_prox );
                                objeto.put("fecha", df_fecha_hora.format((Date)item[5]));
                                objeto.put("receta", "<button onclick=\"open();\" class=\"fa fa-print fa-2x\"></button>");
                                formularios.put(objeto);
                               
                            } catch (JSONException ex) {
                                Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
                            }
                        }
                        
                    } // fin foercha
                    
                    salida.put("data", formularios);
                    PrintWriter out = response.getWriter();
                    System.out.println("el objeto es :"+salida);
                    out.println(salida);
                    out.flush();
                } catch (JSONException ex) {
                    Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
                } catch (IOException ex) {
                    Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
                }
                 }else{
                 
                    }
 
    }
    private void generarReceta(HttpServletRequest request, HttpServletResponse response)
    {
            String id = request.getAttribute("id").toString();
            JSONArray recetas = new JSONArray();
            JSONObject salida = new JSONObject();
            DateFormat df_fecha = new SimpleDateFormat("dd/MM/yyyy");
            
                    Session session = cl.cesfam.DAL.NewHibernateUtil.getSessionFactory().openSession();
                    session.beginTransaction();
                   Query query = session.createQuery("select\n" +
                   "(select pa.PRIMER_NOMBRE_PACIENTE||' '||pa.APELLIDO_PATERNO_PACIENTE from Paciente pa where pa.ID_PACIENTE = fo.PACIENTE_ID_PACIENTE ),\n" +
                   "(select pa.RUT_PACIENTE from Paciente pa where pa.ID_PACIENTE = fo.PACIENTE_ID_PACIENTE ),\n" +
                   "(select medi.NOMBRE_MEDICAMENTO from MEDICAMENTO medi where medi.ID_MEDICAMENTO = (select pre.ID_MEDICAMENTO from PRESCRIPCION pre where pre.ID_FORMULARIO_MEDICAMENTO = fo.ID_FORMULARIO_MEDICAMENTO)),\n" +
                   "(select pre.PERIODO from PRESCRIPCION pre where pre.ID_FORMULARIO_MEDICAMENTO = fo.ID_FORMULARIO_MEDICAMENTO),\n" +
                   "(select pre.FRECUENCIA from PRESCRIPCION pre where pre.ID_FORMULARIO_MEDICAMENTO = fo.ID_FORMULARIO_MEDICAMENTO),\n" +
                   "(select pre.DURACION_TRATAMIENTO from PRESCRIPCION pre where pre.ID_FORMULARIO_MEDICAMENTO = fo.ID_FORMULARIO_MEDICAMENTO),\n" +
                   "(select med.PRIMER_NOMBRE_MEDICO||' '||med.APELLIDO_PATERNO_MEDICO from MEDICO med where med.ID_MEDICO = fo.MEDICO_ID_MEDICO)\n" +
                   " from FORMULARIO_MEDICAMENTO fo\n" +
                   " WhERE fo.ID_FORMULARIO_MEDICAMENTO="+id+" order by fo.FECHA_FORMULARIO_MEDICAMENTO;");
                    List<Object[]> lista = query.list();
                    session.close();
                    
                   if(lista != null){
                try {
                    for (Object[] item : lista) {
                        
                        for (int i = 0; i < 1; i++) {

                            try {
                                JSONObject objeto = new JSONObject();
                                objeto.put("paciente", (String)item[0]);
                                objeto.put("rut_paciente", (String)item[1]);
                                objeto.put("medicamento", (String)item[2]);
                                if (item[3] == null) {
                                objeto.put("periodo", "-");                                     
                                }
                                else
                                {
                                objeto.put("periodo", (int)item[3]);
                                }
                                
                                objeto.put("frecuencia", (int)item[4]);    
  
                                if (item[5] == null) 
                                {
                                objeto.put("duracion", "Permanente");    
                                }
                                else
                                {
                                objeto.put("duracion", (int)item[5]);
                                }
                                objeto.put("medico", (String)item[6]);
                                objeto.put("fecha", df_fecha);
                                recetas.put(objeto);
                                
                               
                            } catch (JSONException ex) {
                                Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
                            }
                        }                      
                    }               
                    salida.put("data", recetas);
                    PrintWriter out = response.getWriter();
                    System.out.println("el objeto es :"+salida);
                    out.println(salida);
                    out.flush();
                } catch (JSONException | IOException ex) {
                    Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
                }
                 }else{
                 
                    }
 
    }
    
             
                   
    private void AutenticarAndroid(HttpServletRequest request, HttpServletResponse response) {
        ParametersUtil.MostrarParametros(request);
        cl.cesfam.ENTITY.FuncionarioFarmacia funcionario = new FuncionarioFarmacia();
        JSONObject salida = new JSONObject();
            String rut = "";
	    String contraseña = "";
            
            //http://192.168.0.14:8083/CESFAM/RequestHelper?accion=autenticar_android&txtRut=9.856.288-5&txtPass=862065 
            if (request.getParameter("rut") != null) 
            {
                rut = request.getParameter("rut");
            }
            
            
            if (request.getParameter("pass") != null) 
            {
                contraseña = request.getParameter("pass");
            }
        
        System.out.println("Autenticando usuario ANDROID ["+rut+","+contraseña+"]...");
        
        try {
            if (cl.cesfam.DAO.FuncionarioFarmaciaDAO.getFuncionarioByRut(rut) != null)
            {
                 funcionario = cl.cesfam.DAO.FuncionarioFarmaciaDAO.getFuncionarioByRut(rut);
                
                if (funcionario.getPassword().equals(contraseña))
                {
                    System.out.println("Autenticando usuario ["+rut+":OK]");
                     JSONObject user = new JSONObject();
                    
                    
                     user.put("nombre", funcionario.getPrimerNombreFuncionario()+" "+funcionario.getApellidoPaternoFuncionario());
                     
                     salida.put("data",user);
                    PrintWriter out = response.getWriter();
                    System.out.println("el objeto es :"+salida);
                    out.println(salida);
                    out.flush();
                    
                }
                else
                {     
                    System.out.println("Autenticando usuario ["+rut+":PASSWORD NO OK]");
//                    salida.put("data",false);
//                    PrintWriter out = response.getWriter();
//                    System.out.println("el objeto es :"+salida);
//                    out.println(salida);
//                    out.flush();
                    
                }
                
                              
            }else{
            System.out.println("Autenticando usuario ["+rut+":USER NO OK]");
//                    salida.put("data",false);
//                    PrintWriter out = response.getWriter();
//                    System.out.println("el objeto es :"+salida);
//                    out.println(salida);
//                    out.flush();
            }
        } catch (Exception ex) {
            Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
        
        
        
        
        
        
        
        
    }

    private void obtenerMedicametosReservados(HttpServletRequest request, HttpServletResponse response) {
    
        
          JSONArray reservas = new JSONArray();
            JSONObject salida = new JSONObject();
            DateFormat df_fecha_hora = new SimpleDateFormat("dd/MM/yyyy HH:mm");
            
                    Session session = cl.cesfam.DAL.NewHibernateUtil.getSessionFactory().openSession();
                    session.beginTransaction();
                   Query query = session.createQuery("select (select pa.primerNombrePaciente||' '||pa.apellidoPaternoPaciente from Paciente pa where pa.idPaciente = re.paciente),\n" +
                        "(select me.nombreMedicamento from Medicamento me where me.idMedicamento = re.medicamento) ,\n" +
                        "re.cantidad ,\n" +
                        "re.fechaEventoReserva\n" +
                        "from Reserva re");
                    List<Object[]> lista = query.list();
                    session.close();
                    
                   if(lista != null){
                try {
                    for (Object[] item : lista) {
                        
                        for (int i = 0; i < 1; i++) {
                           
                            try {
                                JSONObject objeto = new JSONObject();
                               
                                objeto.put("paciente", (String)item[0]);
                                objeto.put("medicamento", (String)item[1]);
                                objeto.put("cantidad", (int)item[2]);
                                objeto.put("fecha", df_fecha_hora.format((Date)item[3]));
                               
                                reservas.put(objeto);
                               
                            } catch (JSONException ex) {
                                Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
                            }
                        }
                        
                    } // fin foercha
                    
                    salida.put("data", reservas);
                    PrintWriter out = response.getWriter();
                    System.out.println("el objeto es :"+salida);
                    out.println(salida);
                    out.flush();
                } catch (JSONException ex) {
                    Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
                } catch (IOException ex) {
                    Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
                }
                 }else{
                 
                    
                    
                    }
     
        
        
        
        
        
        
        
        
    }

    private void ActivarEmail(HttpServletRequest request, HttpServletResponse response) {
       
        int tiempo = 60*5;
            
            //http://localhost:8083/CESFAM/RequestHelper?accion=ActivarEmail&tiempo=10
            if (request.getParameter("tiempo") != null) 
            {
                tiempo = Integer.parseInt(request.getParameter("tiempo"));
            }
        try {
            if (scheduler != null) {
                 scheduler.shutdown(false);
            }
             
        } catch (SchedulerException ex) {
            Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
               scheduler = makeDairlyJob(tiempo);
        
    }

    private void DetenerEmail(HttpServletRequest request, HttpServletResponse response) {
        
          //http://localhost:8083/CESFAM/RequestHelper?accion=DetenerEmail
        try {
            scheduler.shutdown(false);
        } catch (SchedulerException ex) {
            Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
        
        
    }
    
                   
                   
}            
                   
                 