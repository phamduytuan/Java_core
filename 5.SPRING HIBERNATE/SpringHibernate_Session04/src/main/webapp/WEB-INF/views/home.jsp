<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Employee Page!</title>
</head>
<body>
	<h1>LIST EMPLOYEES</h1>
	<table border="1">
		<tr>
			<th>Employee Id</th>
			<th>Employee Name</th>
			<th>Gender</th>
			<th>Birthday</th>
			<th>Address</th>
			<th>Company</th>
			<th>Deparment</th>
			<th>Position</th>
			<th>Salary</th>
		</tr>
		<c:forEach items="${list}" var="e">
			<tr>
				<td>${e.empId}</td>
				<td>${e.empName}</td>
				<td>${e.gender?"Male":"Female"}</td>
				<td><fmt:formatDate value="${e.birthday}" pattern="dd/MM/yyyy"/> </td>
				<td>${e.address}</td>
				<td>${e.company}</td>
				<td>${e.department}</td>
				<td>${e.position}</td>
				<td><fmt:formatNumber type="currency" currencySymbol="" value="${e.salary}"></fmt:formatNumber> (VND)</td>
			</tr>
		</c:forEach>
	</table>
	<a href="initInsertEmployee">Add New Employee</a>
</body>
</html>