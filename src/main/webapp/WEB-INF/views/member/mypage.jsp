<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Mypage</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

	<style type="text/css">

.testimonial-img {
  border-radius: 50%;
  border: 4px solid #fff;
  margin: 0 auto;
}

#pf{
  display: inline-block;
  font-size: larger;
  font-weight: bold;
  margin-top: 20px;
  margin-left: 40px;
}

#minpf{
  display: inline-block;
  font-size: smaller;
  color: dimgrey;
}

.col-sm-6{
  display: block;
}
	</style>
  
</head>
<body>
<!-- header start -->
<c:import url="/WEB-INF/views/template/testheader.jsp"></c:import>
<!-- header end -->
<!-- ======= mypage Section ======= -->
    <section id="book-a-table" class="book-a-table">
      <div class="container" data-aos="fade-up">
        <section id="menu" class="menu">
        <div class="section-header">
        <p><span>${dto.roleDTO.roleName}'s My Page</span></p>
        </div>

        <ul class="nav nav-tabs d-flex justify-content-center" data-aos="fade-up" data-aos-delay="200">

          <c:choose>
            <c:when test="${dto.roleNum eq 2}">
              <li class="nav-item">
                <a class="nav-link" href="./cart">
                  <h4>장바구니</h4>
                </a>
              </li><!-- End tab nav item -->
              <li class="nav-item">
                <a class="nav-link" href="./pick">
                  <h4>찜 내역</h4>
                </a>
              </li><!-- End tab nav item -->
              <li class="nav-item">
                <a class="nav-link" href="./coupon">
                  <h4>보유쿠폰</h4>
                </a>
              </li><!-- End tab nav item -->
    
              <li class="nav-item">
                <a class="nav-link" href="./update">
                  <h4>회원수정</h4>
                </a>
              </li><!-- End tab nav item -->
    
              <li class="nav-item">
                <a class="nav-link" href="./delete">
                  <h4>회원탈퇴</h4>
                </a><!-- End tab nav item -->
    
              <li class="nav-item">
                <a class="nav-link"  href="./purchaseList">
                  <h4>예약내역</h4>
                </a>
              </li><!-- End tab nav item -->
    
              <li class="nav-item">
                <a class="nav-link"  href="./purchaseCancelList">
                  <h4>취소내역</h4>
                </a>
              </li>
            </c:when>
            <c:when test="${dto.roleNum eq 1}">
              <li class="nav-item">
                <a class="nav-link" href="../sell/add">
                  <h4>상품등록</h4>
                </a>
              </li><!-- End tab nav item -->
              <li class="nav-item">
                <a class="nav-link" href="/sell/Sellerlist?itemCatg=3">
                  <h4>상품목록</h4>
                </a>
              </li><!-- End tab nav item -->
              <li class="nav-item">
                <a class="nav-link" href="./update">
                  <h4>회원수정</h4>
                </a>
              </li><!-- End tab nav item -->
    
              <li class="nav-item">
                <a class="nav-link" href="./delete">
                  <h4>회원탈퇴</h4>
                </a><!-- End tab nav item -->
    
              <li class="nav-item">
                <a class="nav-link"  href="./purchaseList?purchaseStatus=1">
                  <h4>예약내역</h4>
                </a>
              </li><!-- End tab nav item -->
    
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <h4>취소내역</h4>
                </a>
              </li>
            </c:when>
            <c:otherwise>
              <li class="nav-item">
                <a class="nav-link" href="./memlist">
                  <h4>회원목록</h4>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/sell/list?itemCatg=1">
                  <h4>상품목록</h4>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="../admin/mypage">
                  <h4>쿠폰관리</h4>
                </a>
              </li>
             </c:otherwise>
             </c:choose>

        </ul>
          </section><!-- End Menu Section -->
  

        <!-- ======= Stats Counter Section ======= -->
    <section id="stats-counter" class="stats-counter">
      <div class="container" data-aos="zoom-out">

        <div class="row gy-4">

          <c:if test="${dto.roleNum eq 2}">
          <div class="col-lg-3 col-md-6">
            <div class="stats-item text-center w-100 h-100" OnClick="location.href ='follower'" style="cursor:pointer;">
              <span data-purecounter-start="0" data-purecounter-end="${followernum}" data-purecounter-duration="1" class="purecounter"></span>
              <p>Follower</p>
            </div>
          </div><!-- End Stats Item -->

          <div class="col-lg-3 col-md-6">
            <div class="stats-item text-center w-100 h-100" OnClick="location.href ='followee'" style="cursor:pointer;">
              <span data-purecounter-start="0" data-purecounter-end="${followeenum}" data-purecounter-duration="1" class="purecounter"></span>
              <p>Followee</p>
            </div>
          </div><!-- End Stats Item -->
          </c:if>

          <c:if test="${dto.roleNum eq 0}">
            <div class="col-lg-3 col-md-6">
              <div class="stats-item text-center w-100 h-100" OnClick="location.href ='./memlist'" style="cursor:pointer;">
                <span data-purecounter-start="0" data-purecounter-end="${memnum}" data-purecounter-duration="1" class="purecounter"></span>
                <p>Member</p>
              </div>
            </div><!-- End Stats Item -->
  
            <div class="col-lg-3 col-md-6">
              <div class="stats-item text-center w-100 h-100" OnClick="location.href ='/sell/list?itemCatg=1'" style="cursor:pointer;">
                <span data-purecounter-start="0" data-purecounter-end="${sellnum}" data-purecounter-duration="1" class="purecounter"></span>
                <p>Item</p>
              </div>
            </div><!-- End Stats Item -->
            </c:if>

          </div><!-- End Stats Item -->

        </div>

      </div>
    </section><!-- End Stats Counter Section -->

          <div class="col-lg-8 align-items-center" id="my">
            <form action="./delete" data-aos="fade-up" data-aos-delay="100" enctype="multipart/form-data" id="updatefrm">
              <div class="row gy-4">
                <div id="profile">
                <c:if test="${dto.roleNum eq 2}">
                  <div class="col-lg-2 text-center" id="pf">
                    <img src="../resources/upload/member/${dto.memberFileDTO.fileName}" class="img-fluid testimonial-img" alt="">
                  </div>
                  </c:if>
                  <div id="pf">
                  ${dto.userName}님 안녕하세요<br>
                  <div id="minpf">${dto.petName} ${dto.petCatg}</div>
                  </div> 
                </div>
                <div class="col-sm-7">
                  <input type="number" name="phone" class="form-control" value="${dto.phone}" readonly>
                  <div class="validate"></div>
                </div>
                <div class="col-sm-7">
                  <input type="email" name="email" class="form-control" value="${dto.email}" readonly>
                  <div class="validate"></div>
                </div>

                <div class="col-sm-7">
                  <input type="text" name="itemZipCode" class="form-control" id="itemZipCode" value="${dto.itemZipCode}" readonly>
                   <div class="validate"></div>
                 </div>
                 <br>
                 <div class="col-sm-7">
                  <input type="text" name="address" class="form-control" id="address" value="${dto.address}" readonly>
                 </div>
                 <br>
                 <div class="col-sm-7">
                   <input type="text" name="deAddress" class="form-control" id="deAddress" value="${dto.deAddress}" readonly>
                   <div class="validate"></div>
                 </div>
                 <br>

                </div>
                
                <c:choose>
                    <c:when test="${dto.roleNum eq 1}">
                      <div class="col-sm-7">
                        <br>
                          <input type="text" class="form-control" name="itemCatg" value="${dto.itemCatg}" readonly>
                          <div class="validate"></div>
                        </div>
                        <br>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" name="itemId" value="${dto.itemId}" readonly>
                            <div class="validate"></div>
                          </div>
                          <br>
                        
                    </c:when>
                    <c:when test="${dto.roleNum eq 2}">
                      <div class="col-sm-7">
                          <br>
                            <input type="text" class="form-control" name="petName" value="${dto.petName}" readonly>
                            <div class="validate"></div>
                          </div>
                          <br>
                          <div class="col-sm-7">
                            <input type="text" class="form-control" name="petCatg" value="${dto.petCatg}" readonly>
                            <div class="validate"></div>
                          </div>
                          <br>
                
                    </c:when>
                </c:choose>

                <c:choose>
                <c:when test="${dto.agValue  eq 1}">
                    <p>정보제공동의여부: 동의</p>
                </c:when>
                <c:when test="${dto.agValue  eq 0}">
                    <p>정보제공동의여부: 비동의</p>
                </c:when>
            </c:choose>
            <c:choose>
                <c:when test="${dto.agMail  eq 1}">
                    <p>메일수신동의여부: 동의</p>
                </c:when>
                <c:when test="${dto.agMail  eq 0}">
                    <p>메일수신동의여부: 비동의</p>
                </c:when>
            </c:choose>
            <c:choose>
                <c:when test="${dto.agMes  eq 1}">
                    <p>문자수신동의여부: 동의</p>
                </c:when>
                <c:when test="${dto.agMes  eq 0}">
                    <p>문자수신동의여부: 비동의</p>
                </c:when>
             </c:choose>
              </div>
              <br>
             
            </form>
          </div><!-- End Reservation Form -->

        </div>

    </section><!-- End Add Items Section -->



  <!-- footer start -->
  <c:import url="/WEB-INF/views/template/testfooter.jsp"></c:import>
  <!-- footer end -->

</body>
</html>