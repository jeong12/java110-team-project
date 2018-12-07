<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="/css/common.css"/> 
<style>

body {
margin: 0;
padding: 0;
}

#bodybody{
min-height: 1000px;
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

.findidcontent {
    position:static;
    margin-top: 200px;
    margin-left: 30%;
    margin-right: 30%;
    text-align: center;
}


#titlefind {
    margin-top: 50px;
    margin-bottom: 100px;
    margin-left: 10%;
}

.send {
    margin-bottom: 250px;
}
    </style>
</head>
<jsp:include page="../header.jsp"></jsp:include>
<body>
<div id=bodybody>
    <div id="titl">
        <img id="logo" src="../../img/playButton.PNG" alt="플레이로고" id="titlimg">
        <h2 id="titl2">비밀번호 찾기</h2>
    </div>
          <div class="findidcontent">
               <h2>${check}</h2>
               <h2>${update}</h2>
               <a href="/app/main" style="text-decoration: none;" class="more-button">
                                          메인화면으로 돌아가기</a>
               <a href="/app/auth/form" style="text-decoration: none;" class="more-button">
                                          로그인화면으로 돌아가기</a>
          </div>
</div>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>