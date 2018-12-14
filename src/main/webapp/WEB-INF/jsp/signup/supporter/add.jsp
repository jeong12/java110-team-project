<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Indisker : 무대제공자 회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="/js/signupBusker.js" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="/../css/common.css" rel="stylesheet">
<style>
th {
    text-align: right;
}

#logo{
width: 40px; 
height:40px; 
float: left; 
margin-top: -4px;
margin-right: 0.5rem;
}

#titl{
margin-top: 5%;
margin-bottom: 3%;
/* margin-left: 11%; */
}

#titl h3{
float: left; 
margin-top: 1px;
font-size: 24px;
}

.container {
    background-color: white;
}

.message{
    margin: 0 auto;
    text-align: center;
}
.btns{
background-color: #3F51D1;
    border-radius: 12px;
}
.main{height: 33rem;
}
body{background-image: url("https://s3.amazonaws.com/ooomf-com-files/8H0UdTsvRFqe03hZkNJr_New%20York%20-%20On%20the%20rock%20-%20Empire%20State%20Building.jpg");
opacity: 0.8;}
.abcdefg{margin-top: 13%;}
#btttttn{width: 7rem; margin-top: 5%;}

</style>
</head>
<jsp:include page="../../header.jsp"></jsp:include>
<body>
    <div class="title container">
<div class="row">
    <div id="titl" class='col-lg-8'>
        <img id="logo" src="../../../img/playButton.PNG" alt="플레이로고">
        <h3>신청완료</h3>
    </div>
    </div>
    </div>

    <div class='main container'>
    <div class="row">
    <div class='col-lg-12 text-center'>
                    
   <div class="abcdefg">
   <h2>제공자 신청을 해주셔서 감사합니다.</h2>
   <h2>올리신 사진 확인 후 제공자로 활동이 가능하십니다.</h2>
   <h2>승인까지 최대 24시간이 소요될 수 있습니다.</h2>
    <a href='../../main' class="btns btns btns-outline-light">홈으로</a>
     </div>
    </div>
    </div>
    </div>
</body>
<jsp:include page="../../footer.jsp"></jsp:include>
</html>