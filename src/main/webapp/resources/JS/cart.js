const btnCartDelete = document.getElementsByClassName("btnCartDelete")
for(let i=0; i<btnCartDelete.length; i++){

    btnCartDelete[i].addEventListener("click",function(){
          let result = window.confirm("장바구니에서 빼시겠습니까?");
          if(!result){
              return;
          }
          else{ 
              let itemNum = btnCartDelete[i].getAttribute("data-item-num");
              const xHttp = new XMLHttpRequest();
              xHttp.open("POST","../../../sell/shopcartdelete");
              xHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
              xHttp.send("itemNum="+itemNum);
              xHttp.onreadystatechange = function(){
                  if(xHttp.readyState == 4 && xHttp.status == 200){
                      let result = xHttp.responseText.trim();
                      if(result == 1){
                          alert("장바구니에서 빼기 성공");
                          return window.location.href="/member/cart";
                      }
                      else{
                          alert("장바구니에서 빼기 실패");
                          return;
                      }
                  }
              }
          }
    });
}