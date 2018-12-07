<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>아이디 비밀번호 찾기</title>
<link rel="stylesheet" href="/css/common.css"/>
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>
#titl {
    margin: 40px 10px 10px 16%;
    padding: 10px;
}

#logo {
    width: 50px;
    height: 50px;
    margin: 10px;
}

.findidcontent {
    margin-top: 150px;
    position:static;
    margin-left: 30%;
    margin-right: 30%;
    margin-bottom: 200px;
}


#titlefind {
    margin-top: 50px;
    margin-bottom: 100px;
    margin-left: 10%;
}

.send  {
    margin-bottom: 250px;
}
button{
  background:#000000;
  color:#fff;
  border:none;
  position:relative;
  height:30px;
  font-size:0.9em;
  padding:4px 10px;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:#000000;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #000000;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}
    </style>
</head>
<jsp:include page="../header.jsp"></jsp:include>
<body>
          
    <div id="titl">
        <h2><img id="logo" src="../../img/playButton.PNG" alt="플레이로고">아이디 비밀번호 찾기</h2>
    </div>
          
          <div class="findidcontent">
          <form action="idis" method="get" class="contentdetail">
               <h2>아이디 찾기</h2>
               <p>회원가입시 입력한 이메일을 입력해 주세요.</p>
               <input type="email" name="email" class="email" placeholder="이메일 입력">
               <button class="send">전송</button>
          </form>

           <form action="checkemail" method="post" class="contentdetail">
               <h2>비밀번호 찾기</h2>
               <p>회원가입시 등록한 아이디와 이메일 주소를 입력하시면 해당 메일로 비밀번호와 초기화 메일이 발송됩이다.</p>
               <input type="text" name="id" placeholder="아이디 입력"><br>
               <input type="email" name="email" class="email" placeholder="이메일 입력">
               <button class="send">전송</button>
           </form>
                  
                  
           </div>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>