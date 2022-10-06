<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Login page</title>
<meta content="" name="description">
<meta content="" name="keywords">

<style>
  #minpf{
  display: inline-block;
  font-size: smaller;
  color: dimgrey;
}
</style>
</head>
<body>
<!-- header start -->
<c:import url="/WEB-INF/views/template/header.jsp"></c:import>
<!-- header end -->
<!-- ======= Join Section ======= -->
<section id="book-a-table" class="book-a-table">
  <div class="container" data-aos="fade-up">

    <div class="section-header">
      <p><span>Login page</span></p>
    </div>

      <div class="col-lg-8 align-items-center">
        <form action="./login" method="post" data-aos="fade-up" data-aos-delay="100" enctype="multipart/form-data"  id="loginfrm">
          <div class="row gy-4">
            <div class="col-lg-8 col-md-12">
              <input type="text" name="userId" class="form-control" placeholder="User ID"id="userId">
              <div class="validate"></div>
            </div>
            <div class="col-lg-8 col-md-12">
              <input type="text" name="password" class="form-control" placeholder="password" id="pw">
              <div class="validate"></div>
            </div>
          </div>
          <br>
         <div class="text-center">
           <button type="button" id="login" class="btn-book-a-table">Login</button>
         </div>
         <div id="minpf"><a href="./findlogin">비밀번호를 잊어버리셨다면</a></div>
        </form>
      </div>

    </div>

</section>



<!-- footer start -->
<c:import url="/WEB-INF/views/template/footer.jsp"></c:import>
<!-- footer end -->

<!-- script start -->
<a href="#" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

<div id="preloader"></div>

<!-- Vendor JS Files -->
<script src="/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/resources/assets/vendor/aos/aos.js"></script>
<script src="/resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="/resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
<script src="/resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
<script src="/resources/assets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="/resources/assets/js/main.js"></script>

<!-- daum 지도 검색 api -->  
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script src="/resources/JS/login.js"></script>

</body>
</html>