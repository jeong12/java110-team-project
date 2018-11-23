`<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>버스커 리스트</title>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css"/>
<link rel='stylesheet' href='/css/common.css'> <!-- 웹 브라우저 입장에서의 경로 -->
<style>
   .media{width: 100%;height: 330px;}
    #phot{width: 320px; height: 240px;} 
    .mm{width: 800px; height:60px;}    
    .media-body{margin-top: 10px;}
    .titl{position: relative ;text-align: center; margin-bottom: 30px;}
    .pto{width: 40px; height: 40px; border-radius: 100px;position: relative; left: 9px;} 
    .nik{border: 1px solid silver;width: 60px; height: 20px; border-radius: 100px;
        text-align: center; background-color: darkgray; color: azure ;margin-bottom: auto;}
    .t{border-bottom: 1px solid silver; border-bottom: 1px solid silver; padding-top: 3px;
    padding-bottom: 42px; height: 67px;}
    .pto,.nik{margin-left: 10px;}
    .pn{ width: 100px; float: left}
    .cc{position: relative ; left: 100px; bottom: 50px; margin: -10px; width: 100px;}
    .text{position: relative; bottom:90px; left: 200px; width: 1000px; height: 60px;margin-top: 20px;}
    .box{width: 65%; margin-left: 17%}
    .container{margin-left: -15px; width: 101%;}
    .td{width: 101%}
    #c-box{border: 1px solid silver; width: 93%; height: 60px; margin-bottom: 20px; 
    margin-top: 10px; border-radius: 6px;}
    #text{border-radius: 5px; width: 92%; height: 70px; margin-bottom: 15px;}
    #btn{margin-left: 90%;margin-bottom: 10px; border-radius: 5px; width: 10%;height:30px;
    margin-left: 91%;}
    #btn2{width: 7%; height: 70px;}
    .c-t{width: 101%; margin-bottom: 30px;}
    #bp{width: 98%;}
    #te{margin-top: 50px;}
    .t-top{border: border; border-top: 1px solid silver}
    
</style>
</head>
<body>
     <div class="box">

<div class="container">
  <div class="td">
      <div class="media">
          <h1 class="titl">${buskerBoardDetail.titl}</h1>
        <a class="pull-left" href="#">
            <img class="media-object" id="phot" src=${buskerBoardDetail.phot}>
          </a>
        <div class="">
   
          <div class="t1">
              <tr><th>팀명:</th><td>${buskerBoardDetail.name}<td></tr><br>
                <tr><th>장르:</th><td>${buskerBoardDetail.genre}</td></tr><br>
                <tr><th>공연지역:</th><td>${buskerBoardDetail.city}</td></tr><br>
                <tr><th>날짜:</th><td>${buskerBoardDetail.sdt}</td>~<td>${buskerBoardDetail.edt}</td></tr><br>
                <tr><th>인원:</th><td>${buskerBoardDetail.cnt}</td></tr><br>
                <tr><th>내용:</th><td class="mm">${buskerBoardDetail.etc}</td></tr><br>
                <tr><th>플래그:</th><td>${buskerBoardDetail.flag}</td></tr><br>
            </div>
          </div>
      </div>
      <button id="btn" name="singlebutton" class="btn btn-primary btn-xs">버스커 피드</button>
   
    </div>
        </div>
     <div>
     <div class="c-t">

 <input type="text" id="text">
 
         <button id="btn2" name="singlebutton" class="btn btn-primary">클릭</button>
 

         </div>
    <div class="t-top"></div>
    <c:forEach  items="${comment}" var="com">
<div class="t">

   <div class="pn">
        <a>
            <img src=${com.phot} class="pto">
       </a>
       <p class="nik">버스커</p>
    </div>
    
    <div class="cc">
        <tr>
            <th>${com.nik}</th><br>
            <td>${com.cdt}</td>
        </tr>
    </div>
      <div class="text" style="margin-top: 20px;">
          <td>${com.cont}</td>         
    </div>   
         </div>
       </c:forEach>
        </div>  
    </div>   
</body>
</html>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    