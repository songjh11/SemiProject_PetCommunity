<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
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
     </style>
     
   </head>
 
<body>
   <!-- header start -->
   <c:import url="/WEB-INF/views/template/header.jsp"></c:import>
   <!-- header end -->
     
	
<section class="container-fluid col-lg-4">
<div class="row">
<h1>개인정보 동의 페이지</h1>
<h4 id="po">필수항목에 동의하셔야 로그인 페이지로 이동합니다.</h4>

<form id="frm" action="./join">

  <div>

  <h5><strong>전체동의 <input type="checkbox" id="all"></strong></h5>
  <div></div>

  개인정보 동의 약관(필수)<input type="checkbox" class="cb req" name="agValue" value="1">
  <div class="col">
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

  이메일 동의 약관(필수) <input type="checkbox" class="cb req" name="agMail" value="1">

  
  <div class="col">
    1. 수집하는 개인정보 항목
    문화체육관광부 대표 누리집의 이용자 참여와 이용통계 분석 등의 서비스를 위해 회원 가입시 아래의 개인정보를 수집하고 있습니다.
    
    가. 필수정보: 아이디, 이름, 성별, 출생년도, 비밀번호, 이메일
    나. 서비스 이용 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
    (접속로그, 접속IP정보, 쿠키, 방문 일시, 서비스 이용기록, 불량 이용 기록)
    2. 대표 누리집에서 이용자 회원가입 시 직접 개인정보를 입력 및 수정하여 개인정보를 수집합니다.
    3. 수집 개인정보의 이용목적
    회원가입, 회원활동 실적 관리, 회원탈퇴 의사 확인 등 회원관리
    제공되는 서비스 이용에 관한 인구통계학적 분석, 서비스 방문 및 이용기록 분석, 관심사에 기반한 맞춤형 서비스 등 제공
    신규 서비스 개발 및 활성화, 홍보 및 이벤트, 전자우편 서비스 등 정보 전달
    향후 법정 대리인 본인확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달 등
    4. 개인정보의 보유 및 이용기간
    이용자의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다.
    따라서 문화체육관광부 대표누리집은 최종 로그인 후 2년이 경과하였거나 정보주체의 회원 탈퇴 신청 시 회원의 개인정보를 지체 없이 파기합니다.
    
    동의 거부 권리 사실 및 불이익 내용
    이용자는 동의를 거부할 권리가 있습니다. 동의를 거부할 경우에는 서비스 이용에 제한됨을 알려드립니다.

  </div>
  메시지 동의 약관(선택) <input type="checkbox" class="cb" name="agMes" value="">
  
  <div class="col">
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
  
 </div>



  <button type="button" id="join">회원가입</button>

</form>
</div>
</section>
</body>
  <script src="/resources/js/member.js"></script>
  <script>
    check();
  </script>
</html>