<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>review add</title>
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
#imgDiv{
  display: flex;
}

.newDiv{
  justify-content: center;
  align-items:center;
  position: relative;
  width: 80px;
      height: 80px;
  margin-right: 5px;
}
.thumnail{
    width: 80px;
    height: 80px;

    } 
.imgDeleteBtn {
  position: absolute;
  top: 0px;
  right: 0px;
}

#inputDiv{
  display: none;
}
</style>

</head>
<body>
<!-- header start -->
<c:import url="/WEB-INF/views/template/header.jsp"></c:import>
<!-- header end -->
<!-- ======= Add Items Section ======= -->
    <section id="book-a-table" class="book-a-table">
      <div class="container" data-aos="fade-up">

        <div class="section-header">
          <p><span>Add Item</span></p>
        </div>

          <div class="col-lg-8 align-items-center">
            <form action="reviewadd" method="post" data-aos="fade-up" data-aos-delay="100" enctype="multipart/form-data" id="addItemFrm">
              <div class="row gy-4">
                <div class="col-lg-8 col-md-12">
                  <input type="text" name="userId" class="form-control" id="userId" placeholder="User ID">
                  <div class="validate"></div>
                </div>
                <div class="col-lg-4 col-md-6">
                   <button type="button" id="sellfileAdd">상품 사진 추가</button>
                  </div>
                <div class="col-lg-4 col-md-6">  
                <div id="sellFileImages">
                  <div id= "inputDiv"></div>
                  <div id = "imgDiv"></div>
                </div>
                </div>
                             
                <div class="col-lg-12 col-md-12">
                  <input type="text" class="form-control" name="rvTitle" id="rvTitle" placeholder="Review Title">
                  <div class="validate"></div>
                </div>
                <div class="form-group mt-3">
	                <textarea class="form-control" name="rvContents" rows="5" placeholder="Review Contents"></textarea>
	                <div class="validate"></div>
                </div>
                
                <div class="col-lg-6 col-md-6">
                 <input type="text" name="rvRate" class="form-control" id="rvRate" placeholder="Review Rate">
                  <div class="validate"></div>
                </div>
                
                 <div class="col-lg-6 col-md-6">
                 <input type="hidden" name="itemNum" class="form-control" id="itemNum" value="${reviewDTO.itemNum }">
                  <div class="validate"></div>
                </div>
              <br>
             <div class="text-left">
             	<button type="submit" id="reviewAddBtn">리뷰 등록</button>
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
  <script src="/resources/JS/sell.js"></script>

</body>
</html>