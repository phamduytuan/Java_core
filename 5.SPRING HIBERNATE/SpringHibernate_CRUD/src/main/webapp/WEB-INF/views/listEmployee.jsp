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
	<c:if test="${not empty success}">
		<h3 style="color:green">${success}</h3>
	</c:if>
	<c:if test="${not empty error}">
		<h3 style="color:red">${error}</h3>
	</c:if>
	
	<form action="searchEmployeeByName">
		<b>Employee Name:</b>
		<input type="text" name="empName"/>
		<input type="submit" value="Search"/>
	</form><br/>
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
			<th>Details</th>
			<th>Delete</th>
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
				<td>
					<a href="detailEmployee?empId=${e.empId}">detail</a>
				</td>
				<td>
					<a href="deleteEmployee?empId=${e.empId}" onclick="return confirm('Sure?')">delete</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	<a href="initInsertEmployee">Add New Employee</a>
</body>
</html>