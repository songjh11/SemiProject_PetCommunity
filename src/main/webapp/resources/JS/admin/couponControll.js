function deleteCoupon(){
    const deleteCoupon = document.getElementsByClassName("deleteCoupon");
    for(let i = 0; i<deleteCoupon.length; i++){
        
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

        
    }
}

function deleteMember(){
    const deleteMember = document.getElementsByClassName("deleteMember");
    for(let i = 0; i<deleteMember.length; i++){
    
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
        
    
    }
}


const tbody1= document.getElementById("tbody1"); 
let sharinguser = null;
const btn = document.getElementById("btn");
function getSharingList(page,userId){
    sharinguser = userId;
  
    console.log("같이해요 리스트");
    
    console.log(userId);

        const xhttp = new XMLHttpRequest();
        xhttp.open("GET","./sharinglist?page="+page+"&userId="+userId);
        xhttp.send();
        xhttp.addEventListener("readystatechange", function(){
            if(this.readyState == 4 && this.status==200){
                let result = JSON.parse(xhttp.responseText.trim());
                let pager = result.pager;
                // console.log(pager);
                let sharing = result.sharing;
                let staticBackdropLabel = document.getElementById("staticBackdropLabel");
                staticBackdropLabel.innerHTML = "같이해요";

                

                tbody1.innerHTML = "";

                for(let i = 0 ; i<sharing.length ; i++){
                    let tr = document.createElement("tr");
                    let td = document.createElement("td");
                    let text = document.createTextNode(sharing[i].title);
                    td.appendChild(text);
                    tr.appendChild(td);

                    td = document.createElement("td");
                    text = document.createTextNode(sharing[i].regDate);
                    td.appendChild(text);
                    tr.appendChild(td);

                    td = document.createElement("td");
                    text = document.createTextNode(sharing[i].hit);
                    td.appendChild(text);
                    tr.appendChild(td);

                    td = document.createElement("td");
                    td.setAttribute("class","delete");
                    td.setAttribute("data-num", sharing[i].num);
                    text = document.createTextNode("삭제");
                    td.appendChild(text);
                    tr.appendChild(td);

                    tbody1.appendChild(tr);
                }//for문 끝

                btn.click();

                const more = document.getElementById("more");
                page++;
                console.log(pager.totalPage);
                if(page > pager.totalPage){
                    more.classList.add("disabled");
                }else{
                    more.classList.remove("disabled");
                }

                more.addEventListener("click", function(){
                    const xhttp2 = new XMLHttpRequest();
                    xhttp2.open("GET","./sharinglist?page="+page+"&userId="+userId);
                    xhttp2.send();
                    xhttp2.onreadystatechange = function(){
                        if(this.readyState == 4 && this.status == 200){
                            let result = JSON.parse(xhttp2.responseText.trim());
                            sharing = result.sharing;
                            for(let i = 0 ; i<sharing.length ; i++){
                                let tr = document.createElement("tr");
                                let td = document.createElement("td");
                                let text = document.createTextNode(sharing[i].title);
                                td.appendChild(text);
                                tr.appendChild(td);
            
                                td = document.createElement("td");
                                text = document.createTextNode(sharing[i].regDate);
                                td.appendChild(text);
                                tr.appendChild(td);
            
                                td = document.createElement("td");
                                text = document.createTextNode(sharing[i].hit);
                                td.appendChild(text);
                                tr.appendChild(td);
            
                                td = document.createElement("td");
                                td.setAttribute("class","delete");
                                td.setAttribute("data-num", sharing[i].num);
                                text = document.createTextNode("삭제");
                                td.appendChild(text);
                                tr.appendChild(td);
            
                                tbody1.appendChild(tr);

                            }//for문 끝
                            page++;
                            console.log(pager.totalPage);
                            if(page > pager.totalPage){
                                more.classList.add("disabled");
                            }else{
                                more.classList.remove("disabled");
                            }
                          
                        }
                    }

                })

            //if문 끝
            }
        })//ajax 끝

}


// Sharing 삭제
tbody1.addEventListener("click", function(event){
    if(event.target.className = "delete"){
        let check = window.confirm("삭제하시겠습니까?");
        if(check == true){
            let num = event.target.getAttribute("data-num");
            
            const xhttp = new XMLHttpRequest();
            xhttp.open("POST","./sharingdelete");
            xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            xhttp.send("num="+num);
            xhttp.onreadystatechange = function(){
                if(this.readyState == 4 && this.status == 200){
                    let result = JSON.parse(xhttp.responseText.trim());

                    if(result == '1'){
                        alert("삭제 완료");
                        tbody1.innerHTML = "";
                        getSharingList('1',sharinguser);
                        // btn.click();
                    }else{
                        alert("삭제 실패");
                    }
                }
            }
        }
    }
})

//QNA 리스트 불러오기

let qnauser = null;
function getQnaList(page,userId){
    qnauser = userId;
  
    console.log("같이해요 리스트");
    
    console.log(userId);

        const xhttp = new XMLHttpRequest();
        xhttp.open("GET","./qnalist?page="+page+"&userId="+userId);
        xhttp.send();
        xhttp.addEventListener("readystatechange", function(){
            if(this.readyState == 4 && this.status==200){
                let result = JSON.parse(xhttp.responseText.trim());
                let pager = result.pager;
                // console.log(pager);
                let qna = result.qna;
                let staticBackdropLabel = document.getElementById("staticBackdropLabel");
                staticBackdropLabel.innerHTML = "같이해요";

                

                tbody1.innerHTML = "";

                for(let i = 0 ; i<qna.length ; i++){
                    let tr = document.createElement("tr");
                    let td = document.createElement("td");
                    let text = document.createTextNode(qna[i].title);
                    td.appendChild(text);
                    tr.appendChild(td);

                    td = document.createElement("td");
                    text = document.createTextNode(qna[i].regDate);
                    td.appendChild(text);
                    tr.appendChild(td);

                    td = document.createElement("td");
                    text = document.createTextNode(qna[i].hit);
                    td.appendChild(text);
                    tr.appendChild(td);

                    td = document.createElement("td");
                    td.setAttribute("class","delete");
                    td.setAttribute("data-num", qna[i].num);
                    text = document.createTextNode("삭제");
                    td.appendChild(text);
                    tr.appendChild(td);

                    tbody1.appendChild(tr);
                }//for문 끝

                btn.click();

                const more = document.getElementById("more");
                page++;
                console.log(pager.totalPage);
                if(page > pager.totalPage){
                    more.classList.add("disabled");
                }else{
                    more.classList.remove("disabled");
                }

                more.addEventListener("click", function(){
                    const xhttp2 = new XMLHttpRequest();
                    xhttp2.open("GET","./qnalist?page="+page+"&userId="+userId);
                    xhttp2.send();
                    xhttp2.onreadystatechange = function(){
                        if(this.readyState == 4 && this.status == 200){
                            let result = JSON.parse(xhttp2.responseText.trim());
                            qna = result.qna;
                            for(let i = 0 ; i<sharing.length ; i++){
                                let tr = document.createElement("tr");
                                let td = document.createElement("td");
                                let text = document.createTextNode(qna[i].title);
                                td.appendChild(text);
                                tr.appendChild(td);
            
                                td = document.createElement("td");
                                text = document.createTextNode(qna[i].regDate);
                                td.appendChild(text);
                                tr.appendChild(td);
            
                                td = document.createElement("td");
                                text = document.createTextNode(qna[i].hit);
                                td.appendChild(text);
                                tr.appendChild(td);
            
                                td = document.createElement("td");
                                td.setAttribute("class","delete");
                                td.setAttribute("data-num", qna[i].num);
                                text = document.createTextNode("삭제");
                                td.appendChild(text);
                                tr.appendChild(td);
            
                                tbody1.appendChild(tr);

                            }//for문 끝
                            page++;
                            console.log(pager.totalPage);
                            if(page > pager.totalPage){
                                more.classList.add("disabled");
                            }else{
                                more.classList.remove("disabled");
                            }
                          
                        }
                    }

                })

            //if문 끝
            }
        })//ajax 끝
}


// QNA 삭제
tbody1.addEventListener("click", function(event){
    if(event.target.className = "delete"){
        let check = window.confirm("삭제하시겠습니까?");
        if(check == true){
            let num = event.target.getAttribute("data-num");
            
            const xhttp = new XMLHttpRequest();
            xhttp.open("POST","./qnadelete");
            xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            xhttp.send("num="+num);
            xhttp.onreadystatechange = function(){
                if(this.readyState == 4 && this.status == 200){
                    let result = JSON.parse(xhttp.responseText.trim());

                    if(result == '1'){
                        alert("삭제 완료");
                        tbody1.innerHTML = "";
                        getQnaList('1',qnauser);
                        // btn.click();
                    }else{
                        alert("삭제 실패");
                    }
                }
            }
        }
    }
})