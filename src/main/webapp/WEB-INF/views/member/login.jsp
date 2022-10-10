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
      <p><span>Login page</span></p>
    </div>

      <div class="col-lg-8 align-items-center log" style="margin-left: 27%;">
        <form action="./login" method="post" data-aos="fade-up" data-aos-delay="100" enctype="multipart/form-data"  id="loginfrm">
          <div class="row gy-4">
            <div class="col-lg-8 col-md-12">
              <input type="text" name="userId" class="form-control" placeholder="User ID" id="userId">
              <div class="validate"></div>
            </div>
            <div class="col-lg-8 col-md-12">
              <input type="password" name="password" class="form-control" placeholder="password" id="pw">
              <div class="validate"></div>
            </div>
          </div>
          <br>
         <div>
           <button type="button" id="login" class="btn-book-a-table" style="display: inline-block; margin-left: 15%; margin-right: 5%;">Login</button>
         <a href="https://kauth.kakao.com/oauth/authorize?client_id=3de4327e8b367107a94e0ffc38dcc41d&redirect_uri=http://localhost/member/kakao&response_type=code" style="display: inline-block;"><img src="/resources/images/kakaologin.png" alt="" style="height: 40px; width: 160px; display: inline-block;"></a>
         
         <a href="./findlogin" style="display: block; margin-top: 10%;">비밀번호를 잊어버리셨다면?</a>
        </div>
    </div>
        </form>
      </div>

    </div>

</section>



<!-- footer start -->
<c:import url="/WEB-INF/views/template/footer.jsp"></c:import>
<!-- footer end -->

<script src="/resources/JS/login.js"></script>



</body>
</html>
