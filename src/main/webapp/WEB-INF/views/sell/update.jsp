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
	                <textarea class="form-control" name="itemContents" rows="5" value="${dto.itemContents}">${dto.itemContents}</textarea>
	                <div class="validate"></div>
                </div>
              
              </div>
              <br>
              <div class="text-center">
                <button type="submit" id="updateItemBtn" class="btn btn-outline-primary">상품 수정</button>
              </div>
             
            </form>
          </div><!-- End Update Form -->

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

<!-- daum 지도 검색 api -->  
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
        function execDaumPostcode() {
          new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //document.getElementById("itemLongtitude").value = extraAddr;
                
                } else {
                    document.getElementById("itemAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('itemZipCode').value = data.zonecode;
                document.getElementById("itemAddress").value = addr += extraAddr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("itemDeAddress").focus();
            }
        }).open();
    }//kakao api 끝
</script>

<script src="/resources/JS/sell.js"></script>
<script>
	setCount(${dto.fileDTOs.size()});
</script>

  
</body>
</html>