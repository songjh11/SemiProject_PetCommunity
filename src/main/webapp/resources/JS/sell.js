const sellfileAdd = document.getElementById("sellfileAdd");
const imgDeleteBtn = document.querySelectorAll(".imgDeleteBtn");
const sellFileImages = document.getElementById("sellFileImages");
const realsellfileAdd = document.getElementById("realsellfileAdd");
const inputDiv = document.getElementById("inputDiv");
const imgDiv = document.getElementById("imgDiv");

let count=0;
let idx=0;

// <input type="file" id="realsellfileAdd" accept="image/*" style="display: none;" onchange="imageChange(event);">

sellfileAdd.addEventListener("click", function(){
    console.log("fileAdd");
    if(count>4){
         alert("상품사진은 최대 5개까지만 추가 가능합니다");
         return;
    }

    const input = document.createElement("input");
    const inputType = document.createAttribute("type");
    inputType.value = "file";
    const inputId = document.createAttribute("id");
    inputId.value = "realsellfileAdd"+idx;
    console.log(inputId.value);
    const iname = document.createAttribute("name");
    iname.value = "files";
    const iClass = document.createAttribute("class");
    iClass.value = "inputNone"
    
    input.setAttributeNode(inputType);
    input.setAttributeNode(inputId);
    input.setAttributeNode(iname);
    input.setAttributeNode(iClass);
    
    inputDiv.appendChild(input);
    
    const child = document.getElementById(input.id);
    console.log("child : ", child);
    child.click();
   

});

//------------------------------------------------
//이벤트 전달
sellFileImages.addEventListener("change", function(event){
    console.log("e",event.target);
    const reader = new FileReader();

    reader.onload = function(event) {

        const newImg = document.createElement("img");
        newImg.setAttribute("src", event.target.result);
        newImg.setAttribute("class", "thumnail");

        const newButton = document.createElement("button");
        const buttonStyle = document.createAttribute("type");
        buttonStyle.value = "button";

        const buttonClass = document.createAttribute("class");
        buttonClass.value="imgDeleteBtn";
        const buttonText = document.createTextNode("X");

        const buttonId = document.createAttribute("id");
        buttonId.value = idx;

        newButton.setAttributeNode(buttonStyle);
        newButton.setAttributeNode(buttonClass);
        newButton.setAttributeNode(buttonId);
        newButton.appendChild(buttonText);

        const newDiv = document.createElement("div");
        newDiv.setAttribute("class","newDiv");
        
        newDiv.appendChild(newImg);
        newDiv.appendChild(newButton);

        imgDiv.appendChild(newDiv);
        idx++;
        count++;
        };

        reader.readAsDataURL(event.target.files[0]);
});


//=======================================================삭제
imgDiv.addEventListener("click", function(event){
    console.log(event.target);
    const df = event.target;
    console.log(df.id);
    let result = window.confirm("삭제?")
      if(!result){
               return;
        }
    
    remId = document.getElementById("realsellfileAdd"+df.id);//인풋아이디
    remId.remove();  
    
    df.parentNode.remove();//버튼
    console.log(inputDiv.children);   
   
    count--;    
});

//------------------------------------------------
