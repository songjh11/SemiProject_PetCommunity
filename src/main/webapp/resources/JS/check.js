var IMP = window.IMP; // 생략 가능
IMP.init("imp12326472"); // 예: imp00000000
const itemName = document.getElementById("itemName");
const itemNum2 = document.getElementById("itemNum");
const itemCatg = document.getElementById("itemCatg");
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
            $.ajax({
                url: "./payments", // 예: https://www.myservice.com/payments/complete
                type: "POST",
                dataType: 'json',
                data: {
                    'imp_uid': rsp.imp_uid,
                    'merchant_uid': rsp.merchant_uid,
                    'pg': rsp.pg
                }
            }).done(function (data) {
              switch(data.status) {
                case "vbankIssued":
                  // 가상계좌 발급 시 로직
                  break;
                case "success":
                  // 결제 성공 시 로직
                  break;
              }
            })
          } else {
            alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
          }
        })
    };
