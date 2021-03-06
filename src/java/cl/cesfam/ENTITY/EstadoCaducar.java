package cl.cesfam.ENTITY;
// Generated 22-05-2017 20:45:04 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * EstadoCaducar generated by hbm2java
 */
public class EstadoCaducar  implements java.io.Serializable {


     private int idEstadoCaducar;
     private String nombreEstado;
     private Set caducars = new HashSet(0);

    public EstadoCaducar() {
    }

	
    public EstadoCaducar(int idEstadoCaducar, String nombreEstado) {
        this.idEstadoCaducar = idEstadoCaducar;
        this.nombreEstado = nombreEstado;
    }
    public EstadoCaducar(int idEstadoCaducar, String nombreEstado, Set caducars) {
       this.idEstadoCaducar = idEstadoCaducar;
       this.nombreEstado = nombreEstado;
       this.caducars = caducars;
    }
   
    public int getIdEstadoCaducar() {
        return this.idEstadoCaducar;
    }
    
    public void setIdEstadoCaducar(int idEstadoCaducar) {
        this.idEstadoCaducar = idEstadoCaducar;
    }
    public String getNombreEstado() {
        return this.nombreEstado;
    }
    
    public void setNombreEstado(String nombreEstado) {
        this.nombreEstado = nombreEstado;
    }
    public Set getCaducars() {
        return this.caducars;
    }
    
    public void setCaducars(Set caducars) {
        this.caducars = caducars;
    }




}


