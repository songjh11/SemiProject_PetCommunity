const review = document.getElementById("review");
const reviewCheck = document.getElementById("reviewCheck");
const itemNum = reviewCheck.getAttribute("data-item-num");
const th = document.getElementsByClassName("th");
const up = document.getElementById("up");
const exampleModalLabel2 = document.getElementById("exampleModalLabel2");
const btnCheck = document.getElementById("btnCheck");
const full = document.getElementById("full");
const fullimage = document.getElementById("fullimage");
const rv = document.getElementById("rv");
const q = document.getElementById("q");
const more = document.getElementById("more");
const moreqna = document.getElementById("moreqna");
let page=1;
function reviewList(){
    console.log(page);
    const xHttp = new XMLHttpRequest();
    xHttp.open("GET","./reviewList?page="+page+"&itemNum="+itemNum);
    xHttp.send();
    xHttp.addEventListener("readystatechange",function(){
        if(this.readyState == 4 && this.status == 200){
            let result = JSON.parse(xHttp.responseText.trim());
            
            let pager = result.pager;
            console.log(pager);
            let ar = result.list;
            let member = result.member;
            
            for(let c=0;c<th.length;c++){
                th[c].setAttribute("style","");
            }
            
            if(page<pager.totalPage){
                more.setAttribute("style","");
            }
    
            for(let i=0;i<ar.length;i++){
                console.log(ar[i].rvFileDTOs[0].fileName);
                if(!ar[i].rvCommentDTOs[0].rvcNum){
                    
                    let tr = document.createElement("tr"); 
                    let tr2 = document.createElement("tr"); 
                    let td = document.createElement("td"); 
                    tdstyle = document.createAttribute("style");
                    tdstyle.value = "width:10%;";
                    td.setAttributeNode(tdstyle);
                    let tdText = document.createTextNode(ar[i].userId);
                    td.appendChild(tdText);           
                    tr.appendChild(td);
    
                    td = document.createElement("td");
                    tdstyle = document.createAttribute("style");
                    tdstyle.value = "width:16%;";
                    td.setAttributeNode(tdstyle);
                    tdText = document.createTextNode(ar[i].rvTitle);
                    td.appendChild(tdText);
                    tr.appendChild(td);
    
                    td = document.createElement("td");
                    tdstyle = document.createAttribute("style");
                    tdstyle.value = "width:18%;";
                    td.setAttributeNode(tdstyle);
                    tdText = document.createTextNode(ar[i].rvContents);
                    td.appendChild(tdText);
                    tr.appendChild(td);
    
                    if(ar[i].rvRate == "0.5"){
                        td = document.createElement("td");
                        tdstyle = document.createAttribute("style");
                        tdstyle.value = "width:14%;";
                        td.setAttributeNode(tdstyle);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star-half-full checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star); 
                        tdText = document.createTextNode(ar[i].rvRate);
                        td.appendChild(tdText);
                        tr.appendChild(td);
                    }
                    else if(ar[i].rvRate == "1"){
                        td = document.createElement("td");
                        tdstyle = document.createAttribute("style");
                        tdstyle.value = "width:14%;";
                        td.setAttributeNode(tdstyle);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        tdText = document.createTextNode(ar[i].rvRate);
                        td.appendChild(tdText);
                        tr.appendChild(td);
                    }
                    else if(ar[i].rvRate == "1.5"){
                        td = document.createElement("td");
                        tdstyle = document.createAttribute("style");
                        tdstyle.value = "width:14%;";
                        td.setAttributeNode(tdstyle);
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
                        tdText = document.createTextNode(ar[i].rvRate);
                        td.appendChild(tdText);
                        tr.appendChild(td);
                    }
                    else if(ar[i].rvRate == "2"){
                        td = document.createElement("td");
                        tdstyle = document.createAttribute("style");
                        tdstyle.value = "width:14%;";
                        td.setAttributeNode(tdstyle);
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
                        tdText = document.createTextNode(ar[i].rvRate);
                        td.appendChild(tdText);
                        tr.appendChild(td);
                    }
                    else if(ar[i].rvRate == "2.5"){
                        td = document.createElement("td");
                        tdstyle = document.createAttribute("style");
                        tdstyle.value = "width:14%;";
                        td.setAttributeNode(tdstyle);
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
                        tdText = document.createTextNode(ar[i].rvRate);
                        td.appendChild(tdText);
                        tr.appendChild(td);
                    }
                    else if(ar[i].rvRate == "3"){
                        td = document.createElement("td");
                        tdstyle = document.createAttribute("style");
                        tdstyle.value = "width:14%;";
                        td.setAttributeNode(tdstyle);
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
                        tdText = document.createTextNode(ar[i].rvRate);
                        td.appendChild(tdText);
                        tr.appendChild(td);
                    }
                    else if(ar[i].rvRate == "3.5"){
                        td = document.createElement("td");
                        tdstyle = document.createAttribute("style");
                        tdstyle.value = "width:14%;";
                        td.setAttributeNode(tdstyle);
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
                        tdText = document.createTextNode(ar[i].rvRate);
                        td.appendChild(tdText);
                        tr.appendChild(td);
                    }
                    else if(ar[i].rvRate == "4"){
                        td = document.createElement("td");
                        tdstyle = document.createAttribute("style");
                        tdstyle.value = "width:14%;";
                        td.setAttributeNode(tdstyle);
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
                        tdText = document.createTextNode(ar[i].rvRate);
                        td.appendChild(tdText);
                        tr.appendChild(td);
                    }
                    else if(ar[i].rvRate == "4.5"){
                        td = document.createElement("td");
                        tdstyle = document.createAttribute("style");
                        tdstyle.value = "width:14%;";
                        td.setAttributeNode(tdstyle);
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
                        tdText = document.createTextNode(ar[i].rvRate);
                        td.appendChild(tdText);
                        tr.appendChild(td);
                    }
                    else if(ar[i].rvRate == "5"){
                        td = document.createElement("td");
                        tdstyle = document.createAttribute("style");
                        tdstyle.value = "width:14%;";
                        td.setAttributeNode(tdstyle);
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
                        tdText = document.createTextNode(ar[i].rvRate);
                        td.appendChild(tdText);
                        tr.appendChild(td);
                    }
                    
                    if(!member){
                        td = document.createElement("td");
                        tdstyle = document.createAttribute("style");
                        tdstyle.value = "white-space:nowrap; padding:0 0 0 0;";
                        td.setAttributeNode(tdstyle);
                        if(ar[i].rvFileDTOs.length == 5){
                            tdcolspan = document.createAttribute("colspan");
                            tdcolspan.value = 3;
                            td.setAttributeNode(tdcolspan);
                            tdstyle.value = "white-space:nowrap; padding:0 180px 0 0;";
                            td.setAttributeNode(tdstyle);
                        }
                        else if(ar[i].rvFileDTOs.length == 4){
                            tdcolspan = document.createAttribute("colspan");
                            tdcolspan.value = 3;
                            td.setAttributeNode(tdcolspan);
                            tdstyle.value = "white-space:nowrap; padding:0 280px 0 0;";
                            td.setAttributeNode(tdstyle);
                        }
                        else if(ar[i].rvFileDTOs.length == 3){
                            tdcolspan = document.createAttribute("colspan");
                            tdcolspan.value = 2;
                            td.setAttributeNode(tdcolspan);
                            tdstyle.value = "white-space:nowrap; padding:0 120px 0 0;";
                            td.setAttributeNode(tdstyle);
                        }
                        else if (ar[i].rvFileDTOs.length == 2){
                            tdcolspan = document.createAttribute("colspan");
                            tdcolspan.value = 2;
                            td.setAttributeNode(tdcolspan);
                            tdstyle.value = "white-space:nowrap; padding:0 220px 0 0;";
                            td.setAttributeNode(tdstyle);
                        }
                        else if(ar[i].rvFileDTOs.length == 1){
                            tdcolspan = document.createAttribute("colspan");
                            tdcolspan.value = 1;
                            td.setAttributeNode(tdcolspan);
                        }
                    }

                    else if(member.userId == ar[i].userId || member.userId != ar[i].userId){

                        td = document.createElement("td");
                        tdstyle = document.createAttribute("style");
                        tdstyle.value = "white-space:nowrap; padding:0 0 0 0;";
                        td.setAttributeNode(tdstyle);
                        if(ar[i].rvFileDTOs.length == 5){
                            tdcolspan = document.createAttribute("colspan");
                            tdcolspan.value = 3;
                            td.setAttributeNode(tdcolspan);
                        }
                        else if(ar[i].rvFileDTOs.length == 4){
                            tdcolspan = document.createAttribute("colspan");
                            tdcolspan.value = 3;
                            td.setAttributeNode(tdcolspan);
                            tdstyle.value = "white-space:nowrap; padding:0 100px 0 0;";
                            td.setAttributeNode(tdstyle);
                        }
                        else if(ar[i].rvFileDTOs.length == 3){
                            tdcolspan = document.createAttribute("colspan");
                            tdcolspan.value = 2;
                            td.setAttributeNode(tdcolspan);
                        }
                        else if (ar[i].rvFileDTOs.length == 2){
                            tdcolspan = document.createAttribute("colspan");
                            tdcolspan.value = 2;
                            td.setAttributeNode(tdcolspan);
                            tdstyle.value = "white-space:nowrap; padding:0 100px 0 0;";
                            td.setAttributeNode(tdstyle);
                        }
                        else if(ar[i].rvFileDTOs.length == 1){
                            tdcolspan = document.createAttribute("colspan");
                            tdcolspan.value = 1;
                            td.setAttributeNode(tdcolspan);
                        }
                    }
                    for(let f=0; f<ar[i].rvFileDTOs.length; f++){
                        btnimage = document.createElement("button");
                        imagetype = document.createAttribute("type");
                        imagetype.value = "button";
                        btnimage.setAttributeNode(imagetype);
                        btnClass = document.createAttribute("class");
                        btnClass.value = "flex-item";
                        btnimage.setAttributeNode(btnClass);
                        imageid = document.createAttribute("id");
                        imageid.value = "image"+ar[i].rvFileDTOs[f].fileName;
                        btnimage.setAttributeNode(imageid);
                        info = document.createAttribute("data-photo-name");
                        info.value = "/resources/upload/reviewfile/"+ar[i].rvFileDTOs[f].fileName;
                        btnimage.setAttributeNode(info);
                        btnStyle = document.createAttribute("style");
                        btnStyle.value = "border: 0px; outline: 0px; width: 100px; height: 100px; display:inline-block";
                        btnimage.setAttributeNode(btnStyle);
                        img = document.createElement("img");
                        imgStyle = document.createAttribute("style");
                        imgStyle.value = "border-radius: 10px;";
                        img.setAttributeNode(imgStyle);
                        src = document.createAttribute("src");
                        src.value="/resources/upload/reviewfile/"+ar[i].rvFileDTOs[f].fileName;
                        img.setAttributeNode(src);
                        a = document.createAttribute("class");
                        a.value = "img-fluid";
                        img.setAttributeNode(a);
                        btnimage.appendChild(img);
                        td.appendChild(btnimage);
                    }
                    tr2.appendChild(td);
                    
                    td = document.createElement("td");
                    tdstyle = document.createAttribute("style");
                    tdstyle.value = "width:12%;";
                    td.setAttributeNode(tdstyle);
                    btnZero = document.createElement("button");
                    btnZeroType = document.createAttribute("type");
                    btnZeroType.value = "button";
                    btnZero.setAttributeNode(btnZeroType);
                    btnNot = document.createAttribute("disabled");
                    btnZero.setAttributeNode(btnNot);
                    btnStyle = document.createAttribute("style");
                    btnStyle.value = "border: 1px solid gray; border-radius: 10px;";
                    btnZero.setAttributeNode(btnStyle);
                    btnimage = document.createElement("img");
                    imgsrc = document.createAttribute("src");
                    imgsrc.value = "/resources/images/review-ico-comment-off.png";
                    btnimage.setAttributeNode(imgsrc);
                    imgalt = document.createAttribute("alt");
                    imgalt.value = "댓글";
                    btnimage.setAttributeNode(imgalt);
                    btnZero.appendChild(btnimage);
                    tdText = document.createTextNode("0");
                    btnZero.appendChild(tdText);
                    td.appendChild(btnZero);
                    tr.appendChild(td);
    
                    td = document.createElement("td");
                    tdstyle = document.createAttribute("style");
                    if(!member){
                        tdstyle.value = "width:10%; display: none;";
                    }
                    else if(member.userId == ar[i].userId){
                        tdstyle.value = "width:10%;";
                    }
                    else if(member.userId != ar[i].userId){
                        tdstyle.value = "width:10%;";
                    }
                    td.setAttributeNode(tdstyle);
                    button = document.createElement("button");
                    type = document.createAttribute("type");
                    type.value = "button";
                    button.setAttributeNode(type);
                    let attr6 = document.createAttribute("id");
                    attr6.value = "reviewcommentadd"+ar[i].rvNum;
                    button.setAttributeNode(attr6);
                    let attr3 = document.createAttribute("class");
                    attr3.value = "btn btn-outline-success";
                    button.setAttributeNode(attr3);
                    attr3 = document.createAttribute("data-review-num");
                    attr3.value = ar[i].rvNum;
                    button.setAttributeNode(attr3);
                    btnText = document.createTextNode("댓글쓰기");
                    button.appendChild(btnText);
                    td.appendChild(button);
                    tr.appendChild(td);
                    
                    td = document.createElement("td");
                    tdstyle = document.createAttribute("style");
                    if(!member){
                        tdstyle.value = "width:10%; display: none;";
                    }
                    else if(member.userId == ar[i].userId){
                        tdstyle.value = "width:10%;";
                    }
                    else if(member.userId != ar[i].userId){
                        tdstyle.value = "width:10%; display: none;";
                    }
                    td.setAttributeNode(tdstyle);
                    let al = document.createElement("a");
                    href = document.createAttribute("href");
                    href.value = "./reviewupdate?rvNum="+ar[i].rvNum;
                    button = document.createElement("button");
                    btntype = document.createAttribute("type");
                    btntype.value = "button";
                    button.setAttributeNode(btntype);
                    attr3 = document.createAttribute("class");
                    attr3.value = "btn btn-outline-warning";
                    button.setAttributeNode(attr3);
                    btnText = document.createTextNode("리뷰수정");
                    button.appendChild(btnText);
                    al.setAttributeNode(href);
                    al.appendChild(button);
                    td.appendChild(al);
                    tr.appendChild(td);
                        
    
                    td = document.createElement("td");
                    tdstyle = document.createAttribute("style");
                    if(!member){
                        tdstyle.value = "width:10%; display: none;";
                    }
                    else if(member.userId == ar[i].userId){
                        tdstyle.value = "width:10%;";
                    }
                    else if(member.userId != ar[i].userId){
                        tdstyle.value = "width:10%; display: none;";
                    }
                    td.setAttributeNode(tdstyle);
                    button = document.createElement("button");
                    type = document.createAttribute("type");
                    type.value = "button";
                    button.setAttributeNode(type);
                    let attr5 = document.createAttribute("id");
                    attr5.value = "reviewdelete"+ar[i].rvNum;
                    button.setAttributeNode(attr5);
                    let attr2 = document.createAttribute("class");
                    attr2.value = "btn btn-outline-danger";
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

                    review.append(tr2);
                    review.append(tr);
                }

                else{
                    let tr = document.createElement("tr"); 
                    let tr2 = document.createElement("tr"); 
                    let trid = document.createAttribute("id");
                    trid.value = "id"+ar[i].rvNum;
                    tr.setAttributeNode(trid);
                    let td = document.createElement("td"); 
                    tdstyle = document.createAttribute("style");
                    tdstyle.value = "width:10%;";
                    td.setAttributeNode(tdstyle);
                    let tdText = document.createTextNode(ar[i].userId);
                    td.appendChild(tdText);           
                    tr.appendChild(td);
    
                    td = document.createElement("td");
                    tdstyle = document.createAttribute("style");
                    tdstyle.value = "width:16%;";
                    td.setAttributeNode(tdstyle);
                    tdText = document.createTextNode(ar[i].rvTitle);
                    td.appendChild(tdText);
                    tr.appendChild(td);
    
                    td = document.createElement("td");
                    tdstyle = document.createAttribute("style");
                    tdstyle.value = "width:18%;";
                    td.setAttributeNode(tdstyle);
                    tdText = document.createTextNode(ar[i].rvContents);
                    td.appendChild(tdText);
                    tr.appendChild(td);
    
                    console.log(ar[i].rvRate);
                    if(ar[i].rvRate == 0.5){
                        td = document.createElement("td");
                        tdstyle = document.createAttribute("style");
                        tdstyle.value = "width:14%;";
                        td.setAttributeNode(tdstyle);
                        let star = document.createElement("span");
                        let starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star-half-full checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        tdText = document.createTextNode(ar[i].rvRate);
                        td.appendChild(tdText);
                        tr.appendChild(td);
                    }
                    else if(ar[i].rvRate == 1){
                        td = document.createElement("td");
                        tdstyle = document.createAttribute("style");
                        tdstyle.value = "width:14%;";
                        td.setAttributeNode(tdstyle);
                        let star = document.createElement("span");
                        let starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        tdText = document.createTextNode(ar[i].rvRate);
                        td.appendChild(tdText);
                        tr.appendChild(td);
                    }
                    else if(ar[i].rvRate == 1.5){
                        td = document.createElement("td");
                        tdstyle = document.createAttribute("style");
                        tdstyle.value = "width:14%;";
                        td.setAttributeNode(tdstyle);
                        let star = document.createElement("span");
                        let starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star-half-full checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        tdText = document.createTextNode(ar[i].rvRate);
                        td.appendChild(tdText);
                        tr.appendChild(td);
                    }
                    else if(ar[i].rvRate == 2){
                        td = document.createElement("td");
                        tdstyle = document.createAttribute("style");
                        tdstyle.value = "width:14%;";
                        td.setAttributeNode(tdstyle);
                        let star = document.createElement("span");
                        let starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        star = document.createElement("span");
                        starclass = document.createAttribute("class");
                        starclass.value = "fa fa-star checked";
                        star.setAttributeNode(starclass);
                        td.appendChild(star);
                        tdText = document.createTextNode(ar[i].rvRate);
                        td.appendChild(tdText);
                        tr.appendChild(td);
                    }
                    else if(ar[i].rvRate == 2.5){
                        td = document.createElement("td");
                        tdstyle = document.createAttribute("style");
                        tdstyle.value = "width:14%;";
                        td.setAttributeNode(tdstyle);
                        let star = document.createElement("span");
                        let starclass = document.createAttribute("class");
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
                        tdText = document.createTextNode(ar[i].rvRate);
                        td.appendChild(tdText);
                        tr.appendChild(td);
                    }
                    else if(ar[i].rvRate == 3){
                        td = document.createElement("td");
                        tdstyle = document.createAttribute("style");
                        tdstyle.value = "width:14%;";
                        td.setAttributeNode(tdstyle);
                        let star = document.createElement("span");
                        let starclass = document.createAttribute("class");
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
                        tdText = document.createTextNode(ar[i].rvRate);
                        td.appendChild(tdText);
                        tr.appendChild(td);
                    }
                    else if(ar[i].rvRate == 3.5){
                        td = document.createElement("td");
                        tdstyle = document.createAttribute("style");
                        tdstyle.value = "width:14%;";
                        td.setAttributeNode(tdstyle);
                        let star = document.createElement("span");
                        let starclass = document.createAttribute("class");
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
                        tdText = document.createTextNode(ar[i].rvRate);
                        td.appendChild(tdText);
                        tr.appendChild(td);
                    }
                    else if(ar[i].rvRate == 4){
                        td = document.createElement("td");
                        tdstyle = document.createAttribute("style");
                        tdstyle.value = "width:14%;";
                        td.setAttributeNode(tdstyle);
                        let star = document.createElement("span");
                        let starclass = document.createAttribute("class");
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
                        tdText = document.createTextNode(ar[i].rvRate);
                        td.appendChild(tdText);
                        tr.appendChild(td);
                    }
                    else if(ar[i].rvRate == 4.5){
                        td = document.createElement("td");
                        tdstyle = document.createAttribute("style");
                        tdstyle.value = "width:14%;";
                        td.setAttributeNode(tdstyle);
                        let star = document.createElement("span");
                        let starclass = document.createAttribute("class");
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
                        tdText = document.createTextNode(ar[i].rvRate);
                        td.appendChild(tdText);
                        tr.appendChild(td);
                    }
                    else if(ar[i].rvRate == 5){
                        td = document.createElement("td");
                        tdstyle = document.createAttribute("style");
                        tdstyle.value = "width:14%;";
                        td.setAttributeNode(tdstyle);
                        let star = document.createElement("span");
                        let starclass = document.createAttribute("class");
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
                        tdText = document.createTextNode(ar[i].rvRate);
                        td.appendChild(tdText);
                        tr.appendChild(td);
                    }
                    
                    
    
                    
                    if(!member){
                        td = document.createElement("td");
                        tdstyle = document.createAttribute("style");
                        tdstyle.value = "white-space:nowrap; padding:0 0 0 0;";
                        td.setAttributeNode(tdstyle);
                        if(ar[i].rvFileDTOs.length == 5){
                            tdcolspan = document.createAttribute("colspan");
                            tdcolspan.value = 3;
                            td.setAttributeNode(tdcolspan);
                            tdstyle.value = "white-space:nowrap; padding:0 180px 0 0;";
                            td.setAttributeNode(tdstyle);
                        }
                        else if(ar[i].rvFileDTOs.length == 4){
                            tdcolspan = document.createAttribute("colspan");
                            tdcolspan.value = 3;
                            td.setAttributeNode(tdcolspan);
                            tdstyle.value = "white-space:nowrap; padding:0 280px 0 0;";
                            td.setAttributeNode(tdstyle);
                        }
                        else if(ar[i].rvFileDTOs.length == 3){
                            tdcolspan = document.createAttribute("colspan");
                            tdcolspan.value = 2;
                            td.setAttributeNode(tdcolspan);
                            tdstyle.value = "white-space:nowrap; padding:0 120px 0 0;";
                            td.setAttributeNode(tdstyle);
                        }
                        else if (ar[i].rvFileDTOs.length == 2){
                            tdcolspan = document.createAttribute("colspan");
                            tdcolspan.value = 2;
                            td.setAttributeNode(tdcolspan);
                            tdstyle.value = "white-space:nowrap; padding:0 220px 0 0;";
                            td.setAttributeNode(tdstyle);
                        }
                        else if(ar[i].rvFileDTOs.length == 1){
                            tdcolspan = document.createAttribute("colspan");
                            tdcolspan.value = 1;
                            td.setAttributeNode(tdcolspan);
                        }
                    }

                    else if(member.userId == ar[i].userId || member.userId != ar[i].userId){

                        td = document.createElement("td");
                        tdstyle = document.createAttribute("style");
                        tdstyle.value = "white-space:nowrap; padding:0 0 0 0;";
                        td.setAttributeNode(tdstyle);
                        if(ar[i].rvFileDTOs.length == 5){
                            tdcolspan = document.createAttribute("colspan");
                            tdcolspan.value = 3;
                            td.setAttributeNode(tdcolspan);
                        }
                        else if(ar[i].rvFileDTOs.length == 4){
                            tdcolspan = document.createAttribute("colspan");
                            tdcolspan.value = 3;
                            td.setAttributeNode(tdcolspan);
                            tdstyle.value = "white-space:nowrap; padding:0 100px 0 0;";
                            td.setAttributeNode(tdstyle);
                        }
                        else if(ar[i].rvFileDTOs.length == 3){
                            tdcolspan = document.createAttribute("colspan");
                            tdcolspan.value = 2;
                            td.setAttributeNode(tdcolspan);
                        }
                        else if (ar[i].rvFileDTOs.length == 2){
                            tdcolspan = document.createAttribute("colspan");
                            tdcolspan.value = 2;
                            td.setAttributeNode(tdcolspan);
                            tdstyle.value = "white-space:nowrap; padding:0 100px 0 0;";
                            td.setAttributeNode(tdstyle);
                        }
                        else if(ar[i].rvFileDTOs.length == 1){
                            tdcolspan = document.createAttribute("colspan");
                            tdcolspan.value = 1;
                            td.setAttributeNode(tdcolspan);
                        }
                    }

                    for(let f=0; f<ar[i].rvFileDTOs.length; f++){
                        btnimage = document.createElement("button");
                        imagetype = document.createAttribute("type");
                        imagetype.value = "button";
                        btnimage.setAttributeNode(imagetype);
                        btnClass = document.createAttribute("class");
                        btnClass.value = "flex-item";
                        btnimage.setAttributeNode(btnClass);
                        imageid = document.createAttribute("id");
                        imageid.value = "image"+ar[i].rvFileDTOs[f].fileName;
                        btnimage.setAttributeNode(imageid);
                        info = document.createAttribute("data-photo-name");
                        info.value = "/resources/upload/reviewfile/"+ar[i].rvFileDTOs[f].fileName;
                        btnimage.setAttributeNode(info);
                        btnStyle = document.createAttribute("style");
                        btnStyle.value = "border: 0px; outline: 0px; width: 100px; height: 100px; display:inline-block";
                        btnimage.setAttributeNode(btnStyle);
                        img = document.createElement("img");
                        imgStyle = document.createAttribute("style");
                        imgStyle.value = "border-radius: 10px;";
                        img.setAttributeNode(imgStyle);
                        src = document.createAttribute("src");
                        src.value="/resources/upload/reviewfile/"+ar[i].rvFileDTOs[f].fileName;
                        img.setAttributeNode(src);
                        a = document.createAttribute("class");
                        a.value = "img-fluid";
                        img.setAttributeNode(a);
                        btnimage.appendChild(img);
                        td.appendChild(btnimage);
                    }
                    tr2.appendChild(td);


                    td = document.createElement("td");
                    tdstyle = document.createAttribute("style");
                    tdstyle.value = "width:12%;";
                    td.setAttributeNode(tdstyle);
                    btnreply = document.createElement("button");
                    type = document.createAttribute("type");
                    type.value = "button";
                    btnreply.setAttributeNode(type);
                    let attr4 = document.createAttribute("class");
                    attr4.value = "comment"+ar[i].rvNum;
                    btnreply.setAttributeNode(attr4); 
                    attr4 = document.createAttribute("data-review-num");
                    attr4.value = ar[i].rvNum;
                    btnreply.setAttributeNode(attr4);
                    btnStyle = document.createAttribute("style");
                    btnStyle.value = "border: 1px solid gray; border-radius: 10px;";
                    btnreply.setAttributeNode(btnStyle);
                    btnimage = document.createElement("img");
                    imgsrc = document.createAttribute("src");
                    imgsrc.value = "/resources/images/review-ico-comment-off.png";
                    btnimage.setAttributeNode(imgsrc);
                    imgalt = document.createAttribute("alt");
                    imgalt.value = "댓글보기";
                    btnimage.setAttributeNode(imgalt);
                    btnText = document.createTextNode(ar[i].rvCommentDTOs.length);
                    btnreply.appendChild(btnimage);
                    btnreply.appendChild(btnText); 
                    td.appendChild(btnreply);
                    tr.appendChild(td);

                    td = document.createElement("td");
                    tdstyle = document.createAttribute("style");
                    if(!member){
                        tdstyle.value = "width:10%; display: none;";
                    }
                    else if(member.userId == ar[i].userId){
                        tdstyle.value = "width:10%;";
                    }
                    else if(member.userId != ar[i].userId){
                        tdstyle.value = "width:10%;";
                    }
                    td.setAttributeNode(tdstyle);
                    button = document.createElement("button");
                    type = document.createAttribute("type");
                    type.value = "button";
                    button.setAttributeNode(type);
                    let attr6 = document.createAttribute("id");
                    attr6.value = "reviewcommentadd"+ar[i].rvNum;
                    button.setAttributeNode(attr6);
                    let attr3 = document.createAttribute("class");
                    attr3.value = "btn btn-outline-success";
                    button.setAttributeNode(attr3);
                    attr3 = document.createAttribute("data-review-num");
                    attr3.value = ar[i].rvNum;
                    button.setAttributeNode(attr3);
                    btnText = document.createTextNode("댓글쓰기");
                    button.appendChild(btnText);
                    td.appendChild(button);
                    tr.appendChild(td);
 
                    td = document.createElement("td");
                    tdstyle = document.createAttribute("style");
                    if(!member){
                        tdstyle.value = "width:10%; display: none;";
                    }
                    else if(member.userId == ar[i].userId){
                        tdstyle.value = "width:10%;";
                    }
                    else if(member.userId != ar[i].userId){
                        tdstyle.value = "width:10%; display: none;";
                    } 
                    td.setAttributeNode(tdstyle);
                    let al = document.createElement("a");
                    href = document.createAttribute("href");
                    href.value = "./reviewupdate?rvNum="+ar[i].rvNum;
                    button = document.createElement("button");
                    btntype = document.createAttribute("type");
                    btntype.value = "button";
                    button.setAttributeNode(btntype);
                    attr3 = document.createAttribute("class");
                    attr3.value = "btn btn-outline-warning";
                    button.setAttributeNode(attr3);
                    btnText = document.createTextNode("리뷰수정");
                    button.appendChild(btnText);
                    al.setAttributeNode(href);
                    al.appendChild(button);
                    td.appendChild(al);
                    tr.appendChild(td);
        
                    td = document.createElement("td");
                    tdstyle = document.createAttribute("style");
                    if(!member){
                        tdstyle.value = "width:10%; display: none;";
                    }
                    else if(member.userId == ar[i].userId){
                        tdstyle.value = "width:10%;";
                    }
                    else if(member.userId != ar[i].userId){
                        tdstyle.value = "width:10%; display: none;";
                    }    
                    td.setAttributeNode(tdstyle);
                    button = document.createElement("button");
                    type = document.createAttribute("type");
                    type.value = "button";
                    button.setAttributeNode(type);
                    let attr5 = document.createAttribute("id");
                    attr5.value = "reviewdelete"+ar[i].rvNum;
                    button.setAttributeNode(attr5);
                    let attr2 = document.createAttribute("class");
                    attr2.value = "btn btn-outline-danger";
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

                    review.append(tr2);
                    review.append(tr);

                   
                }
                console.log(pager.totalPage);
                if(page >= pager.totalPage){
                    more.setAttribute("style","display: none;");
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

                
             

                let reviewdelete = document.getElementById("reviewdelete"+ar[i].rvNum)
                reviewdelete.addEventListener("click",function(){
                        let result = window.confirm("리뷰를 삭제하시겠습니까?");
                        if(!result){
                            return;
                        }
                        let photoNum = reviewdelete.getAttribute("data-reviewfile-num");
                        const xhttp = new XMLHttpRequest();
                        xhttp.open("POST","./fileDelete");
                        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                        xhttp.send("photoNum="+photoNum);
                        xhttp.onreadystatechange = function(){
                            if(xhttp.readyState == 4 && xhttp.status == 200){
                                let result = xhttp.responseText.trim();
                                if(result == 1){
                                    if(!ar[i].rvCommentDTOs[0].rvcNum){
                                        let rvNum = reviewdelete.getAttribute("data-review-num");
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
                                        let rvNum = reviewdelete.getAttribute("data-review-num");
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
                    let reviewcommentadd = document.getElementById("reviewcommentadd"+ar[i].rvNum);
                    reviewcommentadd.addEventListener("click",function(){
                        exampleModalLabel2.innerText = "댓글쓰기";
                        btnCheck.innerText = "작성";
                        let rvNum = ar[i].rvNum;
                        let rvcWriter = member.userId;
                        document.getElementById("rvNum").value = rvNum;
                        document.getElementById("rvcContents").value = "";
                        document.getElementById("rvcWriter").value = rvcWriter;
                        up.click();
                    });

                    
                    
                        if(ar[i].rvCommentDTOs[0].rvcNum){
                            console.log(ar[i].rvCommentDTOs[0].rvcNum);
                            let id = document.getElementById("id"+ar[i].rvNum);
                            const comment = document.getElementsByClassName("comment"+ar[i].rvNum);
                            console.log(comment);

                            for(let c=0;c<comment.length;c++){
                                comment[c].addEventListener("click",function(){
                                    console.log("다시");
                                    console.log(comment[c].firstChild.getAttribute("alt"))
                                    if(comment[c].firstChild.getAttribute("alt") == "댓글보기"){
                                        comment[c].firstChild.setAttribute("alt","댓글닫기");
                                        comment[c].firstChild.setAttribute("src","/resources/images/review-ico-comment-on.png");
                                        comment[c].setAttribute("style","border: 1px solid red; border-radius: 10px;")
                                        for(let j=ar[i].rvCommentDTOs.length;j>0;j--){
                                                let tr = document.createElement("tr");
                                                let check = document.createAttribute("class");
                                                check.value = "class"+ar[i].rvNum;
                                                tr.setAttributeNode(check);
                                                let style = document.createAttribute("style");
                                                style.value = "";
                                                tr.setAttributeNode(style);
                                                let td = document.createElement("td");
                                                colspan = document.createAttribute("colspan");
                                                colspan.value = 1;
                                                td.setAttributeNode(colspan);
                                                let tdText = document.createTextNode(ar[i].rvCommentDTOs[j-1].rvcWriter);
                                                td.appendChild(tdText);
                                                tr.appendChild(td);

                                                if(!member){
                                                    td = document.createElement("td");
                                                    tdcolspan = document.createAttribute("colspan");
                                                    tdcolspan.value = 4;
                                                    td.setAttributeNode(tdcolspan);
                                                    console.log(i);
                                                    console.log(j);
                                                    tdText = document.createTextNode(ar[i].rvCommentDTOs[j-1].rvcContents);
                                                    console.log(tdText);
                                                    td.appendChild(tdText);
                                                    tr.appendChild(td);
                                                }
                                                else if(member.userId == ar[i].userId || member.userId != ar[i].userId){
                                                    td = document.createElement("td");
                                                    tdcolspan = document.createAttribute("colspan");
                                                    tdcolspan.value = 5;
                                                    td.setAttributeNode(tdcolspan);
                                                    console.log(i);
                                                    console.log(j);
                                                    tdText = document.createTextNode(ar[i].rvCommentDTOs[j-1].rvcContents);
                                                    console.log(tdText);
                                                    td.appendChild(tdText);
                                                    tr.appendChild(td);
                                                }
                            
                                                td = document.createElement("td");
                                                tdstyle = document.createAttribute("style");
                                                if(!member){
                                                    tdstyle.value = "display: none;";
                                                }
                                                else if(member.userId == ar[i].rvCommentDTOs[j-1].rvcWriter){
                                                    tdstyle.value = "";
                                                }
                                                else if(member.userId != ar[i].rvCommentDTOs[j-1].rvcWriter){
                                                    tdstyle.value = "display: none;";
                                                }
                                                td.setAttributeNode(tdstyle);
                                                button = document.createElement("button");
                                                type = document.createAttribute("type");
                                                type.value = "button";
                                                button.setAttributeNode(type);
                                                let attr = document.createAttribute("id");
                                                attr.value = "reviewcommentupdate"+ar[i].rvCommentDTOs[j-1].rvcNum;
                                                button.setAttributeNode(attr); 
                                                attr = document.createAttribute("data-reviewcomment-num");
                                                attr.value = ar[i].rvCommentDTOs[j-1].rvcNum;
                                                button.setAttributeNode(attr);
                                                attr = document.createAttribute("class");
                                                attr.value = "btn btn-outline-warning";
                                                button.setAttributeNode(attr);
                                                btnText = document.createTextNode("댓글수정");
                                                button.appendChild(btnText);
                                                td.appendChild(button);
                                                tr.appendChild(td);
                    
                                                td = document.createElement("td");
                                                tdstyle = document.createAttribute("style");
                                                if(!member){
                                                    tdstyle.value = "display: none;";
                                                }
                                                else if(member.userId == ar[i].rvCommentDTOs[j-1].rvcWriter){
                                                    tdstyle.value = "";
                                                }
                                                else if(member.userId != ar[i].rvCommentDTOs[j-1].rvcWriter){
                                                    tdstyle.value = "display: none;";
                                                }
                                                td.setAttributeNode(tdstyle);
                                                button = document.createElement("button");
                                                type = document.createAttribute("type");
                                                type.value = "button";
                                                button.setAttributeNode(type);
                                                let attr1 = document.createAttribute("id");
                                                attr1.value = "reviewcommentdelete"+ar[i].rvCommentDTOs[j-1].rvcNum;
                                                button.setAttributeNode(attr1); 
                                                attr1 = document.createAttribute("data-reviewcomment-num");
                                                attr1.value = ar[i].rvCommentDTOs[j-1].rvcNum;
                                                button.setAttributeNode(attr1);
                                                attr = document.createAttribute("class");
                                                attr.value = "btn btn-outline-danger";
                                                button.setAttributeNode(attr);
                                                btnText = document.createTextNode("댓글삭제");
                                                button.appendChild(btnText);
                                                td.appendChild(button);
                                                tr.appendChild(td);
                        
                                                id.after(tr);
                                            }
                                        }
                        
                                        else if(comment[c].firstChild.getAttribute("alt") == "댓글닫기"){
                                            comment[c].firstChild.setAttribute("alt","댓글보기");
                                            comment[c].firstChild.setAttribute("src","/resources/images/review-ico-comment-off.png");
                                            comment[c].setAttribute("style","border: 1px solid gray; border-radius: 10px;");
                                            let check = document.getElementsByClassName("class"+ar[i].rvNum);
                                            for(let p=check.length;p>0;p--){
                                                console.log(check.length);
                                                check[p-1].remove();
                                            }
                                        }
                                        for(let j=ar[i].rvCommentDTOs.length;j>0;j--){

                                            let reviewcommentdelete = document.getElementById("reviewcommentdelete"+ar[i].rvCommentDTOs[j-1].rvcNum);
                                            let reviewcommentupdate = document.getElementById("reviewcommentupdate"+ar[i].rvCommentDTOs[j-1].rvcNum);
                                                
                                                    
                                                        reviewcommentdelete.addEventListener("click",function(){
                                                            let result = window.confirm("댓글을 삭제하시겠습니까?");
                                                            if(!result){
                                                                return;
                                                            }
                                                            let rvcNum = reviewcommentdelete.getAttribute("data-reviewcomment-num");
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
                                                    
                                                  
                
                                                        reviewcommentupdate.addEventListener("click",function(){
                                                            exampleModalLabel2.innerText = "댓글수정";
                                                            btnCheck.innerText = "수정";
                                                            let rvcContents = ar[i].rvCommentDTOs[j-1].rvcContents;
                                                            console.log(i);
                                                            console.log(c);
                                                            console.log(ar[i].rvCommentDTOs[j-1].rvcContents);
                                                            document.getElementById("rvcContents").value = rvcContents;
                                                            let rvcNum = ar[i].rvCommentDTOs[j-1].rvcNum;
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
    reviewList(page);
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
        let rvcWriter = document.getElementById("rvcWriter").value;

        const xHttp = new XMLHttpRequest();
        xHttp.open("POST","./reviewcommentadd");
        xHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xHttp.send("rvNum="+rvNum+"&rvcContents="+rvcContents+"&rvcWriter="+rvcWriter);
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



const qna = document.getElementById("qna");
const qnaCheck = document.getElementById("qnaCheck");
const th2 = document.getElementsByClassName("th2");
let page2 = 1;
function qnaList(){
    const xHttp = new XMLHttpRequest();
    xHttp.open("GET","./qnaList?page="+page2+"&itemNum="+itemNum);
    xHttp.send();
    xHttp.addEventListener("readystatechange",function(){
        if(this.readyState == 4 && this.status == 200){
            let result = JSON.parse(xHttp.responseText.trim());
            
            let pager = result.pager;
            console.log(pager);
            let ar = result.list;
            let member = result.member;
            for(let c=0;c<th2.length;c++){
                th2[c].setAttribute("style","");
            }

            if(page2<pager.totalPage){
                moreqna.setAttribute("style","");
            }
    
            for(let i=0; i<ar.length; i++){
                if(!ar[i].sellQnaCommentDTOs[0].sqNum){
                    let tr = document.createElement("tr"); 
                    let td = document.createElement("td"); 
                    let tdText = document.createTextNode(ar[i].userId);
                    td.appendChild(tdText);           
                    tr.appendChild(td);
    
                    td = document.createElement("td");
                    tdText = document.createTextNode(ar[i].title);
                    td.appendChild(tdText);
                    tr.appendChild(td);
    
                    td = document.createElement("td");
                    tdText = document.createTextNode(ar[i].contents);
                    td.appendChild(tdText);
                    tr.appendChild(td);

                    td = document.createElement("td");
                    btnZero = document.createElement("button");
                    btnZeroType = document.createAttribute("type");
                    btnZeroType.value = "button";
                    btnZero.setAttributeNode(btnZeroType);
                    btnNot = document.createAttribute("disabled");
                    btnZero.setAttributeNode(btnNot);
                    btnStyle = document.createAttribute("style");
                    btnStyle.value = "border: 1px solid gray; border-radius: 10px;";
                    btnZero.setAttributeNode(btnStyle);
                    btnimage = document.createElement("img");
                    imgsrc = document.createAttribute("src");
                    imgsrc.value = "/resources/images/review-ico-comment-off.png";
                    btnimage.setAttributeNode(imgsrc);
                    imgalt = document.createAttribute("alt");
                    imgalt.value = "댓글";
                    btnimage.setAttributeNode(imgalt);
                    btnZero.appendChild(btnimage);
                    tdText = document.createTextNode("0");
                    btnZero.appendChild(tdText);
                    td.appendChild(btnZero);
                    tr.appendChild(td);
    
                    td = document.createElement("td");
                    tdstyle = document.createAttribute("style");
                    if(!member){
                        tdstyle.value = "display: none;";
                    }
                    else if(member.userId == ar[i].userId){
                        tdstyle.value = "";
                    }
                    else if(member.userId != ar[i].userId){
                        tdstyle.value = "";
                    }
                    td.setAttributeNode(tdstyle);
                    button = document.createElement("button");
                    type = document.createAttribute("type");
                    type.value = "button";
                    button.setAttributeNode(type);
                    let attr5 = document.createAttribute("id");
                    attr5.value = "qnacommentadd"+ar[i].qnaNum;
                    button.setAttributeNode(attr5);
                    let attr3 = document.createAttribute("class");
                    attr3.value = "btn btn-outline-success";
                    button.setAttributeNode(attr3); 
                    attr3 = document.createAttribute("data-qna-num");
                    attr3.value = ar[i].qnaNum;
                    button.setAttributeNode(attr3);
                    btnText = document.createTextNode("댓글쓰기");
                    button.appendChild(btnText);
                    td.appendChild(button);
                    tr.appendChild(td);

                    td = document.createElement("td");
                    tdstyle = document.createAttribute("style");
                    if(!member){
                        tdstyle.value = "display: none;";
                    }
                    else if(member.userId == ar[i].userId){
                        tdstyle.value = "";
                    }
                    else if(member.userId != ar[i].userId){
                        tdstyle.value = "display: none;";
                    }
                    td.setAttributeNode(tdstyle);
                    let al = document.createElement("a");
                    href = document.createAttribute("href");
                    href.value = "./qnaupdate?qnaNum="+ar[i].qnaNum;
                    button = document.createElement("button");
                    btntype = document.createAttribute("type");
                    btntype.value = "button";
                    button.setAttributeNode(btntype);
                    attr3 = document.createAttribute("class");
                    attr3.value = "btn btn-outline-warning";
                    button.setAttributeNode(attr3);
                    btnText = document.createTextNode("QNA수정");
                    button.appendChild(btnText);
                    al.setAttributeNode(href);
                    al.appendChild(button);
                    td.appendChild(al);
                    tr.appendChild(td);
                    

                    td = document.createElement("td");
                    tdstyle = document.createAttribute("style");
                    if(!member){
                        tdstyle.value = "display: none;";
                    }
                    else if(member.userId == ar[i].userId){
                        tdstyle.value = "";
                    }
                    else if(member.userId != ar[i].userId){
                        tdstyle.value = "display: none;";
                    }
                    td.setAttributeNode(tdstyle);
                    button = document.createElement("button");
                    type = document.createAttribute("type");
                    type.value = "button";
                    button.setAttributeNode(type);
                    let attr6 = document.createAttribute("id");
                    attr6.value = "qnadelete"+ar[i].qnaNum;
                    button.setAttributeNode(attr6);
                    let attr2 = document.createAttribute("class");
                    attr2.value = "btn btn-outline-danger";
                    button.setAttributeNode(attr2); 
                    attr2 = document.createAttribute("data-qna-num");
                    attr2.value = ar[i].qnaNum;
                    button.setAttributeNode(attr2);
                    btnText = document.createTextNode("QNA삭제");
                    button.appendChild(btnText);
                    td.appendChild(button);
                    tr.appendChild(td);

    
                    qna.append(tr);
                }
                else{
                    let tr = document.createElement("tr"); 
                    let trid = document.createAttribute("id");
                    trid.value = "id"+ar[i].qnaNum;
                    tr.setAttributeNode(trid);
                    let td = document.createElement("td"); 
                    let tdText = document.createTextNode(ar[i].userId);
                    td.appendChild(tdText);           
                    tr.appendChild(td);
    
                    td = document.createElement("td");
                    tdText = document.createTextNode(ar[i].title);
                    td.appendChild(tdText);
                    tr.appendChild(td);
    
                    td = document.createElement("td");
                    tdText = document.createTextNode(ar[i].contents);
                    td.appendChild(tdText);
                    tr.appendChild(td);


                    td = document.createElement("td");
                    btnreply = document.createElement("button");
                    type = document.createAttribute("type");
                    type.value = "button";
                    btnreply.setAttributeNode(type);
                    attr4 = document.createAttribute("class");
                    attr4.value = "qnacomment"+ar[i].qnaNum;
                    btnreply.setAttributeNode(attr4); 
                    attr4 = document.createAttribute("data-qna-num");
                    attr4.value = ar[i].qnaNum;
                    btnreply.setAttributeNode(attr4);
                    btnStyle = document.createAttribute("style");
                    btnStyle.value = "border: 1px solid gray; border-radius: 10px;";
                    btnreply.setAttributeNode(btnStyle);
                    btnimage = document.createElement("img");
                    imgsrc = document.createAttribute("src");
                    imgsrc.value = "/resources/images/review-ico-comment-off.png";
                    btnimage.setAttributeNode(imgsrc);
                    imgalt = document.createAttribute("alt");
                    imgalt.value = "댓글보기";
                    btnimage.setAttributeNode(imgalt);
                    btnText = document.createTextNode(ar[i].sellQnaCommentDTOs.length);
                    btnreply.appendChild(btnimage);
                    btnreply.appendChild(btnText);
                    td.appendChild(btnreply);
                    tr.appendChild(td);

                    td = document.createElement("td");
                    tdstyle = document.createAttribute("style");
                    if(!member){
                        tdstyle.value = "display: none;";
                    }
                    else if(member.userId == ar[i].userId){
                        tdstyle.value = "";
                    }
                    else if(member.userId != ar[i].userId){
                        tdstyle.value = "";
                    }
                    td.setAttributeNode(tdstyle);
                    button = document.createElement("button");
                    type = document.createAttribute("type");
                    type.value = "button";
                    button.setAttributeNode(type);
                    let attr5 = document.createAttribute("id");
                    attr5.value = "qnacommentadd"+ar[i].qnaNum;
                    button.setAttributeNode(attr5);
                    let attr3 = document.createAttribute("class");
                    attr3.value = "btn btn-outline-success";
                    button.setAttributeNode(attr3); 
                    attr3 = document.createAttribute("data-qna-num");
                    attr3.value = ar[i].qnaNum;
                    button.setAttributeNode(attr3);
                    btnText = document.createTextNode("댓글쓰기");
                    button.appendChild(btnText);
                    td.appendChild(button);
                    tr.appendChild(td);

                    td = document.createElement("td");
                    tdstyle = document.createAttribute("style");
                    if(!member){
                        tdstyle.value = "display: none;";
                    }
                    else if(member.userId == ar[i].userId){
                        tdstyle.value = "";
                    }
                    else if(member.userId != ar[i].userId){
                        tdstyle.value = "display: none;";
                    }
                    td.setAttributeNode(tdstyle);
                    let al = document.createElement("a");
                    href = document.createAttribute("href");
                    href.value = "./qnaupdate?qnaNum="+ar[i].qnaNum;
                    button = document.createElement("button");
                    btntype = document.createAttribute("type");
                    btntype.value = "button";
                    button.setAttributeNode(btntype);
                    attr3 = document.createAttribute("class");
                    attr3.value = "btn btn-outline-warning";
                    button.setAttributeNode(attr3);
                    btnText = document.createTextNode("QNA수정");
                    button.appendChild(btnText);
                    al.setAttributeNode(href);
                    al.appendChild(button);
                    td.appendChild(al);
                    tr.appendChild(td);
    
                    td = document.createElement("td");
                    tdstyle = document.createAttribute("style");
                    if(!member){
                        tdstyle.value = "display: none;";
                    }
                    else if(member.userId == ar[i].userId){
                        tdstyle.value = "";
                    }
                    else if(member.userId != ar[i].userId){
                        tdstyle.value = "display: none;";
                    }
                    td.setAttributeNode(tdstyle);
                    button = document.createElement("button");
                    type = document.createAttribute("type");
                    type.value = "button";
                    button.setAttributeNode(type);
                    let attr6 = document.createAttribute("id");
                    attr6.value = "qnadelete"+ar[i].qnaNum;
                    button.setAttributeNode(attr6);
                    let attr2 = document.createAttribute("class");
                    attr2.value = "btn btn-outline-danger";
                    button.setAttributeNode(attr2); 
                    attr2 = document.createAttribute("data-qna-num");
                    attr2.value = ar[i].qnaNum;
                    button.setAttributeNode(attr2);
                    btnText = document.createTextNode("QNA삭제");
                    button.appendChild(btnText);
                    td.appendChild(button);
                    tr.appendChild(td);


                    qna.append(tr);
                }

                if(page2 >= pager.totalPage){
                    moreqna.setAttribute("style","display: none;");
                    moreqna.classList.add("disabled");
                }
                else{
                    moreqna.classList.remove("disabled");
                }

                const qnadelete = document.getElementById("qnadelete"+ar[i].qnaNum);
                qnadelete.addEventListener("click",function(){
                        let result = window.confirm("QNA를 삭제하시겠습니까?");
                        if(!result){
                            return;
                        }
                        if(!ar[i].sellQnaCommentDTOs[0].sqNum){
                            let qnaNum = qnadelete.getAttribute("data-qna-num");
                            const xHttp = new XMLHttpRequest();
                            xHttp.open("POST","./qnadelete");
                            xHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                            xHttp.send("qnaNum="+qnaNum);
                            xHttp.onreadystatechange = function(){
                                if(xHttp.readyState == 4 && xHttp.status == 200){
                                    let result = xHttp.responseText.trim();
                                    if(result == 1){
                                        alert("QNA 삭제 성공");
                                        return window.location.href='/sell/detail?itemNum='+itemNum;
                                    }
                                    else{
                                        alert("QNA 삭제 실패");
                                        return;
                                    }
                                }
                            }
                        }
                        else{
                            let qnaNum = qnadelete.getAttribute("data-qna-num");
                            const xHttp = new XMLHttpRequest();
                            xHttp.open("POST","./qnacommentalldelete");
                            xHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                            xHttp.send("qnaNum="+qnaNum);
                            xHttp.onreadystatechange = function(){
                                if(xHttp.readyState == 4 && xHttp.status == 200){
                                    let result = xHttp.responseText.trim();
                                    if(result == 1){
                                        const xHttp = new XMLHttpRequest();
                                        xHttp.open("POST","./qnadelete");
                                        xHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                        xHttp.send("qnaNum="+qnaNum);
                                        xHttp.onreadystatechange = function(){
                                            if(xHttp.readyState == 4 && xHttp.status == 200){
                                                let result = xHttp.responseText.trim();
                                                if(result == 1){
                                                    alert("QNA 삭제 성공");
                                                    return window.location.href='/sell/detail?itemNum='+itemNum;
                                                }
                                                else{
                                                    alert("QNA 삭제 실패");
                                                    return;
                                                }
                                            }
                                        }
                                    }
                                    else{
                                        alert("QNA에 있는 댓글 먼저 삭제 실패");
                                        return;
                                    }
                                }
                            }
                        }
                })
                const qnacommentadd = document.getElementById("qnacommentadd"+ar[i].qnaNum);
                qnacommentadd.addEventListener("click",function(){
                    exampleModalLabel2.innerText = "댓글쓰기";
                    btnCheck.innerText = "작성";
                    let qnaNum = ar[i].qnaNum;
                    let sqWriter = member.userId;
                    document.getElementById("rvNum").value = qnaNum;
                    document.getElementById("rvcContents").value = "";
                    document.getElementById("rvcWriter").value = sqWriter;
                    up.click();
                });
                if(ar[i].sellQnaCommentDTOs[0].sqNum){
                    
                    let id = document.getElementById("id"+ar[i].qnaNum);
                    const qnacomment = document.getElementsByClassName("qnacomment"+ar[i].qnaNum);
                    for(let c=0;c<qnacomment.length;c++){
                        qnacomment[c].addEventListener("click",function(){
                            if(qnacomment[c].firstChild.getAttribute("alt") == "댓글보기"){
                                qnacomment[c].firstChild.setAttribute("alt","댓글닫기");
                                qnacomment[c].firstChild.setAttribute("src","/resources/images/review-ico-comment-on.png");
                                qnacomment[c].setAttribute("style","border: 1px solid red; border-radius: 10px;")
                                for(let j=ar[i].sellQnaCommentDTOs.length;j>0;j--){
                                        let tr = document.createElement("tr");
                                        let check = document.createAttribute("class");
                                        check.value = "class"+ar[i].qnaNum;
                                        tr.setAttributeNode(check);
                                        let style = document.createAttribute("style");
                                        style.value = "";
                                        tr.setAttributeNode(style);
                                        let td = document.createElement("td");
                                        colspan = document.createAttribute("colspan");
                                        colspan.value = 1;
                                        td.setAttributeNode(colspan);
                                        let tdText = document.createTextNode(ar[i].sellQnaCommentDTOs[j-1].sqWriter);
                                        td.appendChild(tdText);
                                        tr.appendChild(td);

                                        if(!member){
                                            td = document.createElement("td");
                                            colspan = document.createAttribute("colspan");
                                            colspan.value = 3;
                                            td.setAttributeNode(colspan);
                                            console.log(i);
                                            console.log(j);
                                            tdText = document.createTextNode(ar[i].sellQnaCommentDTOs[j-1].sqContents);
                                            console.log(tdText);
                                            td.appendChild(tdText);
                                            tr.appendChild(td);
                                        }
                                        else if(member.userId == ar[i].userId || member.userId != ar[i].userId){
                                            td = document.createElement("td");
                                            colspan = document.createAttribute("colspan");
                                            colspan.value = 4;
                                            td.setAttributeNode(colspan);
                                            console.log(i);
                                            console.log(j);
                                            tdText = document.createTextNode(ar[i].sellQnaCommentDTOs[j-1].sqContents);
                                            console.log(tdText);
                                            td.appendChild(tdText);
                                            tr.appendChild(td);
                                        }
                    
                                        td = document.createElement("td");
                                        tdstyle = document.createAttribute("style");
                                        if(!member){
                                            tdstyle.value = "display: none;";
                                        }
                                        else if(member.userId == ar[i].sellQnaCommentDTOs[j-1].sqWriter){
                                            tdstyle.value = "";
                                        }
                                        else if(member.userId != ar[i].sellQnaCommentDTOs[j-1].sqWriter){
                                            tdstyle.value = "display: none;";
                                        }
                                        td.setAttributeNode(tdstyle);
                                        button = document.createElement("button");
                                        type = document.createAttribute("type");
                                        type.value = "button";
                                        button.setAttributeNode(type);
                                        let attr = document.createAttribute("id");
                                        attr.value = "qnacommentupdate"+ar[i].sellQnaCommentDTOs[j-1].sqNum;
                                        button.setAttributeNode(attr); 
                                        attr = document.createAttribute("data-qnacomment-num");
                                        attr.value = ar[i].sellQnaCommentDTOs[j-1].sqNum;
                                        button.setAttributeNode(attr);
                                        attr = document.createAttribute("class");
                                        attr.value = "btn btn-outline-warning";
                                        button.setAttributeNode(attr);
                                        btnText = document.createTextNode("댓글수정");
                                        button.appendChild(btnText);
                                        td.appendChild(button);
                                        tr.appendChild(td);
            
                                        td = document.createElement("td");
                                        tdstyle = document.createAttribute("style");
                                        if(!member){
                                            tdstyle.value = "display: none;";
                                        }
                                        else if(member.userId == ar[i].sellQnaCommentDTOs[j-1].sqWriter){
                                            tdstyle.value = "";
                                        }
                                        else if(member.userId != ar[i].sellQnaCommentDTOs[j-1].sqWriter){
                                            tdstyle.value = "display: none;";
                                        }
                                        td.setAttributeNode(tdstyle);
                                        button = document.createElement("button");
                                        type = document.createAttribute("type");
                                        type.value = "button";
                                        button.setAttributeNode(type);
                                        let attr1 = document.createAttribute("id");
                                        attr1.value = "qnacommentdelete"+ar[i].sellQnaCommentDTOs[j-1].sqNum;
                                        button.setAttributeNode(attr1); 
                                        attr1 = document.createAttribute("data-qnacomment-num");
                                        attr1.value = ar[i].sellQnaCommentDTOs[j-1].sqNum;
                                        button.setAttributeNode(attr1);
                                        attr = document.createAttribute("class");
                                        attr.value = "btn btn-outline-danger";
                                        button.setAttributeNode(attr);
                                        btnText = document.createTextNode("댓글삭제");
                                        button.appendChild(btnText);
                                        td.appendChild(button);
                                        tr.appendChild(td);
                
                                        id.after(tr);
                                    }
                
                            }
                            else if(qnacomment[c].firstChild.getAttribute("alt") == "댓글닫기"){
                                qnacomment[c].firstChild.setAttribute("alt","댓글보기");
                                qnacomment[c].firstChild.setAttribute("src","/resources/images/review-ico-comment-off.png");
                                qnacomment[c].setAttribute("style","border: 1px solid gray; border-radius: 10px;");
                                let check = document.getElementsByClassName("class"+ar[i].qnaNum);
                                for(let p=check.length;p>0;p--){
                                    check[p-1].remove();
                                }
                            }
                            for(let j=ar[i].sellQnaCommentDTOs.length;j>0;j--){

                                    let qnacommentdelete = document.getElementById("qnacommentdelete"+ar[i].sellQnaCommentDTOs[j-1].sqNum);
                                    let qnacommentupdate = document.getElementById("qnacommentupdate"+ar[i].sellQnaCommentDTOs[j-1].sqNum);
                                
                                    qnacommentdelete.addEventListener("click",function(){
                                        let result = window.confirm("댓글을 삭제하시겠습니까?");
                                        if(!result){
                                            return;
                                        }
                                        let sqNum = qnacommentdelete.getAttribute("data-qnacomment-num");
                                        const xHttp = new XMLHttpRequest();
                                        xHttp.open("POST","./qnacommentdelete");
                                        xHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                        xHttp.send("sqNum="+sqNum);
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

                                    qnacommentupdate.addEventListener("click",function(){
                                        exampleModalLabel2.innerText = "댓글수정";
                                        btnCheck.innerText = "수정";
                                        let sqContents = ar[i].sellQnaCommentDTOs[j-1].sqContents;
                                        console.log(ar[i].sellQnaCommentDTOs[j-1].sqContents);
                                        document.getElementById("rvcContents").value = sqContents;
                                        let sqNum = ar[i].sellQnaCommentDTOs[j-1].sqNum;
                                        document.getElementById("rvcNum").value = sqNum; 
                                        up.click();
                                    });
                                }
                                
                            })
                        }
                        
                    }
            }
        }
    })
             
}

moreqna.addEventListener("click",function(){
    page2++;
    qnaList(page2);
});

btnCheck.addEventListener("click",function(){
    if(btnCheck.innerHTML == "수정"){
        let sqNum = document.getElementById("rvcNum").value;
        let sqContents = document.getElementById("rvcContents").value;
        const xHttp = new XMLHttpRequest();
        xHttp.open("POST","./qnacommentupdate");
        xHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xHttp.send("sqNum="+sqNum+"&sqContents="+sqContents);
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
        let qnaNum = document.getElementById("rvNum").value;
        let sqContents = document.getElementById("rvcContents").value;
        let sqWriter = document.getElementById("rvcWriter").value;
        const xHttp = new XMLHttpRequest();
        xHttp.open("POST","./qnacommentadd");
        xHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xHttp.send("qnaNum="+qnaNum+"&sqContents="+sqContents+"&sqWriter="+sqWriter);
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