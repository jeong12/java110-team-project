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
               <h2>아이디 찾기</h2>
               <p>회원가입시 입력한 이메일을 입력해 주세요.</p>
               <div>
               <input type="text" name="email" class="email" placeholder="이메일 입력">@
               <input type="text" name="domain" class="domain"> &nbsp;
               <select name="rel_site" class="rel_site">
                   <option value="">직접입력</option>
                   <option value="gmail.com">gmail.com</option>
                   <option value="naver.com">naver.com</option>
                   <option value="daum.net">daum.net</option>
                   <option value="nate.com">nate.com</option>
               </select>&nbsp;
               <input type="submit" value="전송" class="send">
               </div>
           </form>

          
           <form action="#" method="post" class="contentdetail">
               <h2>비밀번호 찾기</h2>
               <p>회원가입시 등록한 아이디와 이메일 주소를 입력하시면 해당 메일로 비밀번호와 초기화 메일이 발송됩이다.</p>
               <input type="text" name="name" placeholder="아이디 입력"><br>
               <input type="email" name="email" class="email" placeholder="이메일 입력">
               <input type="submit" value="전송" class="send">
           </form>
           </div>
           
</body>

</html>