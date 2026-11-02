<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="style.jspf" %>
<title>Lista de Productos</title>
</head>
<body>
	<div class="barra">
		<div class="marca"><span>P</span>Productos</div>
		<div>
			Hola, <strong><sec:authentication property="name" /></strong>
			&nbsp;·&nbsp;
			<a href="${pageContext.request.contextPath}/logout-confirm">Cerrar sesión</a>
		</div>
	</div>
 
	<div class="contenedor tarjeta">
		<h1>Lista de Productos</h1>
 
		<table>
			<tr>
				<th>ID</th>
				<th>Nombre</th>
				<th>Precio</th>
				<th>Acciones</th>
			</tr>
			<c:forEach var="producto" items="${productos}">
				<tr>
					<td>${producto.id}</td>
					<td>${producto.nombre}</td>
					<td>${producto.precio}</td>
					<td>
						<a class="btn suave pequeno" href="${pageContext.request.contextPath}/edit/${producto.id}">Editar</a>

						<form class="en-linea" action="${pageContext.request.contextPath}/delete/${producto.id}" method="post" onsubmit="return confirm('¿Eliminar este producto?');">
							<sec:csrfInput />
							<button type="submit" class="btn peligro pequeno">Eliminar</button>
						</form>
					</td>
				</tr>
			</c:forEach>
			<c:if test="${empty productos}">
				<tr><td colspan="4">No hay productos todavía.</td></tr>
			</c:if>
		</table>
 
		<a class="btn" href="${pageContext.request.contextPath}/new">Agregar un nuevo producto</a>
 
	</div>
</body>
</html>