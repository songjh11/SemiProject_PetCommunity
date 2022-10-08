<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>${category.categoryName}</title>
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

  <script>history.scrollRestoration = "manual"</script>
  <!-- =======================================================
  * Template Name: Yummy - v1.2.0
  * Template URL: https://bootstrapmade.com/yummy-bootstrap-restaurant-website-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
    <style>
      .pagination{
        justify-content: center;
      }

      .pagination > li > a {
        float: none;
      }


    .page-link {
      color: rgb(98, 91, 91); 
      background-color: #fff;
      border: 1px solid #ccc; 
    }

    .page-item.active .page-link {
    z-index: 1;
    color: rgb(228, 145, 145);
    font-weight:bold;
    background-color: #f1f1f1;
    border-color: #ccc;
    
    }

    .page-link:focus, .page-link:hover {
      color: rgb(238, 8, 8);
      background-color: #fafafa; 
      border-color: #ccc;
    }

    .btnsocial{
      border: 0px;  
      outline: 0px;
      background-color: transparent;
    }

    .img-fluid{
      height: 250px;
    }

    </style>

</head>

<body>
<div class="headerWrapper" style="position: relative;">
    <!-- header start -->
    <c:import url="/WEB-INF/views/template/header.jsp"></c:import>
    <!-- header end -->
</div>


  
    <!-- ======= List Section ======= -->

    <section id="chefs" class="chefs section-bg">
      <div class="container" data-aos="fade-up">
                   <section id="book-a-table" class="book-a-table">
                    <div class="container" data-aos="fade-up">
                    <section id="menu" class="menu">
                      <div class="section-header">
                        <p><span>${category.categoryName}</span><p>
                       </div>
                       <ul class="nav nav-tabs d-flex justify-content-center" data-aos="fade-up" data-aos-delay="200">
                        <li class="nav-item">
                          <a class="nav-link" href="/sell/list?itemCatg=1">
                            <h4>Hoteling</h4>
                          </a>
                        </li><!-- End tab nav item -->
                        <li class="nav-item">
                          <a class="nav-link" href="/sell/list?itemCatg=2">
                            <h4>Ondday</h4>
                          </a>
                        </li><!-- End tab nav item -->
                        <li class="nav-item">
                          <a class="nav-link" href="/sell/list?itemCatg=3">
                            <h4>Traning</h4>
                          </a>
                        </li><!-- End tab nav item -->
                        </ul>
                        </section>
                      </div>
                      </section>
                   
					<div class="row gy-1">	
              <c:forEach items="${list}" var="ar">
                <div class="col-lg-3 col-md-4 d-flex align-items-stretch justify-content-center" data-aos="fade-up" data-aos-delay="100">
                  <div class="chef-member" style="width: 250px; height: 350px; margin-bottom: 15px;">
                    <div class="member-img" style="width: 100%;">
                      <img src="/resources/upload/sellfile/${ar.fileDTOs[0].fileName}" class="img-fluid" alt="">
                      <div class="social d-flex">
                        <button type="button" class="btnsocial" id="btnPick">
                          <i class="bi bi-bag-heart btnPick" style="cursor: pointer;" data-item-num="${ar.itemNum}"></i>
                        </button>
                          <i class="bi bi-facebook" style="cursor: pointer;" id="btnShopCart"></i></a>
                        </p>
                      </div>
                    </div>
                    <div class="member-info" style="width: 100%; height: 115px;">
                      <h4><a href="./detail?itemNum=${ar.itemNum}">${ar.itemName}</a></h4>
                      <!-- <p>${ar.itemAddress}</p> -->
                      <span>₩ ${ar.itemPrice}</span>
                    </div>
                  </div>
                </div>
              </c:forEach>
        </div>
        <!-- End grid1div -->

      </div>
    </section> 
    
    <!-- pagination start -->
    <div class="chefs section-bg" style="padding-bottom: 10px;">
      <nav aria-label="Page navigation example">
        <ul class="pagination">
          <li class="page-item ${sellPager.pre?'':'disabled'}">
            <a class="page-link" href="./list?page=${sellPager.startNum-1}&itemCatg=${sellPager.itemCatg}&search=${sellPager.search}" aria-label="Previous">
              <span aria-hidden="true">&laquo;</span>
            </a>
          </li>
          <c:forEach begin="${sellPager.startNum}" end="${sellPager.lastNum}" var="i">
            <li class="page-item"><a class="page-link" href="./list?page=${i}&itemCatg=${sellPager.itemCatg}&search=${sellPager.search}"> ${i}</a> </li>
          </c:forEach>
          <li class="page-item ${pager.next?'':'disabled'}">
            <a class="page-link" href="./list.do?page=${sellPager.lastNum+1}&itemCatg=${sellPager.itemCatg}&search=${sellPager.search}" aria-label="Next">
              <span aria-hidden="true">&raquo;</span>
            </a>
          </li>
        </ul>
      </nav>
    </div>
    <!-- pagination end -->        


       

 <!-- footer start -->
 <section>
  <c:import url="/WEB-INF/views/template/footer.jsp"></c:import>
</section>
<!-- footer end -->

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
  <script src="/resources/JS/sellHeader.js"></script>
  <script src="/resources/JS/pick&shopcart.js"></script>
</body>

</html>