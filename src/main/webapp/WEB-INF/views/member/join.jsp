<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>join page</h1>

<form action="join" method="POST">
<h1>✿회원가입✿( ღ'ᴗ'ღ )</h1>

<hr>
<input type="hidden" name="agMes" value="${ag.agMes}">
<input type="hidden" name="agMail" value="${ag.agMail}">
<input type="hidden" name="agValue" value="${ag.agValue}">
<div>
사업자 <input type="radio" name="roleNum" value="1">
개인회원 <input type="radio" name="roleNum" value="2">
</div>

<div>
아이디 <input type="text" name=userId> <input type="button" value="중복확인"><br>
비밀번호 <input type="password" name="password"> <input type="button" value="비밀번호 확인"><br>
</div>

<div>
    <br>
    이름 <input type="text" name="userName"><br>
    번호 <input type="number" name="phone"><br>
    이메일 <input type="email" name="email"><br>
    주소 <input type="text" name="address"><br>
<br>

  

</div>

<div>
    <hr>
    <input type="button" value="작성취소">
    <input type="submit" value="회원가입">
</div>
</form>
</body>
</html>