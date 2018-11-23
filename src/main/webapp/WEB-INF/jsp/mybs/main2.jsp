<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />


<!-- 달력 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<link href="/css/fullcalendar.min.css" rel="stylesheet">
<script src="/js/fullcalendar.min.js" type="text/javascript"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 

<!-- 달력기간조회 -->
<link rel="stylesheet" type="text/css" href="/../css/jquery.datetimepicker.css">
<script src="/js/time/jquery.datetimepicker.full.min.js"></script>

<!-- 모달 -->
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

<!-- 카카오map,주소 api -->  
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=15e2302756c9e7098ec0d79f7b4d53f4&libraries=services"></script>



<style>
#calendar {
    max-width: 600px;
    margin: 0 auto;
}

#calendar, #selectday, #selectdate{
    display: inline-block;
}

#logo {
    width: 50px;
    height: 50px;
}

#addschedule {
    float: right;
}
.cc{margin-left:30%}


</style>
<script>
/* $(document).ready(function(){
    $('#datetimepicker').datetimepicker();
}); */

</script>

</head>
<body>
    <div id="titl">
        <img id="logo" src="/img/playButton.PNG" alt="플레이로고">
        <h2>버스킹 일정</h2>
    </div>


    <div id='calendar'></div>
    <div id='selectday'>
        <h2></h2>
        <table id="selectdate">
        <thead>
          <tr>
              <td>시간</td> <td>이름</td> <td>장소</td>
          </tr>
          </thead>
          <tbody>
          
          </tbody>
        </table>
        
        <h3></h3>
    </div>
    <div class="flagsearch">
        <button value="1">진행중</button>
        <button value="2">완료</button>
        <button value="3">개인스케줄</button>
    </div>

    <!-- 스케줄등록 모달  -->
    <div id="addschedule">
        <button type="button" class="btn btn-info btn-lg" data-toggle="modal"
            data-target="#myModal">스케줄등록하기</button>
    </div>

    <table class="flagdata">
        <thead>
            <tr>
                <th>상호명</th>
                <th>지역</th>
                <th>공연시간</th>
                <th>신청인원</th>
                <th>진행상태</th>
                <th>작성일</th>
                <th>상세보기</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${list}" var="list">
                <tr>
                    <td>${list.shopname}</td>
                    <td>${list.addr}</td>
                    <td>${list.nsdt}~${list.nedt}</td>
                    <td>${list.cnt}명</td>
                    <td>
                        <c:choose>
	                        <c:when test="${list.flag eq '1'.charAt(0) }">
	                                                          진행중
	                        </c:when>
	                        <c:when test="${list.flag eq '2'.charAt(0) }">
	                                                           완료
	                        </c:when>
	                        <c:otherwise>
	                                                           개인스케줄
	                        </c:otherwise>
                        </c:choose>
                    </td>
                    <td>${list.cdt}</td>
                    
                        <c:choose>
                            <c:when test="${list.supporter eq null }">
                            <td>
                                <button data-toggle="modal" data-target="#detailperModal"  
                                class="detailbtn" value="b${list.sno}">상세보기</button>
                            </td>
                            <td>
                                <button class='removebtn' value="b${list.sno}">삭제</button>
                            </td>    
                            </c:when>
                            <c:otherwise>
                            <td>
                                <button data-toggle="modal" data-target="#detailreqModal"
                                class="detailbtn" value="a${list.sno}">상세보기</button>
                            </td>
                            <td>
                                <button class='removebtn' value="a${list.sno}">삭제</button>
                            </td>    
                            </c:otherwise>
                        </c:choose>    
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    
    <!-- 모달 id -->
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- 모달 내부 설정 -->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">개인스케줄 올리기</h4>
                </div>
                <div class="modal-body">
                    <form action='add' method='post'
                        enctype="multipart/form-data">
                        <table>
                            <tbody>
                                <tr>
                                    <th>장소명</th>
                                    <td><input type='text' name='shopname'></td>
                                </tr>
                                <tr>
                                    <th>스케줄일정</th>
                                    <td><input type="text" name='nsdt' id='regstarttimepicker' autocomplete="off">~<input type="text" name='nedt' id='regendtimepicker' autocomplete="off"></td>
                                </tr>
                                <tr>
                                    <th>인원</th>
                                    <td><input type="text" name='cnt'></td>
                                </tr>
                                <tr>
                                    <th>주소검색</th>
                                    <td>
                                       <input type="text" id="addr" name="addr" placeholder="주소">
                                       <input type="button" onclick="search_addr()" value="주소 검색"><br>
                                       <div id="map" style="width:400px;height:400px;margin-top:10px;display:none"></div>
                                       <input type="text" id="x" name="x" style="display:none"> 
                                       <input type="text" id="y" name="y" style="display:none"> 
                                    </td>
                                </tr>
                                <tr>
                                    <th></th>
                                    <td><button class="btn btn-default">등록</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!--   -->
    <!-- 수정페이지모달  -->
    <div id="EditScheduleModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- 모달 내부 설정 -->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">개인스케줄 수정</h4>
                </div>
                <div class="modal-body">
                    <form action='edit' method='post'
                        enctype="multipart/form-data">
                        <table>
                            <tbody>
                                <tr>
                                    <th>장소명</th>
                                    <td><input type='text' name='shopname' id='shopname'></td>
                                </tr>
                                <tr>
                                    <th>스케줄일정</th>
                                    <td><input type="text" name='nsdt' id='editstartimepicker' autocomplete="off">~<input type="text" name='nedt' id='editendtimepicker' autocomplete="off"></td>
                                </tr>
                                <tr>
                                    <th>인원</th>
                                    <td><input type="text" name='cnt' id='cnt'></td>
                                </tr>
                                <tr>
                                    <th>주소검색</th>
                                    <td>
                                       <input type="text" id="addr" name="addr" placeholder="주소">
                                       <input type="button" onclick="search_addr()" value="주소 검색"><br>
                                       <div id="map" style="width:400px;height:400px;margin-top:10px;display:none"></div>
                                       <input type="text" id="x" name="x" style="display:none"> 
                                       <input type="text" id="y" name="y" style="display:none"> 
                                    </td>
                                </tr>
                                <tr>
                                    <th></th>
                                    <td><button class="btn btn-default">등록</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 상세조회 모달 css  -->
    <style>
	    .span5 {
	        width: auto;
	    }
	
	    #emg1 {
	        float: left;
	        margin-left: 10%
	    }
	
	    #emg2 {
	        float: right;
	        margin-right: 10%
	    }
	
	    .row {
	        width: 80%;
	        margin-top: px;
	    }
	
	    .container {
	        width: 90%;
	        margin-left: 10%;
	    }
	
	    .mimg {
	        margin-top: 30px;
	    }
	
	    .ct {
	        width: 80%
	    }
	
	    .box {
	        margin-top: 50px;
	    }
	
	    .text {
	        margin-top: 10px;
	        margin-bottom: 20px;
	    }
	
	    .text2 {
	        margin-bottom: 10px;
	    }
	    .eb{width:100%;}
    </style>
	    
    <!-- 성사된스케줄 모달  -->
    <div id="detailreqModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- 모달 내부 설정 -->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">요청스케줄</h4>
                </div>
                <div class="ct container">
    <div class="eb row">
        <div class="span5">
            <div class="artist-title col-md-10 ">
                <span>요청스캐줄 상세조회</span>
            </div>

            <div class="mimg center-block artist-collage col-md-14">

                <div class="center-block" id="emg1">
                    <img src="http://i.ytimg.com/i/MXDyVR2tclKWhbqNforSyA/mq1.jpg" alt="artist-image" width="150" height="150" class="center-block" />
                </div>
                <div id="map2" style="width:250px;height:250px;"></div>


            </div>
            <div class="listing-tab col-md-12">


                <!-- Tab panes -->
                <div class="container2">

                    <!---Form starting---->
                    <div class="">
                        <!--- For ShopName---->
                        <div class="box col-sm-12">
                            <div class="eb row">
                                <div class="col-xs-5">
                                    <label class="shopname">장소명 :</label>
                                </div>
                                <div class="reqname">
                                </div>
                            </div>
                        </div>
                        <!--- For Genre---->
                        <div class="col-sm-12">
                            <div class="row">
                                <div class="col-xs-12">
                                    <label class="genre">희망장르/퍼포먼스 :</label>
                                </div>
                                <div class="reqgenre">
                                </div>
                            </div>
                        </div>
                        <!-----For 공연시간---->
                        <div class="col-sm-12">
                            <div class="row">
                                <div class="col-xs-5">
                                    <label class="time">공연시간 :</label></div>
                                <div class="reqtime">
                                </div>
                            </div>
                        </div>
                        <!-----For Tel---->
                        <div class="col-sm-12">
                            <div class="row">
                                <div class="col-xs-5">
                                    <label class="tel">연락처 :</label></div>
                                <div class="reqtel">
                                </div>
                            </div>
                        </div>
                        <!-----For Address---->
                        <div class="col-sm-12">
                            <div class="row">
                                <div class="col-xs-5">
                                    <label class="addr">상세주소 :</label></div>
                                <div class="reqaddr">
                                </div>
                            </div>
                        </div>

                        <!-----For etc---->
                        <div class="text col-sm-12">
                            <div class="row">
                                <div class="text2 col-xs-3">
                                    <label class="etc" id="hect">메세지 :</label></div>
                                <div class="reqetc">
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>
    </div>

    <!-- 개인스케줄모달  -->
    <div id="detailperModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- 모달 내부 설정 -->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">개인스케줄</h4>
                </div>
                <div class="ct container">
    <div class="eb row">
        <div class="span5">
            <div class="artist-title col-md-10 ">
                <span>개인스캐줄 상세조회</span>
            </div>

            <div class="cc center-block artist-collage col-md-8">

                <div id="map3" style="width:250px;height:250px;"></div>

              

            </div>
            <div class="listing-tab col-md-12">


                <!-- Tab panes -->
                <div class="container2">

                    <!---Form starting---->
                    <div class="">
                        <!--- For ShopName---->
                        <div class="box col-sm-12">
                            <div class="eb row">
                                <div class="col-xs-5">
                                    <label class="shopname">장소명 :</label>
                                </div>
                                <div class="pershopname">
                                </div>
                            </div>
                        </div>
                        <!--- For Genre---->
                        <div class="col-sm-12">
                            <div class="row">
                                <div class="col-xs-5">
                                    <label class="genre">희망장르/퍼포먼스 :</label>
                                </div>
                                <div class="pergenre">
                                </div>
                            </div>
                        </div>
                        <!--- For Cnt---->
                        <div class="col-sm-12">
                            <div class="row">
                                <div class="col-xs-5">
                                    <label class="cnt">공연인원 :</label>
                                </div>
                                <div class="percnt">
                                </div>
                            </div>
                        </div>
                        <!-----For Time---->
                        <div class="col-sm-12">
                            <div class="row">
                                <div class="col-xs-5">
                                    <label class="time">공연시간 :</label></div>
                                <div class="pertime">
                                </div>
                            </div>
                        </div>
                        <!-----For Address---->
                        <div class="col-sm-12">
                            <div class="row">
                                <div class="col-xs-5">
                                    <label class="addr">상세주소 :</label></div>
                                <div class="peraddr">
                                </div>
                            </div>
                        </div>
                        <!-----For x,y---->
                        <div id='perx' style='display=none'></div>
                        <div id='pery' style='display=none'></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
                <div class="modal-footer">
                    <button data-toggle="modal" data-target="#EditScheduleModal"  
                                class="editbtn">수정</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>
    </div>
    
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div
mapOption = {
    center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
    level: 5 // 지도의 확대 레벨
};

//지도를 미리 생성
var map = new daum.maps.Map(mapContainer, mapOption);
//주소-좌표 변환 객체를 생성
var geocoder = new daum.maps.services.Geocoder();
//마커를 미리 생성
var marker = new daum.maps.Marker({
position: new daum.maps.LatLng(37.537187, 127.005476),
map: map

});
marker.setDraggable(true); // 마커를 움직일수 있게 설정 false일경우 고정!
map.relayout(); //뭐지이거 ?


/* 요청스케줄 상세보기에 출력해줄 맵을 생성 */
var mapContainer2 = document.getElementById('map2'), // 지도를 표시할 div 
 mapOption2 = { 
     center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표이나 별로 상관없음 
     level: 3 // 지도의 확대 레벨
 };

var map2 = new daum.maps.Map(mapContainer2, mapOption2); // 지도를 생성합니다

// 마커생성
var marker2 = new daum.maps.Marker({
	position: map2.getCenter() // 마커 디폴트 값이나 별로 상관없음 
});

marker2.setMap(map2); // 맵에 생성한 마커를 셋팅!

/* 개인스케줄 상세보기에 출력해줄 맵을 생성 */
var mapContainer3 = document.getElementById('map3'), // 지도를 표시할 div 
 mapOption3 = { 
     center: new daum.maps.LatLng(33.450701, 136.570667), // 지도의 중심좌표이나 별로 상관없음 
     level: 3 // 지도의 확대 레벨
 };

var map3 = new daum.maps.Map(mapContainer3, mapOption3); // 지도를 생성합니다

var marker3 = new daum.maps.Marker({
    position: map3.getCenter() // 마커 디폴트 값이나 별로 상관없음 
});

marker3.setMap(map3); // 맵에 생성한 마커를 셋팅!


function search_addr() {
new daum.Postcode({
    oncomplete: function(data) {
        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        var fullAddr = data.address; // 최종 주소 변수
        var extraAddr = ''; // 조합형 주소 변수

        // 기본 주소가 도로명 타입일때 조합한다.
        if(data.addressType === 'R'){
            //법정동명이 있을 경우 추가한다.
            if(data.bname !== ''){
                extraAddr += data.bname;
            }
            // 건물명이 있을 경우 추가한다.
            if(data.buildingName !== ''){
                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
            fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
        }

        // 주소 정보를 해당 필드에 넣는다.
        document.getElementById("addr").value = fullAddr;
        // 주소로 상세 정보를 검색
        geocoder.addressSearch(data.address, function(results, status) {
            // 정상적으로 검색이 완료됐으면
            if (status === daum.maps.services.Status.OK) {

                var result = results[0]; //첫번째 결과의 값을 활용

                // 해당 주소에 대한 좌표를 받아서
                var coords = new daum.maps.LatLng(result.y, result.x);
                // 지도를 보여준다.
                mapContainer.style.display = "block";
                map.relayout();
                // 지도 중심을 변경한다.
                map.setCenter(coords);
                // 마커를 결과값으로 받은 위치로 옮긴다.
                marker.setPosition(coords)
                var gps = marker.getPosition();
                var x = gps.getLat();
                var y = gps.getLng();
                
                // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
                document.getElementById("x").value = x;
                document.getElementById("y").value = y;
                
            }
        });
        
        daum.maps.event.addListener(map, 'click', function(mouseEvent) {
            searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
                if (status === daum.maps.services.Status.OK) {
                    var detailAddr = !!result[0].road_address ? result[0].road_address.address_name :'';
                    detailAddr += result[0].address.address_name;
                    
                    
                    // 마커를 클릭한 위치에 표시합니다 
                    marker.setPosition(mouseEvent.latLng);
                    marker.setMap(map);            
                                
                    var gps = marker.getPosition();
                    var x = gps.getLat();
                    var y = gps.getLng();
                    
                    // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
                    document.getElementById("addr").value = detailAddr;
                    document.getElementById("x").value = x;
                    document.getElementById("y").value = y;
                }   
            });
        });
       
        
        function searchDetailAddrFromCoords(coords, callback) {
            // 좌표로 법정동 상세 주소 정보를 요청합니다
            geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
        }

    }
}).open();
}


// 클릭한 이전값을 저장해주는 변수
var _prevObj = null;
 
$(function() {
    
  // 캘린더 출력해주는 코드
  $('#calendar').fullCalendar({
      
	  // fullCalendar에 날짜클릭시 발생하는 이벤트 function = dayClick
      dayClick: function(date, jsEvent, view, resourceObj) {
    	  
    	  
            if(_prevObj) { // 이전클릭한 데이터가 존재한다면? ture라면?
                _prevObj.css('background-color', 'white'); // 이전날짜의 배경을 없앰 
                $(this).css('background-color', 'gray'); // 현재의 배경을 색상을 지정
            } else {
                $(this).css('background-color', 'gray'); // 이전클릭한 데이터가 없다면? 그냥 현재의 배경만 색상 지정
            }
              _prevObj = $(this); // 이전데이터 저장하는 변수에 현재누른 것을 넣어줌으로 첫번째 if 문에서 실행되게 함
            $("#selectday h2").html(date.format());
            
              
            /* 여기서 부터는 클릭 date를 받아 스케줄 출력해주는 ajax처리  */ 
            
            // no같은 경우 버스커 번호임, 지금은 로그인안했으니까 5번으로 고정 
            var values = {"no":"5" , "date":date.format()};
            
            $.ajax({ 
                type : "POST", 
                url : "clikeDate",
                dataType: 'json',
                data: values, 
                success : function(data) {
                	    // 데이터 출력 할 곳 초기화
                        $("#selectdate tbody").empty();
                        $("#selectday h3").empty();
                        console.log(data);
                if(data.length==0){
                	// 해당일의 데이터가 없을경우 
                    $("#selectday h3").append('해당일의 스케줄이 존재하지않습니다.');
                }else{
                	
                	// 데이터를 list로 받아와서 foreach문으로 출력해줌!
                    $.each(data,function(index,item){
                        $("#selectdate tbody").append(
                                '<tr><td>'+item.nsdt.substring(11,16)+'~'+item.nedt.substring(11,16)+
                                '</td><td>'+item.shopname+'</td><td>'+item.supporter.baseaddr+'</td></tr>');
                    });
                }

                },
                error : function(request, status, error) {
                    alert("에러가 발생했습니다. 관리자에게 문의하시기 바랍니다");
                }
            });
            
            
            
            
              
          }  
  })
  
});



/* 상세정보 조회 ajax처리 */
$('.detailbtn').click(function(){
	var f = $(this).val(); // 클릭한 값을 받음 ex) a1일 경우 컨트롤러에서 a=요청스케줄, b=개인스케줄로 분류하여 처리 
	$.ajax({ 
        type : "POST", 
        url : "clikedetail",
        dataType: 'json',
        data: { "fakeflag" : f},
        success : function(data) {
        	    /* 요청스케줄, 개인스케줄 모달 태크에 기존 값을 초기화 */
	        	$(".reqname").empty();
	            $(".reqgenre").empty();
	            $(".reqtime").empty();
	            $(".reqtel").empty();
	            $(".reqaddr").empty();
	            $(".reqetc").empty();
	            $(".pershopname").empty();
                $(".pergenre").empty();
                $(".pertime").empty();
                $(".peraddr").empty();
                $(".peretc").empty();
	        
	        if(data ==false){
	        	/* 이거왜했지? 테스트인듯.. */
	        	cosole.log(data.addr)
	        }else{
	        	/* 컨트롤러에서 a,b값에 따라 요청스케줄, 개인스케줄중 한가지를 리턴해줌 */
	        	if(data.supporter==null){// 개인스케줄의 경우 supporter 객체를 받지 않음, 고로 개인스케줄 모달에 데이터 처리
	        		$(".pershopname").append('<p>'+data.shopname+'</p>');
                    $(".pergenre").append('<p>'+'장르를만들자'+'</p>');
                    $(".pertime").append('<p>'+data.nsdt+'~'+data.nedt+'</p>');
                    $(".peraddr").append('<p>'+data.addr+'</p>');
                    
                    // 다음지도 api
                    // x,y값을 받아 다음지도의 LatLng 생성 <= 좌표만들어주는 객체인듯
                    var LatLon = new daum.maps.LatLng(data.x, data.y);
                    // 기존 생성된 map의 중심을 데이터상의 x,y로 맞춰줌
                    map3.setCenter(LatLon);
                    // 기존 생성된 marker의 위치를 수정해주는 매서드
                    marker3.setPosition(new daum.maps.LatLng(LatLon.getLat(),LatLon.getLng()));
	        	}else{ // supporter객체가 있다면 요청스케줄 모달에 데이터 처리
	        		$(".reqname").append('<p>'+data.supporter.name+'</p>');
	        		$(".reqgenre").append('<p>'+data.supporter.sgnere+'</p>');
	        		$(".reqtime").append('<p>'+data.supporter.tel+'</p>');
	        		$(".reqtel").append('<p>'+data.nsdt+'~'+data.nedt+'</p>');
	        		$(".reqaddr").append('<p>'+data.supporter.baseaddr+'</p>');
	        		$(".reqetc").append('<p>'+data.supporter.message+'</p>');
	        		//위와 같음, 다만 map2객체에 설정, map2=요청스케줄 모달페이지 맵, map3=개인스케줄 도달페이지 맵  
	        		var LatLon = new daum.maps.LatLng(data.supporter.x, data.supporter.y);
	                map2.setCenter(LatLon);
	                marker2.setPosition(new daum.maps.LatLng(LatLon.getLat(),LatLon.getLng()));
	        	}
	        	
	        }

        },
        error : function(request, status, error) {
            alert("에러가 발생했습니다. 관리자에게 문의하시기 바랍니다");
        }
        
        
    });
	
	
	
	
})



/* 날짜입력타입 설정해주기 (현재 페이지에선 스케줄등록 모달에 사용중)  */
$('#regstarttimepicker').datetimepicker({
    minDate: 0,
});

var jsDate = moment($("#regstartimepicker").val(), 'DD-MM-YYYY HH:mm'); 
var minimum = function(jsDate){
    this.setOptions({
       minTime : minitime
    })
}; 

var minitime;

$('#regstarttimepicker').change(function(){
	
	jsDate = moment($(this).val(), 'DD-MM-YYYY HH:mm');
	var faketime=$(this).val();
	console.log(faketime);
	minitime=(parseInt(faketime.substring(10,13))+1) +':00';
	console.log(minitime);
})

  
$('#regendtimepicker').datetimepicker({
      datepicker:false,
      format:'H:i',
      onChangeDateTime:minimum,
      onShow:minimum
});


/* 수정페이지 날짜입력타입 설정해주기 (현재 페이지에선 스케줄등록 모달에 사용중)  */
$('#editstartimepicker').datetimepicker({
    minDate: 0,
});

var jsDate = moment($("#editstartimepicker").val(), 'DD-MM-YYYY HH:mm'); 
var minimum = function(jsDate){
    this.setOptions({
       minTime : minitime
    })
}; 

var minitime;

$('#editstartimepicker').change(function(){
    
    jsDate = moment($(this).val(), 'DD-MM-YYYY HH:mm');
    var faketime=$(this).val();
    console.log(faketime);
    minitime=(parseInt(faketime.substring(10,13))+1) +':00';
    console.log(minitime);
})

  
$('#editendtimepicker').datetimepicker({
      datepicker:false,
      format:'H:i',
      onChangeDateTime:minimum,
      onShow:minimum
});
    
/* 필터로 해당단계에 해당하는 스케줄 뿌려주기! (1=진행중,2=완료,else=개인스케줄)  */    
$('.flagsearch button').click(function(){
	
	var f = $(this).val();
	
    console.log(f);
    $.ajax({ 
        type : "POST", //보내는 타입을 Post방식으로 할지,  GET방식으로 할지 결정
        url : "clikeFlag", // /내 프로젝트명/XML파일의namespace/내가불러올XML의Query이름.do
        //header :'Content-Type: application/json',
        dataType: 'json',
        data : { flag : f }, //파라미터 넘겨줄 부분? : 이게 할말이 많은데 원래 GET방식으로 하라했다가 
                               //다시 POST방식으로 하게됬는데 파라미터를 넘겨줄 값이 없어서 다시 GET으로 바꾸면서 주석 
        //contentType : "application/x-www-form-urlencoded; charset=utf-8",  // 기본값이라고 하니까 건들이지 않았고 
        success : function(data) {
                $(".flagdata tbody").empty();
                
        if(data ==false){
            $(".flagdata tbody").append('해당일의 스케줄이 존재하지않습니다.');
        }else{
            $.each(data,function(index,item){
            	
            	if(item.flag==1){ // 진행중(flag=1)일 경우 flag1()에 해당하는 목록을 뿌려줌
            		var naddr=item.addr.substring(item.addr.indexOf(" ")+1,item.addr.length);
                    var startindex=item.addr.indexOf(" ")+1;
                    var endindex=naddr.indexOf(" ")+startindex;
                    flag1(endindex,item);
	                
            	}else if(item.flag==2){ // 진행중(flag=2)일 경우 flag2()에 해당하는 목록을 뿌려줌
            		var naddr=item.addr.substring(item.addr.indexOf(" ")+1,item.addr.length);
                    var startindex=item.addr.indexOf(" ")+1;
                    var endindex=naddr.indexOf(" ")+startindex;
                    flag2(endindex,item);
            		
            	}else{// flag가 없을 경우 개인스케줄 이므로 flag()로 뿌려줌 
            		var naddr=item.addr.substring(item.addr.indexOf(" ")+1,item.addr.length);
            		var startindex=item.addr.indexOf(" ")+1;
            		var endindex=naddr.indexOf(" ")+startindex;
            		flag(endindex,item);
            	}
            });
        }

        },
        error : function(request, status, error) {
            alert("에러가 발생했습니다. 관리자에게 문의하시기 바랍니다");
        }
        
        
    });
	
	
	
});


/*                  필터 뽑아주기 (진행중, 완료, 개인스케줄)                                               */
// 진행중 필터 목록 출력
function flag1(endindex,item){
	$(".flagdata tbody").append(
            '<tr>'+
            '<td>'+item.shopname+'</td>'+
            '<td>'+item.addr.substring(0,endindex)+'</td>'+
            '<td>'+item.nsdt+'~'+item.nedt+'</td>'+
            '<td>'+item.cnt+'명</td>'+
            '<td>'+'진행중'+'</td>'+
            '<td>'+item.ncdt+'</td>'+
            "<td><button data-toggle='modal' data-target='#detailreqModal' "+ 
            "class='detailbtn' value=a"+item.sno+">상세보기</button></td>"+
            "<td><button class='removebtn' value=a"+item.sno+">삭제</button></td>"+ 
            'value=a'+item.sno+"'>"+'상세보기</button></td>'+
            '</tr>');
}
//완료 필터 목록 출력
function flag2(endindex,item){
	$(".flagdata tbody").append(
            '<tr>'+
            '<td>'+item.shopname+'</td>'+
            '<td>'+item.addr.substring(0,endindex)+'</td>'+
            '<td>'+item.nsdt+'~'+item.nedt+'</td>'+
            '<td>'+item.cnt+'명</td>'+
            '<td>'+'완료'+'</td>'+
            '<td>'+item.ncdt+'</td>'+
            "<td><button data-toggle='modal' data-target='#detailreqModal' "+ 
            "class='detailbtn' value=a"+item.sno+">상세보기</button></td>"+
            "<td><button class='removebtn' value=a"+item.sno+">삭제</button></td>"+
            '</tr>');
}
//개인스케줄 필터 목록 출력 
function flag(endindex,item){
	$(".flagdata tbody").append(
            '<tr>'+
            '<td>'+item.shopname+'</td>'+
            '<td>'+item.addr.substring(0,endindex)+'</td>'+
            '<td>'+item.nsdt+'~'+item.nedt+'</td>'+
            '<td>'+item.cnt+'명</td>'+
            '<td>'+'개인스케줄'+'</td>'+
            '<td>'+item.ncdt+'</td>'+
            "<td><button data-toggle='modal' data-target='#detailperModal' "+ 
            "class='detailbtn' value=b"+item.sno+">상세보기</button></td>"+
            "<td><button class='removebtn' value=b"+item.sno+">삭제</button></td>"+
            '</tr>');
}


$('.removebtn').click(function(){
	    var f = $(this).val();
	    console.log(f);
	    
    $.ajax({ 
        type : "POST", //보내는 타입을 Post방식으로 할지,  GET방식으로 할지 결정
        url : "deleteschedule", 
        dataType: 'json',
        data : { fakeflag : f }, //파라미터 넘겨줄 부분? : 이게 할말이 많은데 원래 GET방식으로 하라했다가 
        success : function(data) { // delete, update문 같은 경우에는 기본적으로 int값을 반환함.
            alert("성공적으로 삭제 되었습니다.");
            window.location="/app/mybs/main" // 절대 경로이기 때문에 시작경로를 / 로 설정해줘야함
        },
        error : function(request, status, error) {
            alert("에러가 발생했습니다. 관리자에게 문의하시기 바랍니다");
        }
        
        
    });
	
	
	
})


$('#datetimepicker2').focusout(function(){
	
	
	console.log("aaa");
	
	
       var f = {
        		"sdt": $('#datetimepicker').val(),
        		"edt": $('#datetimepicker2').val(),
        		"no": 5
        }
        console.log(f);
       
    $.ajax({ 
        type : "POST", //보내는 타입을 Post방식으로 할지,  GET방식으로 할지 결정
        url : "checkschedule", 
        dataType: 'json',
        data : f, //파라미터 넘겨줄 부분? : 이게 할말이 많은데 원래 GET방식으로 하라했다가 
        success : function(data) { // delete, update문 같은 경우에는 기본적으로 int값을 반환함.
        	if(data==0){
        		console.log(data+"중복값이없어 바꾼다");	
        	}else{
        		console.log(data+"중복일정이있어 못바꾸게한다");
        	} 
            
        },
        error : function(request, status, error) {
            alert("에러가 발생했습니다. 관리자에게 문의하시기 바랍니다");
        }
        
        
    });
    
    
    
});

$(".editbtn").click(function(){
	
	$('#detailperModal').modal('hide');
	
	
});


</script>

</body>
</html>
