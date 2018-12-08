<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Indisker : 무대제공자 회원가입</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"/>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c63782df6473def89780e1d964f9d83a&libraries=services"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="/js/signupSupporter.js" type="text/javascript"></script>
<style>
<style>
th {
    text-align: right;
}

.title{
margin-left: 15rem;
margin-right: 15rem;
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
margin-left: 8.3rem;
}

#titl h3{
float: left; 
margin-top: -5px;
font-size: 24px;
}

body{
background-color: snow;
}

.container {
    background-color: white;
    margin-left: 15rem;
    margin-right: 15rem;
}

.join_form {
    border: 1px solid silver;
    border-radius: 10px;
    margin: 0px auto;
    margin-bottom: 10%;
}
label {
    margin-bottom: 0px;
    font-family: "Open Sans", Helvetica, sans-serif;
    font-size: 14px;
    font-weight: 900;
}

span{
font-family: "Open Sans", Helvetica, sans-serif;
    font-size: 12px;
}

form {
    margin: 0px auto;
    padding: 8% 10%;
}

input {
    font-family: "Open Sans", Helvetica, sans-serif;
    font-size: 11px; border : none;
    border-bottom: 2px solid #ebebeb;
    position: relative;
    width: 80%;
    border: none; border-bottom : 2px solid #ebebeb; position : relative;
    width : 80%;
}

input:focus {
    outline: none;
    border-bottom-color: #3CC !important;
}

input:hover {
    border-bottom-color: #3CC;
}

input:invalid {
    box-shadow: none;
}

#input_img {
    padding-top: 20px;
}

.signupbtn:disabled {
    float: right;
    cursor: not-allowed;
    background-color: #aaaaaa;
    border-radius: 12px;
}

.signupbtn {
    float: right;
    background-color: #1FBC02;
    border-radius: 12px;
}

select {
    width: 80%;
     font-family: "Open Sans", Helvetica, sans-serif;
    font-size: 13px;
    border: 1px solid silver;
    border-radius: 3px;
    margin-bottom: 6%;
}

#upload1, #upload2, #upload3{
    width: 100%;
    height: 100%;
    display: block;
    margin-bottom: 5%;
    
}
</style>
</head>
<jsp:include page="../../header.jsp"></jsp:include>
<body>

<div class="title container">
<div class="row">
    <div id="titl" class='col-lg-12'>
        <img id="logo" src="../../../img/playButton.png" alt="플레이로고">
        <h3>무대제공자 되기</h3>
    </div>
    </div>
    </div>
    
	<div class=container>
	 <div class="row">
        <div class='col-lg-12'>
            <div class="join_form col-lg-8">
		<form action='add' method='post' enctype="multipart/form-data">
			<label for="name">상호명</label><br>
			<input type='text' name='name' oninput="checkName()" id="name" size=30 autocomplete="off"><br> 
			<span id="nameMsg"></span><br>
			<label for="sgenre">퍼포먼스/장르(희망)</label><br>
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
			</select><br>
			<label for="baseaddr">주소</label><br>
			<input type="text" id="baseaddr" name="baseaddr" placeholder="주소" size=60 autocomplete="off">
            <input type="button" onclick="searchAddr()" value="주소 검색">
			<input type="text" id="detailaddr" name="detailaddr" placeholder="상세주소" size=60 onchange="checkDetailAddr()" autocomplete="off">
            <input type="hidden" id="x" name="x" autocomplete="off">
            <input type="hidden" id="y" name="y" autocomplete="off"><br>			
			<span id="daMsg"></span><br>
			<div id="map" style="width:400px;height:400px;margin-top:10px;display:none"></div>
			<label for="capa">수용가능인원</label><br>
			<input type="number" id="capa" name="capa" size=30 onchange="checkCapa()" autocomplete="off">
			<span id="capaMsg"></span><br>
			<label for="tel">연락처</label><br>
			<input type="tel" id="tel" name="tel" size=30 onchange="checkTel()" autocomplete="off"> <br>
			<label for="message">기타(희망사항)</label><br>
			<input type="textarea" name="message" id="message" size=30 autocomplete="off"> <br>
			<label>사진</label>
			<label>해당 공연장 사진을 올려주세요</label><br>
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
	</div>
	</div>
	</div>
	
	<script>
     var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = {
        center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    }; 

//지도를 미리 생성
var map = new daum.maps.Map(mapContainer, mapOption);
//주소-좌표 변환 객체를 생성
var geocoder = new daum.maps.services.Geocoder();
//마커를 미리 생성
var marker = new daum.maps.Marker({
    position: new daum.maps.LatLng(37.537187, 127.005476),
    map: map
}); 


function searchAddr(){
    new daum.Postcode({
        oncomplete: function(data) {
            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = data.address; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 기본 주소가 도로명 타입일때 조합한다.
            if(data.addressType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 주소 정보를 해당 필드에 넣는다.
            document.getElementById("baseaddr").value = fullAddr;
            // 주소로 상세 정보를 검색
            geocoder.addressSearch(data.address, function(results, status) {
                // 정상적으로 검색이 완료됐으면
                if (status === daum.maps.services.Status.OK) {

                    var result = results[0]; //첫번째 결과의 값을 활용

                    // 해당 주소에 대한 좌표를 받아서
                    var coords = new daum.maps.LatLng(result.y, result.x);
                    // 지도를 보여준다.
                    mapContainer.style.display = "none";
                    map.relayout();
                    // 지도 중심을 변경한다.
                    map.setCenter(coords);
                    // 마커를 결과값으로 받은 위치로 옮긴다.
                    marker.setPosition(coords)
                    
                    var gps = marker.getPosition();
                    var x = gps.getLat();
                    var y = gps.getLng();
                    
                    
                    document.getElementById("x").value = x;
                    document.getElementById("y").value = y;
                }
            });
        }
    }).open();
}
	</script>

</body>
<jsp:include page="../../footer.jsp"></jsp:include>
</html>