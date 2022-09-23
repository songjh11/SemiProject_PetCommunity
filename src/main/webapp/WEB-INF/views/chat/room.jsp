<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <!-- Favicons -->
  <link href="/resources/assets/img/favicon.png" rel="icon">
  <link href="/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Amatic+SC:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Inter:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/resources/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="/resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="/resources/assets/css/main.css" rel="stylesheet">

<style>
	.container {
	width: 500px;
	}

	#list {
	height: 300px;
	padding: 15px;
	overflow: auto;
	}
</style>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>

</head>
<body>

	
	<div class="container">
	<h1 class="page-header">Chat</h1>		
	
	<table class="table table-bordered">
		<tr>
			<td><input type="text" name="user" id="user" class="form-control" placeholder="유저명"></td>
			<td>
				<button type="button" class="btn btn-default" id="btnConnect">연결</button>
				<button type="button" class="btn btn-default" id="btnDisconnect" disabled>종료</button>
			</td>
		</tr>
		<tr>
			<td colspan="2"><div id="list"></div></td>
		</tr>
		<tr>
			<td colspan="2"><input type="text" name="msg" id="msg" placeholder="대화 내용을 입력하세요." class="form-control" disabled></td>
		</tr>
	</table>
	
	</div>


	<!-- Vendor JS Files -->
	<script src="/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/resources/assets/vendor/aos/aos.js"></script>
	<script src="/resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="/resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script src="/resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="/resources/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="/resources/assets/js/main.js"></script>



</body>
<script type="text/javascript">
//채팅 서버 주소
let url = "ws://localhost/chatserver";
   		
// 웹 소켓
let ws;

// 연결하기
$('#btnConnect').click(function() {

	// 유저명 확인
   	if ($('#user').val().trim() != '') {
   		// 연결
	   	ws = new WebSocket(url);
	   			
	   	// 소켓 이벤트 매핑
	   	ws.onopen = function (evt) {
	   		// console.log('서버 연결 성공');
	   		print($('#user').val(), '입장했습니다.');
	   				
	   		// 현재 사용자가 입장했다고 서버에게 통지(유저명 전달)
	   		// -> 1#유저명
			ws.send('1#' + $('#user').val() + '#');
					
			$('#user').attr('readonly', true);
			$('#btnConnect').attr('disabled', true);
			$('#btnDisconnect').attr('disabled', false);
			$('#msg').attr('disabled', false);
			$('#msg').focus();
		};
        
		ws.onmessage = function (evt) {
			// print('', evt.data);
			let index = evt.data.indexOf("#", 2);
			let no = evt.data.substring(0, 1); 
			let user = evt.data.substring(2, index);
			let txt = evt.data.substring(index + 1);
	   				
			if (no == '1') {
				print2(user);
			} else if (no == '2') {
				print(user, txt);
			} else if (no == '3') {
				print3(user);
			}
			$('#list').scrollTop($('#list').prop('scrollHeight'));
		};
	   			
		ws.onclose = function (evt) {
			console.log('소켓이 닫힙니다.');
		};

		ws.onerror = function (evt) {
			console.log(evt.data);
		};
	} else {
		alert('유저명을 입력하세요.');
		$('#user').focus();
	}
});

// 메세지 전송 및 아이디
function print(user, txt) {
	let temp = '';
	temp += '<div style="margin-bottom:3px;">';
	temp += '[' + user + '] ';
	temp += txt;
	temp += ' <span style="font-size:11px;color:#777;">' + new Date().toLocaleTimeString() + '</span>';
	temp += '</div>';
			
	$('#list').append(temp);
}
		
// 다른 client 접속		
function print2(user) {
	let temp = '';
	temp += '<div style="margin-bottom:3px;">';
	temp += "'" + user + "' 이(가) 접속했습니다." ;
	temp += ' <span style="font-size:11px;color:#777;">' + new Date().toLocaleTimeString() + '</span>';
	temp += '</div>';
			
	$('#list').append(temp);
}

// client 접속 종료
function print3(user) {
	let temp = '';
	temp += '<div style="margin-bottom:3px;">';
	temp += "'" + user + "' 이(가) 종료했습니다." ;
	temp += ' <span style="font-size:11px;color:#777;">' + new Date().toLocaleTimeString() + '</span>';
	temp += '</div>';
			
	$('#list').append(temp);
}

$('#user').keydown(function() {
	if (event.keyCode == 13) {
		$('#btnConnect').click();
	}
});
		
		
		
$('#msg').keydown(function() {
	if (event.keyCode == 13) {
				
		//서버에게 메시지 전달
		//2#유저명#메시지
		ws.send('2#' + $('#user').val() + '#' + $(this).val()); //서버에게
		print($('#user').val(), $(this).val()); //본인 대화창에
		
        $('#msg').val('');
		$('#msg').focus();
				
	}
});
		
$('#btnDisconnect').click(function() {
	ws.send('3#' + $('#user').val() + '#');
	ws.close();
			
	$('#user').attr('readonly', false);
    $('#user').val('');
			
	$('#btnConnect').attr('disabled', false);
	$('#btnDisconnect').attr('disabled', true);
			
	$('#msg').val('');
	$('#msg').attr('disabled', true);
});
</script>
</html>