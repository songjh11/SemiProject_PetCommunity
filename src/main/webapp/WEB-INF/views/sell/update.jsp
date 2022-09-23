<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Add Item</title>
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

<!-- ======= Update Items Section ======= -->
<section id="book-a-table" class="book-a-table">
	<div class="container" data-aos="fade-up">

	  <div class="section-header">
		<p><span>Update Item</span></p>
	  </div>

		<div class="col-lg-8 align-items-center">
			
			<!-- form start -->
		  <form action="update" method="post" data-aos="fade-up" data-aos-delay="100" enctype="multipart/form-data" id="updateItemFrm">
			
			<input type="hidden" name="itemNum" value="${dto.itemNum}">
			<input type="hidden" name="itemCatg" value="${dto.itemCatg}">

			  <div class="col-lg-4 col-md-6">
				<input type="text" name="itemName" value="${dto.itemName}" class="form-control" id="itemName">
				<div class="validate"></div>
			  </div>
			  <div class="col-lg-4 col-md-6">
				<input type="text" class="form-control" value="${dto.itemPrice}" name="itemPrice" id="itemPrice">
				<div class="validate"></div>
			  </div>
			  <div class="col-lg-4 col-md-6">
				<c:forEach items= "${dto.fileDTOs}" var= "ar">
					<span>${ar.oriName}
					<button type="button" class="uFileDelete" data-photo-num="${ar.photoNum}">파일 삭제</button>
					</span>
				</c:forEach>
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
			  <div class="form-group mt-3">
				  <textarea class="form-control" name="itemContents" rows="5" value="${dto.itemContents}">${dto.itemContents}</textarea>
				  <div class="validate"></div>
			  </div>
			  
			</div>
			<br>
			<div class="text-center">
				<button type="submit" id="updateItemBtn">상품 수정</button>
			</div>
	   
		  </form><!-- End Form -->
		</div>

	  </div>

  </section><!-- End Update Items Section -->

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