package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import modelo.Centro;
import modelo.Departamento;
import utilidades.ConexionBD;

public class CentroDAOJDBC implements CentroDAO {

	private ConexionBD conexion;

	
	
	public CentroDAOJDBC() {
		conexion = new ConexionBD();
	}

	@Override
	public List<Centro> getCentros() {
		List<Centro> listaCentros = new ArrayList<Centro>();
		Connection con = conexion.getConexion();
		Statement consulta = null;
		ResultSet rs=null;
		try {
			consulta = con.createStatement();
			rs = consulta.executeQuery("select * from centros");
			while (rs.next()) {
				int codCentro = rs.getInt("cod_centro");
				String nombre = rs.getString("nombre");
				String direccion = rs.getString("direccion");
				
				Centro centro = new Centro( codCentro, nombre, direccion);
				
				

				listaCentros.add(centro);
			}
			System.out.println("Seleccionando los Centros: ");
			System.out.println(listaCentros);
		} catch (SQLException e) {
			System.out.println("Error al realizar la consulta sobre centros: "+e.getMessage());
		} finally {
			try {
				rs.close();
				consulta.close();
				conexion.desconectar();
			} catch (SQLException e) {
				System.out.println("Error al liberar recursos: "+e.getMessage());
			} catch (Exception e) {
				
			}
		}

		
		return listaCentros;
	}

	@Override
	public int eliminarCentro(int codCentro) {
		Connection c = conexion.getConexion();
		PreparedStatement consulta = null;
		int num=0;
		
		try {
			consulta = c.prepareStatement("delete from centros where cod_centro=?");
			
			consulta.setInt(1, codCentro);
			
			num= consulta.executeUpdate();
			System.out.println("Centro eliminado correctamente");
		} catch (SQLException e) {
			System.out.println("Error eliminando centro"+codCentro);
			e.printStackTrace();
		} finally {
			
			try {
			
				consulta.close();
				conexion.desconectar();
				
			} catch (SQLException e) {
				// TODO Bloque catch generado automáticamente
				e.printStackTrace();
			}
			
		}		
		return num;
	}

	@Override
	public Centro getCentro(int codCentro) {
		// TODO Esbozo de método generado automáticamente
		return null;
	}

	@Override
	public int insertarCentro(Centro centro) {
		// TODO Esbozo de método generado automáticamente
		return 0;
	}

	@Override
	public int actualizarCentro(Centro centro) {
		// TODO Esbozo de método generado automáticamente
		return 0;
	}

}
