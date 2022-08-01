package dao;

import java.util.List;

import modelo.Centro;

public interface CentroDAO {
	
	List<Centro>getCentros();
	int eliminarCentro(int codCentro);
	Centro getCentro(int codCentro);
	int insertarCentro(Centro centro);
	int actualizarCentro(Centro centro);

}
