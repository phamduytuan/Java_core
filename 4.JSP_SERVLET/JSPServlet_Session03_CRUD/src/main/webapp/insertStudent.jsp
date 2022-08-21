<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Student Page!</title>
</head>
<body>
	<h1>INSERT STUDENT</h1>
	<h3 style="color:red">${error }</h3>
	
	<form action="InsertStudent" method="post">
		<table>
			<tr>
				<td>Full Name:</td>
				<td><input type="text" name="fullName"/></td>
			</tr>
			<tr>
				<td>Gender:</td>
				<td>
					<input type="radio" name="gender" value="true"/>Male
					<input type="radio" name="gender" value="false"/>Female
				</td>
			</tr>
			<tr>
				<td>Birthday:</td>
				<td><input type="date" name="birthday"/></td>
			</tr>
			<tr>
				<td>Address:</td>
				<td>
					<textarea name="address"></textarea>
				</td>
			</tr>
			<tr>
				<td>Class Name:</td>
				<td>
					<select name="className">
						<option value="">---Choose---</option>
						<option value="JW2203LM">JW2203LM</option>
						<option value="JW2204LM">JW2204LM</option>
						<option value="JW2205LM">JW2205LM</option>
						<option value="JW2206LM">JW2206LM</option>
						<option value="JW2207LM">JW2207LM</option>
					</select>
				</td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Insert"/>
				<input type="reset" value="Clear"/></td>
			</tr>
		</table>
	</form>
</body>
</html>