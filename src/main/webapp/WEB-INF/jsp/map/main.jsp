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
   
   <!--  -->
    <link rel="stylesheet" href="https://unpkg.com/flickity@2.0/dist/flickity.min.css">
<script src="https://unpkg.com/flickity@2.0/dist/flickity.pkgd.min.js"></script>
   <!--  -->
   
    
    <style>
    
    
    
    
    /* 박스 */
        .All{       width: 19rem;
    height: 28rem;
    border: 1px solid black;
    position: relative;
    top: -44.6rem;
    z-index: 1;
    background-color: white;
    }
    .toptable{border-bottom-color: #c6cbce;
    background-color: #f2f3f5;
        text-align: center;
        height: 5rem;
        padding-top: 1.5rem;
    }
    li{list-style: none;}
    .listbox ul li{
        width: 33.3333%;
        border: 1px solid #d8dde0;
        padding: 5% 0% 4% 0%;
        text-align: center
 
    }
    .listbox ul{
        flex-wrap:wrap;
        display:flex;
        width: 100%;
        padding: 0;
    }
    .listbox{
        
        
    }
    li{padding: 0;}
    .boxbt{padding: 14px;
    background-color: #f4f5f9;
    text-align: center;
        border: 1px solid #d8dde0;
    }
    ul{
        margin-bottom: 0;
    }
    /* 박스끝 */
    
    /*  */
         @import url("https://fonts.googleapis.com/css?family=Hind:400,700");
html, body {


  width: 100%;
  height: 100%;
}

img {
  max-width: 100%;
  height: auto;
  display: block;
}

h3 {
  text-align: center;
  font-weight: 400;
  margin-bottom: 0;
}

.carousel-wrapper {
  position: relative;
  width: 100%;
  height: 100%;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: #FFFFFF;
  background-image: linear-gradient(#FFFFFF 50%, #FFFFFF 50%, #F0F3FC 50%);
  box-shadow: 0px 12px 39px -19px rgba(0, 0, 0, 0.75);
  overflow: hidden;
}
.carousel-wrapper .carousel {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  width: 100%;
  height: auto;
}
.carousel-wrapper .carousel .carousel-cell {
  padding: 10px;
  background-color: #FFFFFF;
  width: 20%;
  height: auto;
  min-width: 120px;
  margin: 0 20px;
  transition: transform 500ms ease;
}
.carousel-wrapper .carousel .carousel-cell .more {
  display: block;
  opacity: 0;
  margin: 5px 0 15px 0;
  text-align: center;
  font-size: 10px;
  color: #CFCFCF;
  text-decoration: none;
  transition: opacity 300ms ease;
}
.carousel-wrapper .carousel .carousel-cell .more:hover, .carousel-wrapper .carousel .carousel-cell .more:active, .carousel-wrapper .carousel .carousel-cell .more:visited, .carousel-wrapper .carousel .carousel-cell .more:focus {
  color: #CFCFCF;
  text-decoration: none;
}
.carousel-wrapper .carousel .carousel-cell .line {
  position: absolute;
  width: 2px;
  height: 0;
  background-color: black;
  left: 50%;
  margin: 5px 0 0 -1px;
  transition: height 300ms ease;
  display: block;
}
.carousel-wrapper .carousel .carousel-cell .price {
  position: absolute;
  font-weight: 700;
  margin: 45px auto 0 auto;
  left: 50%;
  transform: translate(-50%);
  opacity: 0;
  transition: opacity 300ms ease 300ms;
}
.carousel-wrapper .carousel .carousel-cell .price sup {
  top: 2px;
  position: absolute;
}
.carousel-wrapper .carousel .carousel-cell.is-selected {
  transform: scale(1.2);
}
.carousel-wrapper .carousel .carousel-cell.is-selected .line {
  height: 35px;
}
.carousel-wrapper .carousel .carousel-cell.is-selected .price, .carousel-wrapper .carousel .carousel-cell.is-selected .more {
  opacity: 1;
}
.carousel-wrapper .flickity-page-dots {
  display: none;
}
.carousel-wrapper .flickity-viewport, .carousel-wrapper .flickity-slider {
  overflow: visible;
}
    /*  */
    
body {
	background-color: snow;
}
#ALLdiv{background-color: white;margin-top: 2.3rem;}
#titl{margin-top: 2%; margin-bottom: 2%;}
#logo{float: left; width: 30px; height: 30px;}
#haha{margin-top: 0.8%; margin-left: 5.5%;}
footer{clear: both;}
#map{height: 20rem; clear: both;}
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
#inputbox{float: right; display: flex; width: 17rem;}
.topdiv{display: inline-flex; width: 100%; display: unset;}
#boxleft{float: left; display: -webkit-inline-box;}
#boxleft div{    border: 1px solid silver;
    border: 1px solid #c6cbce;
    height: 2.4rem;
    width: 13rem;
    text-align: center;
    padding-top: 2.5%;
    background-color: #f2f3f5;
    }
#leftbox{border-radius: 5px 0 0 0;}
#rightbox{border-radius: 0 5px 0 0;}
.form-control{margin: 2% 2%;}
#sbutton{    
    font-size: 0.8rem;
    width: 3rem;
    height: 2rem;
        margin: auto;
    }
    </style>
</head>
<jsp:include page="../header.jsp"></jsp:include>
<div id="titl" class="container">
       <img id="logo" src="../../img/playButton.PNG" alt="플레이로고">
       <h2 id="haha">버스킹 일정</h2>
   </div>

<body>

<div id="out" class="container">

<div class="topdiv">
<div id="boxleft">
    <div id="leftbox">하 위</div>
    <div id="rightbox">하 위</div>
</div>
    
    <div id="inputbox">
    <input class="form-control" type="text">
    <button id="sbutton" class="btns btns-outline-m">검색</button>
    </div>
</div>

<div id="ALLdiv">

<div id="map"></div>
<p id="maptitle">오늘의 공연목록</p>
<div id="caseldiv">




<!--  -->
<div class="carousel-wrapper">
  <div class="carousel" data-flickity>
    <div class="carousel-cell">
      <h3>Product 1</h3>
      <a class="more" href="">Explore more</a>
      <img src="https://images.unsplash.com/photo-1464305795204-6f5bbfc7fb81?dpr=2&auto=format&fit=crop&w=1500&h=1000&q=80&cs=tinysrgb&crop=" />
    
    </div>
    <div class="carousel-cell">
      <h3>Product 2</h3>
      <a class="more" href="">Explore more</a>
      <img src="https://images.unsplash.com/photo-1464305795204-6f5bbfc7fb81?dpr=2&auto=format&fit=crop&w=1500&h=1000&q=80&cs=tinysrgb&crop=" />
    
    </div>
    <div class="carousel-cell">
      <h3>Product 3</h3>
      <a class="more" href="">Explore more</a>
      <img src="https://images.unsplash.com/photo-1464305795204-6f5bbfc7fb81?dpr=2&auto=format&fit=crop&w=1500&h=1000&q=80&cs=tinysrgb&crop=" />
   
     
    </div>
  </div>
</div>
<!--  -->


</div>


<em>클릭한 위치에 마커가 표시됩니다!</em>
</div>











<div class="All">
    <div class="toptable">안녕하신가</div>
    <div class="listbox">
        <ul>
            <li>서울특별시</li>
            <li>경기도</li>
            <li>인천광역시</li>
            <li>부산광역시</li>
            <li>대구광역시</li>
            <li>광주광역시</li>
            <li>대전광역시</li>
            <li>광주광역시</li>
            <li>대전광역시</li>
            <li>울산광역시</li>
            <li>세종특별시</li>
            <li>강원도</li>
            <li>경상남도</li>
            <li>경상북도</li>
            <li>전라남도</li>
            <li>전라북도</li>
            <li>충청남도</li>
            <li>충청북도</li>
            <li>제주도</li>
        </ul>
        
    </div>
    <div class="boxbt">
        <button>취소</button>
        
    </div>
    
    </div>

</div>























    
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=15e2302756c9e7098ec0d79f7b4d53f4"></script>

<script>

$(document).ready(function(){
	
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new daum.maps.LatLng(37.4854, 127.034), // 지도의 중심좌표
        level: 7 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다.

var markers=[];
//버튼을 클릭하면 아래 배열의 좌표들이 모두 보이게 지도 범위를 재설정합니다 
var points =[];
var overlays =[];

/* daum.maps.event.addListener(markers, 'click', function() {
    overlay.setMap(map);
}); */

// 기본 overlay를 숨김
/* function close() {
	for(var i=0; i<overlays.length ; i++){
		overlays[i].setMap(null);
		console.log(i);
	}
} */

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

$(document).on('click','.closeOverlay',function (){
	 var i=$(this).attr('value');
	 overlays[i].setMap(null);
});  



$(function(){
	var i = 0;
	<c:forEach items="${list}" var="data">
		var content = '<div class="wrap">' + 
	    '    <div class="info">' + 
	    '        <div class="title">' + 
	    'test' +
	    '            <div class="closeOverlay" onclick="close()" value='+(i++)+' title="닫기"></div>' + 
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
    
    // 마커를 생성, 지도에 추가합니다
    var marker = new daum.maps.Marker({
    	map : map,
        position : position
    });
    
    // 생성된 마커를 배열에 추가합니다
    markers.push(marker);
    
    var overlay = new daum.maps.CustomOverlay({
        content: content,
        /* map: map, */
        position: marker.getPosition()       
    });
    overlays.push(overlay);
    //closeOverlay(overlay);
    daum.maps.event.addListener(marker, 'click', makeClickContent(overlay,map,marker));
    /* $(document).on('click','.colseOverlay',makecloseOverlay(overlay)); */
    
}





})


</script>
</body>
<footer>
<jsp:include page="../footer.jsp"></jsp:include>
</footer>
</html>