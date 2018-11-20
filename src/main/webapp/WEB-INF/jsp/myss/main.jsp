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
position: relative;
left:50px;
top:-80px;
}

#showsuggests{
display: inline-block;
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
       <div class='chkFlag'>
	   <button value="0" >전체</button>
	   <button value="1" >진행</button>
	   <button value="2" >완료</button>
	   </div>
    	
	<table id="suggests">
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
		 <td>${list.supporter.sgnere}</td> 
		 <td>${list.nsdt}~${list.nedt}</td>
		 <td>${list.cnt}</td>
		 <td><c:choose>
			   <c:when test="${list.flag eq '1'.charAt(0) }">진행중 </c:when>
			   <c:when test="${list.flag eq '2'.charAt(0) }">완료 </c:when>
			 </c:choose></td>
		 <td>${list.cdt}</td>
		 <td><button>상세보기</button></td>
		</tr>
	  </c:forEach>
	</tbody>
	</table>
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

<!-- function -->
<script src="/js/myss.js" type="text/javascript"></script>
</body>
</html>
