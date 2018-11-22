<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>버스커 리스트</title>
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
    <img id="logo" src="../../img/playButton.PNG" alt="플레이로고"><h2>버스킹 목록</h2>
    </div>
<table>
<thead>
<tr>
    <th>팀명</th> <th>사진</th>
</tr>
</thead>
<tbody>

<c:forEach  items="${list}" var="m">
<tr>
    <td>${m.teamName}</td>
    <td>${m.phot}</td>
</tr>
</c:forEach>

</tbody>
</table>
</body>
</html>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    