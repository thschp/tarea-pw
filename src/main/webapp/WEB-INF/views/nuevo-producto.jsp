<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="style.jspf" %>
<title>Nuevo Producto</title>
</head>
<body>
	<div class="centro tarjeta">
		<h1>Agregar Nuevo Producto</h1>
		<form action="${pageContext.request.contextPath}/save" method="post">
			<label for="nombre">Nombre</label>
			<input type="text" id="nombre" name="nombre" required />
 
			<label for="precio">Precio</label>
			<input type="number" id="precio" name="precio" step="100" required />
 
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<button type="submit" class="btn completo">Guardar</button>
		</form>
		<p class="hint"><a href="${pageContext.request.contextPath}/">← Volver</a></p>
	</div>
</body>
</html>