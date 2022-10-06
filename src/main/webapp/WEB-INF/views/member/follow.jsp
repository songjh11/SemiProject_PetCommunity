<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>list page</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="/resources/assets/img/favicon.png" rel="icon">
  <link href="/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Amatic+SC:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Inter:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/resources/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="/resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="/resources/assets/css/main.css" rel="stylesheet">

	<style type="text/css">
    .ag{
      background-color:cornsilk;
      overflow: scroll;
      width: 600px;
      height: 100px;
    }

    .warning{
      color: red;
    }
    #po{
      font-size: 10pt;
      color: darkgray;
    }


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

    h5 {
      display: none;
    }

    .blocked{
      filter: brightness(20%); 
    }
	</style>
  
</head>
<body>
<!-- header start -->
<c:import url="/WEB-INF/views/template/header.jsp"></c:import>
<!-- header end -->
    <section id="chefs" class="chefs section-bg">
      <div class="container" data-aos="fade-up">

        <div class="section-header">
          <p>${what} <span>page</span></p>
        </div>

        <div class="row gy-4">

          <c:choose>

            <c:when test="${what eq 'memlist'}">


                    <form class="d-flex" action="find" method="get" id="sfrm">
                      <div>
                        <select name="roleNum" class="form-control" id="whatrn" value="${param.roleNum}">
                          <option value="" selected>-- 상품 카테고리 선택 --</option>
                          <option value="1">사업자</option>
                          <option value="2">개인회원</option>
                          <option value="0">관리자</option>
                        </select>
                      </div>
                      <input class="form-control me-2" type="text" name="search" placeholder="검색어 입력" aria-label="Search" value="${param.search}">
                      <button class="btn btn-outline-success" id="sbtn" type="button">Search</button>
                    </form>



              <c:forEach items="${list}" var="dto">
                <div class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100">
                  <div class="chef-member">
                    <div class="member-img">

                      <c:if test="${empty dto.memberFileDTO.fileName}">
                          <img src="/resources/images/seller.jpg" class="img-fluid blocked" alt="">
                      </c:if>
                    <c:choose>
                      <c:when test="${dto.block == 1}">
                        <img src="/resources/upload/member/${dto.memberFileDTO.fileName}" class="img-fluid blocked" alt="">
                      </c:when>
                      <c:otherwise>
                        <img src="/resources/upload/member/${dto.memberFileDTO.fileName}" class="img-fluid" alt="">
                      </c:otherwise>
                    </c:choose>
                      
                 
                    </div>
                    <div class="member-info">
                      <h4>${dto.userId}</h4>
                      <span>${dto.roleDTO.roleName}</span>
                      <p>${dto.email}</p>
                      <div class="social">
                        <button class="blockbtn" type="button"><i class="bi bi-shield-slash-fill"></i></button> <!-- 멤버 차단-->
                        <button class="unblockbtn" type="button"><i class="bi bi-shield-check"></i></button>
                        <a href=""><i class="bi bi-instagram"></i></a>
                        <a href=""><i class="bi bi-linkedin"></i></a>
                      </div>
                    </div>
            
                  </div>
      
                </div>
              </c:forEach>
                 
            </c:when>

            <c:when test="${what eq 'followee'}">
          <c:forEach items="${list}" var="dto">
            <div class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100">
              <div class="chef-member">
                <div class="member-img">
                  <img src="/resources/upload/member/${dto.memberFileDTO.fileName}" class="img-fluid" alt="">
                </div>
                <c:forEach items="${dto.followDTOs}" var="followDTOs">
                <div class="member-info">
                  <h4>${followDTOs.followee}</h4>
                  <span>guest</span>
                  <p>안녕하세요.</p>
                  <div class="social">
                    <button class="followeedel" type="button"><i class="bi bi-trash3"></i></button>
                    <a href=""><i class="bi bi-facebook"></i></a>
                    <a href=""><i class="bi bi-instagram"></i></a>
                    <a href=""><i class="bi bi-linkedin"></i></a>
                  </div>
                </div>
              </c:forEach>  
              </div>
  
            </div>
          </c:forEach>
             
        </c:when>


        <c:when test="${what eq 'follower'}">
          <c:forEach items="${list}" var="dto">
            <div class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100">
              <div class="chef-member">
                <div class="member-img">
                  <img src="/resources/upload/member/${dto.memberFileDTO.fileName}" class="img-fluid" alt="">
                </div>
                <c:forEach items="${dto.followDTOs}" var="followDTOs">
                <div class="member-info">
                  <h4>${followDTOs.follower}</h4>
                  <span>guest</span>
                  <p>안녕하세요.</p>
                  <div class="social">
                    <button class="followerdel" type="button"><i class="bi bi-trash3"></i></button>
                    <a href=""><i class="bi bi-facebook"></i></a>
                    <a href=""><i class="bi bi-instagram"></i></a>
                    <a href=""><i class="bi bi-linkedin"></i></a>
                  </div>
                </div>
              </c:forEach>  
              </div>
  
            </div>
          </c:forEach>
             
        </c:when>

        <c:when test="${what eq 'pick'}">

                  <c:forEach items="${list.itemDTOs}" var="itemDTO">
             
                  <div class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100">
                  <div class="chef-member">
                    <div class="member-img">
                      <img src="/resources/upload/sellfile/${itemDTO.fileDTOs['0'].fileName}" class="img-fluid" alt="">
                    </div>
                    <div class="member-info">
                      <h5>${itemDTO.itemNum}</h5>
                      <h4>${itemDTO.itemName}</h4>
                      <span>₩ ${itemDTO.itemPrice}</span>
                      <p>${itemDTO.itemContents}</p>
                    <div class="social">
                      <button class="pickdel" type="button"><i class="bi bi-trash3"></i></button>
                       <a href=""><i class="bi bi-facebook"></i></a>
                      <a href=""><i class="bi bi-instagram"></i></a>
                      <a href=""><i class="bi bi-linkedin"></i></a>
                    </div>
                  </div>
                  </div>
      
                </div>
              </c:forEach>  
              </c:when>

        <c:when test="${what eq 'cart'}">
		<c:forEach items="${list.itemDTOs}" var="itemDTO">

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100">
            <div class="chef-member">
              <div class="member-img">
                <img src="/resources/upload/sellfile/${itemDTO.fileDTOs['0'].fileName}" class="img-fluid" alt="">
              </div>
                <div class="member-info">
                  <h5>${itemDTO.itemNum}</h5>
                  <h4>${itemDTO.itemName}</h4>
                  <span>${itemDTO.itemPrice}</span>
                  <p>${itemDTO.itemContents}</p>
                  <div class="social">
                    <button class="cartdel" type="button"><i class="bi bi-trash3"></i></button>
                    <a href=""><i class="bi bi-facebook"></i></a>
                    <a href=""><i class="bi bi-instagram"></i></a>
                    <a href=""><i class="bi bi-linkedin"></i></a>
                  </div>
              </div>
       
            </div>

          </div>
        </c:forEach>
        </c:when>

        <c:when test="${what eq 'coupon'}">

      <div class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100">
        <div class="chef-member">
          <div class="member-img">
            <img src="/resources/images/coupon.jpg" class="img-fluid" alt="">
            <div class="social">
              <a href=""><i class="bi bi-trash3"></i></a>
              <a href=""><i class="bi bi-facebook"></i></a>
              <a href=""><i class="bi bi-instagram"></i></a>
              <a href=""><i class="bi bi-linkedin"></i></a>
            </div>
          </div>
          <c:forEach items="${list}" var="dto">

              <div class="member-info">
          <h4>${dto.couponName}</h4>
          <span>${dto.expDate} 까지</span>
          <p>쿠폰상세내용</p>
        </div>
          </c:forEach>
        </div>

      </div>
          
        </c:when>
  
        <c:when test="${what eq 'Purchase List'}">
          <c:forEach items="${checkList}" var="check">
            <div class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100">

                <div class="chef-member">
                    <div class="member-img">
                        <img src="/resources/upload/sellfile/${check.fileDTOs[0].fileName}" class="img-fluid" alt="">
                        <div class="social">
                        <a href=""><i class="bi bi-trash3"></i></a>
                        <a href=""><i class="bi bi-facebook"></i></a>
                        <a href=""><i class="bi bi-instagram"></i></a>
                        <a href=""><i class="bi bi-linkedin"></i></a>
                        </div>
                    </div>
                    <div class="member-info">
                        <h4>${check.itemDTO.itemName}</h4>
                        <a href="./purchaseDetail?merchant_uid=${check.merchant_uid}">주문번호: ${check.merchant_uid}</a>
                        <span>결제 금액: ${check.amount}</span>
                        <p>${itemDTOs.itemContents}</p>
                    </div>
                </div>
            </div>
        </c:forEach>
      </c:when>
        
     

            </c:choose>

        </div>

      </div>
    </section>


  <!-- footer start -->
  <c:import url="/WEB-INF/views/template/footer.jsp"></c:import>
  <!-- footer end -->

    <!-- script start -->
  <a href="#" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/resources/assets/vendor/aos/aos.js"></script>
  <script src="/resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="/resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="/resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="/resources/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="/resources/assets/js/main.js"></script>
<script src="/resources/JS/follow.js"></script>

<!-- <script>
  function getParameter(name) {
      name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
      var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
          results = regex.exec(location.search);
      return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));

      let what = getParameter(what);
  }
  </script> -->
</body>
</html>