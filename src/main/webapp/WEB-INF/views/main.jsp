<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>WALWAL</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

</head>
  <body>
<!-- header start -->
<c:import url="/WEB-INF/views/template/header.jsp"></c:import>
<!-- header end -->

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="hero d-flex align-items-center section-bg">
    <div class="container">
      <div class="row justify-content-between gy-5">
        <div class="col-lg-5 order-2 order-lg-1 d-flex flex-column justify-content-center align-items-center align-items-lg-start text-center text-lg-start">
          <h2 data-aos="fade-up">반려견 커뮤니티<br>Wal Wal</h2>
          <p data-aos="fade-up" data-aos-delay="100">메인을 꾸며주세오</p>
        </div>
        <div class="col-lg-5 order-1 order-lg-2 text-center text-lg-start">
          <img src="/resources/assets/img/hero-img.jpg" class="img-fluid" alt="" data-aos="zoom-out" data-aos-delay="300">
        </div>
      </div>
    </div>
  </section><!-- End Hero Section -->

  <main id="main">

    <!-- ======= Why Us Section ======= -->
    <section id="why-us" class="why-us section-bg">
      <div class="container" data-aos="fade-up">

        <div class="row gy-4">

          <div class="col-lg-4" data-aos="fade-up" data-aos-delay="100">
            <div class="why-box">
              <h3>최근 이벤트&공지사항</h3>
              <p>
                이벤트나 공지사항 최신글의 타이틀과 컨텐츠를 불러오면 좋을듯합니다.
              </p>
              <div class="text-center">
                <a href="#" class="more-btn">Learn More <i class="bx bx-chevron-right"></i></a>
              </div>
            </div>
          </div><!-- End Why Box -->

          <div class="col-lg-8 d-flex align-items-center">
            <div class="row gy-4">
              <c:forEach items="${sharingList}" var="sharing">
              <div class="col-xl-4" data-aos="fade-up" data-aos-delay="200">
                <div class="icon-box d-flex flex-column justify-content-center align-items-center">
                  <i class="bi bi-clipboard-data"></i>
                  <h4>${sharing.title}</h4>
                  <p>BY ${sharing.writer}</p>
                </div>
              </div><!-- End Icon Box -->
              </c:forEach>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Why Us Section -->

    <!-- ======= Menu Section ======= -->
    <section id="menu" class="menu">
      <div class="container" data-aos="fade-up">
        <div class="section-header">
          <h2>Reservation</h2>
          <p>Check Our <span>Best Item</span></p>
        </div>
            <div class="row gy-5">
              <c:forEach items="${purchaseList}" var="ar">
                <div class="col-lg-4 menu-item d-flex" style="flex-direction: column; align-items: center;">
                  <a href="/resources/upload/sellfile/${ar.fileDTOs[0].fileName}" class="glightbox"><img src="/resources/upload/sellfile/${ar.fileDTOs[0].fileName}" class="menu-img img-fluid" alt=""></a>
                  <h4 style="margin-top: 10px;"><a href="/sell/detail?itemNum=${ar.itemNum}">${ar.itemName}</a></h4>
                  <p class="price">
                    ₩ ${ar.itemPrice}
                  </p>
                </div>
              </c:forEach>
            </div>
      </div>
    </section><!-- End Menu Section -->

  
  </main><!-- End #main -->

 <!-- footer start -->
<c:import url="/WEB-INF/views/template/footer.jsp"></c:import>
<!-- footer end -->
 
</body>

</html>