package cl.cesfam.ENTITY;
// Generated 16-04-2017 15:22:40 by Hibernate Tools 4.3.1


import java.math.BigDecimal;

/**
 * Medico generated by hbm2java
 */
public class Medico  implements java.io.Serializable {


     private BigDecimal idMedico;
     private String rutMedico;
     private String password;
     private String primerNombreMedico;
     private String segundoNombreMedico;
     private String apellidoPaternoMedico;
     private String apellidoMaternoMedico;

    public Medico() {
    }

	
    public Medico(BigDecimal idMedico, String rutMedico, String password, String primerNombreMedico, String apellidoPaternoMedico, String apellidoMaternoMedico) {
        this.idMedico = idMedico;
        this.rutMedico = rutMedico;
        this.password = password;
        this.primerNombreMedico = primerNombreMedico;
        this.apellidoPaternoMedico = apellidoPaternoMedico;
        this.apellidoMaternoMedico = apellidoMaternoMedico;
    }
    public Medico(BigDecimal idMedico, String rutMedico, String password, String primerNombreMedico, String segundoNombreMedico, String apellidoPaternoMedico, String apellidoMaternoMedico) {
       this.idMedico = idMedico;
       this.rutMedico = rutMedico;
       this.password = password;
       this.primerNombreMedico = primerNombreMedico;
       this.segundoNombreMedico = segundoNombreMedico;
       this.apellidoPaternoMedico = apellidoPaternoMedico;
       this.apellidoMaternoMedico = apellidoMaternoMedico;
    }
   
    public BigDecimal getIdMedico() {
        return this.idMedico;
    }
    
    public void setIdMedico(BigDecimal idMedico) {
        this.idMedico = idMedico;
    }
    public String getRutMedico() {
        return this.rutMedico;
    }
    
    public void setRutMedico(String rutMedico) {
        this.rutMedico = rutMedico;
    }
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    public String getPrimerNombreMedico() {
        return this.primerNombreMedico;
    }
    
    public void setPrimerNombreMedico(String primerNombreMedico) {
        this.primerNombreMedico = primerNombreMedico;
    }
    public String getSegundoNombreMedico() {
        return this.segundoNombreMedico;
    }
    
    public void setSegundoNombreMedico(String segundoNombreMedico) {
        this.segundoNombreMedico = segundoNombreMedico;
    }
    public String getApellidoPaternoMedico() {
        return this.apellidoPaternoMedico;
    }
    
    public void setApellidoPaternoMedico(String apellidoPaternoMedico) {
        this.apellidoPaternoMedico = apellidoPaternoMedico;
    }
    public String getApellidoMaternoMedico() {
        return this.apellidoMaternoMedico;
    }
    
    public void setApellidoMaternoMedico(String apellidoMaternoMedico) {
        this.apellidoMaternoMedico = apellidoMaternoMedico;
    }




}


