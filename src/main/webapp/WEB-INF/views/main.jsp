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
        <div class="col-lg-5 order-2 order-lg-1" style="display: flex; width: 100%; justify-content: space-evenly;">
          <div>
            <h2 data-aos="fade-up">반려견 커뮤니티<br>Wal Wal</h2>
          </div>
          <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel" style="height: 300px; width: 700px; overflow: hidden; display: flex; align-items: center;">
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img src="/resources/images/puppy (1).jpg" class="d-block w-100" alt="...">
              </div>
              <div class="carousel-item">
                <img src="/resources/images/puppy (2).jpg" class="d-block w-100" alt="...">
              </div>
              <div class="carousel-item">
                <img src="/resources/images/puppy (3).jpg" class="d-block w-100" alt="...">
              </div>
              <div class="carousel-item">
                <img src="/resources/images/puppy (4).jpg" class="d-block w-100" alt="...">
              </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
            </button>
          </div>
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
              <c:forEach items="${eventList}" var="event">
              <div class="col-xl-4" data-aos="fade-up" data-aos-delay="200">
                <div class="icon-box d-flex flex-column justify-content-center align-items-center">
                  <i><img src="/resources/upload/event/${event.boardFileDTOs[0].fileName}" class="menu-img img-fluid" alt=""></i>
                  <h4>${evnet.title}</h4>
                  <p>BY ${event.writer}</p>
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