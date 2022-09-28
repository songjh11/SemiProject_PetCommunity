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
<c:import url="../template/testheader.jsp"></c:import>

	
	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">쿠폰 발행하기</button>

			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">쿠폰발행</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="./add" method="post">
					<div class="mb-3">
						<label for="recipient-name" class="col-form-label">쿠폰이름</label>
						<input type="text" class="form-control" id="couponName" name="couponName">
					</div>
					<div class="mb-3">
						<label for="recipient-name" class="col-form-label">만료기한</label>
						<input type="text" class="form-control" id="expDate" name="expDate">
					</div>
					
					<div class="mb-3">
						<label for="recipient-name" class="col-form-label">할인방법</label>
						<input type="text" class="form-control" id="discountMethod" name="discountMethod">
					</div>
					
					<div class="mb-3">
						<label for="recipient-name" class="col-form-label">할인율</label>
						<input type="text" class="form-control" id="discountRate" name="discountRate">
					</div>
					
					<div class="mb-3">
						<label for="recipient-name" class="col-form-label">할인율</label>
						<input type="text" class="form-control" id="discountPrice" name="discountPrice">
					</div>
					
					
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary" id="send">Send message</button>
					</div>
					</form>
	
					</div>
				</div>
			</div>
		</div>
</body>
</html>