package cl.cesfam.MAIL.util;

public class Mensajes { 
	
	
	static{
		
	}
	
 	public static void error(String message){
 		//logger.error(message);
 		System.out.println("Error "+ message);
 	}
 	public static void debug(String message){
 		//logger.debug(message);
 		System.out.println("Debug "+ message);
 	}
 	public static void info(String message){
 		//logger.info(message);
 		System.out.println("Info "+ message);
 	}
 	
 	public static void ex(Throwable ex){
 		//logger.error("Exception", ex);
 		ex.printStackTrace();
 	}
 	
 	public static void main(String[] args) {
 		info("Hola Mundo");
	}
 }