<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="utf-8">
    <title>버스커 위치</title>
    <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 <link rel="stylesheet" href="../../css/common.css">
   
   <!--  -->
    <link rel="stylesheet" href="https://unpkg.com/flickity@2.0/dist/flickity.min.css">
    
    
   <!-- 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
    
    <style>
    
    .caselh3{font-family: "Do Hyeon"}
    
    /* 박스 */
        .All{   
        width: 19rem;
    height: 25.89rem;
    border: 1px solid black;
    position: relative;
    top: -54rem;
    left: 19.1rem;
    z-index: 1;
    background-color: white;
    display: none;
    }
    .toptable{
        border-bottom-color: #c6cbce;
    background-color: #f2f3f5;
    text-align: center;
    height: 3rem;
    padding-top: 1rem;

    }
    li{list-style: none;}
    .listbox ul li{
        width: 33.3333%;
        border: 1px solid #d8dde0;
        padding: 5% 0% 4% 0%;
        text-align: center;
        cursor: pointer;
 
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
    height: 100%;
    width: 100%;
    margin: auto;
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
.ellipsis{word-break: break-all;}  
body {
    background-color: snow;
}
#ALLdiv{margin-top: 2.3rem;}
#titl{margin-top: 2%; margin-bottom: 2%; display: -webkit-box;}
#logo{width: 40px; height: 40px;}
#haha{    margin-top: 0;
    margin-bottom: 0;
    margin-left: 1.5%;
    display: inline-block;
    position: relative;
    top: 6px;}
footer{clear: both;}
#map{height: 30rem; clear: both;}
#caseldiv{height: 20rem;}
#maptitle{height: 3rem;
    text-align: -webkit-auto;
}
footer{margin-top: 3rem;}
.flickity-viewport{margin-bottom: 7rem;}
.carousel-cell{text-align: center;}

.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
.wrap * {padding: 0;margin: 0;}
.wrap .info {width: 286px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
.wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
.info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
.info .closeOverlay {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
.info .closeOverlay:hover {cursor: pointer;} 
.info .body {position: relative;overflow: hidden;}
.info .desc {    position: relative;
    margin: 13px 0 0 90px;
    height: 75px;
    padding-right: 2%;}
.desc .ellipsis {overflow: hidden;     white-space: normal;}
.desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
.info .img {position: absolute;top: 10px;left: 5px;width: 4rem;height: 3.5rem;border: 1px solid #ddd;color: #888;overflow: hidden;}
.info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.info .link {color: #5085BB; float: right;}
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
#All{border-radius: 5px 0 0 0;}
#All2{border-radius: 0 5px 0 0;}
.form-control{margin: 2% 2%;}
#sbutton{    
    font-size: 0.8rem;
    width: 3rem;
    height: 2rem;
        margin: auto;

}  
.info{width: 7rem;}
.All2{

              width: 19rem;
    height: 31.6rem;
    border: 1px solid black;
    position: relative;
    top: -54rem;
    z-index: 2;
    background-color: white;
    left: 32.1rem;
    display: none;
    }    
    
.choicearea.active{
    background-color:red;!important;
    }
    
.hdiv{margin-left: 2%;}

#bticon{font-size: 2rem; float: left; margin-left: 2%;
}
#maptitle{padding-top: 0.8%;margin-left: 7%;}
.carousel-cell{top: 3rem;}
.flickity-viewport{background-color: rgba(93, 91, 213, 0.07);}

.flickity-enabled.is-draggable .flickity-viewport{cursor: pointer;}
    </style>
</head>
<jsp:include page="../header.jsp"></jsp:include>
<div id="titl" class="container">
       <img id="logo" src="../../img/playButton.PNG" alt="플레이로고">
       <h3 id="haha" style="display: flex;">버스커 위치</h3>
      
   </div>

<body>

<div id="out" class="container">

<div class="topdiv">
<div id="boxleft">
    <div class='choicearea' id="All">시/도 선택</div>
    <div class='choicearea' id="All2">시/군/구 선택</div>
</div>
    
    <div id="inputbox">
    <input class="form-control" type="text" id="searchinput">
    <button id="sbutton" class="btns btns-outline-m">검색</button>
    </div>
</div>

<div id="ALLdiv">

<div id="map"></div>
<div id="hdiv">

<i class="fas fa-drum" id="bticon"></i>
<h3 id="maptitle">오늘의 공연목록</h3>
</div>
<div id="caseldiv">




<!--  -->
<div class="carousel-wrapper">
  <div class="carousel" data-flickity>
  
  <!-- 카르셀 시작 -->
  <c:forEach items="${list}" var="cl">
      <div class="carousel-cell" value="${cl.x},${cl.y}" >
        <h3 class="caselh3">${cl.bname}</h3>
        <label>${cl.nsdt}~${cl.nedt}</label>
        <label class='a'>${cl.simpleaddr}</label>
        <img style="height: 8rem;" src="/upload/${cl.phot}" />
    </div>
  </c:forEach>
  <!-- 카르셀 끝 -->
  
    </div>
  </div>
</div>
<!--  -->


</div>


</div>


    <div class="All">
    <div class="toptable">시 / 도</div>
    <div class="listbox">
        <ul>
            <li id='seoul'>서울특별시</li>
            <li>경기도</li>
            <li>인천광역시</li>
            <li id='busan'>부산광역시</li>
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
    <div class="All2" id='seoulmenu'>
    <div class="toptable">시 / 군 / 구</div>
    <div class="listbox">
        <ul>
            <li>종로구</li>
            <li>중구</li>
            <li>용산구</li>
            <li>성동구</li>
            <li>광진구</li>
            <li>동대문구</li>
            <li>중랑구</li>
            <li>성북구</li>
            <li>강북구</li>
            <li>도봉구</li>
            <li>노원구</li>
            <li>은평구</li>
            <li>서대문구</li>
            <li>마포구</li>
            <li>양천구</li>
            <li>강서구</li>
            <li>구로구</li>
            <li>금천구</li>
            <li>영등포구</li>
            <li>동작구</li>
            <li>관악구</li>
            <li>서초구</li>
            <li>강남구</li>
            <li>송파구</li>
            <li>강동구</li>
        </ul>
        
    </div>
    <div class="boxbt">
        <button>취소</button>
        
    </div>
    
    </div>


    <div class="All2" id='busanmenu' style="height: 23.1rem;">
	    <div class="toptable">시 / 군 / 구</div>
	    <div class="listbox">
	        <ul>
	            <li>중구</li>
	            <li>서구</li>
	            <li>동구</li>
	            <li>영도구</li>
	            <li>부산진구</li>
	            <li>동래구</li>
	            <li>남구</li>
	            <li>북구</li>
	            <li>해운대구</li>
	            <li>사하구</li>
	            <li>금정구</li>
	            <li>강서구</li>
	            <li>연제구</li>
	            <li>수영구</li>
	            <li>사상구</li>
	            <li>기장군</li>
	        </ul>
	    </div>
		    <div class="boxbt">
		        <button>취소</button>
		    </div>
    </div>
    
<script src="https://unpkg.com/flickity@2.0/dist/flickity.pkgd.min.js"></script>    
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=15e2302756c9e7098ec0d79f7b4d53f4"></script>

<script>
 $(".listbox ul li").mouseover(function(){
	$(this).css("background-color","#d1e1fc");
}) 
$(".listbox ul li").mouseleave(function(){
    $(this).css("background-color","white");
})

$(document).ready(function(){
    
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new daum.maps.LatLng(37.5342, 126.992), // 지도의 중심좌표
        level: 7 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다.

var markers=[];
//버튼을 클릭하면 아래 배열의 좌표들이 모두 보이게 지도 범위를 재설정합니다 
var points =[];
var overlays =[];

function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
    overlays =[];
}
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
var carouselcontent;
var ie=23.51;

 
$(function(){   
    var i = 0;
    var e = 0;
    <c:forEach items="${list}" var="data">
        var content = '<div class="wrap">' + 
        '    <div class="info">' + 
        '        <div class="title">' + 
        '${data.bname}' +
        '            <div class="closeOverlay" onclick="close()" value='+(i++)+' title="닫기"></div>' + 
        '        </div>' + 
        '        <div class="body">' + 
        '            <div class="img">' +
        '                <img src="/upload/${data.phot}" width="73" height="70">' +
        '           </div>' + 
        '            <div class="desc">' + 
        '                <div class="ellipsis">${data.addr}</div>' +
        '                <div class="ellipsis">${data.bname}</div>' + 
        '                <div class="wow"><div class="jibun ellipsis">${data.nsdt}~${data.nedt}</div><a href="/app/buskerfeed/enter?no=${data.bno}" target="_blank" class="link">피드로 이동</a></div>' + 
        '            </div>' + 
        '        </div>' + 
        '    </div>' +    
        '</div>';
        
       
        
        
        
        /* 
        carouselcontent= '<div class="carousel-cell">'+ 
					         '<h3>${data.bname}</h3>'+
					         '<a class="more" href="">Explore more</a>'+
					         //'<span class="more">${data.nsdt}~${data.nedt}</span>'+
					         '<img src="../../img/${data.phot}" />'+
					         '</div>'; */
					         
					        
       addMarker(new daum.maps.LatLng(${data.x}, ${data.y}),content);
       
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

$(".choicearea").click(function(){
    $(this).css('background-color','#c6cbce');
    $(this).siblings().css('background-color','#f2f3f5');
    var listID=$(this).attr('id');
    var listhideID=$(this).siblings().attr('id');
    $('.'+listID).css('display','block');
    $('.'+listhideID).css('display','none');
});


/* 시군구 선택시 무엇을 열어줄지 */
$("#All2").click(function(){
	var area =$("#All").text(); 
    var listID=$(this).attr('id');
    var listhideID=$(this).siblings().attr('id');
    console.log(area);
    $(this).css('background-color','#c6cbce');
    $(this).siblings().css('background-color','#f2f3f5');
    
    if(area=='부산광역시'){
    	$('#busanmenu').css('display','block');
    	$('#seoulmenu').css('display','none');
    }else if(area=='서울특별시'){
    	$('#seoulmenu').css('display','block');
    	$('#busanmenu').css('display','none');
    }else{
    	$('.All2').css('display','none');
    	swal("","시도를 먼저 선택해주세요.","warning");
    	
    }
    
    //$('.'+listhideID).css('display','none');
});


$('html').click(function(e) { 
	if($(e.target).parent().parent().hasClass("listbox")) {
	}else if(!$(e.target).hasClass("choicearea")) {
        $("#All").css('background-color','#f2f3f5');
        $("#All2").css('background-color','#f2f3f5');
        $('.All').css('display','none');
        $('.All2').css('display','none');
    }
	
});


$(".All li").click(function(){
    var searchCode= $(this).text();
    var area = $(this).attr('id');
    $("#All").text(searchCode);
    $("#All").css('background-color','#f2f3f5');
    $("#All2").css('background-color','#c6cbce');
    $('.All').css('display','none');
    $('#'+area+'menu').css('display','block');
});


$(".All2 li").click(function(){
    var searchCode= $(this).text();
    $("#All2").text(searchCode);
    $('.All2').css('display','none');
    $("#All2").css('background-color','#f2f3f5');
    var sido=$("#All").text();
    var sigungu=$(this).text();
    console.log(sido);
    console.log(sigungu);
    $.ajax({ 
        type : "POST", //보내는 타입을 Post방식으로 할지,  GET방식으로 할지 결정
        url : "SearchByTag", 
        dataType: 'json',
        data : {
            "sido":sido,
            "sigungu":sigungu
        }, //파라미터 넘겨줄 부분? : 이게 할말이 많은데 원래 GET방식으로 하라했다가 
        success : function(data) { 
            if(data.length!='0'){
            	if(data.length=='0'){
                    swal("","갬색 지역의 버스커 공연이 없습니다.","warning");
                }else{
                       $('.carousel-wrapper').empty();
                       $('.carousel-wrapper').append('<div class="carousel"></div>'); 
                       
    
                    var bounds = new daum.maps.LatLngBounds() ;
                    $.each(data,function(index,item){
                       bounds.extend(new daum.maps.LatLng(item.x, item.y));
                       
                       carouselcontent= 
                           '<div class="carousel-cell" value="'+item.x+','+item.y+'" >'+
                                 '<h3>'+item.bname+'</h3>'+
                                 '<label>'+item.nsdt+'~'+item.nedt+'</label>'+
                                 '<label class="a">'+item.simpleaddr+'</label>'+
                                 '<img style="height: 8rem;" src="/upload/'+item.phot+'" />'+
                           '</div>'
                           
                                        
                       $('.carousel').append(carouselcontent); 
                       
                    }); 
                   map.setBounds(bounds);
                   $('.carousel').flickity();
                }
            	
            	
                /* var i = 0;
                var bounds = new daum.maps.LatLngBounds() ;
                $('.carousel-wrapper').empty();
                $('.carousel-wrapper').append('<div class="carousel"></div>'); 
                
                $.each(data,function(index,item){
                    var content = '<div class="wrap">' + 
                    '    <div class="info">' + 
                    '        <div class="title">' + 
                    item.bname +
                    '            <div class="closeOverlay" onclick="close()" value='+(i++)+' title="닫기"></div>' + 
                    '        </div>' + 
                    '        <div class="body">' + 
                    '            <div class="img">' +
                    '                <img src="../../img/'+item.phot+' width="73" height="70">' +
                    '           </div>' + 
                    '            <div class="desc">' + 
                    '                <div class="ellipsis">'+item.addr+'</div>' +
                    '                <div class="ellipsis">'+item.shopname+'</div>' + 
                    '                <div class="jibun ellipsis">'+item.nsdt+'~'+item.nedt+'</div>' + 
                    '                <div><a href="/../buskerfeed/enter?no=+'+item.bno+' target="_blank" class="link">피드로 이동</a></div>' + 
                    '            </div>' + 
                    '        </div>' + 
                    '    </div>' +    
                    '</div>';
                    
                    
                   bounds.extend(new daum.maps.LatLng(item.x, item.y)); 
                   //addMarker(new daum.maps.LatLng(item.x, item.y),content);
                });
                   map.setBounds(bounds); */
            }else{
                swal("","갬색 지역의 버스커 공연이 없습니다.","warning");
            }
        },
        error : function(request, status, error) {
            swal("검색오류","관리자에게 문의하세요.","error");
        }
    });
    
});


$(".boxbt").click(function(){
    $('.All').css('display','none');
    $('.All2').css('display','none');
    $("#All").css('background-color','#f2f3f5');
    $("#All2").css('background-color','#f2f3f5');
})


$('.carousel-cell').click(function(){
	console.log('선택이미지');
	var test = $(this).attr('value').split(',');
	var x=test[0];
	var y=test[1];
	
	var gocenter = new daum.maps.LatLng(x, y);
	
	map.setCenter(gocenter);
	
	
});

$('#sbutton').click(function(){
	var keyword=$('#searchinput').val();
	if(keyword.length==0){
		swal("","검색어를 다시 설정해주세요.","warning");
	}else{
		$.ajax({ 
	        type : "POST", 
	        url : "SearchByWord",
	        dataType: 'json',
	        data: {
	            'keyword':keyword        	
	        }, 
	        success : function(data) {
	        	if(data.length=='0'){
	        		swal("","갬색 지역의 버스커 공연이 없습니다.","warning");
	        	}else{
		               $('.carousel-wrapper').empty();
		               $('.carousel-wrapper').append('<div class="carousel"></div>'); 
		               
	
		        	var bounds = new daum.maps.LatLngBounds() ;
		        	$.each(data,function(index,item){
		               bounds.extend(new daum.maps.LatLng(item.x, item.y));
		               
		               carouselcontent= 
		            	   '<div class="carousel-cell" value="'+item.x+','+item.y+'" >'+
		            	         '<h3>'+item.bname+'</h3>'+
		            	         '<label>'+item.nsdt+'~'+item.nedt+'</label>'+
		            	         '<label class="a">'+item.simpleaddr+'</label>'+
		            	         '<img style="height: 8rem;" src="/upload/'+item.phot+'}" />'+
		            	   '</div>'
		            	   
		                                
		               $('.carousel').append(carouselcontent); 
		               
		            }); 
	               map.setBounds(bounds);
	               $('.carousel').flickity();
	        	}
	        },
	        error : function(request, status, error) {
	            swal("오류","데이터전송 오류","error");
	        }
	    });
	}
})


})


</script>

<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> --> 
</body>
<footer>
<jsp:include page="../footer.jsp"></jsp:include>
</footer>
</html>