<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />


<!-- 달력 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    
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
            <c:forEach items="${plist}" var="perlist">
                <tr>
                    <td>${perlist.shopname}</td>
                    <td>${perlist.addr}</td>
                    <td>${perlist.nsdt}~${perlist.nedt}</td>
                    <td>${perlist.cnt}</td>
                    <td>개인스케줄</td>
                    <td>${perlist.cdt}</td>
                    <td><button>상세보기</button></td>
                </tr>
            </c:forEach>
            <c:forEach items="${list}" var="list">
                <tr>
                    <td>${list.shopname}</td>
                    <td>${list.addr}</td>
                    <td>${list.nsdt}~${list.nedt}</td>
                    <td>${list.cnt}</td>
                    <td><c:choose>
                            <c:when test="${list.flag eq '1'.charAt(0) }">
                                                        진행중
                        </c:when>
                            <c:when test="${list.flag eq '2'.charAt(0) }">
                                                        완료
                        </c:when>
                        </c:choose></td>
                    <td>${list.cdt}</td>
                    <td><button>상세보기</button></td>
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
                                    <td><input type="text" name='nsdt' id='datetimepicker'>~<input type="text" name='nedt' id='datetimepicker2'></td>
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
marker.setDraggable(true);




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


    // 이전값을 저장해주는 변수
    var _prevObj = null;
$(function() {
    
  // 캘린더 출력해주는 코드
  $('#calendar').fullCalendar({
      
      dayClick: function(date, jsEvent, view, resourceObj) {
            alert('Date: ' + date.format());
            if(_prevObj) {
                _prevObj.css('background-color', 'white');
                $(this).css('background-color', 'gray');
            } else {
                $(this).css('background-color', 'gray');
            }
              _prevObj = $(this);
            $("#selectday h2").html(date.format());
            
            
            var values = {"no":"5" , "date":date.format()};
            
            $.ajax({ 
                type : "POST", //보내는 타입을 Post방식으로 할지,  GET방식으로 할지 결정
                url : "clikeDate", // /내 프로젝트명/XML파일의namespace/내가불러올XML의Query이름.do
                //header :'Content-Type: application/json',
                dataType: 'json',
                data: values, //파라미터 넘겨줄 부분? : 이게 할말이 많은데 원래 GET방식으로 하라했다가 
                                       //다시 POST방식으로 하게됬는데 파라미터를 넘겨줄 값이 없어서 다시 GET으로 바꾸면서 주석 
                //contentType : "application/x-www-form-urlencoded; charset=utf-8",  // 기본값이라고 하니까 건들이지 않았고 
                success : function(data) {
                        $("#selectdate tbody").empty();
                        $("#selectday h3").empty();
                        
                if(data ==false){
                    $("#selectday h3").append('해당일의 스케줄이 존재하지않습니다.');
                }else{
                    $.each(data,function(index,item){
                        $("#selectdate tbody").append(
                                '<tr><td>'+item.nsdt.substring(11,16)+'~'+item.nedt.substring(11,16)+
                                '</td><td>'+item.shopname+'</td><td>'+item.addr+'</td></tr>');
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

$('#datetimepicker').datetimepicker();
jQuery('#datetimepicker2').datetimepicker({
      datepicker:false,
      format:'H:i'
    });
    
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
            	console.log(item.shopname);
            	
                $(".flagdata tbody").append(
                		'<tr>'+
                        '<td>'+item.shopname+'</td>'+
                        '<td>'+item.addr+'</td>'+
                        '<td>'+item.nsdt+'~'+item.nedt+'</td>'+
                        '<td>'+item.cnt+'</td>'+
                        '<td>'+item.flag+'</td>'+
                        '<td>'+item.cdt+'</td>'+
                        '<td><button>상세보기</button></td>'+
                        '</tr>')
            });
        }

        },
        error : function(request, status, error) {
            alert("에러가 발생했습니다. 관리자에게 문의하시기 바랍니다");
        }
    });
	
	
	
})



</script>

</body>
</html>
