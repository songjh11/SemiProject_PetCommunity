<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>

</head>
<body>
	<section class="container fluid">
	<div class="row">
		<table class="table">
			<thead>
				<tr>
					<th>번호</th><th>쿠폰이름</th><th>만료기한</th><th>발행일</th><th>할인율/할인금액</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.list}" var="dto">
				<tr>
					<td>${pageScope.dto.couponNum}</td>
					<td>${pageScope.dto.couponName}</td>
					<td>${pageScope.dto.expDate}</td>
					<td>${pageScope.dto.regDate}</td>
					<td>${pageScope.dto.discountRate}</td>
					<td>${pageScope.dto.discountPrice}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>


	<!-- 쿠폰 발행 modal-->
	<div>
	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">쿠폰 발행하기</button>

		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">쿠폰발행</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					
					<form id="form1" method="post">
					
					<div class="mb-3">
						<label for="recipient-name" class="col-form-label">쿠폰이름</label>
						<input type="text" class="form-control" id="couponName" name="couponName">
					</div>
					<div class="mb-3">
						<label for="recipient-name" class="col-form-label">만료기한</label>
						<input type="date" class="form-control" id="expDate" name="expDate">
					</div>
					
					<div class="mb-3">
						<label for="recipient-name" class="col-form-label">할인방법</label>
						<select name="discountMethod" id="discountMethod" onchange="changeSelect()">
							<option value="default" selected="selected">선택</option>
							<option value="0">할인율</option>
							<option value="1">할인금액</option>
						</select>
					</div>
					
					<div class="mb-3">
						<label for="recipient-name" class="col-form-label">할인율</label>
						<input type="text" class="form-control" id="discountRate" name="discountRate">
					</div>
					
					<div class="mb-3">
						<label for="recipient-name" class="col-form-label">할인금액</label>
						<input type="text" class="form-control" id="discountPrice" name="discountPrice">
					</div>
					
					
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary" id="send" onclick="addCoupon()">Send message</button>
					</div>

					</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
	<script type="text/javascript">
		function changeSelect(){
			let discountMethod = document.querySelector("#discountMethod");
			let discountRate = document.querySelector("#discountRate");
			let discountPrice = document.querySelector("#discountPrice")
			if(discountMethod.options[discountMethod.selectedIndex].value == '1'){
				discountRate.disabled = true;
				discountPrice.disabled = false;
				discountRate.value = "";
				discountPrice.value = "";
			}
			if(discountMethod.options[discountMethod.selectedIndex].value == '0'){
				discountPrice.disabled = true;
				discountRate.disabled = false;
				discountRate.value = "";
				discountPrice.value = "";
			}
		}


		function addCoupon(){
			let form = $("form")[0];
			let formData = new FormData(form);

			$.ajax({
				cache : false,
				url : "${pageContext.request.contextPath}/admin/addcoupon",
				processData : false,
				contentType : false,
				type : 'POST',
				data : formData,
				success : function(data){
					location.reload();
				},
				error : function(xhr, status){
					alert(xhr+":"+status);
				}

			})
		}

	
	</script>
	
</body>
</html>