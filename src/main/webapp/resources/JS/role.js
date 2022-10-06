const frm = document.getElementById("frm");
const btn1 = document.getElementById("btn1");
const btn2 = document.getElementById("btn2");
const rd1 = document.getElementById("rd1");
const rd2 = document.getElementById("rd2");

btn1.addEventListener("click",function(){

    rd1.checked = true;
    frm.submit();
})

btn2.addEventListener("click",function(){

    rd2.checked = true;
    frm.submit();
})