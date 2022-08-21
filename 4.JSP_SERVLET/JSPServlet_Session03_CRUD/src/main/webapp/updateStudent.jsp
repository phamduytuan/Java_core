<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Student Page!</title>
</head>
<body>
	<h1>UPDATE STUDENT</h1>
	<h3 style="color: red">${error }</h3>

	<form action="UpdateStudent" method="post">
		<table>
			<tr>
				<td>Student Id:</td>
				<td><input type="text" name="stuId" value="${s.stuId }" readonly="readonly"/></td>
			</tr>
			<tr>
				<td>Full Name:</td>
				<td><input type="text" name="fullName" value="${s.fullName }" /></td>
			</tr>
			<tr>
				<td>Gender:</td>
				<td><input type="radio" name="gender" value="true" ${not empty s.gender && s.gender?"checked":""} />Male <input
					type="radio" name="gender" value="false" ${not empty s.gender && !s.gender?"checked":""} />Female</td>
			</tr>
			<tr>
				<td>Birthday:</td>
				<td><input type="date" name="birthday" value="${s.birthday }"/></td>
			</tr>
			<tr>
				<td>Address:</td>
				<td><textarea name="address">${s.address }</textarea></td>
			</tr>
			<tr>
				<td>Class Name:</td>
				<td><select name="className">
						<option value="">---Choose---</option>
						<option value="JW2203LM" ${not empty s.className && s.className=='JW2203LM'?"selected":"" }>JW2203LM</option>
						<option value="JW2204LM" ${not empty s.className && s.className=='JW2204LM'?"selected":"" }>JW2204LM</option>
						<option value="JW2205LM" ${not empty s.className && s.className=='JW2205LM'?"selected":"" }>JW2205LM</option>
						<option value="JW2206LM" ${not empty s.className && s.className=='JW2206LM'?"selected":"" }>JW2206LM</option>
						<option value="JW2207LM" ${not empty s.className && s.className=='JW2207LM'?"selected":"" }>JW2207LM</option>
				</select></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Update" /> <input type="reset"
					value="Clear" /></td>
			</tr>
		</table>
	</form>
	<a href="DetailStudent?stuId=${s.stuId}">Back</a>
</body>
</html>