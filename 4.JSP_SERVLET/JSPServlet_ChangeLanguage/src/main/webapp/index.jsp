<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fmt:setLocale value="${param.lang==null?'vi_VN':param.lang}" scope="session"/>
	<fmt:setBundle basename="language.Lang" scope="session" var="bun"/>
	<a href="index.jsp?lang=vi_VN"><fmt:message bundle="${bun}" key="vn"/></a> &nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="index.jsp?lang=en_US"><fmt:message bundle="${bun}" key="en"/></a>
	<h1><fmt:message bundle="${bun}" key="headerForm"/></h1>
	<form action="ProcessData" method="post">
		<table>
			<tr>
				<td><fmt:message bundle="${bun}" key="name"/>:</td>
				<td><input type="text" name="yourName"/></td>
			</tr>
			<tr>
				<td><fmt:message bundle="${bun}" key="birthday"/>:</td>
				<td><input type="date" name="birthday"/></td>
			</tr>
			<tr>
				<td><fmt:message bundle="${bun}" key="job"/>:</td>
				<td><input type="text" name="job"/></td>
			</tr>
			<tr>
				<td><fmt:message bundle="${bun}" key="salary"/>:</td>
				<td><input type="number" name="salary"/></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Submit"/>
				<input type="reset" value="Clear"/></td>
			</tr>
		</table>
	</form>
</body>
</html>