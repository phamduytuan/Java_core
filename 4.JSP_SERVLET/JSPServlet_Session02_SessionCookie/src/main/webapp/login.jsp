<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page!</title>
</head>
<body>	
	<h1>PLEASE LOGIN</h1>
	<h3 style="color:red">${err }</h3>
	
	<form action="Login" method="post">
		<table>
			<tr>
				<td>Username:</td>
				<td><input type="text" name="username" value="${cookie.username.value}"/></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name="password" value="${cookie.password.value}"/></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="checkbox" name="save" value="true" ${not empty cookie.save.value && cookie.save.value=="true"?"checked":"" }/>Save Password</td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Login"/>
				<input type="reset" value="Clear"/></td>
			</tr>
		</table>
	</form>
</body>
</html>