try {
    const deleteCoupon = document.getElementsByClassName("deleteCoupon");
    for(let i = 0; i<deleteCoupon.length; i++){
    deleteCoupon[i].addEventListener("click", function(){
        let couponNum = deleteCoupon.getAttribute("data-couponNum");
        console.log(couponNum);

        let check = window.confirm("삭제하시겠습니까?");

        if(!check){
            return;
        }

        const xhttp = new XMLHttpRequest();
        xhttp.open("POST","./deletecoupon");
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("couponNum="+couponNum);
        xhttp.onreadystatechange = function(){
            if(xhttp.readyState == 4 && xhttp.status==200){
                let result = xhttp.responseText.trim();
                if(result == 1){
                    alert("삭제 성공");
                    location.reload();
                }else{
                    alert("삭제 실패");
                }
            }
        }

    })
}

}catch (error) {
    
}

try {
    const deleteMember = document.getElementsByClassName("deleteMember");
    for(let i = 0; i<deleteMember.length; i++){
    deleteMember[i].addEventListener("click",function(){
        let userId = deleteMember[i].getAttribute("data-userId");

        let check = window.confirm("추방하시겠습니까?");
        if(!check){
            return;
        }

        const xhttp = new XMLHttpRequest();
        xhttp.open("POST","./deletemember");
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("userId="+userId);
        xhttp.onreadystatechange = function(){
            if(this.readyState == 4 && this.status == 200){
                let result = xhttp.responseText.trim();
                if(result == '1'){
                    alert("추방 성공");
                    location.reload();
                    return;
                }else{
                    alert("추방 실패");
                    return;
                }
            }
        }
        
    })
    }
} catch (error) {
    
}

try {
    const memberDetail = document.querySelectorAll(".memberDetail");
for(let i=0; i<memberDetail.length; i++){
    memberDetail[i].addEventListener("click",function(){
        let userId = memberDetail[i].getAttribute("data-userId");

        const xhttp = new XMLHttpRequest();
        xhttp.open("POST","./boardlist");
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("userId="+userId);
        xhttp.onreadystatechange = function(){
            if(this.readyState == 4 && this.status == 200){
                let result = xhttp.responseText.trim();
                result = JSON.parse(result);
                console.log(result);
                let sharing = result.sharing;
                console.log(sharing);

                let btn = document.querySelector("#btn");
                let boardlist = document.querySelector("#boardlist");
                let tbody = document.querySelector("#tbody");

                for(let i=0; i<sharing.length ; i++){
                    let tr = document.createElement("tr");
                    
                    let td = document.createElement("td");
                    let text = document.createTextNode(sharing[i].title);
                    td.appendChild(text);
                    tr.appendChild(td);

                    td=document.createElement("td");
                    text = document.createTextNode(sharing[i].regDate);
                    td.appendChild(text);
                    tr.appendChild(td);

                    td=document.createElement("td");
                    text = document.createTextNode(sharing[i].hit);
                    td.appendChild(text);
                    tr.appendChild(td);

                    tbody.appendChild(tr);

                }
                
                btn.click();
                return;

            }
        }
        return;
    })
}
} catch (error) {
    
}

function getQnaList(){
    
    const xhttp = new XMLHttpRequest();
        xhttp.open("POST","./boardlist");
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("userId="+userId);
        xhttp.onreadystatechange = function(){
            if(this.readyState == 4 && this.status == 200){
                let result = xhttp.responseText.trim();
                result = JSON.parse(result);
                console.log(result);
                let sharing = result.sharing;
                console.log(sharing);

                let btn = document.querySelector("#btn");
                let boardlist = document.querySelector("#boardlist");
                let tbody = document.querySelector("#tbody");

                for(let i=0; i<sharing.length ; i++){
                    let tr = document.createElement("tr");
                    
                    let td = document.createElement("td");
                    let text = document.createTextNode(sharing[i].title);
                    td.appendChild(text);
                    tr.appendChild(td);

                    td=document.createElement("td");
                    text = document.createTextNode(sharing[i].regDate);
                    td.appendChild(text);
                    tr.appendChild(td);

                    td=document.createElement("td");
                    text = document.createTextNode(sharing[i].hit);
                    td.appendChild(text);
                    tr.appendChild(td);

                    tbody.appendChild(tr);

                }
            }
        }
}