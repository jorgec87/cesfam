package cl.cesfam.ENTITY;
// Generated 22-05-2017 20:45:04 by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Reserva generated by hbm2java
 */
public class Reserva{


     private int idReserva;
     private EstadoReserva estadoReserva;
     private Medicamento medicamento;
     private Paciente paciente;
     private Date fechaEventoReserva;
     private int cantidad;
     private String observacion;

    public Reserva() {
    }

	
    public Reserva(int idEventoStock, Date fechaEventoStock, int cantidad) {
        this.idReserva = idEventoStock;
        this.fechaEventoReserva = fechaEventoStock;
        this.cantidad = cantidad;
    }
    public Reserva(int idEventoStock, EstadoReserva estadoEventoStock, Medicamento medicamento, Paciente paciente, Date fechaEventoStock, int cantidad, String observacion) {
       this.idReserva = idEventoStock;
       this.estadoReserva = estadoEventoStock;
       this.medicamento = medicamento;
       this.paciente = paciente;
       this.fechaEventoReserva = fechaEventoStock;
       this.cantidad = cantidad;
       this.observacion = observacion;
    }
   
    public int getIdReserva() {
        return this.idReserva;
    }
    
    public void setIdReserva(int idReserva) {
        this.idReserva = idReserva;
    }
    public EstadoReserva getEstadoReserva() {
        return this.estadoReserva;
    }
    
    public void setEstadoReserva(EstadoReserva estadoReserva) {
        this.estadoReserva = estadoReserva;
    }
    public Medicamento getMedicamento() {
        return this.medicamento;
    }
    
    public void setMedicamento(Medicamento medicamento) {
        this.medicamento = medicamento;
    }
    public Paciente getPaciente() {
        return this.paciente;
    }
    
    public void setPaciente(Paciente paciente) {
        this.paciente = paciente;
    }
    public Date getFechaEventoReserva() {
        return this.fechaEventoReserva;
    }
    
    public void setFechaEventoReserva(Date fechaEventoReserva) {
        this.fechaEventoReserva = fechaEventoReserva;
    }
    public int getCantidad() {
        return this.cantidad;
    }
    
    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    public String getObservacion() {
        return this.observacion;
    }
    
    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }




}


