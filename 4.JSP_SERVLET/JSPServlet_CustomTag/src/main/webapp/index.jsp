<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="mytag" uri="/WEB-INF/tlds/MyCusTomTag.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<mytag:SimpleTag/>
	<hr/>
	<mytag:TagSimpleWithAttribute age="20" name="Nguyễn Mạnh Hùng" from="Yên Bái"/>
	<hr/>
	<mytag:theLap n="10">Xin chào các bạn<br/></mytag:theLap>
</body>
</html>