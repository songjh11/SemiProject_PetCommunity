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

  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e46b315f965ac58fabe9c3e350d385de&libraries=services"></script>

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
<div style="margin-top: 100px;">  
    <form action="purchaseDelete" method="post">
        <table>
                <tr>
                <td><input type="text" id="imp_uid" name="imp_uid" value="${check.imp_uid}">${check.imp_uid}</td>
                <td id="merchant_uid" name="merchant_uid" value="${check.merchant_uid}">${check.merchant_uid}</td>
                <td>${check.memberDTO.userName}</td>
                <td>${check.itemDTO.itemName}</td>
                <td id="amount" name="amount" value="${check.amount}">${check.amount}</td>
                </tr>    	
        </table>
        <button onclick="cancelPay()">환불하기</button>
        <section class="mainSection">
          <div class="mainContents row gy-1">
              <!-- image 영역 -->
              <div class="col-lg-6 col-md-6 d-flex">
                <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel" style="width:100%; height:100%; display: block;">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                          <c:forEach items="${sellItemDTO.fileDTOs}" var="ar" end="0">
                                        <img width="100%" height="100%" src="../resources/upload/sellfile/${ar.fileName}" class="d-block w-100" alt="...">
                          </c:forEach>  
                        </div>  
                            <c:forEach items="${sellItemDTO.fileDTOs}" var="ar" begin="1">
                                    <div class="carousel-item">
                                        <img width="100%" height="100%" src="../resources/upload/sellfile/${ar.fileName}" class="d-block w-100" alt="...">
                                    </div>
                            </c:forEach>  
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
              </div>
            <!-- text 영역 -->
            <div class="textAre col-lg-6 col-md-6 d-flex">
              <input type="hidden" id="itemNum" name="itemNum" value="${sellItemDTO.itemNum}">
              <input type="hidden" id="itemCatg" name="itemCatg" value="${sellItemDTO.itemCatg}">
              <input type="hidden" id="itemPrice" name="itemPrice" value="${sellItemDTO.itemPrice}">
              <input type="hidden" id="itemName" name="itemName" value="${sellItemDTO.itemName}">
              <input type="hidden" id="itemAddress" name="itemAddress" value="${sellItemDTO.itemAddress}">
              <input type="hidden" id="itemDeAddress" name="itemDeAddress" value="${sellItemDTO.itemDeAddress}">
              <input type="hidden" id="buyer_email" value="${sessionScope.member.email}">
              <input type="hidden" id="buyer_name" value="${sessionScope.member.userName}">
              <input type="hidden" id="buyer_tel" value="${sessionScope.member.phone}">
              <input type="hidden" id="userId" value="${sessionScope.member.userId}">
        
              <div>
                <table class="table table-striped">
                  <tbody>
                    <tr>
                      <td>
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-briefcase" viewBox="0 0 16 16">
                        <path d="M6.5 1A1.5 1.5 0 0 0 5 2.5V3H1.5A1.5 1.5 0 0 0 0 4.5v8A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-8A1.5 1.5 0 0 0 14.5 3H11v-.5A1.5 1.5 0 0 0 9.5 1h-3zm0 1h3a.5.5 0 0 1 .5.5V3H6v-.5a.5.5 0 0 1 .5-.5zm1.886 6.914L15 7.151V12.5a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5V7.15l6.614 1.764a1.5 1.5 0 0 0 .772 0zM1.5 4h13a.5.5 0 0 1 .5.5v1.616L8.129 7.948a.5.5 0 0 1-.258 0L1 6.116V4.5a.5.5 0 0 1 .5-.5z"></path>
                        </svg>
                        ${sellItemDTO.userId}</td>
                    </tr>
                    <tr>
                      <td><h1>${sellItemDTO.itemName}</h1></td>
                    </tr>
                    <tr>
                      <td>
                        <span style="font-size: 15px; color: rgb(0, 0, 0);"><strong>1일 이용 시</strong></span>
                        <p style="margin-top: 3px;"><span>${sellItemDTO.itemPrice} 원</span></p></td>
                    </tr>
                    <tr>
                      <td>
                        <span style="font-size: 15px; color: rgb(0, 0, 0);"><strong>유의사항</strong></span>
                        <p style="line-height: 2; text-align: justify;">
                          <span style="color: rgb(0, 0, 0);">
                          <strong><span style="letter-spacing: -0.5px;">☑&nbsp;</span></strong>
                          <span style="letter-spacing: -1px;">반려견 특성에 따라 교육 과정이 변경되거나 다를 수 있습니다.</span></span></p>
                      </td>      
                    </tr>
                    <tr>
                      <td>
                        <span style="font-size: 15px; color: rgb(0, 0, 0);"><strong>환불규정</strong></span>
                        <p style="line-height: 2; text-align: justify;">
                          <span style="color: rgb(0, 0, 0);">
                          <strong><span style="letter-spacing: -0.5px;">☑&nbsp;</span></strong>
                          <span style="letter-spacing: -1px;"> 예약 일자 3일 전까지 환불처리 가능합니다.</span></span></p>
                      </td>      
                    </tr>
                    </tbody>
                    </table>
              </div>
      </form>




</div>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script><!-- jQuery CDN --->
<script>
  function cancelPay() {
    const imp_uid = document.getElementById("imp_uid");
    const merchant_uid = document.getElementById("merchant_uid")
    let iuv = imp_uid.value;
    let muv = merchant_uid.value;
    jQuery.ajax({
      "url": "member/purchaseDelete", // 예: http://www.myservice.com/payments/cancel
      "type": "POST",
      "contentType": "application/json",
      "data": JSON.stringify({
        "merchant_uid": muv, // 예: ORD20180131-0000011
        "cancel_request_amount": 2000, // 환불금액
        "reason": "테스트 결제 환불" // 환불사유
      }),
      "dataType": "json"
    });
  }
</script>
</body>
</html>