<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</head>
<body>
  <!-- 지도영역 -->
        

      <hr>
      <div>
      위도 : <span id="latitude"></span><br>
      경도 : <span id="longitude"></span><br>
      날씨 : <img id="wicon" src=""><br>
      기온 : <span id="tempr"></span>

      </div>
      <div id="map" style="width:100%; height:100vh;">
      </div>

      
       <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c8a091a525c100bb59fb876c4c7b6bf9"></script>
  <script src="http://code.jquery.com/jquery-latest.js"></script> 
  <script src="/resources/js/map/map_test.js"></script>
</body>
</html>