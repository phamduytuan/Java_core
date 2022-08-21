<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Student Page!</title>
</head>
<body>
	<h1>INSERT STUDENT</h1>
	<form:form action="insertStudent" modelAttribute="s" method="post">
		<table>
			<tr>
				<td>Student Id:</td>
				<td><form:input path="stuId"/></td>
			</tr>
			<tr>
				<td>Full Name:</td>
				<td><form:input path="fullName"/></td>
			</tr>
			<tr>
				<td>Gender:</td>
				<td>
					<form:radiobutton path="gender" value="true"/>Male
					<form:radiobutton path="gender" value="false"/>Female
				</td>
			</tr>
			<tr>
				<td>Birthday:</td>
				<td><form:input path="birthday" type="date"/></td>
			</tr>
			<tr>
				<td>Address:</td>
				<td><form:textarea path="address"/> </td>
			</tr>
			<tr>
				<td>Class Name:</td>
				<td>
					<form:select path="className">
						<form:option value="">---Choose---</form:option>
						<form:option value="JW2103LM">JW2103LM</form:option>
						<form:option value="JW2104LM">JW2104LM</form:option>
						<form:option value="JW2105LM">JW2105LM</form:option>
						<form:option value="JW2106LM">JW2106LM</form:option>
						<form:option value="JW2107LM">JW2107LM</form:option>
					</form:select>
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<input type="submit" value="Insert"/>
					<input type="reset" value="Clear"/>
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>