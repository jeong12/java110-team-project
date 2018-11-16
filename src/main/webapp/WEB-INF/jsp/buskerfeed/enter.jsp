<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>버스커피드가기</title>
<link rel='stylesheet' href='/css/common.css'>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<style>
body{
    width:100%;
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

h2 {
	margin-top: -50px;
	margin-left: 70px;
}
#pho{
    padding: 10px;
}
#container {
	width: 60%;
	height: 1300px;;
	border: 1px solid black;
	margin: 50px 20%;
}
#content{
    padding: 5px;
    border-top: 1px solid black;
}

#teamphoto, #schedule {
	float: left
}

#buskerinformation {
	height: 250px;
}

#teamphot {
	height: 300px;
	margin: 20px;
}   

#intro {
	border: 1px solid black;
	height: 150px;
	width: 90%
}

#schedule, #phoavi, #avi {
	border: 1px solid black;
}

#phoavi {
    width: 60%;
	float: right;
	padding: 5px;
}

#schedule {
	width: 35%
}


.video {
	height: 0;
	position: relative;
	padding-bottom: 60%;
}

.video iframe {
    position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
}

img {
    width: 100%;
    height: 100%;
}
li{
    width: 33%;
    height: 180px;
    padding:5px;
}
.details {
	margin: 20px;
}

.list-unstyled{
 width:90%;
 margin:5px;
 margin-left:30px;
}

</style>

<body>
	<div id="titl">
		<img id="logo" src="../../img/playButton.PNG" alt="플레이로고">
		<h2>버스킹 피드가기</h2>
	</div>
	<div id="container">
		<div>
			<div class="row">
				<div class="col-md-5 img">
					<img
						src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Busker_Busker_from_acrofan_-_cropped.jpg/250px-Busker_Busker_from_acrofan_-_cropped.jpg"
						alt="image" id="teamphot">
				</div>
				<div class="col-md-6 details">
					<table>
						<tr>
							<th>팀명</th>
							<td>(팀명)</td>
						</tr>
						<tr>
							<th>주요장르</th>
							<td>(주요장르)</td>
						</tr>
						<tr>
							<th>주활동지역</th>
							<td>(주활동지역)</td>
						</tr>
						<tr>
							<th>인원</th>
							<td>(인원)</td>
						</tr>
					</table>
					<table>
						<tr>
							<th>소개말</th>
							<td id="intro">(소개말)</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<hr>
		<div id="content">
			<div id="schedule">
				<table>
					<tr>
						<td>스케쥴쥴 반복문</td>
					</tr>
				</table>
			</div>
			<div id="phoavi">
				<div class="row">
					<c:forEach items="${recentlist}" var="m" begin="0" end="2">
						<div class="col py-2">
							<div class="video">
								<iframe src=${m.url } frameborder="0" allowfullscreen></iframe>
							</div>
						</div>
					</c:forEach>
				</div>
				<div id=photo>
				<ul class="list-unstyled row">
				<c:forEach items="${recentplist}" var="t">
				    <li value="${t.pno }" >
                        <img src="${t.firphot}" />
                    </li>
				</c:forEach>
				</ul>
				</div>

			</div>
		</div>
	</div>

<script>
$(".list-unstyled li").click(function(){
    
    var n = $(this).val();
    console.log(n);
    
    $.ajax({ 
        type : "POST", //보내는 타입을 Post방식으로 할지,  GET방식으로 할지 결정
        url : "clikeImage", // /내 프로젝트명/XML파일의namespace/내가불러올XML의Query이름.do
        //header :'Content-Type: application/json',
        dataType: 'json',
        data: {no:n}, //파라미터 넘겨줄 부분? : 이게 할말이 많은데 원래 GET방식으로 하라했다가 
                               //다시 POST방식으로 하게됬는데 파라미터를 넘겨줄 값이 없어서 다시 GET으로 바꾸면서 주석 
        //contentType : "application/x-www-form-urlencoded; charset=utf-8",  // 기본값이라고 하니까 건들이지 않았고 
        success : function(data) {
            
            /* .append로 모달에 보내라 ~~~ */
        }
        ,
        error : function(request, status, error) {
            alert("에러가 발생했습니다. 관리자에게 문의하시기 바랍니다");
        }
    });
    
    
    
})
</script>
</body>
</html>
















