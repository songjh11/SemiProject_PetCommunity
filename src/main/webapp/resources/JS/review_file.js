const fileAdd = document.getElementById("fileAdd");
const addFiles = document.getElementById("addFiles");
const fileDelete = document.querySelectorAll(".fileDelete");

//---------------------------------File Update 시 File Delete ------------------------------

fileDelete.forEach(function(f){
    f.addEventListener("click", function(){
        console.log("delete");
        let check = window.confirm("삭제하시겠습니까?");
        if(!check){
            return;
        }

        let fileNum = f.getAttribute("data-file-num");

        //1. 전송할 객체 생성
        const xhttp = new XMLHttpRequest();

        //2. Method, URL 준비
        xhttp.open("POST","./fileDelete");

        //3. Enctype, Post 방식 일 경우
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

        //4. 전송
        xhttp.send("photoNum="+fileNum);

        //5. 응답처리
        xhttp.onreadystatechange = function(){
            if(xhttp.readyState == 4 && xhttp.status == 200){
                let result = xhttp.responseText.trim();

                if(result == 1){
                    console.log(result);
                    f.parentNode.remove();
                    count--;
                }else{
                    console.log(result);
                }
            }
        }

    })
})








//---------------------------------FileAdd, Delete ------------------------------
let count = 0;
let idx = 0;
function setCount(c){
    if(c>=0){
        count = c;
    }
}
fileAdd.addEventListener("click", function(){

    count++;
    idx++;
    if(count > 5){
        alert("파일첨부는 최대 5개 입니다.")
        count--;
        return;
    }

    let fileAdd_div = document.createElement("div");
    fileAdd_div.setAttribute("class", "mb-3");

    let fileAdd_input = document.createElement("input");
    fileAdd_input.setAttribute("class", "form-control");
    fileAdd_input.setAttribute("type","file");
    fileAdd_input.setAttribute("id","file"+idx);
    fileAdd_input.setAttribute("name","files");

    let filedelete = document.createElement("button");
    filedelete.innerHTML="삭제";
    filedelete.setAttribute("class","del");
    filedelete.setAttribute("type","button");
    filedelete.setAttribute("title",idx);

    
    fileAdd_div.append(fileAdd_input)
    fileAdd_div.append(filedelete);

    addFiles.prepend(fileAdd_div);

   

})

addFiles.addEventListener("click", function(event){
    if(event.target.className == 'del'){
        let delete_fileAdd = document.getElementById("file"+event.target.title);
        delete_fileAdd.parentNode.remove();

        count--;
    }
})