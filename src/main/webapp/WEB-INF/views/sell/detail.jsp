<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${category.categoryName}</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
  .checked {
    color: orange;
  }
  </style>
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
        <span>${ar.oriName}</span>
        <a href="../resources/upload/sellfile/${ar.fileName}">
            <img width=200 height=200 src="../resources/upload/sellfile/${ar.fileName}" class="rounded" alt="...">
            </a>
    </c:forEach>
</div>

 <a href="./update?itemNum=${sellItemDTO.itemNum}"><button>수정</button></a>
 <a href="./delete?itemNum=${sellItemDTO.itemNum}"><button id="deleteItem">삭제</button></a>
  <a href="./reviewadd?itemNum=${sellItemDTO.itemNum}"><button>리뷰쓰기</button></a>
 <!-- contents, review, qna -->
 <div>
   <!-- Button trigger modal -->
   <button type="button" id= "up" style="display:none" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
     Launch demo modal
     </button>
 
     <!-- Modal -->
     <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
     <div class="modal-dialog">
         <div class="modal-content">
         <div class="modal-header">
             <h5 class="modal-title" id="exampleModalLabel">댓글 수정</h5>
             <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
         </div>
         <div class="modal-body">
           <input type="hidden" id="rvcNum" value="">
           <input type="hidden" id="rvNum" value="">
           <textarea class="form-control" id="rvcContents"></textarea>
         </div>
         <div class="modal-footer">
           <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >취소</button>
            <button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="btnCheck">수정</button>
         </div>
         </div>
     </div>
     </div>
 </div>

 <div>
  <!-- Button trigger modal -->
  <button type="button" id= "full" style="display: none;" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal2">
    Launch demo modal
    </button>
    <!-- Modal -->
    <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-fullscreen">
        <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <img src="" id="fullimage">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >닫기</button>
        </div>
        </div>
    </div>
    </div>
</div>

<div class="crq">
  <ul class="nav nav-tabs" role="tablist">
      <li class="nav-item" role="presentation">
        <a class="nav-link active" data-bs-toggle="tab" href="#iContents" aria-selected="true" role="tab">상세 설명</a>
      </li>
      <li class="nav-item" role="presentation">
        <a class="nav-link" data-bs-toggle="tab" href="#rv" id="reviewCheck" onclick="reviewList(); this.onclick=null;" data-item-num="${sellItemDTO.itemNum}" aria-selected="false" role="tab" tabindex="-1">리뷰</a>
      </li>
      <li class="nav-item" role="presentation">
        <a class="nav-link" data-bs-toggle="tab" href="#qna" aria-selected="false" role="tab" tabindex="-1">문의</a>
      </li>
    </ul>
    <div id="myTabContent" class="tab-content">
      <div class="tab-pane fade show active" id="iContents" role="tabpanel">
        <p>${sellItemDTO.itemContents}</p>
      </div>
      <div class="tab-pane fade" role="tabpanel" id="rv">
        <p>리뷰</p>
        <table class="table" id="review">
          <th class="th" style="display: none;" >작성자</th>
          <th class="th" style="display: none;" >제목</th>
          <th class="th" style="display: none;" >내용</th>
          <th class="th" style="display: none;" >평점</th>
          <th class="th" style="display: none;" >리뷰사진</th>
        </table>
        <button id="more">더보기</button>
      </div>
      <div class="tab-pane fade" id="qna" role="tabpanel">
        <p>문의</p>
      </div>
    </div>
</div> 
  
  <!-- 삭제 컨펌 관련 js추가 -->
  <!--모달 부트스트랩-->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
  <!-- 리뷰 리스트 js -->
  <script src="/resources/JS/review.js"></script>
 </body>
</html>