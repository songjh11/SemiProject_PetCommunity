const btnPick = document.getElementsByClassName("btnPick");
const btnShopCart = document.getElementsByClassName("btnShopCart");
const count = document.getElementsByClassName("count");
const btnPickDelete = document.getElementsByClassName("btnPickDelete");
const btnShopCartDelete = document.getElementsByClassName("btnShopCartDelete");
let pickImgResult = true;

for(let i=0;i<btnPick.length; i++){

    btnPick[i].addEventListener("click",function(){
            let itemNum = btnPick[i].getAttribute("data-item-num");
            if(pickImgResult){
                btnPick[i].classList.remove('bi-bag-heart');
                btnPick[i].classList.add('bi-bag-heart-fill');
                pickImgResult = false;
              } else{
                btnPick[i].classList.remove('bi-bag-heart-fill');
                btnPick[i].classList.add('bi-bag-heart');
                pickImgResult = true;
              }  
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

for(let i=0;i<btnShopCart.length; i++){

    btnShopCart[i].addEventListener("click",function(){
            let itemNum = btnShopCart[i].getAttribute("data-item-num");
            let itemPrice = btnShopCart[i].getAttribute("data-item-price");
            const xHttp = new XMLHttpRequest();
            xHttp.open("POST","./shopcartadd");
            xHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xHttp.send("itemNum="+itemNum+"&itemPrice="+itemPrice);
            xHttp.onreadystatechange = function(){
                if(xHttp.readyState == 4 && xHttp.status == 200){
                    let result = xHttp.responseText.trim();
                    if(result == 1){
                        alert("장바구니 등록 성공");
                        return;
                    }
                    else{
                        alert("이미 장바구니에 담긴 상품입니다");
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
            let itemNum = btnPickDelete[i].getAttribute("data-item-num1");
            const xHttp = new XMLHttpRequest();
            xHttp.open("POST","../sell/pickdelete");
            xHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xHttp.send("itemNum="+itemNum);
            xHttp.onreadystatechange = function(){
                if(xHttp.readyState == 4 && xHttp.status == 200){
                    let result = xHttp.responseText.trim();
                    if(result == 1){
                        alert("찜 해제 성공");
                        return window.location.href='/member/test';
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
            let itemNum = btnShopCartDelete[i].getAttribute("data-item-num2");
            const xHttp = new XMLHttpRequest();
            xHttp.open("POST","../sell/shopcartdelete");
            xHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xHttp.send("itemNum="+itemNum);
            xHttp.onreadystatechange = function(){
                if(xHttp.readyState == 4 && xHttp.status == 200){
                    let result = xHttp.responseText.trim();
                    if(result == 1){
                        alert("장바구니에서 빼기 성공");
                        return window.location.href='/member/test';
                    }
                    else{
                        alert("장바구니에서 빼기 실패");
                        return;
                    }
                }
            }
        });
}