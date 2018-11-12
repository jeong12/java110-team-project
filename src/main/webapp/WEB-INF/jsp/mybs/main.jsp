<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<!-- 달력 -->
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script
    src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<link href="../../css/fullcalendar.min.css" rel="stylesheet">
<script src="../../js/fullcalendar.min.js" type="text/javascript"></script>
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    
 <!-- 모달 -->   
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">


    
    
    
    
<style>
#calendar {
    max-width: 600px;
    margin: 0 auto;
}
#calendar,#selectday{
    display:inline-block;
}
#logo{
    width:50px;
    height:50px;
}
#addschedule{
    float:right;
}

</style>

</head>
<body>
    <div id="titl">
        <img id="logo" src="../../img/playButton.PNG" alt="플레이로고">
        <h2>버스킹 일정</h2>
    </div>


    <div id='calendar'></div>
    <div id='selectday'>
       <h2></h2>
    </div>
    
 <!-- 스케줄등록 모달  -->
 <div id="addschedule">
<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">스케줄등록하기</button>   
</div>

    <table>
        <thead>
            <tr>
                <th>상호명</th>
                <th>지역</th>
                <th>공연시간</th>
                <th>신청인원</th>
                <th>진행상태</th>
                <th>작성일</th>
                <th>위도</th>
                <th>경도</th>
                <th>상세보기</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${plist}" var="perlist">
                <tr>
                    <td>${perlist.shopname}</td>
                    <td>${perlist.addr}</td>
                    <td>${perlist.nsdt}~ ${perlist.nedt}</td>
                    <td>${perlist.cnt}</td>
                    <td>개인스케줄</td>
                    <td>${perlist.cdt}</td>
                    <td>${perlist.x}</td>
                    <td>${perlist.y}</td>
                    <td><button>상세보기</button></td>
                </tr>
            </c:forEach>
            <c:forEach items="${list}" var="list">
                <tr>
                    <td>${list.name}</td>
                    <td>${list.addr}</td>
                    <td>${list.nsdt}~ ${list.nedt}</td>
                    <td>${list.cnt}</td>
                    <c:set var="flages" value="${list.flag}"/>
                    <c:choose>
<<<<<<< HEAD
                        <c:when test="${flages == 1 }">
                                                        진행중
=======
                        <c:when test="${!empty flages}">
                     <td>${flages}</td>
>>>>>>> my
                        </c:when>
                        <c:when test="${flages eq 2}">
                                                        완료
                        </c:when>
                    </c:choose>
                    <td>${list.cdt}</td>
                    <td>${list.x}</td>
                    <td>${list.y}</td>
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
        <form action='addperschedule' method='post' enctype="multipart/form-data">
            <table>
            <tbody>
            <tr>
                <th>장소명</th>
                <td><input type='text' name='name'></td>
            </tr>
            <tr>
                <th>시작시간</th>
                <td><input type="datetime" name='sdt' id='sdtDatepicker'></td>
            </tr>
            <tr>
                <th>종료시간</th>
                <td><input type="datetime" name='edt' id='edtDatepicker'></td>
            </tr>
            <tr>
                <th>인원</th>
                <td><input type="text" name='cnt'></td>
            </tr>
            <tr>
                <th>주소검색</th>
                <td><input type='text' name='addr'></td>
            </tr>
            <tr>
                <th></th>
                <td><button>등록</button></td>
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



<script>
    
    // 이전값을 저장해주는 변수
    var _prevObj = null;
$(function() {
    
  // 캘린더 출력해주는 코드
  $('#calendar').fullCalendar({
      dayClick: function(date, jsEvent, view, resourceObj) {
            console.log(date.format());
            alert('Date: ' + date.format());
            if(_prevObj) {
                _prevObj.css('background-color', 'white');
                $(this).css('background-color', 'gray');
            } else {
                $(this).css('background-color', 'gray');
            }
              _prevObj = $(this);
            $("#selectday h2").html(date.format());
              
          }  
  })
  
});

$(function() {
    $( "#sdtDatepicker" ).datepicker({
    });
});

$(function() {
    $( "#edtDatepicker" ).datepicker({
    });
});
</script>
</body>
</html>
