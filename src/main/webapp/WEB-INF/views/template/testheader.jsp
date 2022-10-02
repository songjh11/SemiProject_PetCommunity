<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>

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


  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">
    <div class="container d-flex align-items-center justify-content-between">
      <nav class="navbar navbar-light bg-light">
        <div class="container-fluid row align-items-start">
          <form class="d-flex" action="search" method="get" id="searchFrm">
            <div>
              <select name="itemCatg" class="form-control" id="searchItemCatg" value="${param.itemCatg}">
                <option value="" selected>-- 상품 카테고리 선택 --</option>
                <option value="1">호텔링</option>
                <option value="2">원데이클래스</option>
                <option value="3">트레이닝</option>
              </select>
            </div>
            <input class="form-control me-2" type="text" name="search" placeholder="검색어 입력" aria-label="Search" value="${param.search}">
            <button class="btn btn-outline-success" id="searchBtn" type="button">Search</button>
          </form>
        </div>
      </nav>
      <a href="/" class="logo d-flex align-items-center me-auto me-lg-0">
        <!-- Uncomment the line below if you also wish to use an image logo -->
        <!-- <img src="assets/img/logo.png" alt=""> -->
        <h1>WALWAL<span>.</span></h1>
      </a>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a href="../">Home</a></li>
          <li class="dropdown"><a href="#"><span>예약 서비스</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
            <ul>
                  <li><a href="/sell/list?itemCatg=1">호텔링</a></li>
                  <li><a href="/sell/list?itemCatg=2">One Day 클래스</a></li>
                  <li><a href="/sell/list?itemCatg=3">트레이닝</a></li>
                  <li><a href="/sell/pettx">Pet-Taxi</a></li>
            </ul>
          </li>
          <li><a href="#gallery">여행해요</a></li>
          <li class="dropdown"><a href="#"><span>커뮤니티</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
            <ul>
              <li><a href="/sharing/list">같이해요</a></li>
              <li><a href="/event/list">이벤트</a></li>
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
          <li class="dropdown"><a href="#"><span>고객센터</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
            <li><a href="/notice/list">공지사항</a></li>
            <li><a href="/qna/list">QNA</a></li>
          </li>
          <li><a href="#contact">Contact</a></li>
        </ul>
      </nav><!-- .navbar -->
	  
      <!--로그인 성공했을 때-->
      <c:if test="${not empty sessionScope.member}">
      <h5>${sessionScope.member.userName} 님 환영합니다!</h5>
       <a class="btn-book-a-table" href="/member/mypage">Mypage</a>
       <a class="btn-book-a-table" href="/member/logout">Logout</a>

       <!-- 역할번호에 따라 다른 메뉴바-->
       <c:choose>
       <c:when test="${sessionScope.member.roleNum =='1'}">
        <a class="btn-book-a-table" href="#">seller page</a>
       </c:when>
       <c:when test="${sessionScope.member.roleNum =='2'}">
        <a class="btn-book-a-table" href="#">guest page</a>
       </c:when>
       <c:otherwise>
        <a class="btn-book-a-table" href="/mypage/admin">admin page</a>
        </c:otherwise>
        </c:choose>

       </c:if>
       <!-- 로그인 실패했을 때 -->
       <c:if test="${empty sessionScope.member}">
	      <a class="btn-book-a-table" href="/member/login">Login</a>
	       <a class="btn-book-a-table" href="/member/role">Join</a>
	       </c:if>

    
    <a href="./add"><button class="btn btn-outline-success me-2" type="button">Add Items</button></a>
      <i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i>
      <i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>

    </div>
    <div id="msgStack">
    </div>
  </header><!-- End Header -->


  <script>

    //알림기능
    let socket = null;
    $(document).ready(function(){
      //웹 소켓 연결
      let name = "${sessionScope.member.userName}"
      if(name != null){
        connectWs(name);
      }
    });
      
      function connectWs(name){
        sock = new SockJS("/echo");
        sock.onopen = onOpen;
        sock.onmessage = onMessage;
        sock.onclose = onClose;

        function onOpen(evt){
        }


        // 버튼 클릭(접속) 하면 서버에서 데이터 파싱해서 보내고 알림
        function onMessage(msg){
          let data = msg.data;
  

            let toast = "<div class='toast' role='alert' aria-live='assertive' aria-atomic='true'>";
            toast += "<div class='toast-header'><i class='fas fa-bell mr-2'></i><strong class='mr-auto'>알림</strong>";
            toast += "<small class='text-muted'>just now</small><button type='button' class='ml-2 mb-1 close' data-dismiss='toast' aria-label='Close'>";
            toast += "<span aria-hidden='true'>&times;</span></button>";
            toast += "</div> <div class='toast-body'>" + data + "</div></div>";
            $("#msgStack").append(toast);   // msgStack div에 생성한 toast 추가
            $(".toast").toast({"animation": true, "autohide": false});
            $('.toast').toast('show');
          
        }

        function onClose(evt){}

      }



  </script>
