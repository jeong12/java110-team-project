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
   th {
    text-align: right;
}
   #titl{ margin: 10px; padding: 10px;}
   #logo {width: 50px; height: 50px; margin: 10px;}
   h2{margin-top: -50px; margin-left: 70px; }
table{
    border-collapse: separate;
    border-spacing: 10px 20px;
}  

</style>
</head>
<body>

<table>
<tbody>

<%-- <c:forEach  items="${buskerBoardDetail}" var="m"> --%>
<tr>
    <td>${buskerBoardDetail.bbno}</td>
    <td>${buskerBoardDetail.titl}</td>
    <td>${buskerBoardDetail.name}</td>
    <td>${buskerBoardDetail.genre}</td>
    <td>${buskerBoardDetail.city}</td>
    <td>${buskerBoardDetail.sdt}</td>
    <td>${buskerBoardDetail.edt}</td>
    <td>${buskerBoardDetail.cnt}</td>
    <td>${buskerBoardDetail.etc}</td>
    <td>${buskerBoardDetail.flag}</td> 
</tr>
<%-- </c:forEach> --%>

</tbody>
</table>

</body>
</html>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    