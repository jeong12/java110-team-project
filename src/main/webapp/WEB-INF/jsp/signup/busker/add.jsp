<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Indisker : 버스커 회원가입</title>
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

body{
background-color: snow;
}

.container {
    background-color: white;
}

#upload {
	width: 150px;
	heigh: 300px;
}
</style>
</head>
<jsp:include page="../../header.jsp"></jsp:include>
<body>
	
	<div class="title container">
<div class="row">
    <div id="titl" class='col-lg-8'>
        <img id="logo" src="../../../img/tum.png" alt="플레이로고">
        <h3>버스커 되기 >> 동영상 올리기 >> <b>신청완료</b></h3>
    </div>
    </div>
    </div>
	
	
	<div id=container>
		<h4>버스커 신청을 해주셔서 감사합니다.</h4>
		<h4>다시 로그인 하시면, 버스커로 활동 가능하십니다.</h4>
		<h4>올리신 영상에 문제가 있을 경우 활동이 제약됩니다.</h4>
	</div>
	<button type="button">홈으로 </button>
</body>
<jsp:include page="../../footer.jsp"></jsp:include>
</html>