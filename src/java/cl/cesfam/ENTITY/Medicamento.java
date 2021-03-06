package cl.cesfam.ENTITY;
// Generated 22-05-2017 20:45:04 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Medicamento generated by hbm2java
 */
public class Medicamento  implements java.io.Serializable {


     private int idMedicamento;
     private String nombreMedicamento;
     private int presentacion;
     private int contenidoEnvase;
     private String fabricante;
     private int stock;
     private Integer stockCritico;
     private Set caducars = new HashSet(0);
     private Set composicions = new HashSet(0);
     private Set detallePartidas = new HashSet(0);
     private Set eventoStocks = new HashSet(0);
     private Set prescripcions = new HashSet(0);

    public Medicamento() {
    }

	
    public Medicamento(int idMedicamento, String nombreMedicamento, int presentacion, int contenidoEnvase, String fabricante, int stock, int stockCritico) {
        this.idMedicamento = idMedicamento;
        this.nombreMedicamento = nombreMedicamento;
        this.presentacion = presentacion;
        this.contenidoEnvase = contenidoEnvase;
        this.fabricante = fabricante;
        this.stock = stock;
    }
    public Medicamento(int idMedicamento, String nombreMedicamento, int presentacion, int contenidoEnvase, String fabricante, int stock, int stockCritico, Set caducars, Set composicions, Set detallePartidas, Set eventoStocks, Set prescripcions) {
       this.idMedicamento = idMedicamento;
       this.nombreMedicamento = nombreMedicamento;
       this.presentacion = presentacion;
       this.contenidoEnvase = contenidoEnvase;
       this.fabricante = fabricante;
       this.stock = stock;
       this.stockCritico = stockCritico;
       this.caducars = caducars;
       this.composicions = composicions;
       this.detallePartidas = detallePartidas;
       this.eventoStocks = eventoStocks;
       this.prescripcions = prescripcions;
    }
   
    public int getIdMedicamento() {
        return this.idMedicamento;
    }
    
    public void setIdMedicamento(int idMedicamento) {
        this.idMedicamento = idMedicamento;
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
    public int getStock() {
        return this.stock;
    }
    
    public void setStock(int stock) {
        this.stock = stock;
    }
    public Integer getStockCritico() {
        return this.stockCritico;
    }
    
    public void setStockCritico(Integer stockCritico) {
        this.stockCritico = stockCritico;
    }
    public Set getCaducars() {
        return this.caducars;
    }
    
    public void setCaducars(Set caducars) {
        this.caducars = caducars;
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
    public Set getPrescripcions() {
        return this.prescripcions;
    }
    
    public void setPrescripcions(Set prescripcions) {
        this.prescripcions = prescripcions;
    }




}


