<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
</head>
<body>

<div class="row">
	<table class="table">
		<thead>
			<tr>
				<th>방 번호</th><th>이름</th><th>개설자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.list}" var="dto">
			<tr>
				<td>${pageScope.dto.roomNum}</td>
				<td><a href="/chat?roomNum=${dto.roomNum}">${pageScope.dto.roomName}</a></td>
				<td>${pageScope.dto.masterName}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>

	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">방 생성하기</button>

	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
		<div class="modal-header">
			<h5 class="modal-title" id="exampleModalLabel">방 생성</h5>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		</div>
		<div class="modal-body">
			<form action="./add" method="post">
			<div class="mb-3">
				<label for="recipient-name" class="col-form-label">작성자</label>
				<input type="text" class="form-control" id="masterName" name="masterName" readonly value="${dto.userName}">
			</div>
			<div class="mb-3">
				<label for="message-text" class="col-form-label">방제목</label>
				<textarea class="form-control" id="roomName" name="roomName"></textarea>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				<button type="submit" class="btn btn-primary" id="send">Send message</button>
			</div>
			</form>
			
			<div id="list">
			</div>
			
		</div>
		</div>
	</div>
	</div>
	
	<script type="text/javascript">

	</script>

</body>
</html>