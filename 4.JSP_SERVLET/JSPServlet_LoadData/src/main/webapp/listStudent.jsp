<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Student Page!</title>
</head>
<body>	
	<h1>LIST STUDENTS</h1>
	<table border="1">
		<tr>
			<th>Student Id</th>
			<th>Full Name</th>
			<th>Gender</th>
			<th>Birthday</th>
			<th>Address</th>
			<th>Class Name</th>
		</tr>
		
		<c:forEach items="${list}" var="s">
			<tr>
				<td>${s.stuId}</td>
				<td>${s.fullName}</td>
				<td>${s.gender?"Male":"Female"}</td>
				<td>${s.birthday}</td>
				<td>${s.address}</td>
				<td>${s.className}</td>				
			</tr>
		</c:forEach>
	</table>
</body>
</html>