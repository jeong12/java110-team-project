<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>

<style>
#bodybody{
min-height: 900px;
}

#titl {
    margin: 10px;
    padding: 10px;
}

#logo {
    width: 50px;
    height: 50px;
    margin: 10px;
}

#titl2 {
    margin-top: -50px;
    margin-left: 70px;
    margin-bottom: 30px;
}

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
<jsp:include page="../header.jsp"></jsp:include>
<body>
<div id=bodybody>
    <div id="titl">
        <img id="logo" src="../../img/playButton.PNG" alt="플레이로고">
        <h2 id="titl2">아이디 찾기</h2>
    </div>
          
          <div class="findidcontent">
               <h2>입력하신 이메일과 일치하는 아이디는 "${member.id}"입니다.</h2>
           </div>
</div> 
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>