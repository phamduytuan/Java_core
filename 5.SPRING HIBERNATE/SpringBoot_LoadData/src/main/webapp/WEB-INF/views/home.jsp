<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page!</title>
</head>
<body>
	<h1>LIST BOOKs</h1>
	<table border="1">
		<tr>
			<th>Book Id</th>
			<th>Book Name</th>
			<th>Total Page</th>
			<th>Type</th>
			<th>Quantity</th>
		</tr>
		<c:forEach items="${list}" var="b">
			<tr>
				<td>${b.bookId}</td>
				<td>${b.bookName}</td>
				<td>${b.totalPage}</td>
				<td>${b.type}</td>
				<td>${b.quantity}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>