<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
카테고리: <select name="itemCatg" class="form-control" id="itemCatg">
                    <option value='' selected>-- 상품 카테고리 선택 --</option>
                    <option value="1">호텔링</option>
                    <option value="2">원데이클래스</option>
                    <option value="3">트레이닝</option>
                  </select>
	<button>수정</button>
	</form>
</body>
</html>