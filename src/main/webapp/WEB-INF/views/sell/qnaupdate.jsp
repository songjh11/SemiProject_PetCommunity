<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>Update SellQNA</title>
<meta content="" name="description">
<meta content="" name="keywords">

<style type="text/css">
#imgDiv{
  display: flex;
}

.newDiv{
  justify-content: center;
  align-items:center;
  position: relative;
  width: 80px;
      height: 80px;
  margin-right: 5px;
}
.thumnail{
    width: 80px;
    height: 80px;

    } 
.imgDeleteBtn {
  position: absolute;
  top: 0px;
  right: 0px;
}

#inputDiv{
  display: none;
}


</style>
</head>
<body>
<!-- header start -->
<c:import url="/WEB-INF/views/template/header.jsp"></c:import>
<!-- header end -->
<!-- ======= Add Items Section ======= -->
    <section id="book-a-table" class="book-a-table">
      <div class="container" data-aos="fade-up">

        <div class="section-header">
          <p><span>Update SellQNA</span></p>
        </div>

          <div class="col-lg-8 align-items-center">
			<form action="qnaupdate" method="post" data-aos="fade-up" data-aos-delay="100">
				<input type="hidden" name="qnaNum" value="${sellQnaDTO.qnaNum }">
				<div class="row gy-4">
					<div class="col-lg-8 col-md-6">
						작성자<input type="text" class="form-control disb" readonly="readonly" name="userId" value="${sellQnaDTO.userId }">
						<div class="validate"></div>
                	</div>
                	<div class="col-lg-8 col-md-6">
						제목<input type="text" class="form-control disb" name="title" value="${sellQnaDTO.title }">
						<div class="validate"></div>
                	</div>
                	<div class="form-group mt-3" style="margin-top: 5px;">
						<textarea class="form-control" rows="5" name="contents" value="${sellQnaDTO.contents }">내용</textarea>
						<div class="validate"></div>
                	</div>
				<input type="hidden" name="itemNum" value="${sellQnaDTO.itemNum}">
				</div>
             	<br>
              	<div class="text-center">
					<button type="submit" class="btn btn-outline-primary">상품QNA 수정</button>
				</div>
			</form>
		   </div><!-- End Update Form -->

        </div>

    </section><!-- End Update Items Section -->



  <!-- footer start -->
  <c:import url="/WEB-INF/views/template/footer.jsp"></c:import>
  <!-- footer end -->

</body>
</html>