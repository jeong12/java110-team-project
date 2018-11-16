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
			
			<input type="text" id="baseaddr" name="baseaddr" placeholder="주소" size=60>
            <input type="button" onclick="searchAddr()" value="주소 검색">
			<input type="text" id="detailaddr" name="detailaddr" placeholder="상세주소" size=60 onchange="checkDetailAddr()">
            <input type="hidden" id="x" name="x">
            <input type="hidden" id="y" name="y">			
			<span id="daMsg"></span>
			<div id="map" style="width:400px;height:400px;margin-top:10px;display:none"></div>
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
</html>