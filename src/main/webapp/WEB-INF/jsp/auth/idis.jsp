<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
<style>
.findidcontent {
    position:static;
    margin-left: 30%;
    margin-right: 30%;
    
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
<body>
          
          <h1 id="titlefind"><i class="fas fa-arrow-alt-circle-right"></i>아이디 비밀번호 찾기</h1>
          
          <div class="findidcontent">
          <form action="#" method="post" class="contentdetail">
               <h2>입력하신 이메일과 일치하는 아이디입니다.</h2>
               <p>${member.id}</p>

           </form>


           </div>
           
</body>

</html>