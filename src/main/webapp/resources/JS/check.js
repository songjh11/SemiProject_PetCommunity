var IMP = window.IMP; // 생략 가능
IMP.init("imp12326472"); // 예: imp00000000

var sellItemDTO = '${sellItemDTO}';

let totalPrice = document.getElementById("totalPrice");
const priceCount = document.getElementById("priceCount");
const itemPrice = document.getElementById("itemPrice");
let ipv = "";
const itemName = document.getElementById("itemName");
const itemNum2 = document.getElementById("itemNum");
let itn = "";
const itemCatg = document.getElementById("itemCatg");
let itg = "";
const revStartDate = document.getElementById("revStartDate");
let rsv ="";
const revEndDate = document.getElementById("revEndDate");
let rev = "";
const adultsCount = document.getElementById("adultsCount");
let ac = "";
const dogCount = document.getElementById("dogCount");
let dc = "";
const rvFrm = document.getElementById("rvFrm");
let date = new Date();
let merchant_uid = date.getTime();
const rvBtnFrm = document.getElementById("rvBtnFrm");

//===================================================날짜 계산
priceCount.addEventListener("click", function (){
  let dateResult = false;
  ipv = itemPrice.value;
  rsv = revStartDate.value;
  rev = revEndDate.value;
  ac = adultsCount.value;
  dc = dogCount.value;

  console.log("ipv", ipv);

  if(rsv.length<=0||rev.length<=0){
  alert("날짜를 입력하세요")
  return;
  } else{
    dateResult = true;
  }

if(ac.length<=0||dc.length<=0){
  alert("인원수 또는 반려견 수를 입력하세요")
  return;
} else{
  dateResult = true;
}

if(dateResult){
    const redate = new Date(revEndDate.value);
    const rsdate = new Date(revStartDate.value);
    let redateC = redate.getTime();
    let rsdateC = rsdate.getTime();
    if(redateC<rsdateC){
      alert("날짜를 다시 입력해주세요")
      return;
    } else{
      const tdate = (redateC - rsdateC) / (1000*60*60*24);
      console.log(tdate);
      let priceC = tdate*ipv+ac*10000+dc*10000;
      const totalPriceV = document.createAttribute("value");
      totalPriceV.value = priceC;
      totalPrice.setAttributeNode(totalPriceV);
    }
}

});


//==================================================================결제창 실행
rvBtnFrm.addEventListener("click", function(){
    let dateResult = false;
    itn = itemNum2.value;
    itg = itemCatg.value;
    rsv = revStartDate.value;
    rev = revEndDate.value;
    ac = adultsCount.value;
    dc = dogCount.value;
    tpv = totalPrice.value;

  
    if(tpv.length<=0){
    alert("예상 결제 금액을 확인해주세요")
    return;
    } else{
      dateResult = true;
    }
  
  if(dateResult){
    requestPay();
  } 
});

//=====================================================================결제 api
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
        buyer_tel: "010-4242-4242",
        revStartDate: rsv
    }, function (rsp) { // callback
        
        if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
            console.log("revStartDate",rsv);

            // jQuery로 HTTP 요청
            $.ajax({
                url: "./payments", // 예: https://www.myservice.com/payments/complete
                type: "POST",
                dataType: 'json',
                data: {
                    'imp_uid': rsp.imp_uid,
                    'merchant_uid': rsp.merchant_uid,
                    'pg': 'pg1',
                    'amount': tpv,
                    'revStartDate': rsv,
                    'itemNum': itn,
                    'itemCatg': itg,
                    'revEndDate': rev,
                    'adultsCount': ac,
                    'dogCount': dc

                 
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
