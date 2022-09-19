const sellfileAdd = document.getElementById("sellfileAdd");
const imgDeleteBtn = document.querySelectorAll(".imgDeleteBtn");
const sellFileImages = document.getElementById("sellFileImages");
let count=0;
let idx=0;

function imgFileAdd(){
    console.log("fileAdd");
    if(count>4){
         alert("상품사진은 최대 5개까지만 추가 가능합니다");
         return;
}
    const realsellfileAdd = document.getElementById("realsellfileAdd");
        realsellfileAdd.click();
 
};

function imageChange(event){
    console.log(event.target.parentNode);
    
    const sellFileImages = event.target.parentNode;
//이벤트 대상자의 부모
const reader = new FileReader();

reader.onload = function(event) {
console.log(sellFileImages);
const input = document.createElement("input");
const itype = document.createAttribute("type");
itype.value = "file";
input.setAttributeNode(itype);
const iname = document.createAttribute("name");
iname.value = "mf";
input.setAttributeNode(iname);

const newImg = document.createElement("img");
newImg.setAttribute("src", event.target.result);
newImg.setAttribute("class", "thumnail");

const newButton = document.createElement("button");
const buttonStyle = document.createAttribute("type");
buttonStyle.value = "button";

const buttonClass = document.createAttribute("class");
buttonClass.value="imgDeleteBtn";
const buttonText = document.createTextNode("X");

newButton.setAttributeNode(buttonStyle);
newButton.setAttributeNode(buttonClass);
newButton.appendChild(buttonText);

const imageDiv = document.createElement("div");
const imageDivClass = document.createAttribute("class");
imageDivClass.value = "imageDiv";
imageDiv.setAttributeNode(imageDivClass);
imageDiv.appendChild(input);
imageDiv.appendChild(newImg);
imageDiv.appendChild(newButton);
sellFileImages.appendChild(imageDiv);
count++;
};
reader.readAsDataURL(event.target.files[0]);
};

imgDeleteBtn.forEach(function(df){
        df.addEventListener("click", function(){
            console.log(df.parentNode);
            let result = window.confirm("삭제?")
            if(!result){
                return;
            }


        })

    });