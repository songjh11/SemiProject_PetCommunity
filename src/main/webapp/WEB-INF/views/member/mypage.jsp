<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <form action="./delete" enctype="multipart/form-data">
    <h1>${dto.roleDTO.roleName}'s My Page</h1>
    <p>이름: ${dto.userName}</p>

    <c:choose>
		<c:when test="${dto.roleNum eq 1}">
            <p>아이템카테고리: ${dto.itemCatg}</p>
            <p>아이템아이디: ${dto.itemId}</p>
            
        </c:when>
        <c:when test="${dto.roleNum eq 2}">
            <p>펫이름: ${dto.petName}</p>
            <p>펫카테고리: ${dto.petCatg}</p>
            <img src="../resources/upload/member/${dto.memberFileDTO.fileName}" alt="">
            <a href="../resources/upload/member/${dto.memberFileDTO.fileName}">${dto.memberFileDTO.oriName}</a>
        </c:when>
	</c:choose>
    <p>번호: ${dto.phone}</p>
    <p>메일: ${dto.email}</p>
    <p>주소: ${dto.itemZipCode} + ${dto.deAddress} + ${dto.address}</p>
    <c:choose>
		<c:when test="${dto.agValue  eq 1}">
            <p>정보제공동의여부: 동의</p>
        </c:when>
        <c:when test="${dto.agValue  eq 0}">
            <p>정보제공동의여부: 비동의</p>
        </c:when>
    </c:choose>
    <c:choose>
        <c:when test="${dto.agMail  eq 1}">
            <p>메일수신동의여부: 동의</p>
        </c:when>
        <c:when test="${dto.agMail  eq 0}">
            <p>메일수신동의여부: 비동의</p>
        </c:when>
    </c:choose>
    <c:choose>
        <c:when test="${dto.agMes  eq 1}">
            <p>문자수신동의여부: 동의</p>
        </c:when>
        <c:when test="${dto.agMes  eq 0}">
            <p>문자수신동의여부: 비동의</p>
        </c:when>
     </c:choose>
     <button type="submit" class="btn-book-a-table">회원탈퇴</button>
     <a href="./update" class="btn-book-a-table">정보수정</a>
    </form>
   
    <a href="./purchaseList?userId=${sessionScope.member.userId}"><button type="button">결제 내역 보기</button></a>


<!-- 
    M.USERID, M.ROLENUM, R.ROLENAME, M.USERNAME, M.EMAIL, M.PHONE, M.ADDRESS,
  M.BLOCK, M.AGMAIL, M.AGVALUE, M.AGMES, G.PETCATG, G.PETNAME, MF.FILENAME, MF.ORINAME -->

</body>
</html>