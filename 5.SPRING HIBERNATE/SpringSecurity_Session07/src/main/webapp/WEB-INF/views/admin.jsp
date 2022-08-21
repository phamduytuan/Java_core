<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
</head>
<body>
	<h1>Admin Page</h1>
	<h2>Welcome: ${pageContext.request.userPrincipal.name}</h2>
	<h1>Information:</h1>
	<h3>User name: ${user.username}</h3>
	<h3>Full name: ${user.fullName}</h3>
	<h3>Address: ${user.address}</h3>
	<h3>Email: ${user.email}</h3>
	<h3>Telephone: ${user.telephone}</h3>

	<form action="<c:url value="/j_spring_security_logout" />"
		method="post">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" /> <input type="submit" value="Logout" />
	</form>
</body>
</html>
