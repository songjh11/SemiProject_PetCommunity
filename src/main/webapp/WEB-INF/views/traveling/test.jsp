<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c8a091a525c100bb59fb876c4c7b6bf9&libraries=services"></script>
  <script src="http://code.jquery.com/jquery-latest.js"></script> 
  <script>
       let list = [];
    <c:forEach items="${list}" var="dto">
      list.push("${dto.itemAddress}");
    </c:forEach>
        
    
    let lat = null;
    let lon = null;
    
    // 현재위치 불러오기-------------------------------------------------------------------
    // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
    if (navigator.geolocation) {
        
        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
        navigator.geolocation.getCurrentPosition(function(position) {
            
            lat = position.coords.latitude; // 위도
            lon = position.coords.longitude; // 경도
            
            var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                message = '<div style="padding:5px;">나의 현재 위치</div>'; // 인포윈도우에 표시될 내용입니다


            // 마커와 인포윈도우를 표시합니다
            displayMarker(locPosition, message);
            sellItemMarker(list);
                
          });
        
    } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
        
        var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
            message = 'geolocation을 사용할수 없어요..'
            
        displayMarker(locPosition, message);
        sellItemMarker(list);
    }


    // -------------------------------------------------------------------

    // -------------------------------------------------------------------


    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = { 
            center: new kakao.maps.LatLng(lat,lon), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨 
        }; 

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    // 지도에 마커와 인포윈도우를 표시하는 함수입니다
    function displayMarker(locPosition, message) {

        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({  
            map: map, 
            position: locPosition
        }); 
        
        var iwContent = message, // 인포윈도우에 표시할 내용
            iwRemoveable = true;

        // 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({
            content : iwContent,
            removable : iwRemoveable
        });
        
        // 인포윈도우를 마커위에 표시합니다 
        infowindow.open(map, marker);
        
        // 지도 중심좌표를 접속위치로 변경합니다
        map.setCenter(locPosition);      
    }    

 
    
    function sellItemMarker(list){
      var geocoder = new kakao.maps.services.Geocoder();

      for(let i=0; i<list.length; i++){
        // 주소로 좌표를 검색합니다
        geocoder.addressSearch(list[i], function(result, status) {

            // 정상적으로 검색이 완료됐으면 
            if (status === kakao.maps.services.Status.OK) {

                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                // 결과값으로 받은 위치를 마커로 표시합니다
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });

                // 인포윈도우로 장소에 대한 설명을 표시합니다
                var infowindow = new kakao.maps.InfoWindow({
                    content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
                });
                infowindow.open(map, marker);

                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                // map.setCenter(coords);
              
            } 
          
        });    
    }
  }


    function showLocation(event) {
        var latitude = event.coords.latitude 
        var longitude = event.coords.longitude
        document.querySelector("#latitude").textContent = latitude
        document.querySelector("#longitude").textContent = longitude 
      
        
        let apiKey = "184b4b64db6cd5ca2d07ddafd0b11d3b";
        let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?lat=" + latitude 
                      + "&lon=" + longitude 
                      + "&appid=" + apiKey; 
      
          let options = { method: 'GET' }
        $.ajax(weatherUrl, options).then((response) => {
            console.log(response)
            let icon = (response.weather[0].icon);
            console.log(icon);
            let iconUrl = "http://openweathermap.org/img/wn/" + icon +"@2x.png";
            let img = document.querySelector("#wicon");
            img.src = iconUrl 
            document.querySelector("#tempr").textContent = "" + (response.main.temp - 273) + "ºC"  // 현재 온도
          })
      }
      
      function showError(event) {
        alert("위치 정보를 얻을 수 없습니다.")
      }
      
      window.addEventListener('load', () => { 
        if(window.navigator.geolocation) {
          window.navigator.geolocation.getCurrentPosition(showLocation,showError)
        }
      
      })



  </script>
</body>
</html>