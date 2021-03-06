package cl.cesfam.ENTITY;
// Generated 25-05-2017 9:08:39 by Hibernate Tools 4.3.1



/**
 * Prescripcion generated by hbm2java
 */
public class Prescripcion  implements java.io.Serializable {


     private int idPrescripcion;
     private EstadoPrescripcion estadoPrescripcion;
     private FormularioMedicamento formularioMediamento;
     private Medicamento medicamento;
     private TipoPrescripcion tipoPrescripcion;
     private Integer periodo;
     private Integer frecuencia;
     private Integer cantidad;
     private Integer duracionTratamiento;

     
    public Prescripcion() {
    }

	
    public Prescripcion(int idPrescripcion) {
        this.idPrescripcion = idPrescripcion;
    }
    public Prescripcion(int idPrescripcion, EstadoPrescripcion estadoPrescripcion, FormularioMedicamento formularioMediamento, Medicamento medicamento, TipoPrescripcion tipoPrescripcion, Integer periodo, Integer frecuencia, Integer duracionTratamiento) {
       this.idPrescripcion = idPrescripcion;
       this.estadoPrescripcion = estadoPrescripcion;
       this.formularioMediamento = formularioMediamento;
       this.medicamento = medicamento;
       this.tipoPrescripcion = tipoPrescripcion;
       this.periodo = periodo;
       this.frecuencia = frecuencia;
       this.duracionTratamiento = duracionTratamiento;
    }
   
    public int getIdPrescripcion() {
        return this.idPrescripcion;
    }
    
    public void setIdPrescripcion(int idPrescripcion) {
        this.idPrescripcion = idPrescripcion;
    }
    public EstadoPrescripcion getEstadoPrescripcion() {
        return this.estadoPrescripcion;
    }
    
    public void setEstadoPrescripcion(EstadoPrescripcion estadoPrescripcion) {
        this.estadoPrescripcion = estadoPrescripcion;
    }
    public FormularioMedicamento getFormularioMediamento() {
        return this.formularioMediamento;
    }
    
    public void setFormularioMediamento(FormularioMedicamento formularioMediamento) {
        this.formularioMediamento = formularioMediamento;
    }
    public Medicamento getMedicamento() {
        return this.medicamento;
    }
    
    public void setMedicamento(Medicamento medicamento) {
        this.medicamento = medicamento;
    }
    public TipoPrescripcion getTipoPrescripcion() {
        return this.tipoPrescripcion;
    }
    
    public void setTipoPrescripcion(TipoPrescripcion tipoPrescripcion) {
        this.tipoPrescripcion = tipoPrescripcion;
    }
    public Integer getPeriodo() {
        return this.periodo;
    }
    
    public void setPeriodo(Integer periodo) {
        this.periodo = periodo;
    }
    public Integer getFrecuencia() {
        return this.frecuencia;
    }
    
    public void setFrecuencia(Integer frecuencia) {
        this.frecuencia = frecuencia;
    }
    public Integer getDuracionTratamiento() {
        return this.duracionTratamiento;
    }
    
    public void setDuracionTratamiento(Integer duracionTratamiento) {
        this.duracionTratamiento = duracionTratamiento;
    }
    
    public Integer getCantidad() {
        return cantidad;
    }
    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }




}


