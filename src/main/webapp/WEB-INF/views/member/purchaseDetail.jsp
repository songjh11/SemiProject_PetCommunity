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

  <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
  <script>history.scrollRestoration = "manual"</script>

  <style>
    @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nabla&family=Nanum+Gothic:wght@700&family=Roboto:wght@100&display=swap');
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

        span{
          font-family: 'Gowun Dodum', sans-serif;
          font-family: 'Nabla', cursive;
          font-family: 'Nanum Gothic', sans-serif;
          font-family: 'Roboto', sans-serif;
        }
        
        .tableWrapper{
          border-top: 20px solid #ec2727;
          border-left: 2px solid #ec2727;
          border-right: 2px solid #ec2727;
          border-bottom: 20px solid #ec2727;
          opacity: 0.8;
        }

        .t{
          overflow: hidden;
          width: 100%;
        }

        /* .t>tbody>tr:nth-child(2n-1){
          
        } */

        .t>tbody>tr{
          border-bottom: 1px solid #bbbbbb;
        }

        .t>tbody>tr>td{
          padding: 15px;
        }


 


  </style>
</head>
<body>
  <div>
    <!-- header start -->
    <c:import url="/WEB-INF/views/template/header.jsp"></c:import>
    <!-- header end -->
  </div>

  <div style="display: flex; justify-content: center;">  
      <form action="purchaseDelete" method="post">
          <section class="mainSection">
            <div class="mainContents row gy-1">
              <div class="section-header" style="margin-top: 50px;">
                <c:choose>
                  <c:when test="${check.purchaseStatus eq 1}">
                    <p><span>결제 상세 내역</span><p>
                  </c:when>
                  <c:when test="${check.purchaseStatus eq 0}">
                    <p><span>결제 취소 내역</span></p>  
                  </c:when>
                </c:choose>
              </div>
              <!-- text 영역 -->
              <div class="textAre col-lg-12 col-md-12 d-flex">
                <div class="tableWrapper">
                  <input type="hidden" id="merchant_uid" name="merchant_uid" value="${check.merchant_uid}"}>
                  <input type="hidden" id="imp_uid" name="imp_uid" value="${check.imp_uid}"}>
                  <input type="hidden" id="amount" name="amount" value="${check.amount}"}>
                  <table class="t">
                    <tbody>
                      <tr>
                        <td colspan="2">
                          <i class="bi bi-shop"></i>
                          <span style="font-size: 15px; color: rgb(0, 0, 0);"><strong>판매자명</strong></span>
                          <p style="margin-top: 3px;"><span><h5>${check.itemDTO.userId}</h5></span></p>
                        </td>
                      </tr>
                      <tr>
                        <td colspan="2">
                          <span style="font-size: 15px; color: rgb(0, 0, 0);"><strong>주문자명</strong></span>
                          <p style="margin-top: 3px;"><span><h5>${check.memberDTO.userName}</h5></span></p>
                        </td>
                      </tr>
                      <tr>
                        <td colspan="2">
                          <span style="font-size: 15px; color: rgb(0, 0, 0);"><strong>주문명</strong></span>
                          <p style="margin-top: 3px;"><span><h5>${check.itemDTO.itemName}</h5></span></p>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <span style="font-size: 15px; color: rgb(0, 0, 0);"><strong>예약 인원 수</strong></span>
                          <p style="margin-top: 3px;"><span><h5>${check.adultsCount}</h5></span></p>
                        </td>
                        </td> 
                        <td>
                          <span style="font-size: 15px; color: rgb(0, 0, 0);"><strong>예약 반려견 수</strong></span>
                          <p style="margin-top: 3px;"><span><h5>${check.dogCount}</h5></span></p>
                        </td>
                        </td> 
                    </tr>
                    <c:choose>
                      <c:when test="${check.purchaseStatus eq 0}">
                        <tr>
                          <td colspan="2">
                            <span style="font-size: 15px; color: rgb(0, 0, 0);"><strong>환불 금액</strong></span>
                            <p style="margin-top: 3px;"><span><h5>${check.amount} 원</h5></span></p>
                          </td>
                        </tr>
                      </c:when>
                      <c:when test="${check.purchaseStatus eq 1}">
                        <tr>
                          <td colspan="2">
                            <span style="font-size: 15px; color: rgb(0, 0, 0);"><strong>결제 금액</strong></span>
                            <p style="margin-top: 3px;"><span><h5>${check.amount} 원</h5></span></p>
                          </td>
                        </tr>
                      </c:when>
                    </c:choose>
                      <tr>
                        <td colspan="2">
                          <span style="font-size: 15px; color: rgb(0, 0, 0);"><strong>결제 일자</strong></span>
                          <p style="margin-top: 3px;"><span><h5>${check.purchaseDate}</h5></span></p></td>
                      </tr>
                      <tr>
                          <td>
                            <span style="font-size: 15px; color: rgb(0, 0, 0);"><strong>시작 일자</strong></span>
                            <p style="margin-top: 3px;"><span><h5>${revStartDate}</h5></span></p></td>
                          </td> 
                          <td>
                            <span style="font-size: 15px; color: rgb(0, 0, 0);"><strong>종료 일자</strong></span>
                            <p style="margin-top: 3px;"><span><h5>${revEndDate}</h5></span></p></td>
                          </td> 
                      </tr>
                      <c:if test="${check.purchaseStatus eq 0}">
                        <tr>
                          <td colspan="2">
                            <span style="font-size: 15px; color: rgb(0, 0, 0);"><strong>취소 일자</strong></span>
                            <p style="margin-top: 3px;"><span><h5>${check.cancelDTO.cancelDate}</h5></span></p></td>
                        </tr>
                        <tr>
                          <td colspan="2">
                            <span style="font-size: 15px; color: rgb(0, 0, 0);"><strong>환불 사유</strong></span>
                            <p style="margin-top: 3px;"><span><h5>${check.cancelDTO.reason}</h5></span></p></td>
                        </tr>
                      </c:if>  
                      </tbody>
                      </table>
                    </div>
                
                      <c:if test="${check.purchaseStatus eq 1}">
                        <div style="margin-bottom: 15px; margin-top: 30px; text-align: center">
                          <button type="button" class="btn btn-outline-danger" style="display: inline-block;" onclick="cancelPay()">환불하기</button>
                        </div>
                      </c:if>
              </div>
            </div>
          </section>  
        </form>
  </div>

 <!-- footer start -->
 <c:import url="/WEB-INF/views/template/footer.jsp"></c:import>
 <!-- footer end -->

  <script src="https://code.jquery.com/jquery-3.3.1.min.js"
    integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script><!-- jQuery CDN --->
  <script>
    function cancelPay() {
      const imp_uid = document.getElementById("imp_uid");
      const merchant_uid = document.getElementById("merchant_uid")
      const amount = document.getElementById("amount");
      let iuv = imp_uid.value;
      let muv = merchant_uid.value;
      let av = amount.value;
      $.ajax({
        url: "./purchaseDelete", // 예: http://www.myservice.com/payments/cancel
        type: "POST",
        data: {
          'imp_uid': iuv,
          'merchant_uid': muv, // 예: ORD20180131-0000011
          'amount': av, // 환불금액
          'reason': "구매자 결제 환불" // 환불사유
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