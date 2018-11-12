<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무대제공자 회원가입</title>
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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

#upload {
    width: 150px;
    heigh: 300px;
}
</style>
</head>
<body>

    <div id="titl">
        <img id="logo" src="/img/playButton.PNG" alt="플레이로고">
         <h2>무대 제공자 되기 </h2>
    </div>
    <div id=container>
        <form action='add' method='post' enctype="multipart/form-data">
            <h3>상호명</h3>
            <input type='text' name='teamname' oninput="checkName()" id="name"
                size=30><br> <span id="nameMsg"></span>
            <h3>퍼포먼스/장르(희망)</h3>
            <select name="teamgenre" onchange="checkGenre()" id="genre">
                <option value="ballad">발라드</option>
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
            <input type="text" name="city" id="city" oninput="checkCity()"
                size=30><br> <span id="cityMsg"></span>
            <h3>상세주소</h3>
            <input type="tel" name="tel" id="tel" oninput="checkTel()" size=30>
            <br> <span id="telMsg"></span>
            <h3>수용가능인원</h3>
            <input type="text" name="inst" size=30> <br>
            <h3>연락처</h3>
            <input type="text" name="strurl" size=30> <br>
            <h3>인증번호</h3>
            <input type="text" name="info" size=30> <br>
            <h3>기타(희망사항)</h3>
            <input type="text" name="info" size=30> <br>
            <h3>사진</h3>
            <h5>해당 공연장 사진을 올려주세요</h5>
            <img id="upload" src="/img/anonymous.png" alt="기본이미지"><br>
            <input type='file' name='file' id='input_img1' onchange="readURL(this);" />
            <input type='file' name='file' id='input_img2' onchange="readURL(this);" />
            <input type='file' name='file' id='input_img3' onchange="readURL(this);" />
            <br><br><button class="signupbtn" disabled="disabled">다음으로</button>
        </form>
    </div>

    <script>
    var chkName=0;
    var chkGenre=0;
    var chkCity=0;
    var chkTel=0;
    var chkFile=0;
        
    function checkName(){
        console.log("chkName"+chkName);
        console.log("chkGenre"+chkGenre);
        console.log("chkCity"+chkCity);
        console.log("chkTel"+chkTel);
        console.log("chkFile"+chkFile);
        console.log("==============");
                if(!$('#name').val()) {
                    $(".signupbtn").prop("disabled", true);
                    $(".signupbtn").css("background-color", "#aaaaaa");
                    $("#checkid").css("background-color", "#FFCECE");
                    $("#nameMsg").html("팀명을 입력해주세요.")
                    chkName = 0;
                } else if ($('#name').val()!="") {
                    chkName = 1;
                }
                if(chkName==1 && chkGenre == 1 && chkCity ==1 && chkTel ==1 && chkFile==1) {
                        $(".signupbtn").prop("disabled", false);
                        $(".signupbtn").css("background-color", "#4CAF50");
                    
                } 
        };
    
    function checkGenre(){
        console.log("chkName"+chkName);
        console.log("chkGenre"+chkGenre);
        console.log("chkCity"+chkCity);
        console.log("chkTel"+chkTel);
        console.log("chkFile"+chkFile);
        console.log("==============");
        var selected = $("#genre option:selected").val();
        console.log(selected.length);
            if(selected.length < 0 ) {
                $(".signupbtn").prop("disabled", true);
                $(".signupbtn").css("background-color", "#aaaaaa");
                $("#checkid").css("background-color", "#FFCECE");
                $("#nameMsg").html("장르를 선택해주세요.")
                chkGenre = 0;
            }else if (selected.length>0) { 
                console.log("-------");
                chkGenre = 1;
            }
            if(chkName==1 && chkGenre == 1 && chkCity ==1 && chkTel ==1 &&chkFile==1) {
                    $(".signupbtn").prop("disabled", false);
                    $(".signupbtn").css("background-color", "#4CAF50");
                 
            }
    };
    
    function checkCity(){
        console.log("chkName"+chkName);
        console.log("chkGenre"+chkGenre);
        console.log("chkCity"+chkCity);
        console.log("chkTel"+chkTel);
        console.log("chkFile"+chkFile);
        console.log("==============");
                if($('#city').val()=="") {
                    $(".signupbtn").prop("disabled", true);
                    $(".signupbtn").css("background-color", "#aaaaaa");
                    $("#checkemail").css("background-color", "#FFCECE");
                    $("#cityMsg").html("도시를 입력해주세요.")
                    chkCity = 0;
                } else if($('#city').val()!="") {
                    $("#city").css("background-color", "#B0F6AC");
                    chkCity = 1;
                }
                if(chkName==1 && chkGenre == 1 && chkCity ==1 && chkTel ==1 && chkFile==1) {
                        $(".signupbtn").prop("disabled", false);
                        $(".signupbtn").css("background-color", "#4CAF50");
            }
        };
    
    function checkTel(){
        console.log("chkName"+chkName);
        console.log("chkGenre"+chkGenre);
        console.log("chkCity"+chkCity);
        console.log("chkTel"+chkTel);
        console.log("chkFile"+chkFile);
        console.log("==============");
                if($('#tel').val()=="") {
                    $(".signupbtn").prop("disabled", true);
                    $(".signupbtn").css("background-color", "#aaaaaa");
                    $("#tel").css("background-color", "#FFCECE");
                    $("#telMsg").html("연락처를 입력해주세요.")
                    chkTel = 0;
                } else if ($('#tel').val()!="") {
                    $("#tel").css("background-color", "#B0F6AC");
                    chkTel = 1;
                }
                if(chkName==1 && chkGenre == 1 && chkCity==1 && chkTel==1 && chkFile==1) {
                        $(".signupbtn").prop("disabled", false);
                        $(".signupbtn").css("background-color", "#4CAF50");
                } 
            };
    
    function readURL(input) { 
    
        console.log("chkName"+chkName);
        console.log("chkGenre"+chkGenre);
        console.log("chkCity"+chkCity);
        console.log("chkTel"+chkTel);
        console.log("chkFile"+chkFile);
        console.log("==============");
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
    if(chkName==1 && chkGenre == 1 && chkCity==1 && chkTel==1 && chkFile==1) {
        $(".signupbtn").prop("disabled", false);
        $(".signupbtn").css("background-color", "#4CAF50");
    }
    }
    
    </script>

</body>
</html>