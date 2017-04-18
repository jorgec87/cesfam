/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.cesfam.TEST;

import cl.cesfam.ENTITY.Componente;
import java.io.BufferedReader;
import java.io.FileReader;
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
       String link = "C:\\Users\\Eduardo\\Desktop\\PORTAFOLIO\\componentes.txt";
		
	String texto = "";
        
        cl.cesfam.ENTITY.Componente c1 = new Componente();
	
	try {
		BufferedReader bf = new BufferedReader(new FileReader(link));
		String temp = "";
		String bfRead;
		while((bfRead = bf.readLine()) != null){
			temp = temp + bfRead+"\n";
                        c1.setNombreComponente(bfRead);
                        cl.cesfam.DAO.ComponenteDAO.add(c1);
                        System.out.println("componente :"+bfRead+" guardado con exito");
                        
		}
		
		texto = temp;
		
	} catch (Exception e) {
		// TODO: handle exception
		System.err.println("No se encontro archivo");
	}
	
	
	
	}//fin main
		
	}
	
	


        
    
    

