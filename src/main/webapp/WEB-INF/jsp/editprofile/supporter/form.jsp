<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무대제공자 정보수정</title>
<link rel="stylesheet" href="/css/common.css"/>
<style>
body {
    margin: 0; background-color: #f5f5f5;
}

#titl {
    margin: 0 auto; padding: 10px 0; width: 940px;
}

#logo {
    width: 40px; height: 40px; margin: 10px;
}

.h3 {
    display: inline-block; position: relative; top: .2rem;
}

.container {
    width: 800px; padding-right: 3rem; padding-left: 3rem;
    margin-right: auto; margin-left: auto; margin-bottom: 1rem;
    border-radius: 8px/7px; background-color: #ebebeb;
    box-shadow: 1px 2px 5px rgba(0, 0, 0, .31);
    border: solid 1px #cbc9c9;
}

h4 {
    display: inline-block; min-width: 9rem; margin: 0.8rem 0;
}

#upload1, #upload2, #upload3 {
    margin: .8rem .8rem .2rem; height: 150px; width: 150px;
    border-radius: 3rem;
}

#input_img1, #input_img2, #input_img3 {
    opacity: 0;
}

#label_pic1, #label_pic2, #label_pic3 {
    cursor: pointer;
}

#imgfile {
    position: relative; text-align: center; margin-bottom: .5rem;
}

#sgnere {
    border: 0; border-bottom: 1px solid black; margin-top: 2px;
    font-size: 18px; font-weight: 500; width: 20%;
    background-color: #f5f5f5; -webkit-appearance: none;
    background: url(/img/bottom.png) no-repeat 95% 50%;
    background-size: 15%;
}

#sgnere:focus {
    outline: none;
}

#sgnere option {
    font-size: 18px; font-weight: 300;
}

#detailaddr {
    margin-left: 186px;
}

input[type="text"], input[type="tel"], input[type="number"]{
    border: 0; border-bottom: 1px double black; background-color: #ebebeb;
}

input[type="text"]:focus, input[type="tel"]:focus, input[type="number"]:focus {
    outline: none;
}
 .guide{
    font-size: 0.75rem;
    padding-left: 9.1rem;
}
#map{
    height:400px; margin-top:1rem; display:none;
}
.addr_btn{
    font-size: 0.6rem;
    height: 1.6rem;
    margin-left: .8rem;
    padding: 0rem 0.75rem;
}
.nonesize{
    background-color: #ebebeb;
    resize: none;
    position: relative;
    top: 0.3rem;
    border-radius: 7px 0 7px 0;
}
.nonesize:focus{
    outline: none;
    border:1px solid black;
}

.modi{
    margin: 0.5rem 0 1rem;
}
#modi-center{
    text-align: center;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=15e2302756c9e7098ec0d79f7b4d53f4&libraries=services"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<jsp:include page="../../header.jsp"></jsp:include>
<body>

    <div id="titl">
        <img id="logo" src="/img/playButton.png" alt="플레이로고">
        <h3 class="h3">제공자 정보수정</h3>
    </div>
    <div class=container>
        <form action='editS' method='post' enctype="multipart/form-data">
        <div id="imgfile">
            <table style="display:inline">
                <tr>
                    <td>
                        <label for="input_img1" id="label_pic1">
                            <img id="upload1" src="/upload/${sPhoto1}" alt="기본이미지1">
                            <input type='file' name='file1' id='input_img1' onchange="readURL1(this);" style="display: none;">
                        </label>
                    </td>
                    <td>
                        <label for="input_img2" id="label_pic2">
                            <img id="upload2" src="/upload/${sPhoto2}" alt="기본이미지2">
                            <input type='file' name='file2' id='input_img2' onchange="readURL2(this);" style="display: none;">
                        </label>
                    </td>
                    <td>
                        <label for="input_img3" id="label_pic3">
                            <img id="upload3" src="/upload/${sPhoto3}" alt="기본이미지3">
                            <input type='file' name='file3' id='input_img3' onchange="readURL3(this);" style="display: none;">
                        </label>
                    </td>
                </tr>
            </table>
            </div>
            <h4>상호명</h4>
            <input type='text' name='name' oninput="checkName()" id="name"
                size=30><br> <div id="nameMsg" class="guide"></div>
            <h4>퍼포먼스/장르(희망)</h4>
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
            <h4>주소</h4>
            <input type="text" id="baseaddr" name="baseaddr" placeholder="주소" size=45>
            <input type="button" onclick="searchAddr()" class = "btns btns-outline-secondary addr_btn" value="주소 검색"><br>
            <input type="text" id="detailaddr" name="detailaddr" placeholder="상세주소" size=45 onchange="checkDetailAddr()">
            <input type="hidden" id="x" name="x">
            <input type="hidden" id="y" name="y">
            <div id="daMsg" class="guide"></div>
            <div id="map"></div>
            <h4>수용가능인원</h4>
            <input type="number" id="capa" name="capa" onchange="checkCapa()">
            <div id="capaMsg" class="guide"></div> <br>
            <h4>연락처</h4>
            <input type="tel" id="tel" name="tel" size=30 onchange="checkTel()"> 
            <br><div id="telMsg" class="guide"></div>
            <h4>기타(희망사항)</h4>
            <textarea name="message" id="message" rows="4" cols="34" class="nonesize" placeholder="100자 이내로 적어주시길 바랍니다."></textarea> <br>
            <div id="modi-center">
            <button class="modi btns btns-outline-dark" disabled="disabled">수정완료</button>
            </div>
        </form>
    </div>

<script>
    var chkName=0;
var chkDetAddr=0;
var chkCapa=0;
var chkDetAddr=0;
var chkFile1=1;
var chkFile2=1;
var chkFile3=1;

function checkName(){
    var names=$('#name').val(); 
    $.ajax({
        data : {
            name : names
        },
        url : "checkName",
        success : function(data) {
            if(names.length<=0 && data=='0') {
                $(".modi").prop("disabled", true);
                $("#nameMsg").html("상호명을 입력해주세요.").css('color','black');
                chkName = 0;
            } else if (data == '0') {
                $("#nameMsg").html("사용 가능한 상호명입니다.").css('color','black');
                chkName = 1;
                if(chkName==1 && chkDetAddr ==1&& chkCapa ==1  && chkDetAddr ==1 && chkFile1==1 && chkFile2==1 && chkFile3==1) {
                    $(".modi").prop("disabled", false);
                    $(".modi").css("background-color", "#4CAF50");
                } 
            } else if (data >= '1') {
                $(".modi").prop("disabled", true);
                $("#nameMsg").html("이미 존재하는 상호명입니다.").css('color','red');
                chkName = 0;
            } 
        }
    });
}

function checkDetailAddr(){ 
    var baddr=$('#baseaddr').val();
    var detaddr=$('#detailaddr').val();
    if(detaddr.length<=0 || baddr.length<=0) {
        $(".modi").prop("disabled", true);
        $("#daMsg").html("주소를 입력해주세요.").css('color','black');
        chkDetAddr = 0;
    }else if (detaddr.length>0 && baddr.length>0) {
        chkDetAddr = 1;
        if(chkName==1 && chkDetAddr ==1 && chkCapa ==1  && chkDetAddr ==1 && chkFile1==1 && chkFile2==1 && chkFile3==1) {
            $(".modi").prop("disabled", false);
        }
    }
};


function checkCapa() {
    var capacity = $('#capa').val();
    if (capacity.length <= 0) {
        $(".modi").prop("disabled", true);
        $("#capaMsg").html("수용인원을 입력해주세요.").css('color', 'black');
        chkCapa = 0;
    } else if (capacity.length > 0) {
        chkCapa = 1;
        if (chkName == 1 && chkDetAddr == 1 && chkCapa == 1 && chkDetAddr == 1
                && chkFile1 == 1 && chkFile2 == 1 && chkFile3 == 1) {
            $(".modi").prop("disabled", false);
        }
    }
};

function checkTel() {
    if ($('#tel').val() == "") {
        $(".modi").prop("disabled", true);
        $("#telMsg").html("연락처를 입력해주세요.").css('color', 'black');
        chkDetAddr = 0;
    } else if (/(\d{2}).*(\d{3}).*(\d{4})/.test($('#tel').val())) {
        chkDetAddr = 1;
        $("#telMsg").html("등록 가능한 연락처입니다.").css('color', 'black');
    } else {
        $("#telMsg").html("올바르지 않은 연락처입니다.").css('color', 'red');
    }
    if (chkName == 1 && chkCity == 1 && chkDetAddr == 1 && chkFile == 1) {
        $(".modi").prop("disabled", false);
    }
};

function readURL1(input) {
    var chkImg = document.getElementById('input_img1').value;
    chkImg = chkImg.slice(chkImg.indexOf(".") + 1).toLowerCase();
    if (chkImg != "jpg" && chkImg != "jpeg" && chkImg != "gif"
            && chkImg != "png" && chkImg != "bmp") {
        chkFile1 = 0;
        $(".modi").prop("disabled", true);
        swal("", "이미지 파일만 올려주세요", "error");
    } else if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#upload1').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
        chkFile1 = 1;

        if (chkName == 1 && chkDetAddr == 1 && chkCapa == 1 && chkDetAddr == 1
                && chkFile1 == 1 && chkFile2 == 1 && chkFile3 == 1) {
            $(".modi").prop("disabled", false);
        }
    }
};

function readURL2(input) {
    var chkImg = document.getElementById('input_img2').value
    chkImg = chkImg.slice(chkImg.indexOf(".") + 1).toLowerCase();
    if (chkImg != "jpg" && chkImg != "jpeg" && chkImg != "gif"
            && chkImg != "png" && chkImg != "bmp") {
        chkFile2 = 0;
        $(".modi").prop("disabled", true);
        swal("", "이미지 파일만 올려주세요", "error");
    } else if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#upload2').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
        chkFile2 = 1;

        if (chkName == 1 && chkDetAddr == 1 && chkCapa == 1 && chkDetAddr == 1
                && chkFile1 == 1 && chkFile2 == 1 && chkFile3 == 1) {
            $(".modi").prop("disabled", false);
        }
    }
};

function readURL3(input) {
    var chkImg = document.getElementById('input_img3').value
    chkImg = chkImg.slice(chkImg.indexOf(".") + 1).toLowerCase();
    if (chkImg != "jpg" && chkImg != "jpeg" && chkImg != "gif"
            && chkImg != "png" && chkImg != "bmp") {
        chkFile3 = 0;
        $(".modi").prop("disabled", true);
        swal("", "이미지 파일만 올려주세요", "error");
    } else if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#upload3').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
        chkFile3 = 1;
        if (chkName == 1 && chkDetAddr == 1 && chkCapa == 1 && chkDetAddr == 1
                && chkFile1 == 1 && chkFile2 == 1 && chkFile3 == 1) {
            $(".modi").prop("disabled", false);
        }
    }
};

var mapContainer = document.getElementById('map'), // 지도를 표시할 div
mapOption = {
    center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
    level : 5
// 지도의 확대 레벨
};

//지도를 미리 생성
var map = new daum.maps.Map(mapContainer, mapOption);
//주소-좌표 변환 객체를 생성
var geocoder = new daum.maps.services.Geocoder();
//마커를 미리 생성
var marker = new daum.maps.Marker({
    position : new daum.maps.LatLng(37.537187, 127.005476),
    map : map
});

function searchAddr() {
    new daum.Postcode(
            {
                oncomplete : function(data) {
                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var fullAddr = data.address; // 최종 주소 변수
                    var extraAddr = ''; // 조합형 주소 변수

                    // 기본 주소가 도로명 타입일때 조합한다.
                    if (data.addressType === 'R') {
                        //법정동명이 있을 경우 추가한다.
                        if (data.bname !== '') {
                            extraAddr += data.bname;
                        }
                        // 건물명이 있을 경우 추가한다.
                        if (data.buildingName !== '') {
                            extraAddr += (extraAddr !== '' ? ', '
                                    + data.buildingName : data.buildingName);
                        }
                        // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                        fullAddr += (extraAddr !== '' ? ' (' + extraAddr
                                + ')' : '');
                    }

                    // 주소 정보를 해당 필드에 넣는다.
                    document.getElementById("baseaddr").value = fullAddr;
                    // 주소로 상세 정보를 검색
                    geocoder.addressSearch(data.address, function(results,
                            status) {
                        // 정상적으로 검색이 완료됐으면
                        if (status === daum.maps.services.Status.OK) {

                            var result = results[0]; //첫번째 결과의 값을 활용

                            // 해당 주소에 대한 좌표를 받아서
                            var coords = new daum.maps.LatLng(result.y,
                                    result.x);
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
<jsp:include page="../../footer.jsp"></jsp:include>
</html>