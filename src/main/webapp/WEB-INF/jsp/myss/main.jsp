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
<link href="/css/fullcalendar.min.css" rel="stylesheet">
<script src="/js/fullcalendar.min.js" type="text/javascript"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- 달력기간조회 -->
<link rel="stylesheet" type="text/css"
	href="/../css/jquery.datetimepicker.css">
<script src="/js/time/jquery.datetimepicker.full.min.js"></script>

<!-- 모달 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

<style>
#calendar {
	max-width: 600px;
	margin: 0 auto;
}

#calendar, #selectday, #selectdate {
	display: inline-block;
}

#logo {
	width: 50px;
	height: 50px;
}

#addschedule {
	float: right;
}

.flagdata td {
	width: 300px;
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
		<h2>무대관리</h2>
	</div>


	<div id='calendar'></div>
	<div id='selectday'>
		<h2></h2>
		<table id="insertDate">
			<thead>
				<tr>
					<td colspan="3"></td>
				</tr>
				<tr>
					<td><select id="starthour" name="sdt">
							<c:forEach var="i" begin="00" end="23" step="01">
								<option value="${i}:00">${i}:00</option>
							</c:forEach>
					</select></td>
					<td><select id="endhour" name="edt">
							<c:forEach var="i" begin="01" end="24">
								<option value="${i}:00">${i}:00</option>
							</c:forEach>
					</select></td>
					<td><button id="addbtn" onclick="chkHour()">등록</button></td>
				</tr>
			</thead>
			<tbody>

			</tbody>
		</table>

		<script>
        function chkHour(){
            var start = $("#starthour option:selected").val();
            var end = $("#endhour option:selected").val();
            var sdate = Number(start.split(':')[0]);
            var edate = Number(end.split(':')[0]);
            
            if(edate-sdate<=0){
                alert("시간에 맞게 다시 선택해주세요");
                return;
            }else if(edate-sdate == 1){
                $('#insertDate tbody').append(
                '<tr><td>'+start+"~"+end+'</td></tr>')
            }else{
                console.log("고민해봅시당! 시간을 하나씩 나누기, ajax으로 들어간 시간인지 확인하기");
            }
            
        }
        </script>

	</div>
	<!-- 필터 -->
	<div class="flagsearch">
		<button value="1">전체</button>
		<button value="2">진행</button>
		<button value="3">완료</button>
	</div>

	<table class="flagdata">
		<thead>
			<tr>
				<th>팀명</th>
				<th>장르</th>
				<th>신청시간</th>
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
					<td>${list.genre}</td>
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
					<form action='add' method='post' enctype="multipart/form-data">
						<table>
							<tbody>
								<tr>
									<th>장소명</th>
									<td><input type='text' name='shopname'></td>
								</tr>
								<tr>
									<th>스케줄일정</th>
									<td><input type="text" name='nsdt' id='datetimepicker'>~<input
										type="text" name='nedt' id='datetimepicker2'></td>
								</tr>
								<tr>
									<th>인원</th>
									<td><input type="text" name='cnt'></td>
								</tr>
								<tr>
									<th>주소검색</th>
									<td><input type="text" id="addr" name="addr"
										placeholder="주소"> <input type="button"
										onclick="search_addr()" value="주소 검색"><br>
										<div id="map"
											style="width: 400px; height: 400px; margin-top: 10px; display: none"></div>
										<input type="text" id="x" name="x" style="display: none">
										<input type="text" id="y" name="y" style="display: none">
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
