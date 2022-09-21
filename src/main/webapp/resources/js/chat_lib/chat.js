//chat.js => room.jsp

const app = document.getElementById("app");
const roomName = document.querySelector("#roomName");
const btn = document.getElementById("btn");


btn.addEventListener("click", function(){
    let name = roomName.value;
    console.log(roomName.value);

    const xhttp = new XMLHttpRequest();

    xhttp.open("POST","/chat/room");

    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    xhttp.send("name="+name);

    xhttp.onreadystatechange = function(){
        if(this.readyState==4 && this.status==200){
            location.reload();
        }
    }

})

