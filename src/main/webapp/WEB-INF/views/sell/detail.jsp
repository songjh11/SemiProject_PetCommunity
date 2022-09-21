<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${category.categoryName}</title>
</head>
<body>
<div>
    ${sellItemDTO.itemNum}
    ${sellItemDTO.userId}
    ${sellItemDTO.itemName}
    ${sellItemDTO.itemPrice}
    ${sellItemDTO.itemContents}
    ${sellItemDTO.itemZipCode}
    ${sellItemDTO.itemAddress}
    ${sellItemDTO.itemDeAddress}
    ${sellItemDTO.itemCatg}
</div>

<div>
    <c:forEach items="${sellItemDTO.fileDTOs}" var="ar">
        <a href="../resources/upload/sellfile/${ar.fileName}">
            <img width=200 height=200 src="../resources/upload/sellfile/${ar.fileName}" class="rounded" alt="...">
            </a>
    </c:forEach>
</div>

 <a href="./update?itemNum=${sellItemDTO.itemNum}"><button>수정</button></a>
  <a href="./delete?itemNum=${sellItemDTO.itemNum}"><button id="deleteItem">삭제</button></a>
  
  <!-- 삭제 컨펌 관련 js추가 -->
 </body>
</html>