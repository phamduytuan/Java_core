<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Employee Page!</title>
<style>
	.errorMessage{
		color:red;
	}
</style>
</head>
<body>
	<h1>INSERT EMPLOYEE</h1>
	<form:form action="insertEmployee" modelAttribute="e" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>Employee Id:</td>
				<td><form:input path="empId"/><br/>
				<form:errors path="empId" cssClass="errorMessage"></form:errors></td>
			</tr>
			<tr>
				<td>Employee Name:</td>
				<td><form:input path="empName"/><br/>
				<form:errors path="empName" cssClass="errorMessage"></form:errors></td>
			</tr>
			<tr>
				<td>Gender:</td>
				<td>
					<form:radiobutton path="gender" value="true"/>Male
					<form:radiobutton path="gender" value="false"/>Female<br/>
				<form:errors path="gender" cssClass="errorMessage"></form:errors>
				</td>
			</tr>
			<tr>
				<td>Birthday:</td>
				<td><form:input path="birthday" type="date"/><br/>
				<form:errors path="birthday" cssClass="errorMessage"></form:errors></td>
			</tr>
			<tr>
				<td>Address:</td>
				<td>
					<form:textarea path="address"/><br/>
				<form:errors path="address" cssClass="errorMessage"></form:errors>
				</td>
			</tr>
			<tr>
				<td>Company:</td>
				<td>
					<form:select path="company">
						<form:option value="">--Choose--</form:option>
						<form:option value="FPT Software">FPT Software</form:option>
						<form:option value="Viettel Telecom">Viettel Telecom</form:option>
						<form:option value="Luvina">Luvina</form:option>
						<form:option value="USOL-V">USOL-V</form:option>
					</form:select><br/>
				<form:errors path="company" cssClass="errorMessage"></form:errors>
				</td>
			</tr>
			<tr>
				<td>Department:</td>
				<td><form:input path="department"/><br/>
				<form:errors path="department" cssClass="errorMessage"></form:errors></td>
			</tr>
			<tr>
				<td>Position:</td>
				<td><form:input path="position"/><br/>
				<form:errors path="position" cssClass="errorMessage"></form:errors></td>
			</tr>
			<tr>
				<td>Salary:</td>
				<td><form:input path="salary" type="number"/><br/>
				<form:errors path="salary" cssClass="errorMessage"></form:errors></td>
			</tr>
			<tr>
				<td>Image:</td>
				<td><input type="file" name="imageEmployee"/></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Insert"/>
				<input type="reset" value="Clear"/></td>
			</tr>
			
		</table>
	</form:form>
</body>
</html>