<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>공지사항</title>
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

    <section class="sample-page">
      <div class="container" data-aos="fade-up">

        <div class="row">
			<form action="add" method="post" enctype="multipart/form-data">
				 
			<div class="mb-3">
		  		<label for="writer" class="form-label">작성자</label>
		  		<input type="text" class="form-control" id="writer" name="writer" placeholder="작성자 입력">
			</div>
			<div class="mb-3">
		  		<label for="title" class="form-label">제목</label>
		  		<input type="text" class="form-control" id="title" name="title" placeholder="제목 입력">
			</div>
			
			
			<div class="mb-3">
		  		<label for="contents" class="form-label">내용</label>
		  		<textarea class="form-control" id="contents" rows="3" name="contents" placeholder="내용 입력"></textarea>
			</div>
			
			<c:if test="${board eq 'event'}">
        <div class="mb-3">
		  		<label for="contents" class="form-label">적용할 쿠폰</label>
		  		<select class="form-select" id="validationDefault04" required name ="couponNum">
            <option selected disabled value="">선택</option>
            <c:forEach items="${list}" var="coupon">
              <option value="${coupon.couponNum}"> 쿠폰명 : ${coupon.couponName} ( 할인율/할인금액 : ${coupon.discountRate} % )</option>
            </c:forEach>
          </select>
			</div>
      </c:if>
		
			<div id="addFiles">
				<button type="button" class="btn btn-danger" id="fileAdd">파일 추가</button>
			</div>
			
			
			<button class="btn btn-primary btn-lg btn-block" type="submit">Add</button>
			</form>
		</div>

      </div>
    </section>

  </main><!-- End #main -->

  
  <c:import url="/WEB-INF/views/template/testfooter.jsp"></c:import>
  
  <script src="/resources/JS/board_file.js"></script>
</body>

</html>