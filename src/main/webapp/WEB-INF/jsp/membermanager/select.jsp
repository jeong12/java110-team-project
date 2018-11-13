<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table>
<thead>
<tr>
    <th>아이디</th><th>닉네임</th><th>이메일</th> <th>등급</th><th>가입일</th><th>메모</th>
</tr>
</thead>
<c:forEach  items="${select}" var="s">
<c:choose>
<c:when test="${s.flag eq '1'.charAt(0)}">

    <tr>
    <td>${s.id}</td>
    <td>${s.nik}</td>
    <td>${s.email}</td>
    <td>${s.flag}</td>
    <td>${s.cdt}</td>
    <td>${s.memo}</td>
    </tr>
</c:when>

<c:when test="${s.flag eq '2'.charAt(0)}">
    <tr>
    <td>${s.id}</td>
    <td>${s.nik}</td>
    <td>${s.email}</td>
    <td>${s.flag}</td>
    <td>${s.cdt}</td>
    <td>${s.memo}</td>
    </tr>
</c:when>
<c:when test="${s.flag eq '3'.charAt(0)}">
<tr>
    <td>${s.id}</td>
    <td>${s.nik}</td>
    <td>${s.email}</td>
    <td>${s.flag}</td>
    <td>${s.cdt}</td>
    <td>${s.memo}</td>  
    </tr>
</c:when>
</c:choose> 
     
 </c:forEach>
<button type='button' href="" onclick='location.href = "list"'>전체보기</button>
<button type='button' onclick='location.href = "select?flag=1"'>버스커</button>
<button type='button' onclick='location.href = "select?flag=2"'>제공자</button>
<button type='button' onclick='location.href = "select?flag=3"'>제공자</button>
</tbody>
</table>




</body>
</html>