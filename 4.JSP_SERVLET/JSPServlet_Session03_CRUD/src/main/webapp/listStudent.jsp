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
	<h3>
		<span style="color:green">${success}</span>
		<span style="color:red">${error}</span>
	</h3>
	
	<form action="SearchStudentByName">
		<b>Student Name:</b>
		<input type="text" name="fullName"/><input type="submit" value="Search"/>
	</form><br/>
	<table border="1">
		<tr>
			<th>Student Id</th>
			<th>Full Name</th>
			<th>Gender</th>
			<th>Birthday</th>
			<th>Address</th>
			<th>Class Name</th>
			<th>Details</th>
			<th>Delete</th>
		</tr>
		
		<c:forEach items="${list}" var="s">
			<tr>
				<td>${s.stuId}</td>
				<td>${s.fullName}</td>
				<td>${s.gender?"Male":"Female"}</td>
				<td>${s.birthday}</td>
				<td>${s.address}</td>
				<td>${s.className}</td>		
				<td>
					<a href="DetailStudent?stuId=${s.stuId}">detail</a>
				</td>	
				<td>
					<a href="DeleteStudent?stuId=${s.stuId}" onclick="return confirm('Sure?')">delete</a>
				</td>	
			</tr>
		</c:forEach>
	</table>
	<a href="insertStudent.jsp">Add New Student</a>
</body>
</html>