<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="style.jspf" %>
<title>403 - Acceso denegado</title>
</head>
<body>
	<div class="centro tarjeta centrado">
		<p class="codigo">403</p>
		<h1>Acceso denegado</h1>
		<p>
			Lo sentimos, <strong><sec:authentication property="name" /></strong>,
			tu rol no tiene permiso para entrar a esta página.
		</p>
		<p class="acciones">
			<a class="btn" href="${pageContext.request.contextPath}/">Volver a la lista</a>
			<a class="btn gris" href="${pageContext.request.contextPath}/logout-confirm">Cerrar sesión</a>
		</p>
	</div>
</body>
</html>
