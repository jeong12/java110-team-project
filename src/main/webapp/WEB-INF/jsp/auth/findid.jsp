<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
    $(function(){
        $("#findBtn").click(function(){
            $.ajax({
                url : "../member/find_pw.do",
                type : "POST",
                data : {
                    id : $("#id").val(),
                    email : $("#email").val()
                },
                success : function(result) {
                    alert(result);
                },
            })
        });
    })
</script>
<style>
.findidcontent {
    position:static;
    margin-left: 30%;
    margin-right: 30%;
    margin-bottom: 250px;
}


#titlefind {
    margin-top: 50px;
    margin-bottom: 100px;
    margin-left: 10%;
}

.send  {
    margin-bottom: 250px;
}
/* 
.sendpw-modal {
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background: rgba(0, 0, 0, 0.8);
    opacity:0;
    -webkit-transition: opacity 400ms ease-in;
    -moz-transition: opacity 400ms ease-in;
    transition: opacity 400ms ease-in;
    pointer-events: none;
}
.sendpw-modal:target {
    opacity:1;
    pointer-events: auto;
}
.sendpw-modal > div {
    position: absolute;
    top: 25%;
    left: 25%;
    width: 50%;
    height: 50%;
    padding: 16px;
    border: 16px solid gray;
    background-color: white;
    overflow: auto; 
} */
    </style>
</head>
<body>
          
          <h1 id="titlefind"><i class="fas fa-arrow-alt-circle-right"></i>아이디 비밀번호 찾기</h1>
          
          <div class="findidcontent">
          <form action="idis" method="get" class="contentdetail">
               <h2>아이디 찾기</h2>
               <p>회원가입시 입력한 이메일을 입력해 주세요.</p>
               <input type="email" name="email" class="email" placeholder="이메일 입력">
               <button class="send">전송</button>
          </form>
<!-- 
    <div class="w3-content w3-container w3-margin-top">
        <div class="w3-container w3-card-4">
            <div class="w3-center w3-large w3-margin-top">
                <h3>비밀번호 찾기</h3>
            </div>
            <div>
                <p>
                    <label>ID</label>
                    <input class="w3-input" type="text" id="id" name="id" required>
                </p>
                <p>
                    <label>Email</label>
                    <input class="w3-input" type="text" id="email" name="email" required>
                </p>
                <p class="w3-center">
                    <button type="button" id=findBtn class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">find</button>
                    <button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>
                </p>
            </div>
        </div>
    </div>
          
           -->
           <form action="checkemail" method="post" class="contentdetail">
               <h2>비밀번호 찾기</h2>
               <p>회원가입시 등록한 아이디와 이메일 주소를 입력하시면 해당 메일로 비밀번호와 초기화 메일이 발송됩이다.</p>
               <input type="text" name="id" placeholder="아이디 입력"><br>
               <input type="email" name="email" class="email" placeholder="이메일 입력">
               <button class="send">전송</button>
           </form>
<!--                   <div class="sendpw-modal" id="sendpw">
                      <div>
                          <button><a href="#close">닫기</a></button>
                          <p>초기화 메일이 정상적으로 발송되었습니다.(일단 여기에 비번 표시)</p>
                      </div>
                  </div> -->
                  
                  
           </div>
</body>

</html>