/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package cl.cesfam.UTIL;

import java.util.Enumeration;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;

/**
 * 
 * @author **Jorge Carrenca**
 */
public  class ParametersUtil {

    public static void MostrarParametros(Object parameters){
		System.out.println("\n\n************************** PARAMETROS *********************");
		if(parameters instanceof HttpServletRequest){
			
			HttpServletRequest parsReq = (HttpServletRequest) parameters;
			
			Enumeration attrs =  parsReq.getParameterNames();
			while(attrs.hasMoreElements()) {
				String attr = (String) attrs.nextElement();
				System.out.println("atributo: "+ attr +" => "+((HttpServletRequest) parameters).getParameter(attr));
				
			}
		}else {
		
		} 
            System.out.println("************************** PARAMETROS *********************\n\n");
	}
	
	
    
}
