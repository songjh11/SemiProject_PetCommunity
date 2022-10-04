<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Mypage</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="/resources/assets/img/favicon.png" rel="icon">
  <link href="/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Amatic+SC:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Inter:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/resources/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="/resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="/resources/assets/css/main.css" rel="stylesheet">

	<style type="text/css">

.testimonial-img {
  border-radius: 50%;
  border: 4px solid #fff;
  margin: 0 auto;
}

 
	</style>
  
</head>
<body>
<!-- header start -->
<c:import url="/WEB-INF/views/template/header.jsp"></c:import>
<!-- header end -->
<!-- ======= mypage Section ======= -->
    <section id="book-a-table" class="book-a-table">
      <div class="container" data-aos="fade-up">
        <section id="menu" class="menu">
        <div class="section-header">
        <p><span>${dto.roleDTO.roleName}'s My Page</span></p>
        </div>

        <ul class="nav nav-tabs d-flex justify-content-center" data-aos="fade-up" data-aos-delay="200">

          <li class="nav-item">
            <a class="nav-link" href="./cart">
              <h4>장바구니</h4>
            </a>
          </li><!-- End tab nav item -->
          <li class="nav-item">
            <a class="nav-link" href="./pick">
              <h4>찜 내역</h4>
            </a>
          </li><!-- End tab nav item -->
          <li class="nav-item">
            <a class="nav-link" href="./coupon">
              <h4>보유쿠폰</h4>
            </a>
          </li><!-- End tab nav item -->

          <li class="nav-item">
            <a class="nav-link" href="./update">
              <h4>회원수정</h4>
            </a>
          </li><!-- End tab nav item -->

          <li class="nav-item">
            <a class="nav-link" href="./delete">
              <h4>회원탈퇴</h4>
            </a><!-- End tab nav item -->

          <li class="nav-item">
            <a class="nav-link"  href="./purchaseList">
              <h4>예약내역</h4>
            </a>
          </li><!-- End tab nav item -->

          <li class="nav-item">
            <a class="nav-link" href="#">
              <h4>취소내역</h4>
            </a>
          </li><!-- End tab nav item -->
        </ul>
          </section><!-- End Menu Section -->
  

        <!-- ======= Stats Counter Section ======= -->
    <section id="stats-counter" class="stats-counter">
      <div class="container" data-aos="zoom-out">

        <div class="row gy-4">

          <div class="col-lg-3 col-md-6">
            <div class="stats-item text-center w-100 h-100" OnClick="location.href ='follower'" style="cursor:pointer;">
              <span data-purecounter-start="0" data-purecounter-end="${followernum}" data-purecounter-duration="1" class="purecounter"></span>
              <p>Follower</p>
            </div>
          </div><!-- End Stats Item -->

          <div class="col-lg-3 col-md-6">
            <div class="stats-item text-center w-100 h-100" OnClick="location.href ='followee'" style="cursor:pointer;">
              <span data-purecounter-start="0" data-purecounter-end="${followeenum}" data-purecounter-duration="1" class="purecounter"></span>
              <p>Followee</p>
            </div>
          </div><!-- End Stats Item -->

          </div><!-- End Stats Item -->

        </div>

      </div>
    </section><!-- End Stats Counter Section -->

          <div class="col-lg-8 align-items-center">
            <form action="./delete" data-aos="fade-up" data-aos-delay="100" enctype="multipart/form-data" id="updatefrm">
              <div class="row gy-4">
                <div class="col-lg-8 col-md-12">
                  <input type="text" name="userId" class="form-control" value="${dto.userId}" readonly>
                  <div class="validate"></div>
                </div>
                <div class="col-lg-8 col-md-12">
                  <input type="text" name="userName" class="form-control" value="${dto.userName}" readonly>
                  <div class="validate"></div>
                </div>
                <div class="col-lg-8 col-md-12">
                  <input type="number" name="phone" class="form-control" value="${dto.phone}" readonly>
                  <div class="validate"></div>
                </div>
                <div class="col-lg-8 col-md-12">
                  <input type="email" name="email" class="form-control" value="${dto.email}" readonly>
                  <div class="validate"></div>
                </div>

                <div class="col-lg-6 col-md-6">
                  <input type="text" name="itemZipCode" class="form-control" id="itemZipCode" value="${dto.itemZipCode}" readonly>
                   <div class="validate"></div>
                 </div>
                 <div class="col-lg-12 col-md-12">
                  <input type="text" name="address" class="form-control" id="address" value="${dto.address}" readonly>
                 </div>
                 <div class="col-lg-12 col-md-12">
                   <input type="text" name="deAddress" class="form-control" id="deAddress" value="${dto.deAddress}" readonly>
                   <div class="validate"></div>
                 </div>

                </div>
                
                <c:choose>
                    <c:when test="${dto.roleNum eq 1}">
                        <div class="col-lg-8 col-md-6">
                          <input type="text" class="form-control" name="itemCatg" value="${dto.itemCatg}" readonly>
                          <div class="validate"></div>
                        </div>
                          <div class="col-lg-8 col-md-6">
                            <input type="text" class="form-control" name="itemId" value="${dto.itemId}" readonly>
                            <div class="validate"></div>
                          </div>
                        
                    </c:when>
                    <c:when test="${dto.roleNum eq 2}">
                        <div class="col-lg-8 col-md-6">
                            <input type="text" class="form-control" name="petName" value="${dto.petName}" readonly>
                            <div class="validate"></div>
                          </div>
                          <div class="col-lg-8 col-md-6">
                            <input type="text" class="form-control" name="petCatg" value="${dto.petCatg}" readonly>
                            <div class="validate"></div>
                          </div>
                          <div class="col-lg-2 text-center">
                        <img src="../resources/upload/member/${dto.memberFileDTO.fileName}" class="img-fluid testimonial-img" alt="">
                        </div>
                    </c:when>
                </c:choose>

                <c:choose>
                <c:when test="${dto.agValue  eq 1}">
                    <p>정보제공동의여부: 동의</p>
                </c:when>
                <c:when test="${dto.agValue  eq 0}">
                    <p>정보제공동의여부: 비동의</p>
                </c:when>
            </c:choose>
            <c:choose>
                <c:when test="${dto.agMail  eq 1}">
                    <p>메일수신동의여부: 동의</p>
                </c:when>
                <c:when test="${dto.agMail  eq 0}">
                    <p>메일수신동의여부: 비동의</p>
                </c:when>
            </c:choose>
            <c:choose>
                <c:when test="${dto.agMes  eq 1}">
                    <p>문자수신동의여부: 동의</p>
                </c:when>
                <c:when test="${dto.agMes  eq 0}">
                    <p>문자수신동의여부: 비동의</p>
                </c:when>
             </c:choose>
              </div>
              <br>
             <div class="text-center">
                <button type="submit" class="btn-book-a-table">회원탈퇴</button>
                <a href="./update" class="btn-book-a-table">정보수정</a>
                <a href="./followee" class="btn-book-a-table">팔로잉 목록</a>
                <a href="./follower" class="btn-book-a-table">팔로워 목록</a>
             </div>
             
            </form>
          </div><!-- End Reservation Form -->

        </div>

    </section><!-- End Add Items Section -->



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

</body>
</html>