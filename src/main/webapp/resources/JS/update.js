const password = document.getElementById("password");
const userName = document.getElementById("userName");
const email = document.getElementById("email");
const phone = document.getElementById("phone");
const update = document.getElementById("update");
const updatefrm = document.getElementById("updatefrm");

let pwCheck=true;
let userNameCheck=true;
let emailCheck=true;
let phoneCheck=true;

    const d2 = document.getElementById("d2");
    const d3 = document.getElementById("d3");
    const d4 = document.getElementById("d4");
    const d5 = document.getElementById("d5");
    
    password.addEventListener("change", function(){

    if(0<password.value.length && password.value.length<6){
        console.log(password.value.length);
        pwCheck=false;
        d2.innerHTML='비밀번호는 6글자 이상이어야합니다.';
        
    }else {
        console.log("???");
        pwCheck=true;
        d2.innerHTML='';
    }
    });

    userName.addEventListener("change", function(){

    if(userName.value.length==1){
        userNameCheck=false;
        d3.innerHTML='이름은 2글자 이상입력해주세요.';
    }else {
        userNameCheck=true;
        d3.innerHTML='';

    }

    });


    phone.addEventListener("change", function(){

    if(0<phone.value.length && phone.value.length<12){
        phoneCheck=false;
        d4.innerHTML='번호 형식에 맞게 입력해주세요.';
    }else { phoneCheck=true;
        d4.innerHTML='';}

    });
       
    email.addEventListener("change", function(){
        const e = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
        if(0<email.value.length){
            if(e.test(email.value) == false){
                emailCheck=false;
                d5.innerHTML='올바르지 않은 이메일입니다.';
            }else{ emailCheck=true;
                d5.innerHTML='';}
        }
    
        });

    update.addEventListener("click",function(){
        console.log(pwCheck);
        console.log(userNameCheck);
        console.log(emailCheck);
        console.log(phoneCheck);
   
        if(pwCheck==true && userNameCheck==true && emailCheck==true
            && phoneCheck==true){
                updatefrm.submit();
          }else{
            alert("수정 값을 다시 확인하세요.");
    }

    })