const review = document.getElementById("review");
const reviewCheck = document.getElementById("reviewCheck");
const itemNum = reviewCheck.getAttribute("data-item-num");
const th = document.getElementsByClassName("th");
const up = document.getElementById("up");
const exampleModalLabel = document.getElementById("exampleModalLabel");
const btnCheck = document.getElementById("btnCheck");
const full = document.getElementById("full");
const fullimage = document.getElementById("fullimage");
let page=1;
function reviewList(){
    const xHttp = new XMLHttpRequest();
    xHttp.open("GET","./reviewList?page="+page+"&itemNum="+itemNum);
    xHttp.send();
    xHttp.addEventListener("readystatechange",function(){
        if(this.readyState == 4 && this.status == 200){
            let result = JSON.parse(xHttp.responseText.trim());
            
            let pager = result.pager;
            console.log(pager);
            let ar = result.list;
            for(let c=0;c<th.length;c++){
                th[c].setAttribute("style","");
            }
            for(let i=0;i<ar.length;i++){
                console.log(ar[i].rvFileDTOs[0].fileName);
                if(!ar[i].rvCommentDTOs[0].rvcNum){
                    
                    let tr = document.createElement("tr"); // <tr></tr>
                    let td = document.createElement("td"); // <td></td>
                    let tdText = document.createTextNode(ar[i].userId);
                    td.appendChild(tdText);           
                    tr.appendChild(td);
    
                    td = document.createElement("td");
                    tdText = document.createTextNode(ar[i].rvTitle);
                    td.appendChild(tdText);
                    tr.appendChild(td);
    
                    td = document.createElement("td");
                    tdText = document.createTextNode(ar[i].rvContents);
                    td.appendChild(tdText);
                    tr.appendChild(td);
    
                    td = document.createElement("td");
                    tdText = document.createTextNode(ar[i].rvRate);
                    td.appendChild(tdText);
                    if(ar[i].rvRate == "0.5"){
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star-half-full checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                    }
                    else if(ar[i].rvRate == "1"){
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                    }
                    else if(ar[i].rvRate == "1.5"){
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star-half-full checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                    }
                    else if(ar[i].rvRate == "2"){
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                    }
                    else if(ar[i].rvRate == "2.5"){
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star-half-full checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                    }
                    else if(ar[i].rvRate == "3"){
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                    }
                    else if(ar[i].rvRate == "3.5"){
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star-half-full checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                    }
                    else if(ar[i].rvRate == "4"){
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                    }
                    else if(ar[i].rvRate == "4.5"){
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star-half-full checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                    }
                    else if(ar[i].rvRate == "5"){
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                    }
                    tr.appendChild(td);
    
                    td = document.createElement("td");
                    for(let f=0; f<ar[i].rvFileDTOs.length; f++){

                        btnimage = document.createElement("button");
                        imagetype = document.createAttribute("type");
                        imagetype.value = "button";
                        btnimage.setAttributeNode(imagetype);
                        imageid = document.createAttribute("id");
                        imageid.value = "image"+ar[i].rvFileDTOs[f].fileName;
                        btnimage.setAttributeNode(imageid);
                        info = document.createAttribute("data-photo-name");
                        info.value = "/resources/upload/reviewfile/"+ar[i].rvFileDTOs[f].fileName;
                        btnimage.setAttributeNode(info);
                        img = document.createElement("img");
                        src = document.createAttribute("src");
                        src.value="/resources/upload/reviewfile/"+ar[i].rvFileDTOs[f].fileName;
                        img.setAttributeNode(src);
                        a = document.createAttribute("class");
                        a.value = "img-fluid";
                        img.setAttributeNode(a);
                        btnimage.appendChild(img);
                        td.appendChild(btnimage);
                    }
                    tr.appendChild(td);
    
                    td = document.createElement("td");
                    tdText = document.createTextNode("댓글수 0");
                    td.appendChild(tdText);
                    tr.appendChild(td);
    
                    td = document.createElement("td");
                    let al = document.createElement("a");
                    href = document.createAttribute("href");
                    href.value = "./reviewupdate?rvNum="+ar[i].rvNum;
                    button = document.createElement("button");
                    btnText = document.createTextNode("리뷰수정");
                    button.appendChild(btnText);
                    al.setAttributeNode(href);
                    al.appendChild(button);
                    td.appendChild(al);
                    tr.appendChild(td);
                    

                    td = document.createElement("td");
                    button = document.createElement("button");
                    type = document.createAttribute("type");
                    type.value = "button";
                    button.setAttributeNode(type);
                    let attr2 = document.createAttribute("class");
                    attr2.value = "reviewdelete";
                    button.setAttributeNode(attr2); 
                    attr2 = document.createAttribute("data-review-num");
                    attr2.value = ar[i].rvNum;
                    button.setAttributeNode(attr2);
                    attr2 = document.createAttribute("data-reviewfile-num");
                    attr2.value = ar[i].rvFileDTOs[0].photoNum;
                    button.setAttributeNode(attr2);
                    btnText = document.createTextNode("리뷰삭제");
                    button.appendChild(btnText);
                    td.appendChild(button);
                    tr.appendChild(td);

                    td = document.createElement("td");
                    button = document.createElement("button");
                    type = document.createAttribute("type");
                    type.value = "button";
                    button.setAttributeNode(type);
                    let attr3 = document.createAttribute("class");
                    attr3.value = "reviewcommentadd";
                    button.setAttributeNode(attr3); 
                    attr3 = document.createAttribute("data-review-num");
                    attr3.value = ar[i].rvNum;
                    button.setAttributeNode(attr3);
                    btnText = document.createTextNode("댓글쓰기");
                    button.appendChild(btnText);
                    td.appendChild(button);
                    tr.appendChild(td);
    
                    review.append(tr);
                }

                else{
                    let tr = document.createElement("tr"); // <tr></tr>
                    let trid = document.createAttribute("id");
                    trid.value = "id"+ar[i].rvNum;
                    tr.setAttributeNode(trid);
                    let td = document.createElement("td"); // <td></td>
                    let tdText = document.createTextNode(ar[i].userId);
                    td.appendChild(tdText);           
                    tr.appendChild(td);
    
                    td = document.createElement("td");
                    tdText = document.createTextNode(ar[i].rvTitle);
                    td.appendChild(tdText);
                    tr.appendChild(td);
    
                    td = document.createElement("td");
                    tdText = document.createTextNode(ar[i].rvContents);
                    td.appendChild(tdText);
                    tr.appendChild(td);
    
                    td = document.createElement("td");
                    tdText = document.createTextNode(ar[i].rvRate);
                    td.appendChild(tdText);
                    if(ar[i].rvRate == "0.5"){
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star-half-full checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                    }
                    else if(ar[i].rvRate == "1"){
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                    }
                    else if(ar[i].rvRate == "1.5"){
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star-half-full checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                    }
                    else if(ar[i].rvRate == "2"){
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                    }
                    else if(ar[i].rvRate == "2.5"){
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star-half-full checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                    }
                    else if(ar[i].rvRate == "3"){
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                    }
                    else if(ar[i].rvRate == "3.5"){
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star-half-full checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                    }
                    else if(ar[i].rvRate == "4"){
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                    }
                    else if(ar[i].rvRate == "4.5"){
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star-half-full checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                    }
                    else if(ar[i].rvRate == "5"){
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                    }
                    tr.appendChild(td);
    
                    td = document.createElement("td");
                    for(let f=0; f<ar[i].rvFileDTOs.length; f++){

                        btnimage = document.createElement("button");
                        imagetype = document.createAttribute("type");
                        imagetype.value = "button";
                        btnimage.setAttributeNode(imagetype);
                        imageid = document.createAttribute("id");
                        imageid.value = "image"+ar[i].rvFileDTOs[f].fileName;
                        btnimage.setAttributeNode(imageid);
                        info = document.createAttribute("data-photo-name");
                        info.value = "/resources/upload/reviewfile/"+ar[i].rvFileDTOs[f].fileName;
                        btnimage.setAttributeNode(info);
                        img = document.createElement("img");
                        src = document.createAttribute("src");
                        src.value="/resources/upload/reviewfile/"+ar[i].rvFileDTOs[f].fileName;
                        img.setAttributeNode(src);
                        a = document.createAttribute("class");
                        a.value = "img-fluid";
                        img.setAttributeNode(a);
                        btnimage.appendChild(img);
                        td.appendChild(btnimage);
                    }
                    tr.appendChild(td);

                    td = document.createElement("td");
                    tdText = document.createTextNode("댓글수 "+ar[i].rvCommentDTOs.length);
                    btnreply = document.createElement("button");
                    type = document.createAttribute("type");
                    type.value = "button";
                    btnreply.setAttributeNode(type);
                    let attr4 = document.createAttribute("class");
                    attr4.value = "comment";
                    btnreply.setAttributeNode(attr4); 
                    attr4 = document.createAttribute("data-review-num");
                    attr4.value = ar[i].rvNum;
                    btnreply.setAttributeNode(attr4);
                    btnText = document.createTextNode("댓글보기");
                    btnreply.appendChild(btnText);
                    td.appendChild(btnreply);
                    td.appendChild(tdText);
                    tr.appendChild(td);

                    td = document.createElement("td");
                    let al = document.createElement("a");
                    href = document.createAttribute("href");
                    href.value = "./reviewupdate?rvNum="+ar[i].rvNum;
                    button = document.createElement("button");
                    btnText = document.createTextNode("리뷰수정");
                    button.appendChild(btnText);
                    al.setAttributeNode(href);
                    al.appendChild(button);
                    td.appendChild(al);
                    tr.appendChild(td);
    
                    td = document.createElement("td");
                    button = document.createElement("button");
                    type = document.createAttribute("type");
                    type.value = "button";
                    button.setAttributeNode(type);
                    let attr2 = document.createAttribute("class");
                    attr2.value = "reviewdelete";
                    button.setAttributeNode(attr2); 
                    attr2 = document.createAttribute("data-review-num");
                    attr2.value = ar[i].rvNum;
                    button.setAttributeNode(attr2);
                    attr2 = document.createAttribute("data-reviewfile-num");
                    attr2.value = ar[i].rvFileDTOs[0].photoNum;
                    button.setAttributeNode(attr2);
                    btnText = document.createTextNode("리뷰삭제");
                    button.appendChild(btnText);
                    td.appendChild(button);
                    tr.appendChild(td);

                    td = document.createElement("td");
                    button = document.createElement("button");
                    type = document.createAttribute("type");
                    type.value = "button";
                    button.setAttributeNode(type);
                    let attr3 = document.createAttribute("class");
                    attr3.value = "reviewcommentadd";
                    button.setAttributeNode(attr3); 
                    attr3 = document.createAttribute("data-review-num");
                    attr3.value = ar[i].rvNum;
                    button.setAttributeNode(attr3);
                    btnText = document.createTextNode("댓글쓰기");
                    button.appendChild(btnText);
                    td.appendChild(button);
                    tr.appendChild(td);

                    review.append(tr);

                   
                }

                if(page >= pager.totalPage){

                    more.classList.add("disabled");
                }
                else{
                    more.classList.remove("disabled");
                }
                
                for(let f=0; f<ar[i].rvFileDTOs.length;f++){
                    let btnimageclick = document.getElementById("image"+ar[i].rvFileDTOs[f].fileName);
                    btnimageclick.addEventListener("click",function(){
                        let a = btnimageclick.getAttribute("data-photo-name");
                        fullimage.setAttribute("src",a);
                        full.click();
                    })

                }

                
             

                const reviewdelete = document.getElementsByClassName("reviewdelete");
                reviewdelete[i].addEventListener("click",function(){
                        let result = window.confirm("리뷰를 삭제하시겠습니까?");
                        if(!result){
                            return;
                        }
                        let photoNum = reviewdelete[i].getAttribute("data-reviewfile-num");
                        const xhttp = new XMLHttpRequest();
                        xhttp.open("POST","./fileDelete");
                        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                        xhttp.send("photoNum="+photoNum);
                        xhttp.onreadystatechange = function(){
                            if(xhttp.readyState == 4 && xhttp.status == 200){
                                let result = xhttp.responseText.trim();
                                if(result == 1){
                                    if(!ar[i].rvCommentDTOs[0].rvcNum){
                                        let rvNum = reviewdelete[i].getAttribute("data-review-num");
                                        const xHttp = new XMLHttpRequest();
                                        xHttp.open("POST","./reviewdelete");
                                        xHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                        xHttp.send("rvNum="+rvNum);
                                        xHttp.onreadystatechange = function(){
                                            if(xHttp.readyState == 4 && xHttp.status == 200){
                                                let result = xHttp.responseText.trim();
                                                if(result == 1){
                                                    alert("리뷰 삭제 성공");
                                                    return window.location.href='/sell/detail?itemNum='+itemNum;
                                                }
                                                else{
                                                    alert("리뷰 삭제 실패");
                                                    return;
                                                }
                                            }
                                        }
                                    }
                                    else{
                                        let rvNum = reviewdelete[i].getAttribute("data-review-num");
                                        const xHttp = new XMLHttpRequest();
                                        xHttp.open("POST","./reviewcommentalldelete");
                                        xHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                        xHttp.send("rvNum="+rvNum);
                                        xHttp.onreadystatechange = function(){
                                            if(xHttp.readyState == 4 && xHttp.status == 200){
                                                let result = xHttp.responseText.trim();
                                                if(result == 1){
                                                    const xHttp = new XMLHttpRequest();
                                                    xHttp.open("POST","./reviewdelete");
                                                    xHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                                    xHttp.send("rvNum="+rvNum);
                                                    xHttp.onreadystatechange = function(){
                                                        if(xHttp.readyState == 4 && xHttp.status == 200){
                                                            let result = xHttp.responseText.trim();
                                                            if(result == 1){
                                                                alert("리뷰 삭제 성공");
                                                                return window.location.href='/sell/detail?itemNum='+itemNum;
                                                            }
                                                            else{
                                                                alert("리뷰 삭제 실패");
                                                                return;
                                                            }
                                                        }
                                                    }
                                                }
                                                else{
                                                    alert("리뷰에 있는 댓글 먼저 삭제 실패");
                                                    return;
                                                }
                                            }
                                        }
                                    }
                                }else{
                                    alert("리뷰파일쪽이 먼저 삭제에 실패해 리뷰를 삭제할수 없습니다.");
                                    return;
                                }
                            }
                        }
                    });
                    const reviewcommentadd = document.getElementsByClassName("reviewcommentadd");
                    reviewcommentadd[i].addEventListener("click",function(){
                        exampleModalLabel.innerText = "댓글쓰기";
                        btnCheck.innerText = "작성";
                        let rvNum = ar[i].rvNum;
                        document.getElementById("rvNum").value = rvNum;
                        document.getElementById("rvcContents").value = "";
                        up.click();
                    });

                    
                    
                        if(ar[i].rvCommentDTOs[0].rvcNum){
                    
                            let id = document.getElementById("id"+ar[i].rvNum);
                            const comment = document.getElementsByClassName("comment");
                            console.log(comment);
                            for(let c=0;c<comment.length;c++){
                                comment[c].addEventListener("click",function(){
                                    if(comment[c].innerText == "댓글보기"){
                                        comment[c].innerText = "댓글닫기";
                                        for(let j=ar[i].rvCommentDTOs.length;j>0;j--){
                                                let tr = document.createElement("tr");
                                                let check = document.createAttribute("class");
                                                check.value = "class"+ar[i].rvNum;
                                                tr.setAttributeNode(check);
                                                let style = document.createAttribute("style");
                                                style.value = "";
                                                tr.setAttributeNode(style);
                                                let td = document.createElement("td");
                                                let tdText = document.createTextNode(ar[i].rvCommentDTOs[j-1].rvcWriter);
                                                td.appendChild(tdText);
                                                tr.appendChild(td);
                            
                                                td = document.createElement("td");
                                                colspan = document.createAttribute("colspan");
                                                colspan.value = 2;
                                                td.setAttributeNode(colspan);
                                                console.log(i);
                                                console.log(j);
                                                tdText = document.createTextNode(ar[i].rvCommentDTOs[j-1].rvcContents);
                                                console.log(tdText);
                                                td.appendChild(tdText);
                                                tr.appendChild(td);
                            
                                                td = document.createElement("td");
                                                colspan = document.createAttribute("colspan");
                                                colspan.value = 3;
                                                td.setAttributeNode(colspan);
                                                button = document.createElement("button");
                                                type = document.createAttribute("type");
                                                type.value = "button";
                                                button.setAttributeNode(type);
                                                let attr = document.createAttribute("class");
                                                attr.value = "reviewcommentupdate";
                                                button.setAttributeNode(attr); 
                                                attr = document.createAttribute("data-reviewcomment-num");
                                                attr.value = ar[i].rvCommentDTOs[j-1].rvcNum;
                                                button.setAttributeNode(attr);
                                                btnText = document.createTextNode("댓글수정");
                                                button.appendChild(btnText);
                                                td.appendChild(button);
                                                tr.appendChild(td);
                    
                                                td = document.createElement("td");
                                                colspan = document.createAttribute("colspan");
                                                colspan.value = 3;
                                                td.setAttributeNode(colspan);
                                                button = document.createElement("button");
                                                type = document.createAttribute("type");
                                                type.value = "button";
                                                button.setAttributeNode(type);
                                                let attr1 = document.createAttribute("class");
                                                attr1.value = "reviewcommentdelete";
                                                button.setAttributeNode(attr1); 
                                                attr1 = document.createAttribute("data-reviewcomment-num");
                                                attr1.value = ar[i].rvCommentDTOs[j-1].rvcNum;
                                                button.setAttributeNode(attr1);
                                                btnText = document.createTextNode("댓글삭제");
                                                button.appendChild(btnText);
                                                td.appendChild(button);
                                                tr.appendChild(td);
                        
                                                id.after(tr);
                                            }
                        
                                    }
                                    else if(comment[c].innerText == "댓글닫기"){
                                        comment[c].innerText = "댓글보기";
                                        let check = document.getElementsByClassName("class"+ar[i].rvNum);
                                        for(let p=0;p<check.length;p++){
                                            check[p].setAttribute("style","display: none;");
                                        }
                                    }
                                    
                                        const reviewcommentdelete = document.getElementsByClassName("reviewcommentdelete")
                                        for(let j=0;j<ar[i].rvCommentDTOs.length; j++){
                                            reviewcommentdelete[j].addEventListener("click",function(){
                                                let result = window.confirm("댓글을 삭제하시겠습니까?");
                                                if(!result){
                                                    return;
                                                }
                                                let rvcNum = reviewcommentdelete[j].getAttribute("data-reviewcomment-num");
                                                const xHttp = new XMLHttpRequest();
                                                xHttp.open("POST","./reviewcommentdelete");
                                                xHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                                xHttp.send("rvcNum="+rvcNum);
                                                xHttp.onreadystatechange = function(){
                                                    if(xHttp.readyState == 4 && xHttp.status == 200){
                                                        let result = xHttp.responseText.trim();
                                                        if(result == 1){
                                                            alert("댓글 삭제 성공");
                                                            return window.location.href='/sell/detail?itemNum='+itemNum;
                                                        }
                                                        else{
                                                            alert("댓글 삭제 실패");
                                                            return;
                                                        }
                                                    }
                                                }
                                            });
                                        }
                                        const reviewcommentupdate = document.getElementsByClassName("reviewcommentupdate");
                                        for(let j=0;j<ar[i].rvCommentDTOs.length;j++){

                                            reviewcommentupdate[j].addEventListener("click",function(){
                                                exampleModalLabel.innerText = "댓글수정";
                                                btnCheck.innerText = "수정";
                                                let rvcContents = ar[i].rvCommentDTOs[j].rvcContents;
                                                console.log(i);
                                                console.log(j);
                                                console.log(ar[i].rvCommentDTOs[j].rvcContents);
                                                document.getElementById("rvcContents").value = rvcContents;
                                                let rvcNum = ar[i].rvCommentDTOs[j].rvcNum;
                                                document.getElementById("rvcNum").value = rvcNum; 
                                                up.click();
                                            });
                                        }
                                    
                                        

                                })
                            }
                            
                        }
                    
                        

                        

                    
                


            }
        }
    });
}

more.addEventListener("click",function(){
    page++;
    reviewList();
});

btnCheck.addEventListener("click",function(){
    if(btnCheck.innerHTML == "수정"){
        let rvcNum = document.getElementById("rvcNum").value;
        let rvcContents = document.getElementById("rvcContents").value;
        const xHttp = new XMLHttpRequest();
        xHttp.open("POST","./reviewcommentupdate");
        xHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xHttp.send("rvcNum="+rvcNum+"&rvcContents="+rvcContents);
        xHttp.onreadystatechange = function(){
            if(xHttp.readyState == 4 && xHttp.status == 200){
                let result = xHttp.responseText.trim();
                if(result == 1){
                    alert("댓글 수정 성공");
                    return window.location.href='/sell/detail?itemNum='+itemNum;
                }
                else{
                    alert("댓글 수정 실패");
                    return;
                }
            }
        }
    }
    if(btnCheck.innerHTML == "작성"){
        let rvNum = document.getElementById("rvNum").value;
        let rvcContents = document.getElementById("rvcContents").value;
        const xHttp = new XMLHttpRequest();
        xHttp.open("POST","./reviewcommentadd");
        xHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xHttp.send("rvNum="+rvNum+"&rvcContents="+rvcContents);
        xHttp.onreadystatechange = function(){
            if(xHttp.readyState == 4 && xHttp.status == 200){
                let result = xHttp.responseText.trim();
                if(result == 1){
                    alert("댓글 작성 성공");
                    return window.location.href='/sell/detail?itemNum='+itemNum;
                }
                else{
                    alert("댓글 작성 실패");
                    return;
                }
            }
        }
    }
});