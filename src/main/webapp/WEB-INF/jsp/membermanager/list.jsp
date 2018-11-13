<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>
</head>
<body>

<table>
<thead>
<tr>
    <th>아이디</th><th>닉네임</th><th>이메일</th> <th>등급</th><th>가입일</th><th>메모</th>
</tr>
</thead>
<tbody>
<c:forEach  items="${list}" var="m">
<tr>
    <td>${m.id}</td>
    <td>${m.nik}</td>
    <td>${m.email}</td>
    <td>${m.flag}</td>
    <td>${m.cdt}</td>
    <td>${m.memo}</td>
</tr>
</c:forEach>
<button type='button' href="" onclick='location.href = "list"'>전체보기</button>
<button type='button' onclick='location.href = "select?flag=1"'>버스커</button>
<button type='button' onclick='location.href = "select?flag=2"'>제공자</button>
<button type='button' onclick='location.href = "select?flag=3"'>제공자</button>
<script>
function list(){
    location.href = "list"
}

</body>
</html>