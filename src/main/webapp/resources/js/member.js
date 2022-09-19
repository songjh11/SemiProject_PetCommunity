

//======================전체동의 =======================
function check(){

    const all = document.getElementById("all"); //전체선택
    const cb = document.getElementsByClassName("cb"); //checkbutton
    const req = document.getElementsByClassName("req"); //필수
    const join = document.getElementById("join"); //조인페이지로
    const frm = document.getElementById("frm"); //form

//약관동의 필수값 체크

    join.addEventListener("click", function(){

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
    })


    //전체동의 체크하면 모두 체크하기
    all.addEventListener("click", function(){
        for(let i=0;i<cb.length;i++){
            cb[i].checked=all.checked;
        }
    })

    //동의 값 해제하면 전체동의 버튼도 해제

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


}