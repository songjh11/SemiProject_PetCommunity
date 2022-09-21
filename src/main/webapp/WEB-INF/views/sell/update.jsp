<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="update" method="post">
	<input type="hidden" name="itemNum" value="${dto.itemNum}">
상품명: <input type="text" name="itemName" value="${dto.itemName}">
상품가격: <input type="text" name="itemPrice" value="${dto.itemPrice}">
상품설명: <input type="text" name="itemContents" value="${dto.itemContents}">
<c:forEach items= "${dto.fileDTOs}" var= "ar">
파일: ${ar.oriName}
</c:forEach>
<button>수정</button>
	</form>
</body>
</html>