
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List" %>
<%@page import="modelo.Centro"%>
<jsp:include page="/plantillas/cabecera.jsp"></jsp:include>

<a href="?opcion=nuevo"  class="boton">Insertar Centro</a>

<h1>listado de Centros</h1>
<% List<Centro> lista = (List<Centro>) request.getAttribute("listaCentros"); 
   if (lista==null) {
%>
<h2>No hay datos de Centros registrados</h2>
<% } else {%>
<table class="estilo-tabla">
	<tr>
		<th>Código Centro</th>
		<th>Nombre</th>
		<th>Dirección</th>
		<th>Editar</th>
		<th>Eliminar</th>
	</tr>
	<% 
		for (Centro centro:lista) {
			%>
			<tr>
				<td><%=centro.getCodCentro() %></td>
				<td><%=centro.getNombre() %></td>
				<td><%=centro.getDireccion() %></td>
				<td><a href="centros?opcion=editar&codCentro=<%=centro.getCodCentro()%>">Editar</a></td>
				<td><a href="centros?opcion=eliminar&codCentro=<%=centro.getCodCentro()%>">X</a></td>
			</tr>
			<%
		}
}
	%>
	
</table>


<jsp:include page="/plantillas/pie.jsp"></jsp:include>