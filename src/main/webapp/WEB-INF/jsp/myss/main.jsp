<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />

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
position: relative;
}

#showsuggests{
clear:both;
}

#suggests{
border-spacing:20px;
text-align:center;
}

.insertDate{
float:left;
padding:30px;
margin: 15px;
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

.tabs{
list-style:none;
}

.tabs li{
display: inline-block;
cursor:pointer;
}

.tab-content{
display: none;
}

.tab-content.current{
display:inherit;
}
</style>

</head>
<body>
	<div id="titl">
		<img id="logo" src="/img/playButton.PNG" alt="플레이로고">
		<h2>무대관리</h2>
	</div>

	<div id='calendar'></div>
	<div id='selectday'>
		<table class='insertDate'>
			<thead>
				<tr><td colspan="4" id='showDate'><h2></h2></td></tr>
				<tr>
					<td id="showtype"><h4></h4></td>
					<td><button onclick="add()">등록</button></td>
					<td><button onclick="remove()">삭제</button></td>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
	
	<!-- 필터 -->
    <div id='showsuggests'>
       <ul class='tabs'>
       <li class='tab-link current' data-tab='tab1'>전체</li>
       <li class='tab-link' data-tab='tab2'>신청</li>
       <li class='tab-link' data-tab='tab3'>완료</li>
       </ul>
    	
	
	<div id="tab1" class="tab-content current">
	<table class="suggests">
    <thead>
       <tr>
        <th>팀명</th>
        <th>장르</th>
        <th>신청기간</th>
        <th>신청인원</th>
        <th>진행상태</th>
        <th>작성일</th>
        <th>상세보기</th>
        </tr>
    </thead>
    <tbody>
	  <c:forEach items="${list}" var="list">
		<tr>
		 <td>${list.busker.teamname}</td>
		 <td>${list.busker.teamgenre}</td> 
		 <td>${list.nsdt} ~ ${list.nedt}</td>
		 <td>${list.cnt}명</td>
		 <td><c:choose>
			   <c:when test="${list.flag eq '1'.charAt(0) }">신청중 </c:when>
			   <c:when test="${list.flag eq '2'.charAt(0) }">완료 </c:when>
			   <c:when test="${list.flag eq '3'.charAt(0) }">기한만료 </c:when>
			 </c:choose></td>
		 <td>${list.ncdt}</td>
		 <td><button type="button" class="dbtn btn-default" data-target="#detailModal" 
		      data-toggle="modal" value="${list.sno}" onclick="chk(this)" >상세보기</button><br/></td>
		</tr>
	  </c:forEach>
	   </tbody>
    </table>
	 </div>
	 
	  <div id="tab2" class="tab-content">
	  <table class="suggests">
    <thead>
       <tr>
        <th>팀명</th>
        <th>장르</th>
        <th>신청기간</th>
        <th>신청인원</th>
        <th>진행상태</th>
        <th>작성일</th>
        <th>상세보기</th>
        </tr>
    </thead>
    <tbody>
      <c:forEach items="${flist}" var="list">
        <tr>
         <td>${list.busker.teamname}</td>
         <td>${list.busker.teamgenre}</td> 
         <td>${list.nsdt} ~ ${list.nedt}</td>
         <td>${list.cnt}명</td>
         <td>신청중</td>
         <td>${list.ncdt}</td>
         <td><button type="button" class="dbtn btn-default" data-target="#detailModal" 
              data-toggle="modal" value="${list.sno}" onclick="chk(this)" >상세보기</button><br/></td>
         </tr>
      </c:forEach>
      </tbody>
      </table>
     </div>
	 
	  <div id="tab3" class="tab-content">
	  <table class="suggests">
    <thead>
       <tr>
        <th>팀명</th>
        <th>장르</th>
        <th>신청기간</th>
        <th>신청인원</th>
        <th>진행상태</th>
        <th>작성일</th>
        <th>상세보기</th>
        </tr>
    </thead>
    <tbody>
      <c:forEach items="${slist}" var="list">
        <tr>
         <td>${list.busker.teamname}</td>
         <td>${list.busker.teamgenre}</td> 
         <td>${list.nsdt} ~ ${list.nedt}</td>
         <td>${list.cnt}명</td>
         <td>완료</td>
         <td>${list.ncdt}</td>
         <td><button type="button" class="dbtn btn-default" data-target="#detailModal" 
              data-toggle="modal" value="${list.sno}" onclick="chk(this)" >상세보기</button><br/></td>
         </tr>
      </c:forEach>
     </tbody>
    </table>
     </div>
     
     
</div>	
	
	<!-- 상세보기 모달 -->	
<div class="modal fade" id="detailModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
        <!-- header title -->
        <h4 class="modal-title">신청내역 상세보기</h4>
      </div>
      <!-- body -->
      <div class="modal-body">
      <div class="info">
      </div>
      <div class="dates">
      </div>      
      <div class="abtn">
      </div>
      </table>
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

<!-- function -->
<script src="/js/myss.js" type="text/javascript"></script>

</body>
</html>
