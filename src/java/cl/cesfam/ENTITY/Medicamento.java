package cl.cesfam.ENTITY;
// Generated 16-04-2017 17:23:15 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Medicamento generated by hbm2java
 */
public class Medicamento  implements java.io.Serializable {


     private int idMedicamento;
     private Stock stock;
     private String nombreMedicamento;
     private int presentacion;
     private int contenidoEnvase;
     private String fabricante;
     private Set composicions = new HashSet(0);
     private Set detallePartidas = new HashSet(0);
     private Set eventoStocks = new HashSet(0);

    public Medicamento() {
    }

	
    public Medicamento( String nombreMedicamento, int presentacion, int contenidoEnvase, String fabricante) {
        
        this.nombreMedicamento = nombreMedicamento;
        this.presentacion = presentacion;
        this.contenidoEnvase = contenidoEnvase;
        this.fabricante = fabricante;
    }
    public Medicamento(Stock stock, String nombreMedicamento, int presentacion, int contenidoEnvase, String fabricante, Set composicions, Set detallePartidas, Set eventoStocks) {
      
       this.stock = stock;
       this.nombreMedicamento = nombreMedicamento;
       this.presentacion = presentacion;
       this.contenidoEnvase = contenidoEnvase;
       this.fabricante = fabricante;
       this.composicions = composicions;
       this.detallePartidas = detallePartidas;
       this.eventoStocks = eventoStocks;
    }
   
    public int getIdMedicamento() {
        return this.idMedicamento;
    }
    
    public void setIdMedicamento(int idMedicamento) {
        this.idMedicamento = idMedicamento;
    }
    public Stock getStock() {
        return this.stock;
    }
    
    public void setStock(Stock stock) {
        this.stock = stock;
    }
    public String getNombreMedicamento() {
        return this.nombreMedicamento;
    }
    
    public void setNombreMedicamento(String nombreMedicamento) {
        this.nombreMedicamento = nombreMedicamento;
    }
    public int getPresentacion() {
        return this.presentacion;
    }
    
    public void setPresentacion(int presentacion) {
        this.presentacion = presentacion;
    }
    public int getContenidoEnvase() {
        return this.contenidoEnvase;
    }
    
    public void setContenidoEnvase(int contenidoEnvase) {
        this.contenidoEnvase = contenidoEnvase;
    }
    public String getFabricante() {
        return this.fabricante;
    }
    
    public void setFabricante(String fabricante) {
        this.fabricante = fabricante;
    }
    public Set getComposicions() {
        return this.composicions;
    }
    
    public void setComposicions(Set composicions) {
        this.composicions = composicions;
    }
    public Set getDetallePartidas() {
        return this.detallePartidas;
    }
    
    public void setDetallePartidas(Set detallePartidas) {
        this.detallePartidas = detallePartidas;
    }
    public Set getEventoStocks() {
        return this.eventoStocks;
    }
    
    public void setEventoStocks(Set eventoStocks) {
        this.eventoStocks = eventoStocks;
    }




}


