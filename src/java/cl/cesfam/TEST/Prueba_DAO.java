/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.cesfam.TEST;

import cl.cesfam.SERVLET.RequestHelper;
import java.io.IOException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author **Jorge Carrenca**
 */
public class Prueba_DAO {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        
         cl.cesfam.ENTITY.Caducar caducar = new cl.cesfam.ENTITY.Caducar();
         cl.cesfam.ENTITY.Partida partida = new cl.cesfam.ENTITY.Partida();
          cl.cesfam.ENTITY.Medicamento medicamento = new cl.cesfam.ENTITY.Medicamento();
           cl.cesfam.ENTITY.FuncionarioFarmacia funcionario = new cl.cesfam.ENTITY.FuncionarioFarmacia();

                //Catidad de caducacion
                
                     caducar.setCantidad(2);
              
                //Fecha caducacion
                java.util.Date fecha = new Date();
                caducar.setFechaCaducar(fecha);
                 //Motivo caducacion
               
                     caducar.setCantidad(1);
                
                //Estado 1 Caducado, 2 desechado
                caducar.setEstadoCaducar(1);
                 //Partida caducacion
               
                    try {
                        partida = cl.cesfam.DAO.PartidaDAO.getPartidaById(1);
                        caducar.setPartida(partida);
                        
                    } catch (Exception ex) {
                        Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
                    }
                
                
                 //Medicamento caducacion
               
                    try {
                        medicamento = cl.cesfam.DAO.MedicamentoDAO.getMedicamentoById(1);
                        caducar.setMedicamento(medicamento);
                        
                    } catch (Exception ex) {
                        Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
                    }
                
                
                 //funcionario caducacion
               
                    try {
                        funcionario = cl.cesfam.DAO.FuncionarioFarmaciaDAO.getFuncionarioById(2);
                        caducar.setFuncionarioFarmacia(funcionario);
                        
                    } catch (Exception ex) {
                        Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
                    }
                
           
                
                     
            try {
                if (cl.cesfam.DAO.CaducarDAO.add(caducar)) 
                {
                       System.out.println("caducado correctamente");
             
                
            } else
                {
                     System.out.println("caducado con error");  
                }
                
             } catch (IOException ex) {
                 Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
             } catch (Exception ex) {
                     Logger.getLogger(RequestHelper.class.getName()).log(Level.SEVERE, null, ex);
            }
        
        
        
    }
    
}
