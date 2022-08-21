<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail Employee Page!</title>
</head>
<body>
	<h1>DETAIL EMPLOYEE</h1>
	
		<table>
			<tr>
				<td>Employee Id:</td>
				<td>${e.empId}</td>
			</tr>
			<tr>
				<td>Employee Name:</td>
				<td>${e.empName}</td>
			</tr>
			<tr>
				<td>Gender:</td>
				<td>
					${e.gender?"male":"female"}
				</td>
			</tr>
			<tr>
				<td>Birthday:</td>
				<td>${e.birthday}</td>
			</tr>
			<tr>
				<td>Address:</td>
				<td>${e.address}</td>
			</tr>
			<tr>
				<td>Company:</td>
				<td>
					${e.company}
				</td>
			</tr>
			<tr>
				<td>Department:</td>
				<td>${e.department}</td>
			</tr>
			<tr>
				<td>Position:</td>
				<td>${e.position}</td>
			</tr>
			<tr>
				<td>Salary:</td>
				<td>${e.salary}</td>
			</tr>	
			<tr>
				<td><a href="listEmployee">Back</a></td>
				<td>
					<a href="initUpdateEmployee?empId=${e.empId}">Update</a>
				</td>
			</tr>		
		</table>
		
</body>
</html>