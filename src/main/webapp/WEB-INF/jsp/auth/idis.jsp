<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="en" id="top">
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
<link rel="stylesheet" href="/css/common.css"/> 
<style>
body {
margin: 0;
padding: 0;
}

#bodybody{
min-height: 850px;
margin: 0;
}

#titl {
    display: flex;
    margin: 40px 10px 10px 16%;
    padding: 10px;
}
#titl2 {
    margin-top: 12px;
    padding-bottom: 10px;
}

#logo {
    width: 50px;
    height: 50px;
    margin: 10px;
}
#titlimg {
    margin-top: 10px;
}

.findidcontent {
    position:static;
    margin-top: 200px;
    margin-left: 30%;
    margin-right: 30%;
    text-align: center;
}
#resultcoment {
    margin-bottom: 25px;
}

#titlefind {
    margin-top: 50px;
    margin-bottom: 100px;
    margin-left: 10%;
}

.send {
    margin-bottom: 250px;
}

a#movetop {
    position: fixed; right: 2%; bottom: 82px; display: none; z-index: 999;
}
    </style>
</head>
<jsp:include page="../header.jsp"></jsp:include>
<body>
<div id=bodybody>
    <div id="pos"></div>
    <div id="titl">
        <img id="logo" src="../../img/playButton.PNG" alt="플레이로고" id="titlimg">
        <h2 id="titl2">아이디 찾기</h2>
    </div>
          
          <div class="findidcontent">
               <h2 id="resultcoment">입력하신 이메일과 일치하는 아이디는 "${member.id}"입니다.</h2>
               <a href="/app/main" style="text-decoration: none;" class="more-button">
                                          메인화면으로 돌아가기</a>
               <a href="/app/auth/form" style="text-decoration: none;" class="more-button">
                                          로그인화면으로 돌아가기</a>
           </div>
<a href="#" id="movetop"><img src="../../img/topbtn.png"></a>
</div>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script src="/js/headerfixing.js"></script>
  <script src="/js/promotion/promofilter.js"></script>
  <script src='../../js/jquery.easing.1.3.js'></script>
<script>
$(document).scroll(function(){
    var pos = document.getElementById('pos'); 
    var movetop = document.getElementById('movetop');
    if($(pos).attr('value') > 50){
        movetop.style.display = 'block';
    } else{
        movetop.style.display = 'none';
    }
 });
 
 $('#movetop').click(function(){
     $('#top').animate({
          scrollTop:0
     }, 800, 'easeInQuart');
     return false;
 });
</script>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>