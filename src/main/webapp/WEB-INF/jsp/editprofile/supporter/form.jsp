<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    h3{
        display: inline-block;
        width: 180px;
    }
    
    #imgfile{
        float: right;
        margin-right: 70px;
    }
    #imgfile img{
        width: 150px;
        height: 150px;
    }
    #detailaddr{
        margin-left: 186px;
    }
</style>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=15e2302756c9e7098ec0d79f7b4d53f4&libraries=services"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>
<body>

    <div id="titl">
        <img id="logo" src="/img/playButton.PNG" alt="플레이로고">
        <h2>제공자 정보수정</h2>
    </div>
    <div id=container>
        <form action='editS' method='post' enctype="multipart/form-data">
            <h3>상호명</h3>
            <input type='text' name='name' oninput="checkName()" id="name"
                size=30><br> <span id="nameMsg"></span><br>
                <div id="imgfile">
            <table>
                <tr>
                    <td><img id="upload1" src="/upload/${sPhoto1}" alt="기본이미지">
                    <input type='file' name='file1' id='input_img1' onchange="readURL1(this);"> </td>
                </tr>
                <tr>
                    <td><img id="upload2" src="/upload/${sPhoto2}" alt="기본이미지">
                    <input type='file' name='file2' id='input_img2' onchange="readURL2(this);"> </td>
                </tr>
                <tr>
                    <td><img id="upload3" src="/upload/${sPhoto3}" alt="기본이미지">
                    <input type='file' name='file3' id='input_img3' onchange="readURL3(this);"></td>
                </tr>
            </table>
            </div>
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
            </select><br>
            <h3>주소</h3>
            <input type="text" id="baseaddr" name="baseaddr" placeholder="주소" size=60>
            <input type="button" onclick="searchAddr()" value="주소 검색"><br>
            <input type="text" id="detailaddr" name="detailaddr" placeholder="상세주소" size=60 onchange="checkDetailAddr()">
            <input type="hidden" id="x" name="x">
            <input type="hidden" id="y" name="y">
            <span id="daMsg"></span>
            <div id="map" style="width:400px;height:400px;margin-top:10px;display:none"></div><br>
            <h3>수용가능인원</h3>
            <input type="number" id="capa" name="capa" size=30 onchange="checkCapa()">
            <span id="capaMsg"></span> <br>
            <h3>연락처</h3>
            <input type="tel" id="tel" name="tel" size=30 onchange="checkTel()"> <br>
            <h3>기타(희망사항)</h3>
            <textarea name="message" id="message" rows="4" cols="32"></textarea> <br>
            
            <br><br>
            <button class="signupbtn" disabled="disabled">수정완료</button>
        </form>
    </div>

<script>
    var chkName=0;
var chkDetAddr=0;
var chkCapa=0;
var chkTel=0;
var chkFile1=0;
var chkFile2=0;
var chkFile3=0;

function checkName(){
    var names=$('#name').val(); 
    $.ajax({
        data : {
            name : names
        },
        url : "checkName",
        success : function(data) {
            if(names.length<=0 && data=='0') {
                $(".signupbtn").prop("disabled", true);
                $(".signupbtn").css("background-color", "#aaaaaa");
                $("#name").css("background-color", "#FFCECE");
                $("#nameMsg").html("상호명을 입력해주세요.")
                chkName = 0;
            } else if (data == '0') {
                $("#name").css("background-color", "#B0F6AC");
                $("#nameMsg").html("사용 가능한 상호명입니다.")
                chkName = 1;
                if(chkName==1 && chkDetAddr ==1&& chkCapa ==1  && chkTel ==1 && chkFile1==1 && chkFile2==1 && chkFile3==1) {
                    $(".signupbtn").prop("disabled", false);
                    $(".signupbtn").css("background-color", "#4CAF50");
                } 
            } else if (data >= '1') {
                $(".signupbtn").prop("disabled", true);
                $(".signupbtn").css("background-color", "#aaaaaa");
                $("#name").css("background-color", "#FFCECE");
                $("#nameMsg").html("이미 존재하는 상호명입니다.")
                chkName = 0;
            } 
        }
    });
}

function checkDetailAddr(){ 
    var baddr=$('#baseaddr').val();
    var detaddr=$('#detailaddr').val();
    if(detaddr.length<=0 || baddr.length<=0) {
        $(".signupbtn").prop("disabled", true);
        $(".signupbtn").css("background-color", "#aaaaaa");
        $("#detailaddr").css("background-color", "#FFCECE");
        $("#daMsg").html("주소를 입력해주세요.")
        chkDetAddr = 0;
    }else if (detaddr.length>0 && baddr.length>0) {
        $("#detailaddr").css("background-color", "#B0F6AC");
        chkDetAddr = 1;
        if(chkName==1 && chkDetAddr ==1 && chkCapa ==1  && chkTel ==1 && chkFile1==1 && chkFile2==1 && chkFile3==1) {
            $(".signupbtn").prop("disabled", false);
            $(".signupbtn").css("background-color", "#4CAF50");

        }
    }
};

function checkCapa(){  
    var capacity=$('#capa').val();
    if(capacity.length<=0) {
        $(".signupbtn").prop("disabled", true);
        $(".signupbtn").css("background-color", "#aaaaaa");
        $("#capa").css("background-color", "#FFCECE");
        $("#capaMsg").html("수용인원을 입력해주세요.")
        chkCapa = 0;
    } else if (capacity.length>0) {
        $("#capa").css("background-color", "#B0F6AC");
        chkCapa = 1;

        if(chkName==1 && chkDetAddr ==1 && chkCapa ==1  && chkTel ==1 && chkFile1==1 && chkFile2==1 && chkFile3==1) {
            $(".signupbtn").prop("disabled", false);
            $(".signupbtn").css("background-color", "#4CAF50");
        }
    }
};

function checkTel(){
    var tele=$('#tel').val();
    if(tele.length<=0) {
        $(".signupbtn").prop("disabled", true);
        $(".signupbtn").css("background-color", "#aaaaaa");
        $("#tel").css("background-color", "#FFCECE");
        $("#capaMsg").html("수용인원을 입력해주세요.")
        chkTel = 0;
    } else if (tele.length>0) {
        $("#tel").css("background-color", "#B0F6AC");
        chkTel = 1;

        if(chkName==1 && chkDetAddr ==1 && chkCapa ==1  && chkTel ==1 && chkFile1==1 && chkFile2==1 && chkFile3==1) {
            $(".signupbtn").prop("disabled", false);
            $(".signupbtn").css("background-color", "#4CAF50");
        }
    } 
};


function readURL1(input) { 
    var chkImg = document.getElementById('input_img1').value
    chkImg=chkImg.slice(chkImg.indexOf(".")+1).toLowerCase();
    if(chkImg !="jpg" && chkImg !="jpeg" && 
            chkImg !="gif" && chkImg !="png" && chkImg !="bmp"){
        chkFile1=0;
        $(".signupbtn").prop("disabled", true);
        alert("이미지 파일만 올려주세요");
        $('#upload1').attr('src', "/img/default_image.png");}
    else if (input.files && input.files[0]){ 
        var reader = new FileReader(); 
        reader.onload = function (e) { 
            $('#upload1').attr('src', e.target.result); } 
        reader.readAsDataURL(input.files[0]); 
        chkFile1 = 1;

        if(chkName==1 && chkDetAddr ==1 && chkCapa ==1  && chkTel ==1 && chkFile1==1 && chkFile2==1 && chkFile3==1) {
            $(".signupbtn").prop("disabled", false);
            $(".signupbtn").css("background-color", "#4CAF50");
        }
    }
};

function readURL2(input) { 
    var chkImg = document.getElementById('input_img2').value
    chkImg=chkImg.slice(chkImg.indexOf(".")+1).toLowerCase();
    if(chkImg !="jpg" && chkImg !="jpeg" && 
            chkImg !="gif" && chkImg !="png" && chkImg !="bmp"){
        chkFile2=0;
        $(".signupbtn").prop("disabled", true);
        alert("이미지 파일만 올려주세요");
        $('#upload2').attr('src', "/img/default_image.png");}
    else if (input.files && input.files[0]){ 
        var reader = new FileReader(); 
        reader.onload = function (e) { 
            $('#upload2').attr('src', e.target.result); } 
        reader.readAsDataURL(input.files[0]); 
        chkFile2=1;

        if(chkName==1 && chkDetAddr ==1 && chkCapa ==1  && chkTel ==1 && chkFile1==1 && chkFile2==1 && chkFile3==1) {
            $(".signupbtn").prop("disabled", false);
            $(".signupbtn").css("background-color", "#4CAF50");
        }
    }
};

function readURL3(input) { 
    var chkImg = document.getElementById('input_img3').value
    chkImg=chkImg.slice(chkImg.indexOf(".")+1).toLowerCase();
    if(chkImg !="jpg" && chkImg !="jpeg" && 
            chkImg !="gif" && chkImg !="png" && chkImg !="bmp"){
        chkFile3=0;
        $(".signupbtn").prop("disabled", true);
        alert("이미지 파일만 올려주세요");
        $('#upload3').attr('src', "/img/default_image.png");}
    else if (input.files && input.files[0]){ 
        var reader = new FileReader(); 
        reader.onload = function (e) { 
            $('#upload3').attr('src', e.target.result); } 
        reader.readAsDataURL(input.files[0]); 
        chkFile3= 1;
        if(chkName==1 && chkDetAddr ==1 && chkCapa ==1  && chkTel ==1 && chkFile1==1 && chkFile2==1 && chkFile3==1) {
            $(".signupbtn").prop("disabled", false);
            $(".signupbtn").css("background-color", "#4CAF50");
        }
    }
};

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
                    mapContainer.style.display = "block";
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