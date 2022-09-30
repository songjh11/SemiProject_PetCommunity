<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/assets/css/star.css" rel="stylesheet">
</head>
<body>
	<form action="reviewupdate" method="post" enctype="multipart/form-data">
		<input type="hidden" name="rvNum" value="${reviewDTO.rvNum }">
		작성자<input type="text" readonly="readonly" name="userId" value="${reviewDTO.userId }">
		제목<input type="text" name="rvTitle" value="${reviewDTO.rvTitle }">
		내용<input type="text" name="rvContents" value="${reviewDTO.rvContents }">
		<c:if test="${reviewDTO.rvRate == 0.5}">
			<fieldset class="rating">
				평점
				<input type="radio" id="star5" name="rvRate" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
				<input type="radio" id="star4half" name="rvRate" value="4 and a half" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
				<input type="radio" id="star4" name="rvRate" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
				<input type="radio" id="star3half" name="rvRate" value="3 and a half" /><label  class="half" for="star3half" title="Meh - 3.5 stars"></label>
				<input type="radio" id="star3" name="rvRate" value="3" /><label  class = "full" for="star3" title="Meh - 3 stars"></label>
				<input type="radio" id="star2half" name="rvRate" value="2 and a half" /><label  class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
				<input type="radio" id="star2" name="rvRate" value="2" /><label  class = "full" for="star2" title="Kinda bad - 2 stars"></label>
				<input type="radio" id="star1half" name="rvRate" value="1 and a half" /><label  class="half" for="star1half" title="Meh - 1.5 stars"></label>
				<input type="radio" id="star1" name="rvRate" value="1" /><label  class = "full" for="star1" title="Sucks big time - 1 star"></label>
				<input type="radio" id="starhalf" name="rvRate" value="half" checked="checked" /><label  class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
			  </fieldset>
		</c:if>
		<c:if test="${reviewDTO.rvRate == 1}">
			<fieldset class="rating">
				평점
				<input type="radio" id="star5" name="rvRate" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
				<input type="radio" id="star4half" name="rvRate" value="4 and a half" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
				<input type="radio" id="star4" name="rvRate" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
				<input type="radio" id="star3half" name="rvRate" value="3 and a half" /><label  class="half" for="star3half" title="Meh - 3.5 stars"></label>
				<input type="radio" id="star3" name="rvRate" value="3" /><label  class = "full" for="star3" title="Meh - 3 stars"></label>
				<input type="radio" id="star2half" name="rvRate" value="2 and a half" /><label  class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
				<input type="radio" id="star2" name="rvRate" value="2" /><label  class = "full" for="star2" title="Kinda bad - 2 stars"></label>
				<input type="radio" id="star1half" name="rvRate" value="1 and a half" /><label  class="half" for="star1half" title="Meh - 1.5 stars"></label>
				<input type="radio" id="star1" name="rvRate" value="1" checked="checked" /><label  class = "full" for="star1" title="Sucks big time - 1 star"></label>
				<input type="radio" id="starhalf" name="rvRate" value="half" /><label  class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
			  </fieldset>
		</c:if>
		<c:if test="${reviewDTO.rvRate == 1.5}">
			<fieldset class="rating">
				평점
				<input type="radio" id="star5" name="rvRate" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
				<input type="radio" id="star4half" name="rvRate" value="4 and a half" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
				<input type="radio" id="star4" name="rvRate" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
				<input type="radio" id="star3half" name="rvRate" value="3 and a half" /><label  class="half" for="star3half" title="Meh - 3.5 stars"></label>
				<input type="radio" id="star3" name="rvRate" value="3" /><label  class = "full" for="star3" title="Meh - 3 stars"></label>
				<input type="radio" id="star2half" name="rvRate" value="2 and a half" /><label  class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
				<input type="radio" id="star2" name="rvRate" value="2" /><label  class = "full" for="star2" title="Kinda bad - 2 stars"></label>
				<input type="radio" id="star1half" name="rvRate" value="1 and a half" checked="checked" /><label  class="half" for="star1half" title="Meh - 1.5 stars"></label>
				<input type="radio" id="star1" name="rvRate" value="1" /><label  class = "full" for="star1" title="Sucks big time - 1 star"></label>
				<input type="radio" id="starhalf" name="rvRate" value="half" /><label  class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
			  </fieldset>
		</c:if>
		<c:if test="${reviewDTO.rvRate == 2}">
			<fieldset class="rating">
				평점
				<input type="radio" id="star5" name="rvRate" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
				<input type="radio" id="star4half" name="rvRate" value="4 and a half" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
				<input type="radio" id="star4" name="rvRate" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
				<input type="radio" id="star3half" name="rvRate" value="3 and a half" /><label  class="half" for="star3half" title="Meh - 3.5 stars"></label>
				<input type="radio" id="star3" name="rvRate" value="3" /><label  class = "full" for="star3" title="Meh - 3 stars"></label>
				<input type="radio" id="star2half" name="rvRate" value="2 and a half" /><label  class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
				<input type="radio" id="star2" name="rvRate" value="2" checked="checked" /><label  class = "full" for="star2" title="Kinda bad - 2 stars"></label>
				<input type="radio" id="star1half" name="rvRate" value="1 and a half" /><label  class="half" for="star1half" title="Meh - 1.5 stars"></label>
				<input type="radio" id="star1" name="rvRate" value="1" /><label  class = "full" for="star1" title="Sucks big time - 1 star"></label>
				<input type="radio" id="starhalf" name="rvRate" value="half" /><label  class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
			  </fieldset>
		</c:if>
		<c:if test="${reviewDTO.rvRate == 2.5}">
			<fieldset class="rating">
				평점
				<input type="radio" id="star5" name="rvRate" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
				<input type="radio" id="star4half" name="rvRate" value="4 and a half" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
				<input type="radio" id="star4" name="rvRate" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
				<input type="radio" id="star3half" name="rvRate" value="3 and a half" /><label  class="half" for="star3half" title="Meh - 3.5 stars"></label>
				<input type="radio" id="star3" name="rvRate" value="3" /><label  class = "full" for="star3" title="Meh - 3 stars"></label>
				<input type="radio" id="star2half" name="rvRate" value="2 and a half" checked="checked" /><label  class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
				<input type="radio" id="star2" name="rvRate" value="2" /><label  class = "full" for="star2" title="Kinda bad - 2 stars"></label>
				<input type="radio" id="star1half" name="rvRate" value="1 and a half" /><label  class="half" for="star1half" title="Meh - 1.5 stars"></label>
				<input type="radio" id="star1" name="rvRate" value="1" /><label  class = "full" for="star1" title="Sucks big time - 1 star"></label>
				<input type="radio" id="starhalf" name="rvRate" value="half" /><label  class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
			  </fieldset>
		</c:if>
		<c:if test="${reviewDTO.rvRate == 3}">
			<fieldset class="rating">
				평점
				<input type="radio" id="star5" name="rvRate" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
				<input type="radio" id="star4half" name="rvRate" value="4 and a half" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
				<input type="radio" id="star4" name="rvRate" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
				<input type="radio" id="star3half" name="rvRate" value="3 and a half" /><label  class="half" for="star3half" title="Meh - 3.5 stars"></label>
				<input type="radio" id="star3" name="rvRate" value="3" checked="checked" /><label  class = "full" for="star3" title="Meh - 3 stars"></label>
				<input type="radio" id="star2half" name="rvRate" value="2 and a half" /><label  class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
				<input type="radio" id="star2" name="rvRate" value="2" /><label  class = "full" for="star2" title="Kinda bad - 2 stars"></label>
				<input type="radio" id="star1half" name="rvRate" value="1 and a half" /><label  class="half" for="star1half" title="Meh - 1.5 stars"></label>
				<input type="radio" id="star1" name="rvRate" value="1" /><label  class = "full" for="star1" title="Sucks big time - 1 star"></label>
				<input type="radio" id="starhalf" name="rvRate" value="half" /><label  class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
			  </fieldset>
		</c:if>
		<c:if test="${reviewDTO.rvRate == 3.5}">
			<fieldset class="rating">
				평점
				<input type="radio" id="star5" name="rvRate" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
				<input type="radio" id="star4half" name="rvRate" value="4 and a half" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
				<input type="radio" id="star4" name="rvRate" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
				<input type="radio" id="star3half" name="rvRate" value="3 and a half" checked="checked" /><label  class="half" for="star3half" title="Meh - 3.5 stars"></label>
				<input type="radio" id="star3" name="rvRate" value="3" /><label  class = "full" for="star3" title="Meh - 3 stars"></label>
				<input type="radio" id="star2half" name="rvRate" value="2 and a half" /><label  class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
				<input type="radio" id="star2" name="rvRate" value="2" /><label  class = "full" for="star2" title="Kinda bad - 2 stars"></label>
				<input type="radio" id="star1half" name="rvRate" value="1 and a half" /><label  class="half" for="star1half" title="Meh - 1.5 stars"></label>
				<input type="radio" id="star1" name="rvRate" value="1" /><label  class = "full" for="star1" title="Sucks big time - 1 star"></label>
				<input type="radio" id="starhalf" name="rvRate" value="half" /><label  class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
			  </fieldset>
		</c:if>
		<c:if test="${reviewDTO.rvRate == 4}">
			<fieldset class="rating">
				평점
				<input type="radio" id="star5" name="rvRate" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
				<input type="radio" id="star4half" name="rvRate" value="4 and a half" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
				<input type="radio" id="star4" name="rvRate" value="4" checked="checked" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
				<input type="radio" id="star3half" name="rvRate" value="3 and a half" /><label  class="half" for="star3half" title="Meh - 3.5 stars"></label>
				<input type="radio" id="star3" name="rvRate" value="3" /><label  class = "full" for="star3" title="Meh - 3 stars"></label>
				<input type="radio" id="star2half" name="rvRate" value="2 and a half" /><label  class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
				<input type="radio" id="star2" name="rvRate" value="2" /><label  class = "full" for="star2" title="Kinda bad - 2 stars"></label>
				<input type="radio" id="star1half" name="rvRate" value="1 and a half" /><label  class="half" for="star1half" title="Meh - 1.5 stars"></label>
				<input type="radio" id="star1" name="rvRate" value="1" /><label  class = "full" for="star1" title="Sucks big time - 1 star"></label>
				<input type="radio" id="starhalf" name="rvRate" value="half" /><label  class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
			  </fieldset>
		</c:if>
		<c:if test="${reviewDTO.rvRate == 4.5}">
			<fieldset class="rating">
				평점
				<input type="radio" id="star5" name="rvRate" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
				<input type="radio" id="star4half" name="rvRate" value="4 and a half" checked="checked" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
				<input type="radio" id="star4" name="rvRate" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
				<input type="radio" id="star3half" name="rvRate" value="3 and a half" /><label  class="half" for="star3half" title="Meh - 3.5 stars"></label>
				<input type="radio" id="star3" name="rvRate" value="3" /><label  class = "full" for="star3" title="Meh - 3 stars"></label>
				<input type="radio" id="star2half" name="rvRate" value="2 and a half" /><label  class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
				<input type="radio" id="star2" name="rvRate" value="2" /><label  class = "full" for="star2" title="Kinda bad - 2 stars"></label>
				<input type="radio" id="star1half" name="rvRate" value="1 and a half" /><label  class="half" for="star1half" title="Meh - 1.5 stars"></label>
				<input type="radio" id="star1" name="rvRate" value="1" /><label  class = "full" for="star1" title="Sucks big time - 1 star"></label>
				<input type="radio" id="starhalf" name="rvRate" value="half" /><label  class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
			  </fieldset>
		</c:if>
		<c:if test="${reviewDTO.rvRate == 5}">
			<fieldset class="rating">
				평점
				<input type="radio" id="star5" name="rvRate" value="5" checked="checked" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
				<input type="radio" id="star4half" name="rvRate" value="4 and a half" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
				<input type="radio" id="star4" name="rvRate" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
				<input type="radio" id="star3half" name="rvRate" value="3 and a half" /><label  class="half" for="star3half" title="Meh - 3.5 stars"></label>
				<input type="radio" id="star3" name="rvRate" value="3" /><label  class = "full" for="star3" title="Meh - 3 stars"></label>
				<input type="radio" id="star2half" name="rvRate" value="2 and a half" /><label  class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
				<input type="radio" id="star2" name="rvRate" value="2" /><label  class = "full" for="star2" title="Kinda bad - 2 stars"></label>
				<input type="radio" id="star1half" name="rvRate" value="1 and a half" /><label  class="half" for="star1half" title="Meh - 1.5 stars"></label>
				<input type="radio" id="star1" name="rvRate" value="1" /><label  class = "full" for="star1" title="Sucks big time - 1 star"></label>
				<input type="radio" id="starhalf" name="rvRate" value="half" /><label  class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
			  </fieldset>
		</c:if>
		<input type="hidden" name="itemNum" value="${reviewDTO.itemNum}">
		<c:forEach items="${reviewDTO.rvFileDTOs }" var="fileDTO">
			<div class="mb-3">
				<span>${fileDTO.oriName}</span>
				<button class="fileDelete" type="button" data-file-num="${fileDTO.photoNum}">삭제</button>
			</div>
		</c:forEach>
		<div id="addFiles">
			<button type="button" id="fileAdd">파일 추가</button>
		</div>
	
		
	<button type="submit">수정</button>
	</form>
	<script src="/resources/JS/review_file.js"></script>
	<script>setCount(${reviewDTO.rvFileDTOs.size()});</script>
</body>
</html>