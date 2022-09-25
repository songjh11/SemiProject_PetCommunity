<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"></script>
</head>
<body>

	<div id="messageArea"></div>
	<input type="text" id="message" />
	<input type="button" id="sendBtn" value="submit" >
	
	<script>
        $("#sendBtn").click(function(){
            sendMessage();
            $('#message').val('');
        })

        let sock = new SockJS("http://localhost/echo/");
        sock.onMessage = onMessage;
        sock.onclose = onClose;

        //메세지 전송
        function sendMessage() {
            sock.send($("#message").val());
        }

        //서버로부터 메세지를 받으면
        function onMessage(msg){
            let data = msg.data;
            $("#messageArea").append(data + "<br/>");
        }

        //서버와 연결 끊었을 때
        function onClose(evt){
            $("#messageArea").append("연결 끊김");
        }

    </script>
</body>
</html>