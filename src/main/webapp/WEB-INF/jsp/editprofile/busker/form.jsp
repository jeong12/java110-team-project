<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>버스커 정보수정</title>
<link rel="stylesheet" href="/css/common.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
body {
    margin: 0;
    background-color: #f5f5f5;
}

.container { 
    width: 800px;
    padding-right: 3rem;
    padding-left: 3rem;
    margin-right: auto;
    margin-left: auto;
    margin-bottom: 1rem;
    border-radius: 8px/7px;
    background-color: #ebebeb; 
    box-shadow: 1px 2px 5px rgba(0,0,0,.31); 
    border: solid 1px #cbc9c9;
}
 
#titl {
    margin: 0 auto; padding: 10px 0; width: 800px;
}

#logo {
    width: 40px; height: 40px; margin: 10px;
}

.h3{
    display: inline-block; position: relative; top: .2rem; 
}
    
h4 {
    display: inline-block; min-width: 8rem; margin:0.8rem 0;
}
.h4{
    margin-bottom:1.3rem;
}


#upload {
    margin-top: .8rem;
    margin-bottom: .2rem;
    height:150px; width: 150px;
    border-radius: 3rem;
}
    
    #imgfile{
        position: relative; text-align: center;
    }
    
    #label_pic {
    cursor: pointer;
}
#input_img {
    opacity: 0;
}

#genre{
    border:0;
    border-bottom: 1px solid black; 
    margin-top: 2px;
    font-size: 18px;
    font-weight: 500;
    width: 20%;
    background-color: #f5f5f5; 
    -webkit-appearance:none;
    background: url(/img/bottom.png) no-repeat 95% 50%;
    background-size: 15%;
}

#genre:focus {
    outline: none;
}

#genre option {
    font-size: 18px;
    font-weight: 300;
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
    position: relative;
    left: 13.5rem;
}

 input[type="text"],input[type="tel"]{
    border:0;
    border-bottom: 1px double black;
    background-color: #ebebeb;
 }
 input[type="text"]:focus, input[type="tel"]:focus{
    outline:none;
 }
 
 .guide{
    font-size: 0.75rem;
    padding-left: 8.1rem;
}
</style>
<script>
var chkName=0;
var chkCity=0;
var chkTel=0;
var chkFile=1;

function checkName(){
    var names=$('#teamname').val();
    if(names.length<=0) {
        $(".modi").prop("disabled", true);
        $("#nameMsg").html("팀명을 입력해주세요.");
        chkName = 0;
    }else if (names.length>0) {
        chkName = 1;
        $("#nameMsg").html("사용 가능한 팀명입니다.");
    }
    if(chkName==1 && chkCity ==1 && chkTel ==1 && chkFile==1) {
        $(".modi").prop("disabled", false);
    } 
};
function checkCity(){
    if($('#city').val()=="") {
        $(".modi").prop("disabled", true);
        $("#cityMsg").html("도시를 입력해주세요.");
        chkCity = 0;
    } else if($('#city').val()!="") {
        chkCity = 1;
        $("#cityMsg").html("등록 가능한 도시입니다.");
    }
    if(chkName==1 && chkCity ==1 && chkTel ==1 && chkFile==1) {
        $(".modi").prop("disabled", false);
    }
};

function checkTel(){
    if($('#tel').val()=="") {
        $(".modi").prop("disabled", true);
        $("#telMsg").html("연락처를 입력해주세요.").css('color','black');
        chkTel = 0;
    } else if (/(\d{2}).*(\d{3}).*(\d{4})/.test($('#tel').val())) {
        chkTel = 1;
        $("#telMsg").html("등록 가능한 연락처입니다.").css('color','black');
    } else {
        $("#telMsg").html("올바르지 않은 연락처입니다.").css('color','red');
    }
    if(chkName==1 && chkCity==1 && chkTel==1 && chkFile==1) {
        $(".modi").prop("disabled", false);
    } 
};

function readURL(input) { 
    var chkImg = document.getElementById('input_img').value
    chkImg=chkImg.slice(chkImg.indexOf(".")+1).toLowerCase();
    if(chkImg !="jpg" && chkImg !="jpeg" && 
            chkImg !="gif" && chkImg !="png" && chkImg !="bmp"){
        chkFile=0;
        $(".modi").prop("disabled", true);
        swal("","이미지 파일만 올려주세요","error"); 
        } else if (input.files && input.files[0]){ 
        var reader = new FileReader(); 
        reader.onload = function (e) { 
            $('#upload').attr('src', e.target.result); } 
        reader.readAsDataURL(input.files[0]); 
        chkFile = 1;
      if(chkName==1 && chkCity==1 && chkTel==1 && chkFile==1) {
          $(".modi").prop("disabled", false);
      }
    }
}

</script>
</head>
<jsp:include page="../../header.jsp"></jsp:include>
<body>

    <div id="titl">
        <img id="logo" src="/img/playButton.PNG" alt="플레이로고">
         <h3 class="h3">버스커 정보 수정</h3>
    </div>
    <div class=container>
        <form action='editB' method='post' enctype="multipart/form-data" style="padding-left: 20px;">
            <div id="imgfile">
            <label for="input_img" id="label_pic">
            <img id="upload" src="/upload/${busker.teamPhoto}" alt="기본이미지" ><br>
            <input type='file' name='file1' id='input_img'
                onchange="readURL(this);" style="display:none;" /></label></div>
            <h4>팀명</h4>
            <input type='text' name='teamname' oninput="checkName()" id="teamname"
                size=30><br> <div id="nameMsg" class="guide"></div>
            <h4 class="h4">장르</h4>
            <select name="teamgenre" id="genre">
                <option value="ballad" selected="selected" id="test">발라드</option>
                <option value="dance">댄스</option>
                <option value="trot">트로트</option>
                <option value="folk">포크</option>
                <option value="rock">락</option>
                <option value="jazz">재즈</option>
                <option value="country">컨츄리</option>
                <option value="rnb">알앤비</option>
                <option value="rap">랩</option>
            </select><br>
            <h4>주요 활동 도시</h4>
            <input type="text" name="city" id="city" oninput="checkCity()"
                size=30><br> <div id="cityMsg" class="guide"></div>
            <h4>연락처</h4>
            <input type="tel" name="tel" id="tel" oninput="checkTel()" size=30 placeholder="xxx-xxxx-xxxx">
            <br> <div id="telMsg" class="guide"></div>
            <h4 class="h4">주 연주 악기</h4>
            <input type="text" name="instrument" size=30> <br>
            <h4>팀소개</h4>
            <textarea name="teamInfo" rows="4" cols="34" class="nonesize" placeholder="100자 이내로 적어주시길 바랍니다."></textarea><br>
            <button class="modi btns btns-outline-dark" disabled="disabled">수정완료</button>
        </form>
    </div>
</body>
<jsp:include page="../../footer.jsp"></jsp:include>
</html>