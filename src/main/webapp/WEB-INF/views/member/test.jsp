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
	<!-- 임시 마이페이지에 찜,장바구니 리스트,삭제 -->
	<h1>찜 목록</h1>
	<table border="1">
		<thead>
			<tr>
				<th>아이디</th><th>상품번호</th><th>상품이름</th><th>상품가격</th><th>상품내용</th><th>상품사진</th><th>찜 해제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list.itemDTOs }" var="dto">
			 <tr>
				<td>${list.userId }</td>
				<td>${dto.itemNum }</td>
				<td>${dto.itemName }</td>
				<td>${dto.itemPrice }</td>
				<td>${dto.itemContents }</td>
				<td><img src="/resources/upload/sellfile/${dto.fileDTOs[0].fileName}" class="img-fluid" alt=""></td>
				<form action="../sell/pickdelete" method="post">
				<td><input type="submit" value="${dto.itemNum }" name="itemNum"></td>
				</form>
			 </tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>