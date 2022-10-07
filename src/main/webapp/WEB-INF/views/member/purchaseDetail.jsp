<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page import="java.util.Date" %>
    <%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>${check.itemDTO.itemName}</title>
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

  <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

  <style>
    .crq{
        justify-content: center;
        text-align: center;
        margin-top: 20px;
      }
    
      .mainSection{
        display: flex;
        flex-direction: column;
        align-items: center;
        
      }

      .mainContents{
        display: flex;
        width: 80%;
      }  

      .outerBox{
          display: flex;
          justify-content: space-between;
          align-items:center;
          padding: 10px;
          border-width: 1px;
          border-style: solid;
          border-color: gainsboro;
          border-radius: 10px;
        }

        .innerBox{
          display: flex;
          justify-content: space-between;
          align-items:center;
          padding: 10px;
          border-width: 1px;
          border-style: solid;
          border-color: gainsboro;
          border-radius: 10px;
        }

         .buttonBox{
          display:flex;
          justify-content: space-between;
          align-items:center;
          padding:10px;
          writing-mode: horizontal-tb;
        }

        .textAre{
          display: flex;
          flex-direction: column;
        }

        .modalC{
          display: flex;
          flex-direction: column;
        }
        .checked {
          color: orange;
        }
        
        #rvBtnFrmP{
          writing-mode: horizontal-tb;
        }


  </style>
</head>
<body>
  <div>
    <!-- header start -->
    <c:import url="/WEB-INF/views/template/header.jsp"></c:import>
    <!-- header end -->
  </div>
  <div style="margin-top: 100px; width: 80%;">  
      <form action="purchaseDelete" method="post">
          <section class="mainSection">
            <div class="mainContents row gy-1">
              <div class="section-header">
                <p><span>결제 상세 내역</span><p>
              </div>
              <!-- text 영역 -->
              <div class="textAre col-lg-12 col-md-12 d-flex">
                <div>
                  <input type="hidden" id="merchant_uid" name="merchant_uid" value="${check.merchant_uid}"}>
                  <input type="hidden" id="imp_uid" name="imp_uid" value="${check.imp_uid}"}>
                  <table class="table table-striped">
                    <tbody>
                      <tr>
                        <td colspan="2">
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-briefcase" viewBox="0 0 16 16">
                          <path d="M6.5 1A1.5 1.5 0 0 0 5 2.5V3H1.5A1.5 1.5 0 0 0 0 4.5v8A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-8A1.5 1.5 0 0 0 14.5 3H11v-.5A1.5 1.5 0 0 0 9.5 1h-3zm0 1h3a.5.5 0 0 1 .5.5V3H6v-.5a.5.5 0 0 1 .5-.5zm1.886 6.914L15 7.151V12.5a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5V7.15l6.614 1.764a1.5 1.5 0 0 0 .772 0zM1.5 4h13a.5.5 0 0 1 .5.5v1.616L8.129 7.948a.5.5 0 0 1-.258 0L1 6.116V4.5a.5.5 0 0 1 .5-.5z"></path>
                          </svg>
                          <span style="font-size: 15px; color: rgb(0, 0, 0);"><strong>판매자명</strong></span>
                          <p style="margin-top: 3px;"><span><h5>${check.itemDTO.userId}</h5></span></p></td>
                      </tr>
                      <tr>
                        <td colspan="2">
                          <span style="font-size: 15px; color: rgb(0, 0, 0);"><strong>주문자명</strong></span>
                          <p style="margin-top: 3px;"><span><h5>${check.memberDTO.userName}</h5></span></p></td>
                      </tr>
                      <tr>
                        <td colspan="2">
                          <span style="font-size: 15px; color: rgb(0, 0, 0);"><strong>주문명</strong></span>
                          <p style="margin-top: 3px;"><span><h5>${check.itemDTO.itemName}</h5></span></p></td>
                      </tr>
                      <tr>
                        <td>
                          <span style="font-size: 15px; color: rgb(0, 0, 0);"><strong>예약 인원 수</strong></span>
                          <p style="margin-top: 3px;"><span><h5>${check.adultsCount}</h5></span></p></td>
                        </td> 
                        <td>
                          <span style="font-size: 15px; color: rgb(0, 0, 0);"><strong>예약 반려견 수</strong></span>
                          <p style="margin-top: 3px;"><span><h5>${check.dogCount}</h5></span></p></td>
                        </td> 
                    </tr>
                      <tr>
                        <td colspan="2">
                          <span style="font-size: 15px; color: rgb(0, 0, 0);"><strong>결제 금액</strong></span>
                          <p style="margin-top: 3px;"><span><h5>${check.amount} 원</h5></span></p></td>
                      </tr>
                      <tr>
                        <td colspan="2">
                          <span style="font-size: 15px; color: rgb(0, 0, 0);"><strong>결제 일자</strong></span>
                          <p style="margin-top: 3px;"><span><h5>${check.purchaseDate}</h5></span></p></td>
                      </tr>
                      <tr>
                          <td>
                            <span style="font-size: 15px; color: rgb(0, 0, 0);"><strong>시작 일자</strong></span>
                            <p style="margin-top: 3px;"><span><h5>${check.revStartDate}</h5></span></p></td>
                          </td> 
                          <td>
                            <span style="font-size: 15px; color: rgb(0, 0, 0);"><strong>종료 일자</strong></span>
                            <p style="margin-top: 3px;"><span><h5>${check.revEndDate}</h5></span></p></td>
                          </td> 
                      </tr>
                      </tbody>
                      </table>
                
                        <div style="margin-bottom: 15px; margin-top: 30px; text-align: center">
                          <button type="button" class="btn btn-outline-danger" style="display: inline-block;" onclick="cancelPay()">환불하기</button>
                        </div>
     
                </div>
                </div>
            </div>
          </section>  
        </form>
  </div>

 <!-- footer start -->
 <c:import url="/WEB-INF/views/template/footer.jsp"></c:import>
 <!-- footer end -->

 <!-- Vendor JS Files -->
 <script src="/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
 <script src="/resources/assets/vendor/aos/aos.js"></script>
 <script src="/resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
 <script src="/resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
 <script src="/resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
 <script src="/resources/assets/vendor/php-email-form/validate.js"></script>

 <!-- Template Main JS File -->
  <script src="/resources/assets/js/main.js"></script>

  <script src="https://code.jquery.com/jquery-3.3.1.min.js"
    integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script><!-- jQuery CDN --->
  <script>
    function cancelPay() {
      const imp_uid = document.getElementById("imp_uid");
      const merchant_uid = document.getElementById("merchant_uid")
      let iuv = imp_uid.value;
      let muv = merchant_uid.value;
      $.ajax({
        url: "./purchaseDelete", // 예: http://www.myservice.com/payments/cancel
        type: "POST",
        data: {
          'imp_uid': iuv,
          'merchant_uid': muv, // 예: ORD20180131-0000011
          'cancel_request_amount': 2000, // 환불금액
          'reason': "테스트 결제 환불" // 환불사유
        }
      }).done(function(result) { // 환불 성공시 로직
              console.log(result.msg);
              if(result.msg=="success"){
                alert("환불 성공!")
                window.location.href = 'http://localhost/member/purchaseList?purchaseStatus=1';
              } else{
                alert("환불 실패");
              }
          
    }).fail(function(error) { // 환불 실패시 로직
        console.log(error);
        alert("환불 실패");
    });
  };
    
  </script>
</body>
</html>