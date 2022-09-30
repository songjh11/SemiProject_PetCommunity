<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>공지사항</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

 
</head>

<body>

  <c:import url="/WEB-INF/views/template/testheader.jsp"></c:import>

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>Sample Inner Page</h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li>Sample Inner Page</li>
          </ol>
        </div>

      </div>
    </div><!-- End Breadcrumbs -->

    <section class="sample-page">
      <div class="container" data-aos="fade-up">

       <table class="table">
	
		<thead>
			<tr>
				<th>번호</th><th>제목</th><th>작성자</th><th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${requestScope.dto.num}</td>
				<td>${requestScope.dto.title}</td>
				<td>${requestScope.dto.writer}</td>
				<td>${requestScope.dto.hit}</td>
				
			</tr>
		</tbody>
		</table>
		
		<div class="row">
			<c:forEach items="${dto.boardFileDTOs}" var="fileDTO">
				<p>
				<a href="../resources/upload/notice/${fileDTO.fileName}">${fileDTO.oriName}</a>
				</p>
			</c:forEach>
		</div> 
		
				<div class="form-floating">
	  			<textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 200px"></textarea>
	  			<label for="floatingTextarea2">${dto.contents}</label>
				</div>
		
		
		<c:if test="${board eq 'qna'}">
		<a href="./reply?num=${dto.num}" class="btn btn-danger">reply</a>
		</c:if>
	
		<a href="./update?num=${requestScope.dto.num}" class="btn btn-primary">수정</a>
	
	
		<a href="./delete?num=${requestScope.dto.num}" class="btn btn-primary">삭제</a>

    </div>

    <c:if test="${board eq 'sharing'}">
    <!--------COMMENT---------->
			<div class="row">
				<div class="mb-3">
					<label for="writer" class="form-label">Username</label>
					<input type="text" class="form-control" id="writer">
				  </div>
				  <div class="mb-3">
					<label for="contents" class="form-label">Contents</label>
					<textarea class="form-control" id="contents" rows="3"></textarea>
				  </div>
				  <div class="mb-3">
					<button type="button" id="commentAdd" data-num="${dto.num}">댓글 작성</button>

				  </div>
			</div>
			<div>
				<table id="commentList" class="table table-dark table-hover">

				</table>

				<button id="more" class="btn btn-danger">더 보기</button>

			</div>
			<!--------COMMENT---------->

		</div>
		<!--- Modal ----->
		<div>
			<button type="button" style="display: none;" id="up" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@getbootstrap">댓글 수정</button>

			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Update</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form>
						<input type="hidden" id="num">
					<div class="mb-3">
						<label for="recipient-name" class="col-form-label">Writer</label>
						<input type="text" class="form-control" readonly id="updateWriter">
					</div>
					<div class="mb-3">
						<label for="message-text" class="col-form-label">Contents</label>
						<textarea class="form-control" id="updateContents"></textarea>
					</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="close">닫기</button>
					<button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="updateButton">수정하기</button>
				</div>
				</div>
			</div>
			</div>

		</div>
   </c:if>

    </section>

  </main><!-- End #main -->

  <c:import url="/WEB-INF/views/template/testfooter.jsp"></c:import>

	<script type="text/javascript" src="/resources/JS/board/boardComment.js"></script>
</body>

</html>