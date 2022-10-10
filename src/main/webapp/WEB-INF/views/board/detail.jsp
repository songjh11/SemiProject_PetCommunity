<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>${board} 상세 페이지</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

 
</head>

<body>

  <c:import url="/WEB-INF/views/template/testheader.jsp"></c:import>

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>Sample Inner Page</h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li>Sample Inner Page</li>
          </ol>
        </div>

      </div>
    </div><!-- End Breadcrumbs -->

	<c:if test="${board eq 'sharing'}">
	<section id="hero" class="hero d-flex align-items-center section-bg">
		<div class="container">
		  <div class="row justify-content-between gy-5">
			<div class="col-lg-5 order-2 order-lg-1 d-flex flex-column justify-content-center align-items-center align-items-lg-start text-center text-lg-start">
			  <h2 data-aos="fade-up">${requestScope.member.userName}님 <br>프로필</h2>
			  <p data-aos="fade-up" data-aos-delay="100">Pet 이름 : ${requestScope.member.petName}<br> Pet Category : ${requestScope.member.petCatg}</p>
			  <div class="d-flex" data-aos="fade-up" data-aos-delay="200">
				<a class="btn-book-a-table" id="follow">팔로우</a>
				
				<c:if test="${not empty sessionScope.member}">
					<a href="#" class="glightbox btn-watch-video d-flex align-items-center"><i class="bi bi-play-circle"></i><span>1:1 채팅</span></a>
				</c:if>
				
			  </div>
			</div>
				<div class="col-lg-5 order-1 order-lg-2 text-center text-lg-start">
			  		<img src="../resources/upload/member/${requestScope.member.memberFileDTO.fileName}" class="img-fluid" alt="" data-aos="zoom-out" data-aos-delay="300">
				</div>
		  </div>
		</div>
	  </section><!-- End Hero Section -->
	</c:if> 

    <section class="sample-page">
      <div class="container" data-aos="fade-up">

       <table class="table">
	
		<thead>
			<tr>
				<th>번호</th><th>제목</th><th>작성자</th><th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${requestScope.dto.num}</td>
				<td>${requestScope.dto.title}</td>
				<td>${requestScope.dto.writer}</td>
				<td>${requestScope.dto.hit}</td>
				
			</tr>
		</tbody>
		</table>
		
		<div class="row">
			<c:forEach items="${dto.boardFileDTOs}" var="fileDTO">
				<p>
				<a href="../resources/upload/notice/${fileDTO.fileName}">${fileDTO.oriName}</a>
				</p>
			</c:forEach>
		</div> 
		
				<div class="form-floating">
	  			<textarea class="form-control" id="floatingTextarea2" style="height: 200px"><c:out value="${dto.contents}"/></textarea>
				  <div style="white-space:pre;"><c:out value="${dto.contents}"/></div>
	  			<!-- <label for="floatingTextarea2">${dto.contents}</label> -->
				</div>
		
		
		<c:if test="${board eq 'qna'}">
		<a href="./reply?num=${dto.num}" class="btn btn-danger">reply</a>
		</c:if>
	
		<a href="./update?num=${requestScope.dto.num}" class="btn btn-primary">수정</a>
	
	
		<a href="./delete?num=${requestScope.dto.num}" class="btn btn-primary">삭제</a>
		<div class="row">
			<c:if test="${board eq 'event'}">
				<button type="button" id="couponSave">${coupon.couponName}쿠폰 다운로드</button>
			</c:if>
		</div>
    </div>

    <c:if test="${board eq 'sharing'}">
    <!--------COMMENT---------->
			<div class="row">
				<div class="mb-3">
					<label for="writer" class="form-label">Username</label>
					<input type="text" class="form-control" id="writer">
				  </div>
				  <div class="mb-3">
					<label for="contents" class="form-label">Contents</label>
					<textarea class="form-control" id="contents" rows="3"></textarea>
				  </div>
				  <div class="mb-3">
					<button type="button" id="commentAdd" data-num="${dto.num}">댓글 작성</button>

				  </div>
			</div>
			<div>
				<table id="commentList" class="table table-dark table-hover">

				</table>

				<button id="more" class="btn btn-danger">더 보기</button>

			</div>
			<!--------COMMENT---------->

		
		<!--- Modal ----->
		<div>
			<button type="button" style="display: none;" id="up" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@getbootstrap">댓글 수정</button>

			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Update</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form>
						<input type="hidden" id="num">
					<div class="mb-3">
						<label for="recipient-name" class="col-form-label">Writer</label>
						<input type="text" class="form-control" readonly id="updateWriter">
					</div>
					<div class="mb-3">
						<label for="message-text" class="col-form-label">Contents</label>
						<textarea class="form-control" id="updateContents"></textarea>
					</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="close">닫기</button>
					<button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="updateButton">수정하기</button>
				</div>
				</div>
			</div>
			</div>

		</div>
   </c:if>

    </section>

  </main><!-- End #main -->

  <c:import url="/WEB-INF/views/template/testfooter.jsp"></c:import>

  	<script type="text/javascript">
		let userName = "${requestScope.member.userName}";
	</script>
	<script type="text/javascript" src="/resources/JS/board/boardComment.js"></script>
  	<script type="text/javascript">

		let followee = "${requestScope.member.userId}";
		let userId= "${sessionScope.member.userId}";
		let couponNum = "${coupon.couponNum}"
		let num = "${requestScope.dto.num}";
		let data = "${requestScop.dto.contents}";
		
		try {
			
			setFollow(followee, userId);
		} catch (error) {
			
		}
		
		try {
			
			saveCoupon(couponNum, userId, num);
		} catch (error) {
			
		}

	</script>
</body>

</html>