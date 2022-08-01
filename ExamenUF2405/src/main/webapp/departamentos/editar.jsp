
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="modelo.Departamento" %>
<%@page import="java.util.List"%>
<%@page import="modelo.Centro"%>

<jsp:include page="/plantillas/cabecera.jsp"></jsp:include>

<%
	List<Centro> listaCentros = (List<Centro>)
	              request.getAttribute("listaCentros");

	Departamento dept = (Departamento) request.getAttribute("dept");

%>

<!--  incio del cuerpo de la página -->
<h1>Nuevo Departamento</h1>
<form action="departamentos" method="post">
	<input type="hidden" name="opcion" value="editar" />
	<div>
		<label for="codDepartamento">Código Departamento: </label>
		<input type="text" name="codDepartamento" id="codDepartamento" value="<%=dept.getCodDepartamento() %>" />
	</div>

	<div>
		<label for="codCentro">Centro:</label>
		<select name="codCentro" id="codCentro">
			<% for (Centro c: listaCentros) { 
				if (c.getCodCentro()==dept.getCodCentro()){
					out.println("<option value='"+c.getCodCentro()+"' selected>"
					            +c.getNombre()+ "</option>" );
				} else {
					out.println("<option value='"+c.getCodCentro()+"'>"
				            +c.getNombre()+ "</option>" );
				}
			}
			%>
		</select>
	</div>
	<div>
		<label for="tipoDir">Tipo Dirección: </label>
		<select name="tipoDir" id="tipoDir">
			<option value="P" <% if (dept.getTipoDir().equals("P")) out.print("selected"); %>>En propiedad </option>
			<option value="F" <% if (dept.getTipoDir().equals("F")) out.print("selected"); %>>En funciones</option>
		</select>
	</div>
	
	<div>
		<label for="presupuesto">Presupuesto: </label>
		<input type="text" name="presupuesto" id="presupuesto" value="<%=dept.getPresupuesto() %>" />
	</div>


	<div>
		<label for="nombre">Nombre: </label>
		<input type="text" name="nombre" id="nombre" value="<%=dept.getNombre() %>" />
	</div>
	<input type="submit" value="enviar">
</form>




<jsp:include page="/plantillas/pie.jsp"></jsp:include>