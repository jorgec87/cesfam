/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package cl.cesfam.automa;

import cl.cesfam.ENTITY.Composicion;
import static cl.cesfam.MAIL.util.EnviarEmail.enviar;
import cl.cesfam.UTIL.UtilEmail;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.quartz.CronScheduleBuilder;
import org.quartz.Job;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SimpleScheduleBuilder;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;


/**
 * 
 * @author **Jorge Carrenca**
 */
public class AutomatizadoEmail implements Job{

      public AutomatizadoEmail() {
    }
    
    
    
    
    public static void enviarEmail(){
        System.out.println("EJECUTANDO SCHEDULE");
   
        Session session = cl.cesfam.DAL.NewHibernateUtil.getSessionFactory().openSession();
               session.beginTransaction();
               Query query = session.createQuery("select (select pa.primerNombrePaciente||' '||pa.apellidoPaternoPaciente from Paciente pa where pa.idPaciente = re.paciente), \n"
                       + "(select pa.emailPaciente from Paciente  pa where pa.idPaciente = re.paciente) \n" +
                                                   "from Reserva re WHERE estadoReserva = 2");
                  List<Object[]> lista = query.list();
               session.close();
             
               for (Object[] item : lista) {
                   
                   System.out.println((String)item[0]+" "+(String)item[1]);
                   
                    System.out.println("ENVIANDO CORREO A : "+item);
                   ArrayList<HashMap<String, Object>> destinatarios = new ArrayList<HashMap<String,Object>>();
                HashMap<String, Object> mail = new HashMap<String, Object>();
                mail.put("email",(String)item[1]);
                destinatarios.add(mail);
		ArrayList<HashMap<String, Object>> attachments = new ArrayList<HashMap<String,Object>>();
		HashMap<String, Object> att = new HashMap<String, Object>();
		//att.put("ruta_file", "/home/");
		attachments.add(att);
		System.out.println("enviando..");
		enviar(destinatarios,"Cesfam Informa", UtilEmail.crearEmail((String)item[0]) , attachments,"");
		System.out.println("ok...");
                   
                   
        }
        
     
    }
    
   
    
    
    
    public static Scheduler makeDairlyJob(int segundos) {
        Scheduler scheduler3 = null;
        JobDetail job3 = JobBuilder.newJob(AutomatizadoEmail.class).withIdentity("email","unico1").build();
        //Trigger trigger3 = TriggerBuilder.newTrigger().withIdentity("triggerEmail", "unico").build();
        Trigger trigger3 = TriggerBuilder.newTrigger().withIdentity("triggerEmail", "unico")
                .startNow().withSchedule(SimpleScheduleBuilder.simpleSchedule().withIntervalInSeconds(segundos).repeatForever()).build();
        
        try {
            scheduler3 =  new StdSchedulerFactory().getScheduler();
            scheduler3.scheduleJob(job3, trigger3);
            scheduler3.start();
            
        } catch (SchedulerException e) {
            e.printStackTrace();
        }
        return scheduler3;
    }

  
    
    public static void main(String[] args) {
        
        //enviarEmail();
        //makeDairlyJob(3000);
//          try {
//              makeDairlyJob(30).shutdown(true);
//            
//          } catch (SchedulerException ex) {
//              Logger.getLogger(AutomatizadoEmail.class.getName()).log(Level.SEVERE, null, ex);
//          }
        
    }

    @Override
    public void execute(JobExecutionContext jec) throws JobExecutionException {
     
        System.out.println("PROCESO EMAIL AUTOMATICO EJECUTANDOSE");
         //MiScheduler.execute();
         enviarEmail();
         
    }
    
    
    
    
    
}
