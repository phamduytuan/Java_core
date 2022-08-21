<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail Student Page!</title>
</head>
<body>
	<h1>DETAIL STUDENT</h1>

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
			<td>${s.gender?"Male":"Female"}</td>
		</tr>
		<tr>
			<td>Birthday:</td>
			<td>${s.birthday}</td>
		</tr>
		<tr>
			<td>Address:</td>
			<td>${s.address}</td>
		</tr>
		<tr>
			<td>Class Name:</td>
			<td>${s.className}</td>
		</tr>
		<tr>
			<td><a href="index.jsp">Back</a></td>
			<td>
				<a href="InitUpdateStudent?stuId=${s.stuId }">Update</a>
			</td>
		</tr>
	</table>
	
</body>
</html>