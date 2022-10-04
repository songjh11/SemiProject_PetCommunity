 const dels = document.querySelectorAll(".del");
 
    for (const del of dels){
        del.addEventListener('click', function(event) {
            let fol = event.target.parentNode.parentNode.parentNode.firstChild.nextSibling.innerText;
        console.log(fol);
        // console.log(what);
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