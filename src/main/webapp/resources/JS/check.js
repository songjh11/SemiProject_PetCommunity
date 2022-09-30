
var IMP = window.IMP; // 생략 가능
IMP.init("imp12326472"); // 예: imp00000000
const itemName = document.getElementById("itemName");
const revStartDate = document.getElementById("revStartDate");
const revEndDate = document.getElementById("revEndDate");
const adultsCount = document.getElementById("adultsCount");
const dogCount = document.getElementById("dogCount");
const rvFrm = document.getElementById("rvFrm");
let date = new Date();
let merchant_uid = date.getTime();
const rvBtnFrm = document.getElementById("rvBtnFrm");

rvBtnFrm.addEventListener("click", function(){
    requestPay();
});

//결제 api
  function requestPay() {
    // IMP.request_pay(param, callback) 결제창 호출
    IMP.request_pay({ // param
        pg: "html5_inicis",
        pay_method: "card",
        merchant_uid: merchant_uid,
        name: $('#itemName').text(),
        amount: 100,//${sellItemDTO.itemPrice}
        buyer_email: "gildong@gmail.com",
        buyer_name: "홍길동",
        buyer_tel: "010-4242-4242"
    }, function (rsp) { // callback
        if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
            // jQuery로 HTTP 요청
            jQuery.ajax({
                url: "sell/verify_iamport/", // 예: https://www.myservice.com/payments/complete
                method: "POST",
                headers: { "Content-Type": "application/json" },
                data: {
                    imp_uid: rsp.imp_uid,
                    merchant_uid: rsp.merchant_uid
                }
            }).done(function (data) {
              // 가맹점 서버 결제 API 성공시 로직
            })
          } else {
            alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
          }
        })
    };