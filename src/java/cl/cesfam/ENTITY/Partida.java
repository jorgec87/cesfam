package cl.cesfam.ENTITY;
// Generated 16-04-2017 15:22:40 by Hibernate Tools 4.3.1


import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Partida generated by hbm2java
 */
public class Partida  implements java.io.Serializable {


     private BigDecimal idPartida;
     private Date fechaVencimineto;
     private String nombrePartida;
     private Set detallePartidas = new HashSet(0);
     private Set detalleEntregas = new HashSet(0);

    public Partida() {
    }

	
    public Partida(BigDecimal idPartida, Date fechaVencimineto, String nombrePartida) {
        this.idPartida = idPartida;
        this.fechaVencimineto = fechaVencimineto;
        this.nombrePartida = nombrePartida;
    }
    public Partida(BigDecimal idPartida, Date fechaVencimineto, String nombrePartida, Set detallePartidas, Set detalleEntregas) {
       this.idPartida = idPartida;
       this.fechaVencimineto = fechaVencimineto;
       this.nombrePartida = nombrePartida;
       this.detallePartidas = detallePartidas;
       this.detalleEntregas = detalleEntregas;
    }
   
    public BigDecimal getIdPartida() {
        return this.idPartida;
    }
    
    public void setIdPartida(BigDecimal idPartida) {
        this.idPartida = idPartida;
    }
    public Date getFechaVencimineto() {
        return this.fechaVencimineto;
    }
    
    public void setFechaVencimineto(Date fechaVencimineto) {
        this.fechaVencimineto = fechaVencimineto;
    }
    public String getNombrePartida() {
        return this.nombrePartida;
    }
    
    public void setNombrePartida(String nombrePartida) {
        this.nombrePartida = nombrePartida;
    }
    public Set getDetallePartidas() {
        return this.detallePartidas;
    }
    
    public void setDetallePartidas(Set detallePartidas) {
        this.detallePartidas = detallePartidas;
    }
    public Set getDetalleEntregas() {
        return this.detalleEntregas;
    }
    
    public void setDetalleEntregas(Set detalleEntregas) {
        this.detalleEntregas = detalleEntregas;
    }




}


