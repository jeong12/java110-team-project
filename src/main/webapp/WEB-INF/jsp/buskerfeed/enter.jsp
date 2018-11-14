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

#container {
	width: 1000px;
	height: 1500px;
	border: 1px solid black;
	margin: 50px 20%;
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

#schedule, #phoavi, #pho, #avi {
	border: 1px solid black;
}

#phoavi {
	float: right
}

#schedule {
	width: 40%
}

#phoavi {
	width: 55%
}

.video {
	height: 0;
	position: relative;
	padding-bottom: 56.25%;
	/* Если видео 16/9, то 9/16*100 = 56.25%. Также и с 4/3 - 3/4*100 = 75% */
}

.video iframe {
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
}

.details {
	margin: 20px;
}

.box {
	float: left;
	position: relative;
	width: 33%;
	padding-bottom: 33%;
}

.boxInner img {
	width: 100%;
}

.boxInner {
	position: absolute;
	left: 10px;
	right: 10px;
	top: 10px;
	bottom: 10px;
	overflow: hidden;
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
				<div id="pho">
				<c:forEach items="${recentplist}" var="p">
					<div class="box">
						<div class="boxInner">
                            ${p.filename}
<%-- 							<img
								src="${p.filename}" /> --%>
						</div>
					</div>
					   </c:forEach>
					
				</div>
			</div>
		</div>
	</div>

</body>
</html>
















