// boardComment.js


getCommentList();

const writer = document.querySelector("#writer");
const contents = document.querySelector("#contents");
const commentAdd = document.querySelector("#commentAdd");
const commentList = document.querySelector("#commentList");
const num = commentAdd.getAttribute("data-num");

commentAdd.addEventListener("click", function(){

    const xhttp = new XMLHttpRequest();
    xhttp.open("POST", "./commentAdd");
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("num="+num+"&writer="+writer.value+"&contents="+contents.value);
    
    xhttp.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            let result = xhttp.responseText.trim();
            result = JSON.parse(result);
            if(result == 1 && writer.value != "" && contents.value != ""){
                writer.value = "";
                contents.value = "";
                alert("댓글 작성 완료");
            }else{
                alert("댓글 작성 실패");
            }
        }
    }


})


function getCommentList(){
    
    const xhttp = new XMLHttpRequest();
    xhttp.open("GET", "./commentList");
    xhttp.send();
    xhttp.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            let result = xhttp.responseText.trim();
            result = JSON.parse(result);

            let ar = result.list;
            let pager = result.pager;
            let tab_tbody = document.createElement("tbody");

            for(let i=0 ; ar.length; i++){
                let tab_tr = document.createElement("tr");
                let tab_td = document.createElement("td");
                tab_td.innerHTML = ar[i].writer
                tab_tr.appendChild(tab_td);
               
                tab_td = document.createElement("td");
                tab_td.innerHTML = ar[i].contents;
                tab_tr.appendChild(tab_td);
               
                tab_td = document.createElement("td");
                tab_td.innerHTML = ar[i].regDate;
                tab_tr.appendChild(tab_td);

                tab_tbody.appendChild(tab_tr);

            }


        }
    }
}