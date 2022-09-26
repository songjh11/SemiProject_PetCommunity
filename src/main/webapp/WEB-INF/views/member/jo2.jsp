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
<!-- ======= Add Items Section ======= -->
    <section id="book-a-table" class="book-a-table">
      <div class="container" data-aos="fade-up">

        <div class="section-header">
          <p><span>Join page</span></p>
        </div>

          <div class="col-lg-8 align-items-center">
            <form action="join" method="post" data-aos="fade-up" data-aos-delay="100" enctype="multipart/form-data" id="addItemFrm">
              <div class="row gy-4">
                <div class="col-lg-8 col-md-12">
                  <input type="text" name="userId" class="form-control" placeholder="User ID">
                  <div class="validate"></div>
                </div>
                <div class="col-lg-8 col-md-12">
                  <input type="text" name="password" class="form-control" placeholder="password">
                  <div class="validate"></div>
                </div>
                <div class="col-lg-8 col-md-12">
                  <input type="text" name="userName" class="form-control" placeholder="User Name">
                  <div class="validate"></div>
                </div>
                <div class="col-lg-8 col-md-12">
                  <input type="text" name="userId" class="form-control" id="userId" placeholder="User ID">
                  <div class="validate"></div>
                </div>
                <div class="col-lg-8 col-md-12">
                  <input type="number" name="phone" class="form-control" id="userId" placeholder="Phone">
                  <div class="validate"></div>
                </div>
                <div class="col-lg-8 col-md-12">
                  <input type="email" name="email" class="form-control" placeholder="Email">
                  <div class="validate"></div>
                </div>

                <div class="col-lg-6 col-md-6">
                  <input type="text" name="itemZipCode" class="form-control" id="itemZipCode" placeholder="우편번호">
                   <div class="validate"></div>
                 </div>
                 <div class="col-lg-6 col-md-6">
                   <button type="button" id="address_kakao" onclick="execDaumPostcode();">주소 검색</button>
                 </div>
                 <div class="col-lg-12 col-md-12">
                  <input type="text" name="address" class="form-control" id="address" placeholder="주소">
                 </div>
                 <div class="col-lg-12 col-md-12">
                   <input type="text" name="deAddress" class="form-control" id="deAaddress" placeholder="상세 주소">
                   <div class="validate"></div>
                 </div>

                <c:if test="${param.roleNum == '1'}">
                  <div class="col-lg-4 col-md-6">
                    <select name="itemCatg" class="form-control" id="itemCatg">
                      <option value='' selected>-- 상품 카테고리 선택 --</option>
                      <option value="1">호텔링</option>
                      <option value="2">원데이클래스</option>
                      <option value="3">트레이닝</option>
                    </select>
                    <div class="validate"></div>
                  </div>
                </c:if>
                </div>
                
               
             
                <c:if test="${param.roleNum == '2'}">

                  <div class="col-lg-8 col-md-6">
                    <input type="text" class="form-control" name="petCatg" placeholder="Pet Categori">
                    <div class="validate"></div>
                  </div>

                  <div class="col-lg-8 col-md-6">
                    <input type="text" class="form-control" name="petName" placeholder="Pet Name">
                    <div class="validate"></div>
                  </div>

                  <div class="col-lg-8 col-md-6">
                    <input type="file" class="form-control" name="photo" id="files" placeholder="Pet Photo">
                    <div class="validate"></div>
                  </div>

                </c:if>

                <div class="col-lg-4 col-md-6">
                   <button type="button" id="sellfileAdd">상품 사진 추가</button>
                  </div>
                             
                  <h4 id="po">필수항목에 동의하셔야 로그인 페이지로 이동합니다.</h4>

                  <h5><strong>전체동의 <input type="checkbox" id="all"></strong></h5>
                  <div></div>
  
                  개인정보 동의 약관(필수)<input type="checkbox" class="cb req" name="agValue" value="1">
                  <div class="form-group mt-3">
	                <div class="form-control col" name="itemContents" rows="5">

                    제 1 조 (목적)
                    본 약관은 문화체육관광부 대표누리집 (이하 "누리집")이 제공하는 모든 서비스(이하 "서비스")의 이용조건 및 절차, 이용자와 누리집의 권리, 의무, 책임사항과 기타 제반 사항을 규정함을 목적으로 합니다.
                    
                    제 2 조 (약관의 명시와 개정)
                    1. 누리집은 이 약관의 내용과 주소지, 관리자의 성명, 개인정보보호 담당자의 성명, 연락처(전화, 팩스, 전자우편 주소 등) 등을 이용자가 알 수 있도록 누리집의 초기 서비스화면(전면)에 게시합니다.
                    2. 누리집은 약관의 규제에 관한 법률, 전자거래기본법, 전자서명법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
                    3. 누리집이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 누리집의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일 까지 공지합니다.
                    4. 이 약관에 동의하는 것은 정기적으로 웹을 방문하여 약관의 변경사항을 확인하는 것에 동의함을 의미합니다. 변경된 약관에 대한 정보를 알지 못해 발생하는 이용자의 피해는 누리집에서 책임지지 않습니다.
                    5. 회원은 변경된 약관에 동의하지 않을 경우 회원 탈퇴(해지)를 요청할 수 있으며, 변경된 약관의 효력 발생일로부터 7일 이후에도 거부의사를 표시하지 아니 하고 서비스를 계속 사용할 경우 약관의 변경 사항에 동의한 것으로 간주됩니다.
                    6. 본 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 및 기타 관련 법령의 규정에 의합니다.
                    제 3 조 (용어의 정의)
                    1. 본 약관에서 사용하는 용어의 정의는 다음과 같습니다.
                    ① 이용계약 : 서비스 이용과 관련하여 누리집과 이용자 간에 체결하는 계약
                    ② 가입 : 누리집이 제공하는 신청서 양식에 해당 정보를 기입하고, 본 약관에 동의하여 서비스 이용계약을 완료시키는 행위
                    ③ 회원 : 누리집에 회원가입에 필요한 개인 정보를 제공하여 회원 등록을 한 자로서, 누리집의 정보 및 서비스를 이용할 수 있는 자
                    ④ 이용자번호(ID) : 이용고객의 식별과 이용자가 서비스 이용을 위하여 이용자가 정하고 누리집이 승인하는 문자와 숫자의 조합
                    ⑤ 비밀번호(PW) : 이용자가 등록회원과 동일인인지 신원을 확인하고 통신상의 자신의 개인정보보호를 위하여 이용자 자신이 정한 문자와 숫자의 조합
                    ⑥ 게시물 : 회원이 서비스를 이용하면서 게시한 글, 이미지, 동영상 등 각종 파일과 링크 등
                    ⑦ 탈퇴(해지) : 서비스 또는 회원이 이용계약을 종료하는 행위
                    2. 본 약관에서 정의하지 않은 용어는 개별서비스에 대한 별도약관 및 이용규정에서 정의합니다.
                
                  </div>
	                <div class="validate"></div>
                </div>
                
              
              
              </div>
              <br>
             <div class="text-center">
             	<button type="submit" id="addItemBtn">상품 등록</button>
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
                    document.getElementById("address").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('itemZipCode').value = data.zonecode;
                document.getElementById("address").value = addr += extraAddr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("deAddress").focus();
            }
        }).open();
    }//kakao api 끝
</script>

<script src="/resources/JS/member.js"></script>

  
</body>
</html>