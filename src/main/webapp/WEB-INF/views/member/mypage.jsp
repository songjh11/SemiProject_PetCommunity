<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>My page</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

	<style type="text/css">
    
    input[type=text]{
      border: 0;
      border-radius: 50px; 
      background-color: #F4f4f4;
    
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
        <p><span>${member.userId}'s My Page</span></p>
        </div>

        <ul class="nav nav-tabs d-flex justify-content-center" data-aos="fade-up" data-aos-delay="200">
          <c:choose>
            <c:when test="${member.roleNum eq 2}">
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
                <a class="nav-link"  href="./purchaseCancelList">
                  <h4>취소내역</h4>
                </a>
              </li>
            </c:when>
            <c:when test="${member.roleNum eq 1}">
              <li class="nav-item">
                <a class="nav-link" href="../sell/add">
                  <h4>상품등록</h4>
                </a>
              </li><!-- End tab nav item -->
              <li class="nav-item">
                <a class="nav-link" href="/sell/Sellerlist?itemCatg=1">
                  <h4>상품목록</h4>
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
                <a class="nav-link"  href="./purchaseList?purchaseStatus=1">
                  <h4>예약내역</h4>
                </a>
              </li><!-- End tab nav item -->
    
              <li class="nav-item">
                <a class="nav-link" href="./purchaseCancelList?purchaseStatus=1">
                  <h4>취소내역</h4>
                </a>
              </li>
            </c:when>
            <c:when test="${member.roleNum eq 0}">
              <li class="nav-item">
                <a class="nav-link" href="./memlist">
                  <h4>회원목록</h4>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/sell/list?itemCatg=1">
                  <h4>상품목록</h4>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="../admin/mypage">
                  <h4>쿠폰관리</h4>
                </a>
              </li>
             </c:when>
             </c:choose>

        </ul>
          </section><!-- End Menu Section -->
  

        <!-- ======= Stats Counter Section ======= -->
    <section id="stats-counter" class="stats-counter">
      <div class="container" data-aos="zoom-out">

        <div class="row gy-4">

          <c:if test="${dto.roleNum eq 2}">
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
          </c:if>

          <c:if test="${dto.roleNum eq 0}">
            <div class="col-lg-3 col-md-6">
              <div class="stats-item text-center w-100 h-100" OnClick="location.href ='./memlist'" style="cursor:pointer;">
                <span data-purecounter-start="0" data-purecounter-end="${memnum}" data-purecounter-duration="1" class="purecounter"></span>
                <p>Member</p>
              </div>
            </div><!-- End Stats Item -->
  
            <div class="col-lg-3 col-md-6">
              <div class="stats-item text-center w-100 h-100" OnClick="location.href ='/sell/list?itemCatg=1'" style="cursor:pointer;">
                <span data-purecounter-start="0" data-purecounter-end="${sellnum}" data-purecounter-duration="1" class="purecounter"></span>
                <p>Item</p>
              </div>
            </div><!-- End Stats Item -->
            </c:if>

          </div><!-- End Stats Item -->

        </div>

      </div>
    </section><!-- End Stats Counter Section -->


    <section id="contact" class="contact">
      <div class="container" data-aos="fade-up">

        <div class="section-header">
          <h2>Who am I</h2>
          <p><span>Hello!</span>${member.userId}</p>
        </div>

        <form action="./delete" data-aos="fade-up" data-aos-delay="100" enctype="multipart/form-data" id="updatefrm">
        <c:if test="${dto.roleNum eq 2}">
            <img src="../resources/upload/member/${dto.memberFileDTO.fileName}" class="testimonial-img" alt="">
          </c:if>
        <div class="row gy-4">
          <div class="col-md-6">
            <div class="info-item d-flex align-items-center">
              <i class="icon bi bi-envelope flex-shrink-0"></i>
              <div>
                <h3>Email</h3>
                <p><input type="text" value="${dto.email}" name="email" readonly></p>
              </div>
            </div>
          </div><!-- End Info Item -->

          <div class="col-md-6">
            <div class="info-item  d-flex align-items-center">
              <i class="icon bi bi-telephone flex-shrink-0"></i>
              <div>
                <h3>Phone</h3>
                <p><input type="text" value="${dto.email}" name="email" readonly></p>
              </div>
            </div>
          </div><!-- End Info Item -->

          <div class="col-md-6">
            <div class="info-item  d-flex align-items-center">
              <i class="icon bi bi-share flex-shrink-0"></i>
              <div>
                <h3>Agree</h3>
                <div>
                  <c:choose>
                    <c:when test="${dto.agValue  eq 1}">
                      <strong>정보제공동의여부:</strong> 동의<br>
                    </c:when>
                    <c:when test="${dto.agValue  eq 0}">
                      <strong>정보제공동의여부:</strong> 비동의<br>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${dto.agMail  eq 1}">
                      <strong>메일수신동의여부:</strong> 동의<br>
                    </c:when>
                    <c:when test="${dto.agMail  eq 0}">
                      <strong>메일수신동의여부:</strong> 동의<br>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${dto.agMes  eq 1}">
                      <strong>문자수신동의여부:</strong> 동의<br>
                    </c:when>
                    <c:when test="${dto.agMes  eq 0}">
                      <strong>문자수신동의여부:</strong> 동의<br>
                    </c:when>
                 </c:choose>
                </div>
              </div>
            </div>
          </div><!-- End Info Item -->

          <div class="col-md-6">
            <div class="info-item  d-flex align-items-center">
              <i class="icon bi bi-map flex-shrink-0"></i>
              <div>
                <h3>Our Address</h3>
                <p><input type="text" value="${dto.address}" name="address" readonly>
                  <p><input type="text" value=" ${dto.deAddress}" name="deAddress" readonly></p></p>
              </div>
            </div>
          </div><!— End Info Item —>

        </div>

      </form>
        </div>
        </section>


          


<!-- footer start -->
<c:import url="/WEB-INF/views/template/footer.jsp"></c:import>
<!-- footer end -->


</body>
</html>