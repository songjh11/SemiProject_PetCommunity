<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 ${dto.itemNum}
 ${dto.itemName}
 ${dto.fileName}
 <a href="./update?itemNum=${dto.itemNum}"><button>수정</button></a>
  <a href="./delete?itemNum=${dto.itemNum}"><button id="deleteItem">삭제</button></a>
  
  <!-- 삭제 컨펌 관련 js추가 -->
 </body>
</html>