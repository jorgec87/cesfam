package cl.cesfam.ENTITY;
// Generated 16-04-2017 17:23:15 by Hibernate Tools 4.3.1



/**
 * Composicion generated by hbm2java
 */
public class Composicion  implements java.io.Serializable {


     private int idComposicion;
     private Componente componente;
     private Medicamento medicamento;
     private Integer cantidad;

    public Composicion() {
    }

	

    public Composicion(Componente componente, Medicamento medicamento, Integer cantidad) {
      this.componente = componente;
       this.medicamento = medicamento;
       this.cantidad = cantidad;
    }
   
    public int getIdComposicion() {
        return this.idComposicion;
    }
    
    public void setIdComposicion(int idComposicion) {
        this.idComposicion = idComposicion;
    }
    public Componente getComponente() {
        return this.componente;
    }
    
    public void setComponente(Componente componente) {
        this.componente = componente;
    }
    public Medicamento getMedicamento() {
        return this.medicamento;
    }
    
    public void setMedicamento(Medicamento medicamento) {
        this.medicamento = medicamento;
    }
    public Integer getCantidad() {
        return this.cantidad;
    }
    
    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }




}


