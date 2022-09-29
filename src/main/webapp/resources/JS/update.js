    //=====================update 선택동의값 세팅 =====================

    update.addEventListener("click",function(){

        const update = document.getElementById("update");
        const updatefrm = document.getElementById("updatefrm");
        const radiomes = document.getElementById("radiomes");
        console.log("수정하기;")
    if(radiomes.checked){
        radiomes.value='1'
    }else{
        radiomes.value='0'
    }

    updatefrm.submit();

    })