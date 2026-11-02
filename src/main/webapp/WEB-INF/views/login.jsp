<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 
<!DOCTYPE html>
<html>
<head>
<%@ include file="style.jspf" %>
<title>Iniciar sesión</title>
</head>
<body>
	<div class="centro tarjeta">
		<h1>Iniciar sesión</h1>
 
		<% if (request.getParameter("error") != null) { %>
			<div class="alerta error">Usuario o contraseña incorrectos.</div>
		<% } %>
		<% if (request.getParameter("logout") != null) { %>
			<div class="alerta ok">Sesión cerrada correctamente.</div>
		<% } %>
 
		<form action="${pageContext.request.contextPath}/login" method="post">
			<label for="username">Usuario</label>
			<input type="text" id="username" name="username" autofocus required />
 
			<label for="password">Contraseña</label>
			<input type="password" id="password" name="password" required />
 
			<sec:csrfInput />
 
			<button type="submit" class="btn completo">Entrar</button>
		</form>
 
		<p class="hint">Usuarios de prueba: admin, creator, editor, user, test (contraseña = usuario + "123").</p>
		<p class="hint">El usuario "test" tiene los roles de user, creator y editor.</p>
	</div>
</body>
</html>