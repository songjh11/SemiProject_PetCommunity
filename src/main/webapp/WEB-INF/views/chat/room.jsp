<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="container" id="app">
        <div class="row">
            <div class="col-md-12">
                <h3>채팅방 리스트</h3>
            </div>
        </div>
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <label class="input-group-text"></label>
        </div>
        <input type="text" class="form-control" name="name" id="roomName">
        <div class="input-group-apped">
            <button class="btn btn-primary" type="button" id="btn">채팅방 개설</button>
        </div>
        <ul class="list-group">
            <c:forEach items="${list}" var="entry">
    			<li class="list-group-item list-group-item-action">
                	Key = ${entry.key}, value = ${entry.value.name}
            	</li>
			</c:forEach>
        </ul>
    </div>

<script src="/resources/js/chat.js"></script>

</body>
</html>