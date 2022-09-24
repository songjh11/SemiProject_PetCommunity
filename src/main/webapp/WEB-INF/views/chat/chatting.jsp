<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>

<!-- Noto-Sans 폰트-->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- JUA 폰트-->
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

</head>
<body>
	<!-- 채팅 아이콘 -->
	<div class="chatIcon font_jua">
		<img src="/resources/assets/img/chatting/chatting.png" class="iconImage">
	</div>
    <div class="ChatContiner display-none"></div>


    
    
    
    <!--채팅 리스트/ 채팅방 OPEN / CLOSE-->
    <script>

        //채팅 아이콘 클릭했을 때
        // 1. 채팅방이 열려있지 않으면
        //  = > 리스트 오픈
        // 2. 열려있으면
        //  = > 채팅방 닫음
        $(document).on("click", ".chatIcon", function(){
            if($('.chatContainer').hasClass("display-none")){           
                $('.chatListContainer').toggleClass('display-none');    
            }else{
                $('.chatContainer').toggleClass('display-none');
                websocket.close();
            }                                                               
        });

        $(document).on("click", "img.close", function(){
            $('.chatContainer').toggleClass('display-none');
            websocket.close();
        })

        $(document).on("click", "img.down", function(){
            $('.chatContainer').toggleClass('display-none');
            $('.chatListContainer').toggleClass('display-none');
            websocket.close();
        })

    </script>
</body>
</html>