<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
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

</head>
<body>
<div>
    <!-- header start -->
    <c:import url="/WEB-INF/views/template/header.jsp"></c:import>
    <!-- header end -->
</div>

<!-- main contents -->
<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel" style="display: block;">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <c:forEach items="${sellItemDTO.fileDTOs}" var="ar">
                    <div class="carousel-item">
                        <img width="300px" height="300px" src="../resources/upload/sellfile/${ar.fileName}" class="d-block w-100" alt="...">
                    </div>
            </c:forEach>  
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

  <!-- carousel를 구성할 영역 설정 -->  
  <div style="width: 300px;margin: 100px;">    
    <!-- carousel를 사용하기 위해서는 class에 carousel와 slide 설정한다. -->    
    <!-- carousel는 특이하게 id를 설정해야 한다.-->    
    <div id="carousel-example-generic" class="carousel slide" >      
        <!-- carousel의 지시자 -->      
        <!-- 지시자라고는 하는데 ol태그의 class에 carousel-indicators를 넣는다. -->      
        <ol class="carousel-indicators">        
            <!-- li는 이미지 개수만큼 추가하고 data-target은 carousel id를 가르킨다. -->        
            <!-- data-slide-to는 순서대로 0부터 올라가고 0은 active를 설정한다. -->        
            <!-- 딱히 이 부분은 옵션별로 설정하게 없다. -->        
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>        
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>      
        </ol>      
        <!-- 실제 이미지 아이템 -->      
        <!-- class는 carousel-inner로 설정하고 role은 listbox에서 설정한다. -->      
        <div class="carousel-inner" role="listbox">        
            <!-- 이미지의 개수만큼 item을 만든다. 중요한 포인트는 carousel-indicators의 li 태그 개수와 item의 개수는 일치해야 한다. -->        
            <div class="item active">          
                <!-- 아미지 설정- -->          
                <img src="https://tistory2.daumcdn.net/tistory/1041549/skin/images/nowonbuntistory.png" style="width:100%">          
            </div>       
            <div class="item">          
                <img src="https://www.nowonbun.com/img/nowonbuntistory1.png" style="width:100%">          
            </div>     
        </div>      
                     <!-- 왼쪽 화살표 버튼 -->      
                     <!-- href는 carousel의 id를 가르킨다. -->      
                     <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">        
                        <!-- 왼쪽 화살표 -->        
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>      
                    </a>      
                    <!-- 오른쪽 화살표 버튼 -->      
                    <!-- href는 carousel의 id를 가르킨다. -->      
                    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">        
                        <!-- 오른쪽 화살표 -->        
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></a>    
    </div>  
  </div>


<!-- reservation section -->
<div>
    <div class="block-32 aos-init aos-animate" data-aos="fade-up" data-aos-offset="-200">
        <form action="#">
          <div class="row">
            <div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
              <label for="checkin_date" class="font-weight-bold text-black">Check In</label>
              <div class="field-icon-wrap">
                <div class="icon"><span class="icon-calendar"></span></div>
                <input type="date" id="checkin_date" class="form-control">
              </div>
            </div>
            <div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
              <label for="checkout_date" class="font-weight-bold text-black">Check Out</label>
              <div class="field-icon-wrap">
                <div class="icon"><span class="icon-calendar"></span></div>
                <input type="date" id="checkout_date" class="form-control">
              </div>
            </div>
            <div class="col-md-6 mb-3 mb-md-0 col-lg-3">
              <div class="row">
                <div class="col-md-6 mb-3 mb-md-0">
                  <label for="adults" class="font-weight-bold text-black">Adults</label>
                  <div class="field-icon-wrap">
                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                    <select name="" id="adults" class="form-control">
                      <option value="">1</option>
                      <option value="">2</option>
                      <option value="">3</option>
                      <option value="">4+</option>
                    </select>
                  </div>
                </div>
                <div class="col-md-6 mb-3 mb-md-0">
                  <label for="children" class="font-weight-bold text-black">Children</label>
                  <div class="field-icon-wrap">
                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                    <select name="" id="children" class="form-control">
                      <option value="">1</option>
                      <option value="">2</option>
                      <option value="">3</option>
                      <option value="">4+</option>
                    </select>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6 col-lg-3 align-self-end">
              <button class="btn btn-primary btn-block text-white">Check Availabilty</button>
            </div>
          </div>
        </form>
      </div>
</div>

<a href="./update?itemNum=${sellItemDTO.itemNum}"><button>수정</button></a>
<a href="./delete?itemNum=${sellItemDTO.itemNum}"><button id="deleteItem">삭제</button></a>

<ul class="nav nav-tabs" role="tablist">
    <li class="nav-item" role="presentation">
      <a class="nav-link active" data-bs-toggle="tab" href="#home" aria-selected="true" role="tab">Home</a>
    </li>
    <li class="nav-item" role="presentation">
      <a class="nav-link" data-bs-toggle="tab" href="#profile" aria-selected="false" role="tab" tabindex="-1">Profile</a>
    </li>
    <li class="nav-item" role="presentation">
      <a class="nav-link disabled" href="#" aria-selected="false" tabindex="-1" role="tab">Disabled</a>
    </li>
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
      <div class="dropdown-menu" style="">
        <a class="dropdown-item" href="#">Action</a>
        <a class="dropdown-item" href="#">Another action</a>
        <a class="dropdown-item" href="#">Something else here</a>
        <div class="dropdown-divider"></div>
        <a class="dropdown-item" href="#">Separated link</a>
      </div>
    </li>
  </ul>
  <div id="myTabContent" class="tab-content">
    <div class="tab-pane fade" id="home" role="tabpanel">
      <p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
    </div>
    <div class="tab-pane fade active show" id="profile" role="tabpanel">
      <p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit.</p>
    </div>
    <div class="tab-pane fade" id="dropdown1">
      <p>Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney's organic lomo retro fanny pack lo-fi farm-to-table readymade. Messenger bag gentrify pitchfork tattooed craft beer, iphone skateboard locavore carles etsy salvia banksy hoodie helvetica. DIY synth PBR banksy irony. Leggings gentrify squid 8-bit cred pitchfork.</p>
    </div>
    <div class="tab-pane fade" id="dropdown2">
      <p>Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater. Fanny pack portland seitan DIY, art party locavore wolf cliche high life echo park Austin. Cred vinyl keffiyeh DIY salvia PBR, banh mi before they sold out farm-to-table VHS viral locavore cosby sweater.</p>
    </div>
  </div>

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
<script>    $(function(){      // 이미지 슬라이드 컨트롤를 사용하기 위해서는 carousel를 실행해야한다.      
$('#carousel-example-generic').carousel({        // 슬리아딩 자동 순환 지연 시간        // false면 자동 순환하지 않는다.        
    interval: 1000,        // hover를 설정하면 마우스를 가져대면 자동 순환이 멈춘다.        
    pause: "hover",        // 순환 설정, true면 1 -> 2가면 다시 1로 돌아가서 반복        
    wrap: true,        // 키보드 이벤트 설정 여부(?)        
    keyboard : true	  });	});  
    </script>

<script src="/resources/JS/sell.js"></script>  
 </body>
</html>