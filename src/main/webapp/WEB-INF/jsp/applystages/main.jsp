<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />

<!-- 지도 -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c63782df6473def89780e1d964f9d83a&libraries=services"></script>

<style>
#calendar {
    max-width: 600px;
    margin: 0 auto;
    float: left;
}

#calendar, #selectday{
    display: inline-block;
}

#selectday{
float:right;
position    : relative;
}

#logo {
    margin: 10px;
    float: left;
    width: 50px;
    height: 50px;
}

#titl h2 {
    margin: 10px;
    display:inline-block;
}

#name{
    text-align: center;
    margin: 50px;
}
#info{
clear: both;
}
#info table tbody td{
padding : 10px;
}
#photo{
margin: 30px;
}
img{
width: 25%; height:10%;
margin: auto;
}

ul li{
list-style: none;
}
</style>

</head>
<body>
    <div id="titl">
        <img id="logo" src="/img/playButton.PNG" alt="플레이로고">
        <h2>무대관리</h2>
    </div>
    <div id="name">
        <h2>${list.name}</h2>
    </div>
    <div id="photo"> 
    <c:forEach items="${lists}" var="s">
    <img alt="이미지" src="/upload/${s.photo}">
    </c:forEach>
    </div>
                                        
    <div id='calendar'></div>
    <div id='selectday'>
        <table class='applydates'>
            <thead>
                <tr><td colspan="4" id='showDate'><h2></h2></td></tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
    <div id='info'>
    <table>
    <tbody>
    <tr><td>상호명/장소명</td><td>${list.name}</td></tr>
    <tr><td>상세주소</td><td>${list.baseaddr} ${list.detailaddr}</td></tr> 
    <tr><td>수용가능인원</td><td>${list.capa}</td></tr> 
    <tr><td>희망 장르</td><td>${list.sgnere}</td></tr> 
    <tr><td>연락처</td><td>${list.tel}</td></tr> 
    <tr><td>장소 소개</td><td>${list.message}</td></tr>    
    </tbody>
    </table>
    </div>
    <div id="map" style="width:500px;height:400px;"></div>
    
    
    <!-- 신청하기 모달 -->    
<div class="modal fade" id="addcontModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
        <!-- header title -->
        <h4 class="modal-title">신청하기</h4>
      </div>
      <!-- body -->
      <div class="modal-body">
      <div class="info">
        <h5>신청내역</h5>
        <ul>
        </ul>
      </div>
      <div class="content">
      <label for="cont">추가 전달사항</label><br>
      <textarea name="cont" id="cont" cols="40" rows="8"></textarea><br>
      <label for="count">팀 인원</label>
      <input type="number" id="count" name="count"><br> 
      <button onclick="applyStage()" id='applybtn' disabled="disabled">신청하기</button>
      </div>      
      </div>
      <!-- Footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

        
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">


<script>
var _prevObj = null;
$(function() {  
  $('#calendar').fullCalendar({      
      dayClick: function(date, jsEvent, view, resourceObj) {
    	  var current_date = moment().format('YYYY-MM-DD')
          if(current_date > date.format()) {
              alert("오늘 이후의 날짜를 골라주세요")
          }else{
              if(_prevObj) {
                  _prevObj.css('background-color', 'white');
                  $(this).css('background-color', 'gray');
              } else {
                  $(this).css('background-color', 'gray');
              }
              _prevObj = $(this); 
            $("#selectday h2").html(date.format());
            
            $.ajax({ 
                type : "POST", 
                url : "chkDates",
                data: {"date":date.format()},
                success : function(data) {
                        $("#selectdate tbody").empty();
                        $("#selectday h3").empty();
                 if(data.length==0){
                    // 해당일의 데이터가 없을경우 
                    $("#selectday h3").append('해당일의 무대가 존재하지않습니다.');
                }else{
                }
       $.each(data,function(index,item){
                    	$(".applydates tbody").append(
                                '<tr>'+
                                '<td>'+'<input type="checkbox" name="applydate" value="'+item.sno+'_'+item.nsdt+'~'+item.nedt+'">'+
                                item.nsdt+'~'+item.nedt+
                                '</td>'+
                        '</tr>');
                    });
       $(".applydates tbody").append(
               '<tr>'+
               '<td>' + '<button type="button" class="abtn btn-default" data-target="#addcontModal"'+ 
               'onclick="addcont()">신청하기</button><br/></td>'+
               '</tr>'
       );
                     },
                error : function(request, status, error) {
                    alert("에러가 발생했습니다. 관리자에게 문의하시기 바랍니다");
                }
            });
          }  
  }})
  
});



function addcont(){
	$('.info ul').empty();
    var chkbox = document.getElementsByName("applydate");
    var chkCnt=0;
    var chks = new Array();
    var j=0;
    for(var i=0;i<chkbox.length; i++){
        if(chkbox[i].checked){
            chks[j] = chkbox[i].value.split("_")[1];
            j++
            chkCnt++;
        }
    }
    
    if(chkCnt == 0){
        alert("신청하실 시간을 체크해주세요");
        $('#addcontModal').modal('hide');
        return
    }
    
    $('#addcontModal').modal('show');
    $.each(chks,function(index,item){
    $('.info ul').append(
    		'<li>'+item+'</li>');    	
    }
    )
    
    var count = $('#count').val();
    if(count.size != 0){
    	$('#applybtn').prop("disabled",false);
    }
    
};


function applyStage(){
    var chkbox = document.getElementsByName("applydate");
    var chkCnt=0;
    var addchk = new Array();
    var j=0;
    for(var i=0;i<chkbox.length; i++){
        if(chkbox[i].checked){
            addchk[j] = chkbox[i].value.split("_")[0];
            j++;
            chkCnt++;
        }
    }

    var cont = $('#cont').val();
    var count = $('#count').val();
    console.log(count);
    $.ajax({ 
        type : "GET", 
        url : "applyStage", 
        traditional : true,
        data : {"ssno" : addchk, "cont" : cont, "count":count},
        success : function(data){
            if(data != null){
                alert("success!");
                window.location.href=window.location.href;
            }else
                alert("fail!");
        },
        error : function(request, status, error) {
            alert("에러가 발생했습니다. 관리자에게 문의하시기 바랍니다");
        }
    });

    
}




 var container = document.getElementById('map');
 var options = {
     center: new daum.maps.LatLng(${list.x}, ${list.y}),
     level: 3
};

 var map = new daum.maps.Map(container, options);
 var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(${list.x}, ${list.y}),
        map: map
 });
 marker.setDraggable(true); // 마커를 움직일수 있게 설정 false일경우 고정!
 map.relayout();
</script>


</body>
</html>
