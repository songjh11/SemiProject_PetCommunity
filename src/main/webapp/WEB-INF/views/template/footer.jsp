<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">

    <div class="container">
      <div class="row gy-3">
        <div class="col-lg-3 col-md-6 d-flex">
          <i class="bi bi-geo-alt icon"></i>
          <div>
            <h4>Project</h4>
            <p>
              구디아카데미 <br>
              5조 세미 프로젝트<br>
            </p>
          </div>

        </div>

        <div class="col-lg-3 col-md-6 footer-links d-flex">
          <i class="bi bi-people icon"></i>
          <div>
            <h4>Our Team</h4>
            <p>
              <strong>류형민 </strong>  github.com/<br>
              <strong>이지원 </strong>  github.com/ezzzyone<br>
              <strong>송지혜 </strong>  github.com/<br>
              <strong>최근호 </strong>  github.com/<br>
            </p>
          </div>
        </div>

        <div class="col-lg-3 col-md-6 footer-links d-flex">
          <i class="bi bi-clock icon"></i>
          <div>
            <h4>Project duration</h4>
            <p>
              <strong>2022. 09. 13 </strong> - 10. 13<br>
              1 Month
            </p>
          </div>
        </div>

        <div class="col-lg-3 col-md-6 footer-links">
          <h4>Follow Our Github</h4>
          <div class="social-links d-flex">
            <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
            <a href="https://github.com/ezzzyone" class="facebook"><i class="bi bi-facebook"></i></a>
            <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
            <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
          </div>
        </div>

      </div>
    </div>

    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong><span>WALWAL</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/yummy-bootstrap-restaurant-website-template/ -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>

  </footer><!-- End Footer -->
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
  
  <!-- Sock Js 전역 알림기능-->
  <script>

    //알림기능
    let socket = null;
    $(document).ready(function(){
      //웹 소켓 연결
      let name = "${sessionScope.member.userName}";
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
