<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Add SellQNA</title>
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
          <p><span>Add SellQNA</span></p>
        </div>

          <div class="col-lg-8 align-items-center">
            <form action="sellqnaadd" method="post" data-aos="fade-up" data-aos-delay="100">
              <div class="row gy-4">
                <div class="col-lg-8 col-md-12">
                  <input type="text" name="userId" readonly class="form-control" id="userId" value="${sellQnaDTO.userId}" placeholder="User ID">
                  <div class="validate"></div>
                </div>
                
                             
                <div class="col-lg-12 col-md-12">
                  <input type="text" class="form-control" name="title" id="title" placeholder="QNA Title">
                  <div class="validate"></div>
                </div>
                <div class="form-group mt-3">
	                <textarea class="form-control" name="contents" rows="5" placeholder="QNA Contents"></textarea>
	                <div class="validate"></div>
                </div>
                
                 <div class="col-lg-6 col-md-6">
                 <input type="hidden" name="itemNum" class="form-control" id="itemNum" value="${sellQnaDTO.itemNum }">
                  <div class="validate"></div>
                </div>
              <br>
             <div class="text-left">
             	<button type="submit">문의 등록</button>
             </div>
             
            </form>
          </div><!-- End Reservation Form -->

        </div>

    </section><!-- End Add Items Section -->



  <!-- footer start -->
  <c:import url="/WEB-INF/views/template/footer.jsp"></c:import>
  <!-- footer end -->

  <script src="/resources/JS/sell.js"></script>

</body>
</html>