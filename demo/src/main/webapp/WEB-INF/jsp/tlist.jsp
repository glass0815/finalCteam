<%@page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>tlist.jsp</title>
</head>
<body>
	<c:forEach var="e" items="${list}">
		<tr>
			<td>${e.num }</td>
			<td>${e.title }</td>
			<td>${e.cont }</td>
			<td>${e.tdate }</td>
		</tr>
	</c:forEach>
</body>
</html>