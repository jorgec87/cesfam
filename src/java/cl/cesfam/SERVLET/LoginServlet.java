/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.cesfam.SERVLET;

import cl.cesfam.DTO.SessionUsuario;
import cl.cesfam.ENTITY.FuncionarioFarmacia;
import cl.cesfam.ENTITY.Medico;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author **Jorge Carrenca**
 */
public class LoginServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            HttpServletResponse res = (HttpServletResponse) response;
            cl.cesfam.ENTITY.FuncionarioFarmacia funcionario = new FuncionarioFarmacia();
            cl.cesfam.ENTITY.Medico medico = new Medico();
            String rut = "";
	    String contraseña = "";
            
             
            if (request.getParameter("txtRut") != null) 
            {
                rut = request.getParameter("txtRut");
            }
            
            
            if (request.getParameter("txtPass") != null) 
            {
                contraseña = request.getParameter("txtPass");
            }
             
             
	  
            System.out.println("Autenticando usuario ["+rut+","+contraseña+"]...");
            
            
              if (cl.cesfam.DAO.FuncionarioFarmaciaDAO.getFuncionarioByRut(rut) != null)
            {               
                funcionario = cl.cesfam.DAO.FuncionarioFarmaciaDAO.getFuncionarioByRut(rut);
                
                if (funcionario.getPassword().equals(contraseña))
                {
                    System.out.println("Autenticando usuario ["+rut+":OK]");
                    SessionUsuario userSession = new SessionUsuario();
                    userSession.setIdUsuario(funcionario.getIdFuncionario());
                    userSession.setRutUsuario(funcionario.getRutFuncionario());
                    userSession.setNombreUsuario(funcionario.getPrimerNombreFuncionario()+" "+funcionario.getApellidoPaternoFuncionario());
                    userSession.setTipoUsuario("F");
                    request.getSession().setAttribute("usuario", userSession); 
                    System.out.println("armo la sessión");
                    request.getRequestDispatcher("dashboard_F.jsp").forward(request, response);
                }
                else
                {     
                    System.out.println("Autenticando usuario ["+rut+":PASSWORD NO OK]");
                    res.sendRedirect("login.jsp?error=1");
                }
             }
              else if (cl.cesfam.DAO.MedicoDAO.getMedicoByRut(rut) != null) 
              {
                  medico = cl.cesfam.DAO.MedicoDAO.getMedicoByRut(rut);
                
                if (medico.getPassword().equals(contraseña))
                {
                    System.out.println("Autenticando usuario ["+rut+":OK]");
                    SessionUsuario userSession = new SessionUsuario();
                    userSession.setIdUsuario(medico.getIdMedico());
                    userSession.setRutUsuario(medico.getRutMedico());
                    userSession.setNombreUsuario(medico.getPrimerNombreMedico()+" "+medico.getApellidoPaternoMedico());
                    userSession.setTipoUsuario("M");
                    request.getSession().setAttribute("usuario", userSession);
                    System.out.println("armo la sessión");
                    request.getRequestDispatcher("dashboard_M.jsp").forward(request, response);
                }
                else
                {     
                    System.out.println("Autenticando usuario ["+rut+":PASSWORD NO OK]");
                    res.sendRedirect("login.jsp?error=1");
                }
                }
              else
              {
                     System.out.println("Autenticando usuario ["+rut+":NOMBRE DE USUARIO NO OK]");
                     res.sendRedirect("login.jsp?error=1");
               }
            }
            catch (Exception e) 
            {
                e.getMessage();
                request.getRequestDispatcher("login.jsp").forward(request, response);
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

}
