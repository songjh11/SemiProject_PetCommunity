    const all = document.getElementById("all"); //전체선택
    const cb = document.getElementsByClassName("cb"); //checkbutton
    const req = document.getElementsByClassName("req"); //필수
    const join = document.getElementById("join"); //조인페이지로
    const frm = document.getElementById("frm"); //form


    //===============로그인 조건 값 주기&경고창================

    const btn = document.getElementById("btn");
    const uname = document.getElementById("userId");
    const password = document.getElementById("password");
    const password2 = document.getElementById("password2");
    const userName = document.getElementById("userName");
    const email = document.getElementById("email");
    const phone = document.getElementById("phone");
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

    //============전체동의 체크하면 모두 체크하기==================
    all.addEventListener("click", function(){
    console.log("dkdkdkdk");
    for(let i=0;i<cb.length;i++){
        cb[i].checked=all.checked;
    }
    });

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

        
    });
}

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
        console.log(roleNum);
        console.log(userIdCheck);
        console.log(pwCheck);
        console.log(pw2Check);
        console.log(userNameCheck);
        console.log(emailCheck);
        console.log(phoneCheck);
        console.log(itemZipCodeCheck);
        console.log("주소체크"+addressCheck);
        console.log(deAddressCheck);
        console.log(petCatgCheck);
        console.log(petNameCheck);
        console.log(filesCheck);

        if(itemZipCode.value != null){
            itemZipCodeCheck=true;
        }
        if(address.value != null){
            addressCheck=true;
        }

         //=============로그인 조건 제출 시 확인========================

         if(roleNum==1){if( 
            userIdCheck==true && pwCheck==true && pw2Check==true && userNameCheck==true 
            && emailCheck==true && phoneCheck==true 
            && itemZipCodeCheck==true && addressCheck==true && deAddressCheck==true && itemCatgCheck==true){
            frm.submit();
          }else{
            alert("필수 항목을 다시 확인하세요.")}
         }else if(roleNum==2){
            if(
                userIdCheck==true && pwCheck==true && pw2Check==true && userNameCheck==true && emailCheck==true
                && phoneCheck==true && itemZipCodeCheck==true && addressCheck==true && deAddressCheck==true 
                && petCatgCheck==true &&  petNameCheck==true && filesCheck==true){
              frm.submit();
              }else{
                alert("필수 항목을 다시 확인하세요.")}

         }else if(roleNum==0){if(
            userIdCheck==true && pwCheck==true && pw2Check==true && userNameCheck==true && emailCheck==true
             && phoneCheck==true && itemZipCodeCheck==true && addressCheck==true && deAddressCheck==true){
          frm.submit();
          }else{
            alert("필수 항목을 다시 확인하세요.")
         }
        
    }else{
        alert("필수 항목을 다시 확인하세요.")
    }
}

});





    userId.addEventListener("blur", function(){

        if(userId.value.length<2){
            userId.focus();
            userIdCheck=false;
            d1.innerHTML='ID는 2글자 이상이어야합니다';
          
        }else {
            userIdCheck=true;
            d1.innerHTML='';
        }
    
        });
    
        password.addEventListener("change", function(){
    
        if(password.value.length<5){
            password.focus();
            pwCheck=false;
            d2.innerHTML='비밀번호는 6글자 이상이어야합니다';
            
        }else {
            pwCheck=true;
            d2.innerHTML='';
            password2.value="";
        }
        });
    
        password2.addEventListener("blur", function(){
    
        if(password.value != password2.value){
            password2.focus();
            pw2Check=false;
            d2_1.innerHTML='비밀번호가 불일치합니다';
            password2.value='';
        }else {
            pw2Check=true;
            d2_1.innerHTML='';
           
        }
    
        });
    
        userName.addEventListener("blur", function(){
    
        if(password.value.length<1){
            userName.focus();
            userNameCheck=false;
            d3.innerHTML='이름을 입력해주세요.';
        }else {
            userNameCheck=true;
            d3.innerHTML='';
    
        }
    
        });

    
        phone.addEventListener("blur", function(){
    
        if(phone.value.length<1){
            phone.focus();
            phoneCheck=false;
            d4.innerHTML='번호를 입력해주세요.';
        }else {
            phoneCheck=true;
            d4.innerHTML='';
        }
    
        });

           
        email.addEventListener("blur", function(){
    
            if(email.value.length<1){
                email.focus();
                emailCheck=false;
                d5.innerHTML='이메일을 입력해주세요.';
            }else {
                emailCheck=true;
                d5.innerHTML='';
            }
        
            });
    
        deAddress.addEventListener("blur", function(){
    
        if(deAddress.value.length<1){
            deAddress.focus();
            deAddressCheck=false;
            d8.innerHTML='상세주소를 입력해주세요.';
        }else {
            deAddressCheck=true;
            d8.innerHTML='';
        }
    
        });

        if(roleNum==1){

            itemCatg.addEventListener("blur", function(){
    
                if(itemCatg.value.length<1){
                    itemCatg.focus();
                    itemCatgCheck=false;
                    d9.innerHTML='상품 카테고리를 입력해주세요.';
                }else {
                    itemCatgCheck=true;
                    d9.innerHTML='';
                }
            
                });
    

        }else if(roleNum==2){

            petCatg.addEventListener("blur", function(){
    
                if(petCatg.value.length<1){
                    petCatg.focus();
                    petCatgCheck=false;
                    d10.innerHTML='반려견 종을 입력해주세요.';
                }else {
                    petCatgCheck=true;
                    d10.innerHTML='';
                }
            
                });
            
                petName.addEventListener("blur", function(){
            
                if(petName.value.length<1){
                    petName.focus();
                    petNameCheck=false;
                    d11.innerHTML='반려견 이름을 입력해주세요.';
                }else {
                    petNameCheck=true;
                    d11.innerHTML='';
                }
            
                });
            
                files.addEventListener("blur", function(){
            
                if(files.value.length<1){
                    files.focus();
                    filesCheck=false;
                    d12.innerHTML='반려견 사진을 등록해주세요.';
                }else {
                    filesCheck=true;
                    d12.innerHTML='';
                }
            
                });
        }else{

        }

                    //주소 api작용되는 부분의 값 변화를 blur,change로 체크가 안되어
            //join눌렀을 때 널값으로 체크함.
    
        // itemZipCode.addEventListener("change", function(){
    
        // if(itemZipCode.value.length<1){
        //     itemZipCode.focus();
        //     itemZipCodeCheck=false;
        //     d6.innerHTML='주소 검색해주세요.';
        // }else {
        //     itemZipCodeCheck=true;
        //     d6.innerHTML='';
        // }
    
        // });
        
        // address.addEventListener("change", function(){
    
        // if(address.value.length<1){
        //     address.focus();
        //     addressCheck=false;
        //     d7.innerHTML='주소를 입력해주세요.';
        // }else {
        //     addressCheck=true;
        //     d7.innerHTML='';
        // }
    
        // });
