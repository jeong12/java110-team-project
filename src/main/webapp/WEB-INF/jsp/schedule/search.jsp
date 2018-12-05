<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link href="/../css/common.css" rel="stylesheet">
<style>

#logo {
	width: 50px;
	height: 50px;
}
.search{
margin-top: 15px;
margin-bottom:15px; 
}
</style>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<jsp:include page="../header.jsp"></jsp:include>
</head>
<body>
	<div id="titl">
		<img id="logo" src="/img/playButton.PNG" alt="플레이로고">
		<h2>버스킹 일정</h2>
	</div>
    <div class='container'>
    <div class='row'>
    <div class='col-lg-12'>
    <div class='search col-lg-10'>
    <button type="button" class="btn btn-outline-secondary" a onclick="window.location.reload()">목록</button><br>
    <form action="search">
    <select name="type">
    <option value="date" selected>기간</option>
    <option value="team">팀명</option>
    <option value="city">도시</option>
    </select>
    <input type="date" name="date"> 
    <input type="text" name="keyword"><button type="submit">검색하기</button>
    </form>
    </div>
    <div class='col-lg-12'>
	<table class="table table-hover">
	<thead class='thead-dark'>
	<tr>
	   <th scope="col">날짜</th>
	   <th scope="col">시간</th>
	   <th scope="col">팀명</th>
	   <th scope="col">장소</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach items="${list}" var="m">
	<tr>
	   <th scope="row">${m.ncdt}</th>
	   <td>${m.nsdt} ~ ${m.nedt}</td>
	   <td onClick="location.href='detail?no=${m.sno}'">${m.busker.teamname}</td>
	   <td>${m.addr}</td>
	   </tr>
	</c:forEach>
	</tbody>
	</table>
	</div>
	</div>
	</div>
	</div>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>
