const btnPick = document.getElementsByClassName("btnPick");
for(let i=0;i<btnPick.length; i++){

    btnPick[i].addEventListener("click",function(){
            let itemNum = btnPick[i].getAttribute("data-item-num");
            const xHttp = new XMLHttpRequest();
            xHttp.open("POST","./pickadd");
            xHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xHttp.send("itemNum="+itemNum);
            xHttp.onreadystatechange = function(){
                if(xHttp.readyState == 4 && xHttp.status == 200){
                    let result = xHttp.responseText.trim();
                    if(result == 1){
                        alert("찜 등록 성공");
                        return;
                    }
                    else{
                        alert("이미 찜한 상품입니다");
                        return;
                    }
                }
            }
        });
} 