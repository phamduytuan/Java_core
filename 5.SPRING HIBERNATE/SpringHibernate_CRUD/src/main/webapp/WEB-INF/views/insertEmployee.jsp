<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Employee Page!</title>
</head>
<body>
	<h1>INSERT EMPLOYEE</h1>
	<h3 style="color:red">${error }</h3>
	
	<form:form action="insertEmployee" modelAttribute="e" method="post">
		<table>
			<tr>
				<td>Employee Name:</td>
				<td><form:input path="empName"/></td>
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
				<td>Company:</td>
				<td>
					<form:select path="company">
						<form:option value="">---Choose---</form:option>
						<form:option value="FPT Software">FPT Software</form:option>
						<form:option value="VietSoftware">VietSoftware</form:option>
						<form:option value="USOL-V">USOL-V</form:option>
						<form:option value="Luvina">Luvina</form:option>
						<form:option value="ITSolt">ITSolt</form:option>
						<form:option value="ThaiSonSoft">ThaiSonSoft</form:option>
					</form:select>
				</td>
			</tr>
			<tr>
				<td>Department:</td>
				<td><form:input path="department"/> </td>
			</tr>
			<tr>
				<td>Position:</td>
				<td><form:input path="position"/> </td>
			</tr>
			<tr>
				<td>Salary:</td>
				<td><form:input path="salary" type="number"/> </td>
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