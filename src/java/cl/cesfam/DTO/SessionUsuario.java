/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package cl.cesfam.DTO;

/**
 * 
 * @author **Jorge Carrenca**
 */
public class SessionUsuario {

        public int idUsuario = 0;
	public String rutUsuario = null;
	public String nombreUsuario = null;
	public Long idSession = 0L;
        
        public SessionUsuario(){
		
	}
	
	public SessionUsuario(int _idUsuario,String _codigoUsuario, String _nombreUsuario, Long _idSession){
		idUsuario = _idUsuario;
		rutUsuario = _codigoUsuario;
		nombreUsuario = _nombreUsuario;
		idSession = _idSession;
	}
	
	public int getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
	public String getNombreUsuario() {
		return nombreUsuario;
	}
	public void setNombreUsuario(String nombreUsuario) {
		this.nombreUsuario = nombreUsuario;
	}
	public Long getIdSession() {
		return idSession;
	}
	public void setIdSession(Long idSession) {
		this.idSession = idSession;
	}

	public String getRutUsuario() {
		return rutUsuario;
	}

	public void setRutUsuario(String codigoUsuario) {
		this.rutUsuario = codigoUsuario;
	}
	
	
	
}
