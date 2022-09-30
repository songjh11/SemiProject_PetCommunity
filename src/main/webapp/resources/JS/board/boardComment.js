// boardComment.js


let page = 1;

const writer = document.querySelector("#writer");
const contents = document.querySelector("#contents");
const commentAdd = document.querySelector("#commentAdd");
const commentList = document.querySelector("#commentList");
const more = document.querySelector("#more");
const num = commentAdd.getAttribute("data-num");

getCommentList(page,num);

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

                if(commentList.children.length != 0){
                    for(i=0; i < commentList.children.length;){
                        commentList.children[0].remove();
                    }
                }
                page = 1;
                getCommentList(page,num);
            }else{
                alert("댓글 작성 실패");
            }
        }
    }


})


function getCommentList(p,n){
    
    const xhttp = new XMLHttpRequest();
    xhttp.open("GET", "./commentList?page="+page+"&num="+num);
    xhttp.send();
    xhttp.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            let result = xhttp.responseText.trim();
            result = JSON.parse(result);

            let ar = result.list;
            console.log(result);
            console.log(ar[0].writer);
            let pager = result.pager;
            let tab_tbody = document.createElement("tbody");

            for(let i=0 ; i < ar.length; i++){
                let tab_tr = document.createElement("tr");
                let tab_td = document.createElement("td");
                let td_text = document.createTextNode(ar[i].writer);
                tab_td.appendChild(td_text);
                tab_tr.appendChild(tab_td);
               
                tab_td = document.createElement("td");
                td_text = document.createTextNode(ar[i].contents);
                tab_td.appendChild(td_text);
                tab_tr.appendChild(tab_td);
               
                tab_td = document.createElement("td");
                td_text = document.createTextNode(ar[i].regDate);
                tab_td.appendChild(td_text);
                tab_tr.appendChild(tab_td);

                tab_td = document.createElement("td");
                tab_td.setAttribute("class","delete");
                tab_td.setAttribute("data-comment-num",ar[i].commentNum);
                td_text = document.createTextNode("삭제");
                tab_td.appendChild(td_text);
                tab_tr.appendChild(tab_td);

                tab_td = document.createElement("td");
                tab_td.setAttribute("class","update");
                tab_td.setAttribute("data-comment-num",ar[i].commentNum);
                td_text = document.createTextNode("수정");
                tab_td.appendChild(td_text);
                tab_tr.appendChild(tab_td);
            
                tab_tbody.appendChild(tab_tr);
            }


            if(page >= pager.totalPage){
                more.classList.add("disabled");
            }else{
                more.classList.remove("disabled");
            }

            commentList.appendChild(tab_tbody);

        }
    }
}