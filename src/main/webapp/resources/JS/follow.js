 const fed = document.querySelectorAll(".followeedel");
 const frd = document.querySelectorAll(".followerdel");
 const cd = document.querySelectorAll(".cartdel");
 const pd = document.querySelectorAll(".pickdel");
 const bb = document.querySelectorAll(".blockbtn");
 const unbb = document.querySelectorAll(".unblockbtn");

 for (const unblockbtn of unbb){
    unblockbtn.addEventListener('click', function(event) {
        let fol = event.target.parentNode.parentNode.parentNode.firstChild.nextSibling.innerText;
        
        let frm = document.createElement('form');
        frm.id = 'frm';
        frm.name= 'frm'
        frm.method = 'get';
        frm.action = "unblock";

        let input = document.createElement('input');
        input.setAttribute("type","hidden");
        input.setAttribute("name","userId");
        input.setAttribute("value",fol);

        frm.appendChild(input);

        document.body.appendChild(frm);

        frm.submit();

        document.body.removeChild(frm); 

  })
}
 

 for (const blockbtn of bb){
    blockbtn.addEventListener('click', function(event) {
        let fol = event.target.parentNode.parentNode.parentNode.firstChild.nextSibling.innerText;

        let frm = document.createElement('form');
        frm.id = 'frm';
        frm.name= 'frm'
        frm.method = 'get';
        frm.action = "block";

        let input = document.createElement('input');
        input.setAttribute("type","hidden");
        input.setAttribute("name","userId");
        input.setAttribute("value",fol);

        frm.appendChild(input);

        document.body.appendChild(frm);

        frm.submit();

        document.body.removeChild(frm); 

  })
}

for (const followeedel of fed){
  followeedel.addEventListener('click', function(event) {
let check = window.confirm("팔로이를 삭제하시겠습니까?");
if(!check){
    return;
}
let fol = event.target.parentNode.parentNode.parentNode.firstChild.nextSibling.innerText;

let frm = document.createElement('form');
frm.id = 'frm';
frm.name= 'frm'
frm.method = 'post';
frm.action = "followee";

let input = document.createElement('input');
input.setAttribute("type","hidden");
input.setAttribute("name","followee");
input.setAttribute("value",fol);

frm.appendChild(input);

document.body.appendChild(frm);

//1. 전송할 객체 생성
const xhttp = new XMLHttpRequest();

//2. Method, URL 준비
xhttp.open("POST","./followee");

//3. Enctype, Post 방식 일 경우
xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

//4. 전송
xhttp.send("followee="+fol);

//5. 응답처리
xhttp.onreadystatechange = function(){
    if(xhttp.readyState == 4 && xhttp.status == 200){
        let result = xhttp.responseText.trim();

        if(result == 1){
          alert("삭제되었습니다.");
          document.body.removeChild(frm); 
          return window.location.href='/member/followee';

        }else{
          alert("삭제 실패했습니다.");
        }
    }
}

})
}

    for (const followerdel of frd){
        followerdel.addEventListener('click', function(event) {
            let fol = event.target.parentNode.parentNode.parentNode.firstChild.nextSibling.innerText;
            console.log(fol);
            let frm = document.createElement('form');
            frm.id = 'frm';
            frm.name= 'frm'
            frm.method = 'post';
            frm.action = "follower";

            let input = document.createElement('input');
            input.setAttribute("type","hidden");
            input.setAttribute("name","follower");
            input.setAttribute("value",fol);

            frm.appendChild(input);

            document.body.appendChild(frm);

            frm.submit();

            document.body.removeChild(frm); 

      })
    }

    for (const cartdel of cd){
        cartdel.addEventListener('click', function(event) {
            let fol = event.target.parentNode.parentNode.parentNode.firstChild.nextSibling.innerText;
            console.log(fol);
            let frm = document.createElement('form');
            frm.id = 'frm';
            frm.name= 'frm';
            frm.method = 'post';
            frm.action = "cart";

            let input = document.createElement('input');
            input.setAttribute("type","hidden");
            input.setAttribute("name","itemNum");
            input.setAttribute("value",fol);

            frm.appendChild(input);

            document.body.appendChild(frm);

            frm.submit();

            document.body.removeChild(frm); 

      })
    }

    for (const pickdel of pd){
        pickdel.addEventListener('click', function(event) {
            let fol = event.target.parentNode.parentNode.parentNode.firstChild.nextSibling.innerText;
            console.log(fol);
            let frm = document.createElement('form');
            frm.id = 'frm';
            frm.name= 'frm'
            frm.method = 'post';
            frm.action = "pick";

            let input = document.createElement('input');
            input.setAttribute("type","hidden");
            input.setAttribute("name","itemNum");
            input.setAttribute("value",fol);

            frm.appendChild(input);

            document.body.appendChild(frm);

            frm.submit();

            document.body.removeChild(frm); 

      })
    }

    //==================관리자 회원목록에서 회원 검색=====================

  const sfrm = document.getElementById("sfrm");
  const whatrn = document.getElementById("whatrn");
  const sbtn = document.getElementById("sbtn");

  sbtn.addEventListener("click",function(){
    console.log("dddd ");

    if(whatrn.value<1){
        alert("카테고리를 입력해주세요");
        return;
    }else{
        sfrm.submit();
    }
  })

