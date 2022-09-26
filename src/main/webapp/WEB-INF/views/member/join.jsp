<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Join page</title>
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
    .col{
      background-color:cornsilk;
      overflow: scroll;
      width: 600px;
      height: 100px;
    }
    #po{
      font-size: 10pt;
      color: darkgray;
    }


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
<!-- ======= Join Section ======= -->
    <section id="book-a-table" class="book-a-table">
      <div class="container" data-aos="fade-up">

        <div class="section-header">
          <p><span>Join page</span></p>
        </div>
  

          <div class="col-lg-8 align-items-center">
            <form action="join" method="post" data-aos="fade-up" data-aos-delay="100" enctype="multipart/form-data">
              <div class="row gy-4">
                <div class="col-lg-8 col-md-12">
                  <input type="hidden" name="roleNum" value="${param.roleNum}">
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
                   <input type="text" name="deAddress" class="form-control" id="deAddress" placeholder="상세 주소">
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
  
                  이메일 동의 약관(필수) <input type="checkbox" class="cb req" name="agMail" value="1">
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

                메시지 동의 약관(선택) <input type="checkbox" class="cb" name="agMes" value=""> 

                  <div class="form-group mt-3">
	                <div class="form-control col" name="itemContents" rows="5">

                   제 9 조 (서비스 이용시간)
                   1. 서비스 이용시간은 누리집의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴, 1일 24시간을 원칙으로 합니다.
                   2. 제1항의 이용시간 중 정기점검 등의 필요로 인하여 누리집이 정한 날 또는 시간은 예외로 합니다.
                   제 10 조 (서비스의 중지 및 중지에 대한 공지)
                   1. 이용자는 누리집 서비스에 보관되거나 전송된 메시지 및 기타 통신 메시지 등의 내용이 국가의 비상사태, 정전, 누리집의 관리 범위 외의 서비스 설비 장애 및 기타 불가항력에 의하여 보관되지 못하였거나 삭제된 경우, 전송되지 못한 경우 및 기타 통신 데이터의 손실이 있을 경우에 누리집은 관련 책임을 부담하지 아니합니다.
                   2. 누리집이 정상적인 서비스 제공의 어려움으로 인하여 일시적으로 서비스를 중지하여야 할 경우에는 서비스 중지 전에 중지사유 및 일시를 공지한 후 서비스를 중지할 수 있으며, 회원이 공지내용을 인지하지 못한 데 대하여 누리집은 책임을 부담하지 아니합니다. 또한 위 서비스 중지에 의하여 본 서비스에 보관되거나 전송된 메시지 및 기타 통신 메시지 등의 내용이 보관되지 못하였거나 삭제된 경우, 전송되지 못한 경우 및 기타 통신 데이터의 손실이 있을 경우에 대하여도 누리집은 책임을 부담하지 아니합니다.
                   3. 누리집의 사정으로 서비스를 영구적으로 중단하여야 할 경우에는 제2항에 의거합니다.
                   4. 누리집은 사전 공지 후 서비스를 일시적으로 수정, 변경 및 중단할 수 있으며, 이에 대하여 회원 또는 제3자에게 어떠한 책임도 부담하지 아니합니다.
                   5. 누리집은 긴급한 시스템 점검, 증설 및 교체 등 부득이한 사유로 인하여 예고 없이 일시적으로 서비스를 중단할 수 있으며, 새로운 서비스로의 교체 등 누리집이 적절하다고 판단하는 사유에 의하여 현재 제공되는 서비스를 완전히 중단할 수 있습니다.
                   6. 누리집은 국가비상사태, 정전, 서비스 설비의 장애 또는 서비스 이용의 폭주 등으로 정상적인 서비스 제공이 불가능할 경우, 서비스의 전부 또는 일부를 제한하거나 중지할 수 있습니다. 다만 이 경우 그 사유 및 기간 등을 이용자에게 사전 또는 사후에 공지합니다.
                   7. 누리집은 누리집이 통제할 수 없는 사유로 인한 서비스 중단의 경우(시스템관리자의 고의 과실 없는 디스크장애, 시스템다운 등)에 사전통지가 불가능하며 타인(PC통신회사, 기간통신사업자 등)의 고의과실로 인한 시스템중단 등의 경우에는 통지하지 않습니다.
                   8. 누리집은 서비스를 특정범위로 분할하여 각 범위별로 이용가능시간을 별도로 지정할 수 있습니다. 다만 이 경우 그 내용을 공지합니다.
                   9. 누리집은 회원이 본 약관의 내용에 위배되는 행동을 한 경우, 임의로 서비스 사용을 제한 및 중지하거나 회원의 동의 없이 이용계약을 해지할 수 있습니다. 이 경우 누리집은 위 이용자의 접속을 금지할 수 있습니다.
                   제 11 조 (정보 제공 및 홍보물 게재)
                   1. 누리집은 서비스를 운영함에 있어서 각종 정보를 누리집에 게재하는 방법, 전자우편이나 서신우편 발송 등으로 회원에게 제공할 수 있습니다.
                   2. 누리집은 서비스에 적절하다고 판단되거나 공익성이 있는 홍보물을 게재할 수 있습니다.
              
                
                  </div>
	                <div class="validate"></div>
                </div>

              
                
              
              
              </div>
              <br>
             <div class="text-center">
             	<button type="submit" id="join">회원가입</button>
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

  <script>check();</script>
</body>
</html>