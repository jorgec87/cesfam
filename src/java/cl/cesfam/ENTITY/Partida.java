package cl.cesfam.ENTITY;
// Generated 22-05-2017 20:45:04 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Partida generated by hbm2java
 */
public class Partida  implements java.io.Serializable {


     private int idPartida;
     private String nombrePartida;
     private Set detallePartidas = new HashSet(0);
     private Set caducars = new HashSet(0);
     private Set detalleEntregas = new HashSet(0);

    public Partida() {
    }

	
    public Partida(int idPartida, String nombrePartida) {
        this.idPartida = idPartida;
        this.nombrePartida = nombrePartida;
    }
    public Partida(int idPartida, String nombrePartida, Set detallePartidas, Set caducars, Set detalleEntregas) {
       this.idPartida = idPartida;
       this.nombrePartida = nombrePartida;
       this.detallePartidas = detallePartidas;
       this.caducars = caducars;
       this.detalleEntregas = detalleEntregas;
    }
   
    public int getIdPartida() {
        return this.idPartida;
    }
    
    public void setIdPartida(int idPartida) {
        this.idPartida = idPartida;
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
    public Set getCaducars() {
        return this.caducars;
    }
    
    public void setCaducars(Set caducars) {
        this.caducars = caducars;
    }
    public Set getDetalleEntregas() {
        return this.detalleEntregas;
    }
    
    public void setDetalleEntregas(Set detalleEntregas) {
        this.detalleEntregas = detalleEntregas;
    }




}


