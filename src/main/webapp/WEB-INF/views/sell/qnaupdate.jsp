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
	<form action="qnaupdate" method="post">
		<input type="hidden" name="qnaNum" value="${sellQnaDTO.qnaNum }">
		작성자<input type="text" readonly="readonly" name="userId" value="${sellQnaDTO.userId }">
		제목<input type="text" name="title" value="${sellQnaDTO.title }">
		내용<input type="text" name="contents" value="${sellQnaDTO.contents }">
		<input type="hidden" name="itemNum" value="${sellQnaDTO.itemNum}">
		<button type="submit">수정</button>
	</form>
</body>
</html>