<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<thead>
		<tr>
			<td>번호</td><td>작성자</td><td>내용</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${dto}" var="aaa">
		<tr>
			<td>${aaa.num}</td><td>${aaa.writer}</td><td>${aaa.contents}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>

</body>
</html>