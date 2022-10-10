<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Login page</title>
<meta content="" name="description">
<meta content="" name="keywords">

<style>

.btn-book-a-table {
  font-size: 14px;
  color: #fff;
  background: var(--color-primary);
  padding: 8px 20px;
  margin-left: 30px;
  border-radius: 50px;
  transition: 0.3s;
  color: #fff;
  background: rgba(206, 18, 18, 0.8);
}

</style>
</head>
<body>
<!-- header start -->
<c:import url="/WEB-INF/views/template/header.jsp"></c:import>
<!-- header end -->
<!-- ======= Join Section ======= -->
<section id="book-a-table" class="book-a-table">
  <div class="container" data-aos="fade-up">

    <div class="section-header">
      <p><span>"PW"</span> Find page</p>
    </div>

      <div class="col-lg-8 align-items-center log" style="margin-left: 27%;">
        <form action="findlogin" method="post" data-aos="fade-up" data-aos-delay="100">
          <div class="row gy-4">
            <div class="col-lg-8 col-md-12">
              <input type="text" name="userId" class="form-control" placeholder="User ID"id="userId">
              <div class="validate"></div>
            </div>
            <div class="col-lg-8 col-md-12">
              <input type="text" name="email" class="form-control" placeholder="Email" id="email">
              <div class="validate"></div>
            </div>
          </div>
          <br>
         <div>
           <button type="submit" id="findpw" class="btn-book-a-table" style="display: inline-block; margin-left: 30%;">Find</button>
        </div>
    </div>
        </form>
      </div>

    </div>

</section>



<!-- footer start -->
<c:import url="/WEB-INF/views/template/footer.jsp"></c:import>
<!-- footer end -->

</body>
</html>
