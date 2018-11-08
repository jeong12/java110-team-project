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
<form action='add' method='post' enctype="multipart/form-data">
<table>
<tbody>
<tr>
    <th>제목</th>
    <td><input type='text' name='titl'></td>
</tr>
<tr>
    <th>장르</th>
    <td><input type='text' name='genre'></td>
</tr>
<tr>
    <th>도시</th>
    <td><input type="text" name='city'></td>
</tr>
<tr>
    <th>인원</th>
    <td><input type='number' name='cnt'></td>
</tr>
<tr>
    <th>시작일</th>
    <td><input type='text' name='sdt'></td>
</tr>
<tr>
    <th>종료일</th>
    <td><input type='text' name='edt'></td>
    </tr>
<tr>
<tr>
    <th>연락처1</th>
    <td><input type='text' name='tel1'></td>
    </tr>
<tr>
<tr>
    <th>연락처</th>
    <td><input type='text' name='tel2'></td>
    </tr>
<tr>
<tr>
    <th>홍보내용</th>
    <td><input type='text' name='etc'></td>
    </tr>
<tr>
<tr>
    <th>사진</th>
    <td><input type='text' name='phot'></td>
    </tr>
<tr>
<tr>
    <th>버스커번호</th>
    <td><input type='text' name='bno'></td>
    </tr>
<tr>
    <th></th>
    <td><button>버스커 홍보올리기</button></td>
</tr>
</tbody>
</table>
</form>
</body>
</html>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    