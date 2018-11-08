<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>사진게시물</title>
<link rel='stylesheet' href='/css/common.css'> <!-- 웹 브라우저 입장에서의 경로 -->
<style>
    #titl{ margin: 10px; padding: 10px;}
    #logo {width: 50px; height: 50px; margin: 10px;}
    h2{margin-top: -50px; margin-left: 70px; }
    table{
        width: 80%;
        border: 1px solid silver;
        margin: 10%;
        border-collapse: collapse;
    }
    th{
        height: 50px;
        border: 1px solid silver;
        background-color: azure
    }
    td{
        height: 30px;
        border: 1px solid silver;
        padding: 15px;
    }
</style>
</head>
<body>
    <div id="titl">
    <img id="logo" src="../../img/playButton.PNG" alt="플레이로고"><h2>버스킹 일정</h2>
    </div>
<table>
<thead>
<tr>
    <th>상호명</th> <th>지역</th> <th>시작시간</th> <th>종료시간</th> <th>신청인원</th> <th>진행상태</th> <th>작성일</th><th>위도</th><th>경도</th> <th>상세보기</th>
</tr>
</thead>
<tbody>

<c:forEach  items="${plist}" var="perlist">
<tr>
    <td>${perlist.shopname}</td>
    <td>${perlist.addr}</td>
    <td>${perlist.sdt}</td>
    <td>${perlist.edt}</td>
    <td>${perlist.cnt}</td>
    <td>개인스케줄</td>
    <td>${perlist.cdt}</td>
    <td>${perlist.x}</td>
    <td>${perlist.y}</td>
    <td><button>상세보기</button></td>
</tr>
</c:forEach>

</tbody>
</table>
</body>
</html>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    