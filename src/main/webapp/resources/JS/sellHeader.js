
function searchClose(){
    const searchBtn = document.getElementById("searchBtn");
    const searchFrm = document.getElementById("searchFrm");
    searchBtn.addEventListener("click", function(){
        console.log("버튼");
        const searchItemCatg = document.getElementById("searchItemCatg");
        console.log(searchItemCatg.value);
        if(searchItemCatg.value.length<1){
            alert("카테고리를 선택해주세요");
            return;
        } else{
            searchFrm.submit();
        }
    })
}
searchBtn.addEventListener("click", function(){
    console.log("버튼");
    const searchItemCatg = document.getElementById("searchItemCatg");
    console.log(searchItemCatg.value);
    if(searchItemCatg.value.length<1){
        alert("카테고리를 선택해주세요");
        return;
    } else{
        searchFrm.submit();
    }
})