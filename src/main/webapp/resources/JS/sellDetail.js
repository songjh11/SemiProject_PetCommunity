const sellfileAdd = document.getElementById("sellfileAdd");
const imgDeleteBtn = document.querySelectorAll(".imgDeleteBtn");
const sellFileImages = document.getElementById("sellFileImages");
const realsellfileAdd = document.getElementById("realsellfileAdd");
const inputDiv = document.getElementById("inputDiv");
const imgDiv = document.getElementById("imgDiv");
const uFileDelete = document.querySelectorAll(".uFileDelete");

let count=0;
let idx=0;

function setCount(c){
    if(c>=0){
        count=c;
    }
}




//삭제 끝------------------------------------------------


//detail page: 파일 폴더에서 삭제=============================================================
deleteItem.addEventListener("click", function(){
    let result = window.confirm("삭제하시겠습니까?");
    if(!result){
        return;
    }

    let photoNum = deleteItem.getAttribute("data-photo-num");
    console.log(photoNum);

    const xhttp = new XMLHttpRequest();
    xhttp.open("post","./filedelete");
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("photoNum="+photoNum);

    xhttp.onreadystatechange=function(){
        if(xhttp.readyState==4&&xhttp.status==200){
            let result = xhttp.responseText.trim();
            if(result>0){
                console.log("삭제완");
                f.parentNode.remove();
            } else{
                console.log("삭제 실패");
            }
        }
    }

});





