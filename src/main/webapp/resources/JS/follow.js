 const fed = document.querySelectorAll(".followeedel");
 const frd = document.querySelectorAll(".followerdel");
 const cd = document.querySelectorAll(".cartdel");
 const pd = document.querySelectorAll(".pickdel");
 
    for (const followeedel of fed){
        followeedel.addEventListener('click', function(event) {
            let fol = event.target.parentNode.parentNode.parentNode.firstChild.nextSibling.innerText;
   
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

    for (const followerdel of frd){
        followerdel.addEventListener('click', function(event) {
            let fol = event.target.parentNode.parentNode.parentNode.firstChild.nextSibling.innerText;
            console.log(fol);
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