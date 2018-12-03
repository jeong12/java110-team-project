<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />

<style>

#logo {
    width: 50px;
    height: 50px;
}
.search{
margin-top: 15px;
margin-bottom:15px; 
}

.find{
border-radius:15px; 
}

.info{
float:right;
}
.teaminfo{
border: 1px solid silver;
}
.teaminfo td:first-child{
width:30%;
}
.teaminfo td{
padding-bottom: 10px;
}



</style>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
    <div id="titl">
        <img id="logo" src="/img/playButton.PNG" alt="플레이로고">
        <h2>버스킹 일정</h2>
    </div>
    <div class='container'>
    <div class='row'>
    <div class='col-lg-12'>
    <div class='search col-lg-8'>
    <button type="button" class="btn btn-outline-secondary" a onclick="window.location.reload()">목록</button>
    <select>
    <option>기간</option>
    <option>팀명</option>
    <option>도시</option>
    </select>
    <input type="text" class='find'placeholder="원하는 내용을 검색하세요" size="30">
    </div>
    <div class='col-lg-8'>
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
    <div class='col-lg-4 float-right'>
    <table class='teaminfo'>
    <tbody>
    <tr><td colspan="2"><img src='/upload/${busker.teamPhoto}' alt='버스커사진'></td></tr>
    <tr><td>팀명</td><td>${busker.teamname}</td></tr>
    <tr><td>주요 장르</td><td>${busker.teamgenre}</td></tr>
    <tr><td>팀 소개</td><td>${busker.teamInfo}</td></tr>
    <tr><td colspan="2" align="center"><button type="button" class="btn btn-info" value=${busker.no}>피드로 가기</button></td></tr>  
    </tbody>
    </table>
    </div>
    </div>
    </div>
    </div>
</body>

</html>
