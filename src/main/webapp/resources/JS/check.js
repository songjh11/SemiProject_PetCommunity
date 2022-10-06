var IMP = window.IMP; // 생략 가능
IMP.init("imp12326472"); // 예: imp00000000

var sellItemDTO = '${sellItemDTO}';

let totalPrice = document.getElementById("totalPrice");
const priceCount = document.getElementById("priceCount");
const itemPrice = document.getElementById("itemPrice");
let ipv = "";
const itemName = document.getElementById("itemName");
let inv = "";
const itemNum2 = document.getElementById("itemNum");
let itn = "";
const itemCatg = document.getElementById("itemCatg");
let itg = "";
const buyer_email = document.getElementById("buyer_email");
let bev = "";
const buyer_name = document.getElementById("buyer_name");
let bnv = "";
const buyer_tel = document.getElementById("buyer_tel");
let btv = "";
const userId = document.getElementById("userId");
let uiv = "";
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
let msg = "";

//===================================================날짜 계산
priceCount.addEventListener("click", function (){
  let dateResult = false;
  ipv = itemPrice.value;
  rsv = revStartDate.value;
  rev = revEndDate.value;
  ac = adultsCount.value;
  dc = dogCount.value;

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
    bev = buyer_email.value;
    bnv = buyer_name.value;
    btv = buyer_tel.value;
    uiv = userId.value;
    inv = itemName.value;
  
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
        name: inv,
        amount: 100,//tpv
        buyer_email: bev,
        buyer_name: bnv,
        buyer_tel: btv,
        revStartDate: rsv,
        notice_url : 'http://localhost/member/purchaseList'
    }, function (rsp) { // callback
        // 결제검증
        if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
          // jQuery로 HTTP 요청
          $.ajax({
              url: "./payments", // 예: https://www.myservice.com/payments/complete
              type: "POST",
              data: {
                  'imp_uid': rsp.imp_uid,
                  'merchant_uid': rsp.merchant_uid,
                  'amount': tpv,
                  'revStartDate': rsv,
                  'itemNum': itn,
                  'revEndDate': rev,
                  'adultsCount': ac,
                  'dogCount': dc,
                  'userId': uiv
              },
              error : function(xhr,status,error){
                console.log(xhr.responseText);
                console.log(status);
                console.log(error);
                let data = xhr.responseText;
                console.log(data);
              },
              success : function(paymentResult){
                console.log(paymentResult);
                if(paymentResult=="paid") {
                  alert("결제에 성공하였습니다!")
                  window.location.href = 'http://localhost/member/purchaseList';
              }
              }})
          // .done(function (paymentResult) {
          //   console.log(paymentResult);
          //   if(paymentResult=="paid") {
          //     alert("결제에 성공하였습니다!")
          //     window.location.href = 'http://localhost/member/purchaseList';
          //   }
        } else {
          alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
          // location.reload(); 
        }
      })
  };