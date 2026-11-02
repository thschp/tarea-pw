<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="style.jspf" %>
<title>Cerrar sesión</title>
</head>
<body>
	<div class="centro tarjeta">
		<h1>Cerrar sesión</h1>
		<p>¿Estás seguro de que quieres salir?</p>
 
		<form action="${pageContext.request.contextPath}/logout" method="post">
			<sec:csrfInput />
			<button type="submit" class="btn">Sí, cerrar sesión</button>
			<a class="btn gris" href="${pageContext.request.contextPath}/">Cancelar</a>
		</form>
	</div>
</body>
</html>