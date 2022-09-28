
function check(){

    const all = document.getElementById("all"); //전체선택
    const cb = document.getElementsByClassName("cb"); //checkbutton
    const req = document.getElementsByClassName("req"); //필수
    const join = document.getElementById("join"); //조인페이지로
    const frm = document.getElementById("frm"); //form

    const btn = document.getElementById("btn");
    const uname = document.getElementById("userId");
    const pw = document.getElementById("password");
    const pw2 = document.getElementById("password2");
    const name = document.getElementById("userName");
    const email = document.getElementById("phone");
    const phone = document.getElementById("email");
    const itemZipCode = document.getElementById("itemZipCode");
    const address = document.getElementById("address");
    const deAddress = document.getElementById("deAddress");
    const itemCatg = document.getElementById("itemCatg");
    const petCatg = document.getElementById("petCatg");
    const petName = document.getElementById("petName");
    const files = document.getElementById("files");

    const d1 = document.getElementById("d1");
    const d2 = document.getElementById("d2");
    const d2_1 = document.getElementById("d2_1");
    const d3 = document.getElementById("d3");
    const d4 = document.getElementById("d4");
    const d5 = document.getElementById("d5");
    const d6 = document.getElementById("d6");
    const d7 = document.getElementById("d7");
    const d8 = document.getElementById("d8");
    const d9 = document.getElementById("d9");
    const d10 = document.getElementById("d10");
    const d11 = document.getElementById("d11");
    const d12 = document.getElementById("d12");

    

    join.addEventListener("click", function(){

          //=============약관동의 필수값 체크=================

          let result = true;
          for(let j=0; j<req.length;j++){
              if(!req[j].checked){
                  result=false;
                  break;
              }
          }
  
         
  
          if(result){
  
            
              frm.submit();
            
          }else{
              alert("필수 약관에 동의하셔야합니다.")
          }
  

          //=============로그인 조건 제출 시 확인========================
    let userIdCheck=false;
    let pwCheck=false;
    let pw2Check=false;
    let userNameCheck=false;
    let emailCheck=false;
    let phoneCheck=false;
    let itemZipCodeCheck=false;
    let addressCheck=false;
    let deAddressCheck=false;
    let itemCatgCheck=false;
    let petCatgCheck=false;
    let petNameCheck=false;
    let filesCheck=false;

    if(unameCheck==true && pwCheck==true && pw2Check==true && nameCheck==true && emailCheck==true && phoneCheck==true ){
    frm.submit();
    }
    });
    
    }


    //============전체동의 체크하면 모두 체크하기==================
    all.addEventListener("click", function(){
        for(let i=0;i<cb.length;i++){
            cb[i].checked=all.checked;
        }
    })

    //=================동의 값 해제하면 전체동의 버튼도 해제============

    for(let i=0; i<cb.length;i++){

        cb[i].addEventListener("click", function(){

            let result = true;
            for(let j=0;j<cb.length;j++){
                if(!cb[j].checked){
                    result=false;
                    
                    break;
                }
            }

            all.checked=result;

            
        })
    }

    //=====================update 선택동의값 세팅 =====================

const update = document.getElementById("update");
const updatefrm = document.getElementById("updatefrm");
const radiomes = document.getElementById("radiomes");

update.addEventListener("click",function(){

    if(radiomes.checked){
        radiomes.value='1'
    }else{
        radiomes.value='0'
    }

    updatefrm.submit();

    })


//===============로그인 조건 값 주기&경고창================



userId.addEventListener("blur", function(){

    if(userId.value.length>1){
        userIdCheck=true;
        d1.innerHTML='';
    }else {
        userId.focus();
        userIdCheck=false;
        d1.innerHTML='ID는 2글자 이상이어야합니다';
    }

});
