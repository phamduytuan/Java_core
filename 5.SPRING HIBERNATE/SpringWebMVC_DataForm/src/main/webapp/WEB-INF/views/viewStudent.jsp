<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Student Page!</title>
</head>
<body>
	<h1>VIEW STUDENT</h1>
		<table>
			<tr>
				<td>Student Id:</td>
				<td>${s.stuId}</td>
			</tr>
			<tr>
				<td>Full Name:</td>
				<td>${s.fullName}</td>
			</tr>
			<tr>
				<td>Gender:</td>
				<td>
					${s.gender?"Male":"Female"}
				</td>
			</tr>
			<tr>
				<td>Birthday:</td>
				<td>${s.birthday}</td>
			</tr>
			<tr>
				<td>Address:</td>
				<td>${s.address} </td>
			</tr>
			<tr>
				<td>Class Name:</td>
				<td>
					${s.className}
				</td>
			</tr>			
		</table>
		<a href="initInsertStudent">Back</a>
</body>
</html>