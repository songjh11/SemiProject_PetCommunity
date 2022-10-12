const btnPickFalse = document.getElementsByClassName("btnPickFalse");
const btnPickAdd = document.getElementsByClassName("btnPickAdd");
const btnPickDelete = document.getElementsByClassName("btnPickDelete");
const itemCatg = document.getElementById("itemCatg");
const count = document.getElementsByClassName("count");

for(let i=0;i<btnPickFalse.length; i++){
    btnPickFalse[i].addEventListener("click",function(){
        let result = window.confirm("찜은 로그인후 사용가능합니다. \n 로그인 화면으로 가시겠습니까?");
        if(!result){
            return;
        }
        else{
            return window.location.href='/member/login';
        }
    })
}

for(let i=0;i<btnShopCartFalse.length; i++){
    btnShopCartFalse[i].addEventListener("click",function(){
        let result = window.confirm("장바구니 담기는 로그인후 사용가능합니다. \n 로그인 화면으로 가시겠습니까?");
        if(!result){
            return;
        }
        else{
            return window.location.href='/member/login';
        }
    })
}

for(let i=0;i<btnPickAdd.length; i++){

    btnPickAdd[i].addEventListener("click",function(){
            let itemNum = btnPickAdd[i].getAttribute("data-item-num");
            const xHttp = new XMLHttpRequest();
            xHttp.open("POST","./pickadd");
            xHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xHttp.send("itemNum="+itemNum);
            xHttp.onreadystatechange = function(){
                if(xHttp.readyState == 4 && xHttp.status == 200){
                    let result = xHttp.responseText.trim();
                    if(result == 1){
                        alert("찜 등록 성공");
                        return window.location.href='/sell/list?itemCatg='+itemCatg.getAttribute("value");
                    }
                    else{
                        alert("찜 등록 실패");
                        return;
                    }
                }
            }
        });
}

for(let i=0;i<btnShopCartAdd.length; i++){

    btnShopCartAdd[i].addEventListener("click",function(){
            let itemNum = btnShopCartAdd[i].getAttribute("data-item-num");
            let itemPrice = btnShopCartAdd[i].getAttribute("data-item-price");
            const xHttp = new XMLHttpRequest();
            xHttp.open("POST","./shopcartadd");
            xHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xHttp.send("itemNum="+itemNum+"&itemPrice="+itemPrice);
            xHttp.onreadystatechange = function(){
                if(xHttp.readyState == 4 && xHttp.status == 200){
                    let result = xHttp.responseText.trim();
                    if(result == 1){
                        alert("장바구니 담기 성공");
                        return window.location.href='/sell/list?itemCatg='+itemCatg.getAttribute("value");
                    }
                    else{
                        alert("장바구니에 담기 실패");
                        return;
                    }
                }
            }
        });
} 

for(let i=0;i<count.length; i++){
    count[i].addEventListener("click",function(){
        let itemNum = count[i].getAttribute("data-item-num");
        let totalCount = count[i].value;
        const xHttp = new XMLHttpRequest();
        xHttp.open("POST","../sell/shopcartupdate");
        xHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xHttp.send("itemNum="+itemNum+"&totalCount="+totalCount);
        xHttp.onreadystatechange = function(){
            if(xHttp.readyState == 4 && xHttp.status == 200){
                let result = xHttp.responseText.trim();
                if(result == 1){
                    alert("수량 총합 변경 성공");
                    return window.location.href='/member/test';
                }
                else{
                    alert("수량 총합 변경 실패");
                    return;
                }
            }
        }
    });
}

for(let i=0;i<btnPickDelete.length; i++){

    btnPickDelete[i].addEventListener("click",function(){
            let itemNum = btnPickDelete[i].getAttribute("data-item-num");
            let userId = btnPickDelete[i].getAttribute("data-id");
            const xHttp = new XMLHttpRequest();
            xHttp.open("POST","../sell/pickdelete");
            xHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xHttp.send("itemNum="+itemNum+"&userId="+userId);
            xHttp.onreadystatechange = function(){
                if(xHttp.readyState == 4 && xHttp.status == 200){
                    let result = xHttp.responseText.trim();
                    if(result == 1){
                        alert("찜 해제 성공");
                        return window.location.href='/sell/list?itemCatg='+itemCatg.getAttribute("value");
                    }
                    else{
                        alert("찜 해제 실패");
                        return;
                    }
                }
            }
        });
}

for(let i=0;i<btnShopCartDelete.length; i++){

    btnShopCartDelete[i].addEventListener("click",function(){
            let itemNum = btnShopCartDelete[i].getAttribute("data-item-num");
            let userId = btnShopCartDelete[i].getAttribute("data-id");
            const xHttp = new XMLHttpRequest();
            xHttp.open("POST","../sell/shopcartdelete");
            xHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xHttp.send("itemNum="+itemNum+"&userId="+userId);
            xHttp.onreadystatechange = function(){
                if(xHttp.readyState == 4 && xHttp.status == 200){
                    let result = xHttp.responseText.trim();
                    if(result == 1){
                        alert("장바구니에서 빼기 성공");
                        return window.location.href='/sell/list?itemCatg='+itemCatg.getAttribute("value");
                    }
                    else{
                        alert("장바구니에서 빼기 실패");
                        return;
                    }
                }
            }
        });
}