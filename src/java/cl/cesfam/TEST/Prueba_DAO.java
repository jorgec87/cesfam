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
    public static void main(String[] args) throws Exception {

        
         cl.cesfam.ENTITY.Partida partida = new cl.cesfam.ENTITY.Partida();

                //nombre de partida
                     partida.setNombrePartida("BIEN");
              
                if (cl.cesfam.DAO.PartidaDAO.add(partida)) 
                {
                System.out.println("Se agrego");
                }
                else
                {
                System.out.println("No se agrego");      
                }

} 
        
    }
    

