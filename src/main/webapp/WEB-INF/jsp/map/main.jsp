<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="utf-8">
    <title>여러개 마커 제어하기</title>
    <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
    
    <style>
body {
	background-color: snow;
}
#ALLdiv{background-color: white;}
#titl{margin-top: 2%; margin-bottom: 2%;}
#logo{float: left; width: 30px; height: 30px;}
#haha{margin-top: 0.8%; margin-left: 5.5%;}
footer{clear: both;}
#map{border: 1px solid red;height: 20rem;}
#caseldiv{border:1px solid red; height: 20rem;}
#maptitle{border: 1px solid red; width: 5rem; height: 3rem;}
    </style>
    
    
</head>
<jsp:include page="../header.jsp"></jsp:include>
<div id="titl" class="container">
       <img id="logo" src="../../img/playButton.PNG" alt="플레이로고">
       <h2 id="haha">버스킹 일정</h2>
   </div>

<body>


<div class="container" id="ALLdiv">
<div id="map"></div>
<p id="maptitle">오늘의 공연목록</p>
<div id="caseldiv"></div>


<em>클릭한 위치에 마커가 표시됩니다!</em>
</div>






































    
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=15e2302756c9e7098ec0d79f7b4d53f4"></script>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new daum.maps.LatLng(37.4693, 127.04), // 지도의 중심좌표
        level: 7 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다.

var markers=[];
//버튼을 클릭하면 아래 배열의 좌표들이 모두 보이게 지도 범위를 재설정합니다 
var points =[];
$(function(){
	<c:forEach items="${list}" var="data">
	   addMarker(new daum.maps.LatLng(${data.supporter.x}, ${data.supporter.y}));
	</c:forEach>
});

//마커를 생성하고 지도위에 표시하는 함수입니다
function addMarker(position) {
    
    // 마커를 생성합니다
    var marker = new daum.maps.Marker({
        position: position
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);
    
    // 생성된 마커를 배열에 추가합니다
    markers.push(marker);
}
console.log(markers);



</script>
</body>
<footer>
<jsp:include page="../footer.jsp"></jsp:include>
</footer>
</html>