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
<c:import url="/WEB-INF/views/template/header.jsp"></c:import>
	<section class="container fluid">
		<!-- ======= Breadcrumbs ======= -->
		<div class="breadcrumbs">
			<div class="container">
	  
			  <div class="d-flex justify-content-between align-items-center">
				<h2>Admin</h2>
				<ol>
				  <li><a href="index.html">Home</a></li>
				  <li>Admin</li>
				</ol>
			  </div>
	  
			</div>
		  </div><!-- End Breadcrumbs -->

		  <hr>

	<div class="row">
		<div class="d-flex justify-content-center">
			<h3 style="color: black;">Coupon</h3>
		</div>
		<div style="float: left;">
			<button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">쿠폰 발행하기</button>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>번호</th><th>쿠폰이름</th><th>만료기한</th><th>발행일</th><th>할인율/할인금액</th>
				</tr>
			</thead>
			<tbody id="tbody3">
				<c:forEach items="${requestScope.list}" var="dto">
				<tr>
					<td>${pageScope.dto.couponNum}</td>
					<td>${pageScope.dto.couponName}</td>
					<td>${pageScope.dto.expDate}</td>
					<td>${pageScope.dto.regDate}</td>
					<c:choose>
						<c:when test="${dto.discountMethod eq '0'}">
							<td>${pageScope.dto.discountRate} % </td>
						</c:when>
						<c:otherwise>
							<td>${pageScope.dto.discountPrice} 원</td>
						</c:otherwise>
					</c:choose>
					<td class="deleteCoupon" data-couponNum = "${pageScope.dto.couponNum}" onclick="deleteCoupon()">삭제</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>

		<div class="row">
		<nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">
			
			<li class="page-item ${couponPager.pre?'':'disabled'}">
			  <a class="page-link" id="previous1" data-page="${couponPager.startNum-1}">이전</a>
			</li>
			<c:forEach begin="${couponPager.startNum}" end="${couponPager.lastNum}" var="i">
			<li class="page-item"><a class="page-link 2" data-page="${i}">${i}</a></li>
		   </c:forEach>
			<li class="page-item ${couponPager.next?'':'disabled'}">
			  <a class="page-link" id="next1" data-page="${couponPager.lastNum+1}">다음</a>
			</li>
		  </ul>
		</nav>
		</div>
	

	<!-- 쿠폰 발행 modal-->
	<div>
	
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
							<input type="text" class="form-control" id="discountRate" name="discountRate"><h5>%</h5>
						</div>
						
						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">할인금액</label>
							<input type="text" class="form-control" id="discountPrice" name="discountPrice"><h5>원</h5>
						</div>
						
						
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary" id="send" onclick="addCoupon()">쿠폰 생성</button>
						</div>
	
						</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<hr>

	<div class="row" style="border: 1px;">
		<div class="d-flex justify-content-center">
			<h3>Guest</h3>
		</div>

			<div class="col-md-3">
				<label class="visually-hidden" for="kind">Preference</label>
				<select name="kind" class="form-select" id="kind">
				<option class="kinds" value="userId">User Id</option>
				<option class="kinds" value="userName">User Name</option>
				</select>
			</div>

	
		  <div class="col-md-3">
		    <label class="visually-hidden" for="search">검색어 입력</label>
		    <div class="input-group">
		      <input type="text" name="search" value="${pager.search}" class="form-control" id="search" placeholder="검색어 입력">
		    </div>
		  </div>
	
		  <div class="col-md-3">
		    <button type="button" class="btn btn-primary" id="searchGu">검색</button>
		  </div>

		<table class="table">
			<thead>
				<tr>
					<th>UserId</th><th>UserName</th><th></th><th></th><th></th><th></th><th></th>
				</tr>
			</thead>
			<tbody id="tbody2">
				<c:forEach items="${guest}" var="gue">
				<tr>
					<td>${gue.userId}</td>
					<td>${gue.userName}</td>
					<c:choose>
						<c:when test="${gue.block eq '1'}">
							<td class="unblockMember" data-userId="${gue.userId}" onclick="unblockMember(event)">차단해제</td>
						</c:when>
						<c:otherwise>
							<td class="deleteMember" data-userId="${gue.userId}" onclick="deleteMember(event)">차단</td>
						</c:otherwise>
					</c:choose>
					<td><button class="btn btn-outline-secondary" onclick="getSharingList('1','${gue.userId}')" data-userId="${gue.userId}">같이해요 작성한 글</button></td>
					<td><button class="btn btn-outline-secondary" onclick="getQnaList('1','${gue.userId}')" data-userId="${gue.userId}">QnA 작성한 글</button></td>
					<td><button class="btn btn-outline-secondary" data-userId="${gue.userId}"  onclick="getItemList('1','${gue.userId}','0')">구매 목록</button></td>
					<td><button class="btn btn-outline-secondary" data-userId="${gue.userId}" onclick="getDetail('${gue.userId}')">회원 상세 프로필</button></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- 게스트 목록 페이징-->
	<div class="row">
		<nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">
			
			<li class="page-item ${guestPager.pre?'':'disabled'}">
			  <a class="page-link" id="previous2" data-page="${guestPager.startNum-1}">이전</a>
			</li>
			<c:forEach begin="${guestPager.startNum}" end="${guestPager.lastNum}" var="i">
			<li class="page-item"><a class="page-link" data-page="${i}">${i}</a></li>
		   </c:forEach>
			<li class="page-item ${guestPager.next?'':'disabled'}">
			  <a class="page-link" id="next2" data-page="${guestPager.lastNum+1}">다음</a>
			</li>
		  </ul>
		</nav>
	</div>

		<hr>
		
	<div class="row">
		<div class="d-flex justify-content-center">
			<h3>Biz</h3>
		</div>
		
	
		<div class="col-md-3">
			<label class="visually-hidden" for="kind">Preference</label>
			<select name="kind" class="form-select" id="kind1">
			<option class="kinds" value="userId">User Id</option>
			<option class="kinds" value="userName">User Name</option>
			</select>
		</div>

	  <div class="col-md-3">
		<label class="visually-hidden" for="search">검색어 입력</label>
		<div class="input-group">
		  <input type="text" name="search" value="${pager.search}" class="form-control" id="search1" placeholder="검색어 입력">
		</div>
	  </div>
	

	  <div class="col-md-3">
		<button type="button" class="btn btn-primary" id="searchBiz">검색</button>
	  </div>
	  
		<table class="table">
			<thead>
				<tr>
					<th>UserId</th><th>UserName</th>
				</tr>
			</thead>
			<tbody id="tbody4">
				<c:forEach items="${biz}" var="bizmen">
				<tr>
					<td>${bizmen.userId}</td>
					<td>${bizmen.userName}</td>
					<c:choose>
						<c:when test="${bizmen.block eq '0'}">
							<td class="deleteMember1" data-userId="${bizmen.userId}" onclick="deleteMember1(event)">차단</td>
						</c:when>
						<c:otherwise>
							<td class="unblockMember1" data-userId="${bizmen.userId}" onclick="unblockMember1(event)">차단 해제</td>
						</c:otherwise>
					</c:choose>
					<td><button class="btn btn-outline-secondary" onclick="getEventList('1','${bizmen.userId}')" data-userId="${bizmen.userId}">이벤트 작성한 글</button></td>
					<td><button class="btn btn-outline-secondary" data-userId="${bizmen.userId}" onclick="getSellItem('${bizmen.userId}')">판매 상품 목록</button></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- 사업자 목록 페이징-->
	<div class="row">
		<nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">
			
			<li class="page-item ${bizPager.pre?'':'disabled'}">
			  <a class="page-link" id="previous3" data-page="${bizPager.startNum-1}">이전</a>
			</li>
			<c:forEach begin="${bizPager.startNum}" end="${bizPager.lastNum}" var="i">
			<li class="page-item"><a class="page-link 3" data-page="${i}">${i}</a></li>
		   </c:forEach>
			<li class="page-item ${bizPager.next?'':'disabled'}">
			  <a class="page-link" id="next3" data-page="${bizPager.lastNum+1}">다음</a>
			</li>
		  </ul>
		</nav>
	</div>



	<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" id="btn" style="display: none;"></button>
  
  <!-- Modal -->
  <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl">
	  <div class="modal-content">
		<div class="modal-header">
		  <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
		  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		</div>
		<div class="modal-body" id="boardlist">
			<table class="table">
				<thead>
					<tr>
						<th>글 제목</th><th>작성일</th><th>조회수</th>
					</tr>
				</thead>
				<tbody id="tbody1">
				</tbody>
			</table>
			<button id="more" class="btn btn-danger">더 보기</button>
			  
		</div>
		<div class="modal-footer">
		  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="close">닫기</button>
		  <button type="button" class="btn btn-primary" id="check">확인</button>
		</div>
	  </div>
	</div>
  </div>
	


</section>

<c:import url="/WEB-INF/views/template/footer.jsp"></c:import>
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
			let form = $("#form1")[0];
			console.log(form);
			let formData = new FormData(form);
			console.log(formData);

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
	<script src="/resources/JS/admin/couponControll.js"></script>
</body>
</html>