package cl.cesfam.MAIL.util;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;
import java.util.ResourceBundle;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import cl.cesfam.MAIL.util.Mensajes;
import java.util.Locale;
 
public class EnviarEmail {
 
	static ResourceBundle configuracionesMail = ResourceBundle.getBundle("cl.cesfam.MAIL.util.mail_es_CL_EURO");
	
	public static boolean enviar(final ArrayList<HashMap<String, Object>> destinatario, final String subject, final String mensaje, final ArrayList<HashMap<String, Object>> attachments, final String responsable) {
		new Thread(new Runnable() {
			
			@Override
			public void run() {
				String mensajeStr = mensaje;
				// TODO Auto-generated method stub
				Mensajes.info("Enviando mail...");

				System.out.println("adjuntos: "+ attachments);
				
				final String username = configuracionesMail.getString("mail.smtp.user");
				final String password = configuracionesMail.getString("mail.smtp.password");
				
				Properties props = new Properties();
				props.put("mail.smtp.auth", configuracionesMail.getString("mail.smtp.auth"));
				props.put("mail.smtp.starttls.enable", configuracionesMail.getString("mail.smtp.starttls.enable"));
				props.put("mail.smtp.host", configuracionesMail.getString("mail.smtp.server"));
				props.put("mail.smtp.port", configuracionesMail.getString("mail.smtp.port"));
		 
				Mensajes.info("Inicializando Session mail..");
				Session session = Session.getInstance(props,
				  new javax.mail.Authenticator() {
					protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
						return new javax.mail.PasswordAuthentication(username, password);
					}
				  });
		 
				try {
					Message message = new MimeMessage(session);
					message.setFrom(new InternetAddress(configuracionesMail.getString("mail.smtp.from")));
					
					
					Address[] destinatariosTMP = new Address[destinatario.size()];
					
					int contador = 0;
					for(int i=0; i< destinatario.size() ; i++){
						try{
							if(destinatario.get(i).get("email") != null && destinatario.get(i).get("email").toString().length() >0){
								Mensajes.debug("destinatario:["+i+"]["+destinatario.get(i).get("id_item")+"] "+ destinatario.get(i).get("email"));
								destinatariosTMP[contador] = new InternetAddress(destinatario.get(i).get("email")+"");
								contador++;
							}
						} catch(Exception e){
							e.printStackTrace();
							Mensajes.ex(e);
						}
					}
					
					
					String footer = configuracionesMail.getString("mail.smtp.firma.footer");
					
					Address[] destinatarios = new Address[contador];
					
					for (int i=0; i< contador ; i++) {
						destinatarios[i] = destinatariosTMP[i];
					}
					
					message.setRecipients(Message.RecipientType.TO,destinatarios);
					message.setSubject(new String(subject.getBytes("utf-8"), "utf-8"));
					message.setText(mensajeStr);
		 
					
					Multipart multipart = new MimeMultipart();
					MimeBodyPart messageBody = new MimeBodyPart();

					
					if(attachments != null && attachments.size()>0){
						for (HashMap<String, Object> attachment : attachments) {
							if(attachment.get("ruta_file") != null && (attachment.get("ruta_file")+"").length() > 0){
									MimeBodyPart messageBodyPart = new MimeBodyPart();
									messageBodyPart = new MimeBodyPart();
									DataSource source = new FileDataSource(attachment.get("ruta_file")+"");
									messageBodyPart.setDataHandler(new DataHandler(source));
									messageBodyPart.setFileName(source.getName());
									multipart.addBodyPart(messageBodyPart);
							}
						}
					}
					
					mensajeStr = mensajeStr + footer;
					
					messageBody.setContent(mensajeStr,"text/html");
			        multipart.addBodyPart(messageBody);
			        message.setContent(multipart);
					Mensajes.info("Enviando mensaje a "+ destinatario);
					System.out.println("esperando...");
					System.out.println("a enviar...");
								
					Transport.send(message);
					
					
				} catch (MessagingException e) {
					Mensajes.error(e.getMessage());
					throw new RuntimeException(e);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					Mensajes.ex(e);
				}

			}
		}).start();
		return false;
	}

	public static void main(String[] args) {
		//enviar("jorgec87@gmail.com;j.carrenca@alumnos.duoc.cl", "prueba", "prueba");
		ArrayList<HashMap<String, Object>> destinatarios = new ArrayList<HashMap<String,Object>>();
		HashMap<String, Object> mail = new HashMap<String, Object>();
		mail.put("email","jorgec87@gmail.com");
		destinatarios.add(mail);
		ArrayList<HashMap<String, Object>> attachments = new ArrayList<HashMap<String,Object>>();
		HashMap<String, Object> att = new HashMap<String, Object>();
		//att.put("ruta_file", "/home/");
		attachments.add(att);
		System.out.println("send..");
		enviar(destinatarios, "prueba ", "mensaje...", attachments,"");
		System.out.println("ok...");
	}
        
        
        
        
	
	
}
