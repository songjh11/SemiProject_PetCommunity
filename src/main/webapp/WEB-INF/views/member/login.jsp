<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <section id="login-page" class="login-page">
      <div class="container" data-aos="fade-up">

        <div class="section-header">
          <h2>login-page</h2>
          <p>This is <span>login</span> page</p>
        </div>
        
        <form action="./login" id="loginform" method="post">

        <div class="row g-0">

        

          <div class="col-lg-8 d-flex align-items-center reservation-form-bg">
            <form action="forms/book-a-table.php" method="post" role="form" class="php-email-form" data-aos="fade-up" data-aos-delay="100">
              <div class="row gy-4">
                <div class="col-lg-4 col-md-6">
                  <input type="text" name="userId" class="form-control" id="userId" placeholder="Your ID" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
                  <div class="validate"></div>
                </div>
                
                <div class="col-lg-4 col-md-6">
                  <input type="text" class="form-control" name="password" id="password" placeholder="Your Password" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
                  <div class="validate"></div>
                </div>
               
              <div class="text-center"><button type="submit">Login</button></div>
            </form>
          </div><!-- End Reservation Form -->

        </div>
        
        </form>

      </div>
    </section><!-- End Book A Table Section -->
</body>
</html>