<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>untitled</title>
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

<!-- ======= 같이해요 리스트 Section ======= -->
    <section id="chefs" class="chefs section-bg">
      <div class="container" data-aos="fade-up">
        
        <div class="section-header">
          <h2>같이해요</h2>
          <p>회원 <span>정보 공유</span> 게시판</p>
        </div>
        <div class="mb-3">
          <a href="./add" class="btn btn-primary">새 글 작성하기</a>
        </div> 
        <div class="row gy-4">
		<c:forEach items="${list}" var="dto">
          <div class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100" style=" cursor: pointer;" onclick="location.href='./detail?num=${dto.num}';">
            <div class="chef-member">
              <div class="member-img">
                <img src="/resources/upload/sharing/${pageScope.dto.boardFileDTOs[0].fileName}" class="img-fluid" alt="">
                <div class="social">
                  <a href=""><i class="bi bi-twitter"></i></a>
                  <a href=""><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
              <div class="member-info">
                <h4>${dto.title}</h4>
                <span>${dto.regDate}</span>
                <p>by ${dto.writer}</p>
              </div>
            </div>
          </div><!-- 글 리스트 -->

		</c:forEach>
        </div>

      </div>
    </section><!-- End Chefs Section -->
  </main>
<c:import url="/WEB-INF/views/template/testfooter.jsp"></c:import>

</body>
</html>