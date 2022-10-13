<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Update Item</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

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

    .disb{
      display: block;
    }

    .fileList{
      align-items: center;
    }

    span{
      display: block;
      margin-bottom: 5px;
    }

    .uFileDelete{
      margin-left: 5px;
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
          <p><span>Update Item</span></p>
        </div>

          <div class="col-lg-8 align-items-center">
            <form action="update" method="post" data-aos="fade-up" data-aos-delay="100" enctype="multipart/form-data" id="updateItemFrm">
              <input type="hidden" name="itemNum" value="${dto.itemNum}">
        			<input type="hidden" name="itemCatg" value="${dto.itemCatg}">
              <div class="row gy-4">
                <div class="col-lg-8 col-md-6">
                  <input type="text" class="form-control disb" name="itemName" id="itemName" value="${dto.itemName}">
                  <div class="validate"></div>
                </div>
                <div class="col-lg-8 col-md-6">
                  <input type="text" class="form-control disb" name="itemPrice" id="itemPrice" value="${dto.itemPrice}">
                  <div class="validate"></div>
                </div>
                <div class="col-lg-12 col-md-12 fileList">
                  <c:forEach items= "${dto.fileDTOs}" var= "ar">
                    <span>${ar.oriName}
                    <button type="button" class="uFileDelete btn btn-outline-danger" data-photo-num="${ar.photoNum}">파일 삭제</button>
                    </span>
                  </c:forEach>
                  </div>
                <div class="col-lg-12 col-md-12">
                   <button type="button" id="sellfileAdd" class="btn btn-outline-primary">상품 사진 추가</button>
                  </div>
                <div class="col-lg-4 col-md-6">  
                <div id="sellFileImages">
                  <div id= "inputDiv"></div>
                  <div id = "imgDiv"></div>
                </div>
                </div>
                <div class="form-group mt-3" style="margin-top: 5px;">
	                <textarea class="form-control" id="itemContents" name="itemContents" rows="5" value="${dto.itemContents}">${dto.itemContents}</textarea>
	                <div class="validate"></div>
                </div>
              
              </div>
              <br>
              <div class="text-center">
                <button type="button" id="updateItemBtn" class="btn btn-outline-primary">상품 수정</button>
              </div>
             
            </form>
          </div><!-- End Update Form -->

        </div>

    </section><!-- End Update Items Section -->



  <!-- footer start -->
  <c:import url="/WEB-INF/views/template/footer.jsp"></c:import>
  <!-- footer end -->

    <!-- script start -->

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
<script>
	setCount(${dto.fileDTOs.size()});
</script>

  
</body>
</html>