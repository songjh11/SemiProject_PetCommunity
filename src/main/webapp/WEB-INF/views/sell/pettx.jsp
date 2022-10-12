<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Pet-Taxi</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

	<style type="text/css">
        #backImg{
            position: relative;
            width: 80%;
            height: auto;
        }

        #rvBtn{
          width: 250px;
          top: -30px;
          position: relative;
          height: 80px;
          background: #f49d2c;
          color: #fff;
          border-radius: 50px;
          border-color: transparent;
          text-align: center;
          font-size: 1.5rem;
          display: flex;
          flex-direction: column;
          justify-content: center;
          align-items: center;
        }
	</style>
  
</head>
<body>
<!-- header start -->
<c:import url="/WEB-INF/views/template/header.jsp"></c:import>
<!-- header end -->
<!-- ======= Add Items Section ======= -->
<body>
  <div style="padding: 90px;  background-color: #feefd4;"></div>
<div style="background-color: #feefd4; display: flex; flex-direction: column; align-items: center; padding-bottom: 50px; text-align: center;">
   <img id="backImg" src="/resources/images/펫택시 배경.png">
  <a href="https://mntx.co.kr/reservation.php"><button id="rvBtn">예약하기</button></a>
</div>


  <!-- footer start -->
  <c:import url="/WEB-INF/views/template/footer.jsp"></c:import>
  <!-- footer end -->

 </body>
</html>