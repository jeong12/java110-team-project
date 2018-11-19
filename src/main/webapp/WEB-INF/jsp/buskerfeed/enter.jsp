<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>버스커피드</title>
<link rel='stylesheet' href='/css/common.css'>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- 모달 -->
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

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
	border: 1px solid black;
	margin: 50px 20%;
	padding: 5px;
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
    height: 150px;
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
		<h2>버스커피드</h2>
	</div>
	<div id="container">
		<div>
			<div class="row">
				<div class="col-md-5 img">
					<img
						src="${busk.teamPhoto }"
						alt="image" id="teamphot">
				</div>
				<div class="col-md-6 details">
					<table>
						<tr>
							<th>팀명</th>
							<td>${busk.teamname }</td>
						</tr>
						<tr>
							<th>주요장르</th>
							<td>${busk.teamgenre }</td>
						</tr>
						<tr>
							<th>주활동지역</th>
							<td>${busk.city }</td>
						</tr>
						<tr>
							<th>인원</th>
							<td>(인원) 어케할까연?</td>
						</tr>
					</table>
					<table>
						<tr>
							<th>소개말</th>
							<td id="intro">${busk.teamInfo }</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<hr>
		<div id="content">
			<div id="schedule">
				<table>
				    <c:forEach items="${schelist}" var="sche">
<%-- 				    <c:if test="">
				    
				    </c:if> --%>
					<tr>
					   <td>${sche.nsdt }~${sche.nedt }</td>
					   <td>${sche.shopname }</td>
					   <td>${sche.addr }</td>
					</tr>
					</c:forEach>
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
				    <p><a href="http://www.naver.com">동영상더보기</a></p>
				</div>
				<div id=photo>
				<ul class="list-unstyled row">
				<c:forEach items="${recentplist}" var="t">
				    <li data-toggle="modal" data-target="#findByImageModal" value="${t.pno }" >
                        <img src="${t.firphot}" />
                    </li>
				</c:forEach>
				</ul>
				</div>

			</div>
		</div>
	</div>
	
	
    <!-- 모달 id -->
    <div id="findByImageModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- 모달 내부 설정 -->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">개인스케줄 올리기</h4>
                </div>
                <div class="modal-body">
                    <form action='add' method='post'
                        enctype="multipart/form-data">
                        <table>
                            <tbody>
                                <tr>
                                    <th>장소명</th>
                                    <td><input type='text' name='shopname'></td>
                                </tr>
                                <tr>
                                    <th>스케줄일정</th>
                                    <td><input type="text" name='nsdt' id='datetimepicker'>~<input type="text" name='nedt' id='datetimepicker2'></td>
                                </tr>
                                <tr>
                                    <th>인원</th>
                                    <td><input type="text" name='cnt'></td>
                                </tr>
                                <tr>
                                    <th>주소검색</th>
                                    <td>
                                       <input type="text" id="addr" name="addr" placeholder="주소">
                                       <input type="button" onclick="search_addr()" value="주소 검색"><br>
                                       <div id="map" style="width:400px;height:400px;margin-top:10px;display:none"></div>
                                       <input type="text" id="x" name="x" style="display:none">
                                       <input type="text" id="y" name="y" style="display:none">
                                    </td>
                                </tr>
                                <tr>
                                    <th></th>
                                    <td><button class="btn btn-default">등록</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>
	

<script>
/* $(".list-unstyled li").click(function(){
    
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
    
    
    
}) */
</script>
</body>
</html>
















