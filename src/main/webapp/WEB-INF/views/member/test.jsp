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
				<td><button type="button" class="btnPickDelete" data-item-num1="${dto.itemNum}">찜 해제</button></td>
			 </tr>
			</c:forEach>
		</tbody>
	</table>
	<h1>장바구니 목록</h1>
	<table border="1">
		<thead>
			<tr>
				<th>아이디</th><th>상품번호</th><th>상품이름</th><th>상품가격</th><th>상품내용</th><th>상품사진</th><th>장바구니에서 빼기</th><th>주문수량</th>
			</tr>
		</thead>
		<tbody>
		 <c:forEach items="${list2.itemDTOs }" var="dto2">
			 <tr>
				<td>${list2.userId }</td>
				<td>${dto2.itemNum }</td>
				<td>${dto2.itemName }</td>
				<td>${dto2.itemPrice }</td>
				<td>${dto2.itemContents }</td>
				<td><img src="/resources/upload/sellfile/${ dto2.fileDTOs[0].fileName}" class="img-fluid" alt=""></td>
				<td><button type="button" class="btnShopCartDelete" data-item-num2="${dto2.itemNum}">장바구니에서 제외</button></td>
				<td><input type="number" class="count" data-item-num="${dto2.itemNum}" min="1" value=${dto2.shopCartDTOs[0].totalCount }></td>
			 </tr>
		 </c:forEach>
		</tbody>
	</table>
	총금액<input type="text" readonly="readonly" value="${list3.totalPrice }">
	<script src="/resources/JS/pick&shopcart.js"></script>
</body>
</html>