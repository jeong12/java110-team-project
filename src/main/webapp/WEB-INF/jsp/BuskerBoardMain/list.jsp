<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>학생 관리</title>
<link rel='stylesheet' href='/css/common.css'>
<style>
table, th, td {
    border: 1px solid gray;
}
</style>
</head>
<body>



<h1>학생 목록</h1>
<p><a href='form'>추가</a></p>
<table>
<thead>
<tr>
    <th>번호</th><th>이름</th><th>이메일</th> <th>최종학교</th><th>재직여부</th>
</tr>
</thead>
<tbody>
<c:forEach  items="${list}" var="m">
<tr>
    <td>${m.bbno}</td>
    <td>${m.titl}</td>
    <td>${m.name}</td>
    <td>${m.genre}</td>
    <td>${m.city}</td>
    <td>${m.sdt}</td>
    <td>${m.edt}</td>
    <td>${m.cnt}</td>
    <td>${m.etc}</td>
    <td>${m.flag}</td>
</tr>
</c:forEach>

</tbody>
</table>



</body>
</html>

    
    
    
    
    
    
    
    
    
    
    
    
    