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
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css"/>
<style>
    #butt{position: relative;left: 960px;}
    .media{width: 1100px;height: 180px;}
    #phot{width: 200px; height: 220px;} 
    .mm{width: 800px; height:60px;}    
    .media-body{margin-top: 10px;}
</style>
 
</head>
<body>
<c:forEach  items="${list}" var="m">   
<div class="container">
  <div class="well">
      <div class="media">
        <a class="pull-left" href="#">
            <img class="media-object" id="phot" src=${m.phot}>
        </a>
        <div class="media-body">
        
     
        
    <h4 class="media-heading">${m.titl}</h4>
          <div class="t1"> 
<tr><th>팀명:</th><td>${m.name}<td></tr><br>
<tr><th>장르:</th><td>${m.genre}</td></tr><br>
<tr><th>공연지역:</th><td>${m.city}</td></tr><br>
<tr><th>날짜:</th><td>${m.sdt}</td><td>${m.edt}</td></tr><br>
<tr><th>인원:</th><td>${m.cnt}</td></tr><br>
<tr><th>내용:</th><td class="mm">${m.etc}</td></tr>
<tr><th>인원:</th><td>${m.flag}</td></tr><br>


     
    </div>
   
  </div>
   
</div>
 <button type="button" class="btn btn-info btn-xs" id="butt">버스커 피드</button>
    <button type="button" class="btn btn-info btn-xs" id="butt">상세 보기</button>
    </div>
    </div>
    </c:forEach>
    </body>





<tbody>



    </body>
</tbody>
</table>



</body>
</html>

    
    
    
    
    
    
    
    
    
    
    
    
    