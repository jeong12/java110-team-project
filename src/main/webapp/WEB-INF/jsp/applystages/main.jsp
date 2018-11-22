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
margin: auto;
}
img{
width: 25%; height:10%;
margin: auto;
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
<script src="/js/applystages.js" type="text/javascript"></script>
</body>
</html>
