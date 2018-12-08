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
 <link rel="stylesheet" href="../../css/common.css">
    
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

.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
.wrap * {padding: 0;margin: 0;}
.wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
.wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
.info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
.info .closeOverlay {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
.info .closeOverlay:hover {cursor: pointer;}
.info .body {position: relative;overflow: hidden;}
.info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
.desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
.desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
.info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
.info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.info .link {color: #5085BB;}
#inputbox{float: right;}
.topdiv{display: flow-root;}
    </style>
    
</head>
<jsp:include page="../header.jsp"></jsp:include>
<div id="titl" class="container">
       <img id="logo" src="../../img/playButton.PNG" alt="플레이로고">
       <h2 id="haha">버스킹 일정</h2>
   </div>

<body>


<div class="container" id="ALLdiv">
<div class="topdiv">
    <div>하 위</div>
    <div>하 위</div>
    
    <div id="inputbox">
    <input type="text">
    <button class="btns btns-outline-m">검색</button>
    </div>
</div>
<div id="map"></div>
<p id="maptitle">오늘의 공연목록</p>
<div id="caseldiv"></div>


<em>클릭한 위치에 마커가 표시됩니다!</em>
</div>






































    
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=15e2302756c9e7098ec0d79f7b4d53f4"></script>

<script>

$(document).ready(function(){
	
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new daum.maps.LatLng(37.4693, 127.04), // 지도의 중심좌표
        level: 7 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다.

var markers=[];
//버튼을 클릭하면 아래 배열의 좌표들이 모두 보이게 지도 범위를 재설정합니다 
var points =[];

/* daum.maps.event.addListener(markers, 'click', function() {
    overlay.setMap(map);
}); */

// 기본 overlay를 숨김
function closeOverlay(overlay) {
    overlay.setMap(null);     
}

//클릭시 overlay를 보여주기위한 function
function makeClickContent(overlay,map,marker){
    return function(){
           overlay.setMap(map);
    }
} 

function makecloseOverlay(overlay){
    return function(){
           overlay.setMap(null);
    }
} 



$(function(){
	<c:forEach items="${list}" var="data">
		var content = '<div class="wrap">' + 
	    '    <div class="info">' + 
	    '        <div class="title">' + 
	    'test' +
	    '            <div class="closeOverlay"  title="닫기"></div>' + 
	    '        </div>' + 
	    '        <div class="body">' + 
	    '            <div class="img">' +
	    '                <img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
	    '           </div>' + 
	    '            <div class="desc">' + 
	    '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' + 
	    '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
	    '                <div><a href="http://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
	    '            </div>' + 
	    '        </div>' + 
	    '    </div>' +    
	    '</div>';
	
	   addMarker(new daum.maps.LatLng(${data.supporter.x}, ${data.supporter.y}),content);
	   
	   
	   
	</c:forEach>
});

//마커를 생성하고 지도위에 표시하는 함수입니다
function addMarker(position, content) {
    
    // 마커를 생성합니다
    var marker = new daum.maps.Marker({
        position: position
    });
    
    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);
    
    // 생성된 마커를 배열에 추가합니다
    markers.push(marker);
    
    var overlay = new daum.maps.CustomOverlay({
        content: content,
        map: map,
        position: marker.getPosition()       
    });
    
    closeOverlay(overlay);
    daum.maps.event.addListener(marker, 'click', makeClickContent(overlay,map,marker));
    daum.maps.event.addListener($('#colseOverlay'), 'click', makecloseOverlay(overlay)); 
    
}
})


</script>
</body>
<footer>
<jsp:include page="../footer.jsp"></jsp:include>
</footer>
</html>