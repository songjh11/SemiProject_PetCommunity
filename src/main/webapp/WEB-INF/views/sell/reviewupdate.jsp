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
	<form action="reviewupdate" method="post" enctype="multipart/form-data">
		<input type="hidden" name="rvNum" value="${reviewDTO.rvNum }">
		<input type="text" readonly="readonly" name="userId" value="${reviewDTO.userId }">
		<input type="text" name="rvTitle" value="${reviewDTO.rvTitle }">
		<input type="text" name="rvContents" value="${reviewDTO.rvContents }">
		<input type="text" name="rvRate" value="${reviewDTO.rvRate }">
		<input type="hidden" name="itemNum" value="${reviewDTO.itemNum}">
		<c:forEach items="${reviewDTO.rvFileDTOs }" var="fileDTO">
			<div class="mb-3">
				<span>${fileDTO.oriName}</span>
				<button class="fileDelete" type="button" data-file-num="${fileDTO.photoNum}">삭제</button>
			</div>
		</c:forEach>
		<div id="addFiles">
			<button type="button" id="fileAdd">파일 추가</button>
		</div>
	
		
	<button type="submit">수정</button>
	</form>
	<script src="/resources/JS/review_file.js"></script>
	<script>setCount(${reviewDTO.rvFileDTOs.size()});</script>
</body>
</html>