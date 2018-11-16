<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>버스커 회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
    h3{
        display: inline-block;
        width: 150px;
    }

#container {
    padding: 50px;
}

#upload {
    width: 150px;
    height: 300px;
}
    
    #imgfile{
        float: right;
        width: 150px;
        height: 150px;
        margin-right: 150px;
    }
    #h3_img{
        display: block;
        text-align: center;
    }
</style>
<script>
var chkName=0;
var chkCity=0;
var chkTel=0;
var chkFile=0;

function checkName(){
    var names=$('#teamname').val();
    if(names.length<=0) {
        $(".signupbtn").prop("disabled", true);
        $(".signupbtn").css("background-color", "#aaaaaa");
        $("#teamname").css("background-color", "#FFCECE");
        $("#nameMsg").html("팀명을 입력해주세요.")
        chkName = 0;
    }else if (names.length>0) {
        chkName = 1;
        $("#teamname").css("background-color", "#B0F6AC");
        $("#nameMsg").html("사용 가능한 팀명입니다.");
    }
    if(chkName==1 && chkCity ==1 && chkTel ==1 && chkFile==1) {
        $(".signupbtn").prop("disabled", false);
        $(".signupbtn").css("background-color", "#4CAF50");

    } 
};
function checkCity(){
    if($('#city').val()=="") {
        $(".signupbtn").prop("disabled", true);
        $(".signupbtn").css("background-color", "#aaaaaa");
        $("#city").css("background-color", "#FFCECE");
        $("#cityMsg").html("도시를 입력해주세요.")
        chkCity = 0;
    } else if($('#city').val()!="") {
        $("#city").css("background-color", "#B0F6AC");
        chkCity = 1;
        $("#cityMsg").html(" ");
    }
    if(chkName==1 && chkCity ==1 && chkTel ==1 && chkFile==1) {
        $(".signupbtn").prop("disabled", false);
        $(".signupbtn").css("background-color", "#4CAF50");
    }
};

function checkTel(){
    if($('#tel').val()=="") {
        $(".signupbtn").prop("disabled", true);
        $(".signupbtn").css("background-color", "#aaaaaa");
        $("#tel").css("background-color", "#FFCECE");
        $("#telMsg").html("연락처를 입력해주세요.")
        chkTel = 0;
    } else if ($('#tel').val()!="") {
        $("#tel").css("background-color", "#B0F6AC");
        chkTel = 1;
        $("#telMsg").html(" ");
    }
    if(chkName==1 && chkCity==1 && chkTel==1 && chkFile==1) {
        $(".signupbtn").prop("disabled", false);
        $(".signupbtn").css("background-color", "#4CAF50");
    } 
};

function readURL(input) { 
    var chkImg = document.getElementById('input_img').value
    chkImg=chkImg.slice(chkImg.indexOf(".")+1).toLowerCase();
    if(chkImg !="jpg" && chkImg !="jpeg" && 
            chkImg !="gif" && chkImg !="png" && chkImg !="bmp"){
        chkFile=0;
        $(".signupbtn").prop("disabled", true);
        alert("이미지 파일만 올려주세요");
        $('#upload').attr('src', "/img/anonymous.png");}
    else if (input.files && input.files[0]){ 
        var reader = new FileReader(); 
        reader.onload = function (e) { 
            $('#upload').attr('src', e.target.result); } 
        reader.readAsDataURL(input.files[0]); 
        chkFile = 1;
    }
    if(chkName==1 && chkCity==1 && chkTel==1 && chkFile==1) {
        $(".signupbtn").prop("disabled", false);
        $(".signupbtn").css("background-color", "#4CAF50");
    }
}

    </script>
</head>
<body>

    <div id="titl">
        <img id="logo" src="/img/playButton.PNG" alt="플레이로고">
         <h2>버스커 정보 수정</h2>
    </div>
    <div id=container>
        <form action='editB' method='post' enctype="multipart/form-data">
            <h3>팀명</h3>
            <input type='text' name='teamname' oninput="checkName()" id="teamname"
                size=30><br> <span id="nameMsg"></span><br>
            <h3>장르</h3>
            <select name="teamgenre" onchange="checkGenre()" id="genre">
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
            <div id="imgfile">
            <h3 id="h3_img">사진</h3>
            <img id="upload" src="/img/anonymous.png" alt="기본이미지" style="height:200px; width: 200px;"><br>
            <input type='file' name='file1' id='input_img'
                onchange="readURL(this);" />
            </div>
            <h3>주요 활동 도시</h3>
            <input type="text" name="city" id="city" oninput="checkCity()"
                size=30><br> <span id="cityMsg"></span><br>
            <h3>연락처</h3>
            <input type="tel" name="tel" id="tel" oninput="checkTel()" size=30>
            <br> <span id="telMsg"></span><br>
            <h3>악기</h3>
            <input type="text" name="instrument" size=30> <br>
            <h3>팀소개</h3>
            <textarea name="teamInfo" rows="4" cols="32"></textarea> <br>
            
            <br><br><button class="signupbtn" disabled="disabled">수정완료</button>
        </form>
    </div>
</body>
</html>