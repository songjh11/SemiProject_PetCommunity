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
				<th>아이디</th><th>상품번호</th><th>상품이름</th><th>상품가격</th><th>상품내용</th><th>상품사진</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="dto">
			 <tr>
				<td>${dto.userId }</td>
				<td>${dto.itemDTOs[0].itemNum }</td>
				<td>${dto.itemDTOs[0].itemName }</td>
				<td>${dto.itemDTOs[0].itemPrice }</td>
				<td>${dto.itemDTOs[0].itemContents }</td>
				<td>${dto.fileDTOs[0].fileName }</td>
				<form action="../sell/pickdelete" method="post">
				<td><input type="submit" value="찜 해제"></td>
				</form>
			 </tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>