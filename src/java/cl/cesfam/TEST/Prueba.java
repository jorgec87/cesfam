/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.cesfam.TEST;

import cl.cesfam.ENTITY.Componente;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.InputStreamReader;
import java.util.logging.Level;
import java.util.logging.Logger;

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
       
        
        cl.cesfam.ENTITY.Componente c1 = new Componente();
	
	try {
             
	    FileInputStream fis = new FileInputStream("C:\\Users\\Francisco\\Desktop\\Analista Programador\\Portafolio De Titulo\\componentes.txt");
            InputStreamReader is = new InputStreamReader(fis, "ISO-8859-1");
              BufferedReader bf = new BufferedReader(is);
		         
		String temp = "";
		String bfRead;
		while((bfRead = bf.readLine()) != null){
			 c1.setNombreComponente(bfRead);
                        cl.cesfam.DAO.ComponenteDAO.add(c1);
                        System.out.println("componente :"+bfRead+" guardado con exito");
                        
		}
		
		
		
	} catch (Exception e) {
		// TODO: handle exception
		System.err.println("No se encontro archivo");
	}
	
	
	
	}//fin main
		
	}
	
	


        
    
    

