// boardComment.js


let page = 1;

const writer = document.querySelector("#writer");
const contents = document.querySelector("#contents");

try {
    
    const commentAdd = document.querySelector("#commentAdd");
    const commentList = document.querySelector("#commentList");
    const more = document.querySelector("#more");
    const num = commentAdd.getAttribute("data-num");
    const updateButton = document.querySelector("#updateButton");
    
    
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
                    sock.send(userName+","+window.location.href+","+writer.value+","+"님이 댓글을 작성했습니다.");
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
                let pager = result.pager;
                let tab_tbody = document.createElement("tbody");
    
                for(let i=0 ; i < ar.length; i++){
                    let tab_tr = document.createElement("tr");
                    let tab_td = document.createElement("td");
                    let td_text = document.createTextNode(ar[i].writer);
                    tab_td.appendChild(td_text);
                    tab_tr.appendChild(tab_td);
                    
                    // tab_td = document.createElement("td");
                    // let div = document.createElement("div");
                    // div.setAttribute("style","width : 50px; height : 50px; border-radius : 70%; overflow : hidden;");
                    // let img = document.createElement("img");
                    // img.setAttribute()
                    // tab_td.appendChild(td_text);
                    // tab_tr.appendChild(tab_td);


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
    
    more.addEventListener("click", function(){
        page++;
        console.log(num);
        console.log(page);
        getCommentList(page,num);
    })
    
    
    //댓글 삭제 delete 이벤트 위임
    commentList.addEventListener("click", function(event){
        if(event.target.className == "delete"){
            let check = window.confirm("삭제하시겠습니까?");
            if(check == true){
                let commentNum = event.target.getAttribute("data-comment-num");
                console.log("num:",num);
    
                const xhttp = new XMLHttpRequest();
                xhttp.open("POST","./commentDelete");
                xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
                xhttp.send("commentNum="+commentNum);
                xhttp.onreadystatechange = function(){
                    if(this.readyState == 4 && this.status == 200){
                        let result = xhttp.responseText.trim();
                        console.log(result);
                        result = JSON.parse(result);
                        if(result == '1'){
                            alert("삭제 완료");
                            if(commentList.children.length != 0){
                                for(let i=0; i<commentList.children.length;){
                                    commentList.children[0].remove();
                                }
                            }
    
                            page = 1;
                            getCommentList(page,num);
                        }else{
                            alert("삭제 실패");
                        }
                    }
                }
            }
        }
    
        if(event.target.className == "update"){
            let check = window.confirm("수정하시겠습니까")
            if(check == true){
                let contents = event.target.previousSibling.previousSibling.previousSibling.innerHTML;
                let writer = event.target.previousSibling.previousSibling.previousSibling.previousSibling.innerHTML;
                let commentNum = event.target.getAttribute("data-comment-num");
    
                document.querySelector("#updateWriter").value = writer;
                document.querySelector("#updateContents").value = contents;
                document.querySelector("#num").value = commentNum;
    
                document.querySelector("#up").click();
            }  
        }
    
    })
    
    
    
    //----------------- Modal 창 업데이트 버튼 클릭 이벤트 ------------------------------
    updateButton.addEventListener("click",function(){
        
        let data_contents = document.querySelector("#updateContents").value;
        let data_commentNum = document.querySelector("#num").value; 
        
        const xhttp = new XMLHttpRequest();
        xhttp.open("POST", "./commentUpdate");
        xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xhttp.send("commentNum="+data_commentNum+"&contents="+data_contents);
        xhttp.onreadystatechange = function(){
            if(this.readyState == 4 && this.status == 200){
                let result = xhttp.responseText.trim();
                result = JSON.parse(result);
    
                if(result == '1'){
                    alert("수정성공");
                    if(commentList.children.length !=0){
                        for(let i=0; i<commentList.children.length;){
                            commentList.children[0].remove();
                        }
                    }
    
                    page = 1;
                    getCommentList(page,num);
                }else{
                    alert("수정 실패");
                }
    
            }
        }
    
    })
} catch (error) {
    
}




//----------------------- 팔로우 -------------------------------

try {
    
    function setFollow(followee, follower){
        
        
        const follow = document.querySelector("#follow");
        follow.addEventListener("click",function(){
            if(followee == ""){
                alert("로그인이 필요합니다.");
                return;
            }
    
                const xhttp = new XMLHttpRequest();
                xhttp.open("POST","./addfollow");
                xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
                xhttp.send("follower="+follower+"&followee="+followee);
                xhttp.onreadystatechange = function(){
                    if(this.readyState == 4 && this.status==200){
                        let result = xhttp.responseText.trim();
                        result = JSON.parse(result);
                        if(result == '1'){
                            alert("팔로우 성공");
                        }else{
                            alert("팔로우 실패");
                        }
                    }
                }
        })     
    }
} catch (error) {
    
}



//--------------------------- 쿠폰 다운로드 기능 ---------------------------


try {
    
    function saveCoupon(cn, ui, n){
        
        
        const couponSave = document.querySelector("#couponSave");
        couponSave.addEventListener("click", function(){
            if(ui == ""){
                alert("로그인이 필요합니다.");
                return;
            }
    
            const xhttp = new XMLHttpRequest();
            xhttp.open("POST","./saveCoupon");
            xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            xhttp.send("couponNum="+cn+"&userId="+ui+"&num="+n);
            xhttp.onreadystatechange = function(){
                if(this.readyState == 4 && this.status == 200){
                    let result = xhttp.responseText.trim();
                    result = JSON.parse(result);
                    if(result == '1'){
                        alert("쿠폰 다운로드 성공");
                    }else{
                        alert("쿠폰 다운로드 실패");
                    }
                }
            }
        })
    }
} catch (error) {
    
}