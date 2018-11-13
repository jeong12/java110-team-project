<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무대제공자 회원가입</title>
<style>
th {
	text-align: right;
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

#container {
	padding: 50px;
}

#upload1, #upload2, #upload3{
    width: 150px;
    heigh: 300px;
}
</style>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c63782df6473def89780e1d964f9d83a&libraries=services"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="/js/findAddr.js" type="text/javascript"></script>
<script src="/js/signupSupporter.js" type="text/javascript"></script>
</head>
<body>

	<div id="titl">
		<img id="logo" src="/img/playButton.PNG" alt="플레이로고">
		<h2>무대 제공자 되기</h2>
	</div>
	<div id=container>
		<form action='add' method='post' enctype="multipart/form-data">
			<h3>상호명</h3>
			<input type='text' name='name' oninput="checkName()" id="name"
				size=30><br> <span id="nameMsg"></span>
			<h3>퍼포먼스/장르(희망)</h3>
			<select name='sgnere' id='sgnere'>
				<option value="ballad" selected="selected">발라드</option>
				<option value="dance">댄스</option>
				<option value="trot">트로트</option>
				<option value="folk">포크</option>
				<option value="rock">락</option>
				<option value="jazz">재즈</option>
				<option value="country">컨츄리</option>
				<option value="rnb">알앤비</option>
				<option value="rap">랩</option>
			</select>
			<h3>주소</h3>
			<input type="text" id="postno" name="postno" placeholder="우편번호">
			<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br> 
			<input type="text" id="baseaddr" name="baseaddr" placeholder="주소" size=60><br>
			<input type="text" id="detailaddr" name="detailaddr" placeholder="상세주소" size=60 onchange="checkDetailAddr()">
			<div id="map" style="width:400px;height:400px;margin-top:10px;display:none"></div>
            <input type="text" id="x" name="x" >
            <input type="text" id="y" name="y" >
			<span id="daMsg"></span>
			<h3>수용가능인원</h3>
			<input type="number" id="capa" name="capa" size=30 onchange="checkCapa()">
			<span id="capaMsg"></span> <br>
			<h3>연락처</h3>
			<input type="tel" id="tel" name="tel" size=30 onchange="checkTel()"> <br>
			<h3>인증번호</h3>
			<input type="text" id="tel_chk" name="tel_chk" size=30><br>
			<h3>기타(희망사항)</h3>
			<input type="textarea" name="message" id="message" size=30> <br>
			<h3>사진</h3>
			<h5>해당 공연장 사진을 올려주세요</h5>
			<img id="upload1" src="/img/default_image.png" alt="기본이미지">
			<img id="upload2" src="/img/default_image.png" alt="기본이미지">
			<img id="upload3" src="/img/default_image.png" alt="기본이미지"><br>			
			<input type='file' name='file1' id='input_img1' onchange="readURL1(this);" /> 
		    <input type='file' name='file2' id='input_img2' onchange="readURL2(this);" /> 
		    <input type='file' name='file3' id='input_img3' onchange="readURL3(this);" /> 
		    <br><br>
			<button class="signupbtn" disabled="disabled">가입하기</button>
		</form>
	</div>

</body>
</html>