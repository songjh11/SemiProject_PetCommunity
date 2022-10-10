<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>WALWAL</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- SockJs Websocket Jquery-->
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>


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

  <!-- =======================================================
  * Template Name: Yummy - v1.2.0
  * Template URL: https://bootstrapmade.com/yummy-bootstrap-restaurant-website-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

    <!-- Modal -->
    <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Search</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form class="d-flex" action="../sell/search" method="get" id="searchFrm">
              <div class="modal-body">
                <div>
                  <select name="itemCatg" class="form-control" id="searchItemCatg" value="${param.itemCatg}">
                    <option value="" selected>-- 상품 카테고리 선택 --</option>
                    <option value="1">호텔링</option>
                    <option value="2">원데이클래스</option>
                    <option value="3">트레이닝</option>
                  </select>
                </div>
                <input class="form-control me-2" type="text" name="search" placeholder="검색어 입력" aria-label="Search" value="${param.search}">
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-outline-success" id="searchBtn">Search</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >닫기</button>
              </div>
            </form>
          </div>
      </div>
    </div>
  <!-- ======= Header ======= -->
  <header id="header" class="header d-flex align-items-center" style="position: fixed; top:0; width:100vw; justify-content: space-evenly;">
    <!-- search button+logo start -->
    <div style="display: flex; align-items: center;">
      <!-- Button trigger modal -->
      <button type="button" class="btn-book-a-table" data-bs-toggle="modal" data-bs-target="#searchModal" style="border:0px; margin: 0;">
        <i class="bi bi-search"></i>
        </button>
          <a href="/" class="logo d-flex align-items-center me-auto me-lg-0">
            <span style="font-size: 40px; color: black; font-weight: 700;">WALWAL.</span>
          </a>
    </div>
    <!-- search button+logo end -->
  
    <!-- Main menu start -->
    <div>
        <nav id="navbar" class="navbar">
              <ul>
                    <li><a href="/sell/list?itemCatg=1">호텔링</a></li>
                    <li><a href="/sell/list?itemCatg=2">One Day 클래스</a></li>
                    <li><a href="/sell/list?itemCatg=3">트레이닝</a></li>
                    <li><a href="/sell/pettx">Pet-Taxi</a></li>
            <li><a href="#gallery">여행해요</a></li>
            <li class="dropdown"><a href="#"><span>커뮤니티</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
              <ul>
                <li><a href="#">같이해요</a></li>
                <li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
                  <ul>
                    <li><a href="#">Deep Drop Down 1</a></li>
                    <li><a href="#">Deep Drop Down 2</a></li>
                    <li><a href="#">Deep Drop Down 3</a></li>
                    <li><a href="#">Deep Drop Down 4</a></li>
                    <li><a href="#">Deep Drop Down 5</a></li>
                  </ul>
                </li>
                <li><a href="/notice/list">공지사항</a></li>
                <li><a href="#">Drop Down 3</a></li>
                <li><a href="#">Drop Down 4</a></li>
              </ul>
            </li>
          </ul>
        </nav>
    </div>
      <!-- .navbar -->
        
        <!--로그인 성공했을 때-->
          <div> 
              <c:if test="${not empty sessionScope.member}">
              <h5 style="color: gray; font-size: smaller;">${sessionScope.member.userName}님<br>환영합니다!</h5>
              <a class="btn-book-a-table" href="/member/mypage">Mypage</a>
              <c:choose>
                <c:when test="${empty member.password}">
                  <a class="btn-book-a-table" href="https://kauth.kakao.com/oauth/logout?client_id=3de4327e8b367107a94e0ffc38dcc41d&logout_redirect_uri=http://localhost/member/logout">Logout</a>
                </c:when>
                <c:otherwise>
                <a class="btn-book-a-table" href="/member/logout">Logout</a>
                </c:otherwise>
              </c:choose>
              <c:if test="${member.roleNum eq 2}">
              <a href="/member/cart"><i class="bi bi-cart-check" style="margin-left: 5%; font-size: 2rem;"></i></a>
              </c:if>
        
              </c:if>
              <!-- 로그인 실패했을 때 -->
              <c:if test="${empty sessionScope.member}">
                <a class="btn-book-a-table" href="/member/login">Login</a>
                <a class="btn-book-a-table" href="/member/role">Join</a>
                </c:if>
          </div>          
        <i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i>
        <i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>
    </header><!-- End Header -->
  
    <!--모달 부트스트랩-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script src="/resources/JS/sellHeader.js"></script>
    <script>
      searchClose();
    </script>
  
</body>
</html>

