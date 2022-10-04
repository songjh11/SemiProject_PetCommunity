<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    purchaseDetail
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
    </form>
    <script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
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