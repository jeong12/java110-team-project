<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>회원정보수정</title>
    <link rel="stylesheet" href="/css/common.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
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
    margin: 0 auto; padding: 10px 0; width: 940px;
}

#logo {
    width: 40px; height: 40px; margin: 10px;
}

h4 {
    display: inline-block; min-width: 8rem; margin:0.8rem 0;
}

.h3 {
    display: inline-block; position: relative; top: .2rem;
}
.pd{
        padding: 0 14%;
}
 input[type="password"],input[type="email"]{
    border:0;
    border-bottom: 1px double black;
    background-color: #ebebeb;
 } 
 input[type="password"]:focus, input[type="email"]:focus{
    outline:none;
 }
.guide{
    font-size: 0.75rem;
    padding-left: 8.1rem;
}

.imgmodi{
    margin-top: .8rem;
    height:150px; width: 150px;
    border-radius: 3rem;
}
.imgfile {
    position: relative; text-align: center;
}

#piclabel {
    min-width: 4rem;
}

#label_pic {
    cursor: pointer;
}

#input_img {
    opacity: 0;
}

#id, #nick{
    font-weight: 300;
    font-size: 1rem;
}

.textgenre{
    font-size: 1rem;
}

.check{
    width: 45%;
    display: inline-block;
}
input[type=checkbox] {
    display: none;
}

.chklabel {
    margin: 2% 1%;
    padding: 0px !important;
    width: 65px;
    height: 20px;
    text-align: center;
    border: 1px solid silver;
    border-radius: 25px;
    background-color: rgba(52, 58, 64, 0.5);
    color: white;
}

input[type=checkbox]+label {
    display: inline-block;
    cursor: pointer;
    position: relative;
    padding-left: 25px;
    margin-right: 15px;
    font-size: 13px;
    margin: 2% 1%;
}

input[type=checkbox]:checked+label{
    background-color:rgb(52, 58, 64);
}
#modi-center{
    text-align: center;
}
.modi{
    margin: 0.5rem 0 1rem;
}
</style>

<script>
    var chkPwd = 0;
    var chkPwdl = 0;
    var chkEmail = 0;
    var chkGenre = 0;
    var chkFile = 1;

    function ChkCount(obj) {
        var chkbox = document.getElementsByName("genre");
                    var chkCnt = 0;
                    for (var i = 0; i < chkbox.length; i++) {
                        if (chkbox[i].checked) {
                            chkCnt++;
                        }
                    }
                    if (chkCnt == 3) {
                        chkGenre = 1;
                        if (chkPwd == 1 && chkEmail == 1 && chkPwdl ==1 &&
                                chkGenre == 1 && chkFile == 1) {
                            $(".modi").prop("disabled", false);
                        }
                    } else if (chkCnt > 3) {
                        swal(' ',"최대 3개까지만 선택하실 수 있습니다.",'error');
                        chkGenre = 1;
                        obj.checked = false;
                        return false;
                    } else if (chkCnt < 3) {
                        $(".modi").prop("disabled", true);
                    }
                }

                function checkPwd() {
                    var inputed = $('.pass').val();
                    var reinputed = $('#repwd').val();

                    if (/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/
                            .test(inputed)) {
                        $('#pwdMsg').html("사용가능한 비밀번호입니다.").css('color','black');
                        chkPwdl = 1;
                    } else {
                        $('span .fa-lock').hide(); 
                        $('span .fa-lock-open').show();
                        $('#pwdMsg').html("8자 이상 영어,숫자,특수문자를 포함해주세요 ").css('color','red');
                        $(".modi").prop("disabled", true);
                    }

                    if (reinputed == ""
                            && (inputed != reinputed || inputed == reinputed)) {
                        $('span .fa-lock').hide(); 
                        $('span .fa-lock-open').show();
                        $("#rePassword").html("위와 같은 비밀먼호를 입력해주세요").css('color','red');
                        $(".modi").prop("disabled", true);
                    } else if (inputed == reinputed) {
                        $('span .fa-lock').show(); 
                        $('span .fa-lock-open').hide();
                        $("#rePassword").html("비밀번호가 일치합니다.").css('color','black');
                        chkPwd = 1;
                        if (chkPwd == 1 && chkEmail == 1 && chkPwdl ==1 &&
                                chkGenre == 1 && chkFile == 1) {
                            $(".modi").prop("disabled", false);
                        }
                    } else if (inputed != reinputed) {
                        $('span .fa-lock').hide(); 
                        $('span .fa-lock-open').show();
                        $("#rePassword").html("비밀번호가 일치하지않습니다.").css('color','red');
                        chkPwd = 0;
                        $(".modi").prop("disabled", true);
                    }
                }

                function checkEmail() {
                    var inserted = $('#checkemail').val();
                    $.ajax({
                        data : {
                            email : inserted
                        },
                        url : "checkEmail",
                        success : function(data) {
                            if(!(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/
                                    .test(inserted))){
                                $(".modi").prop("disabled", true);
                                $("#emailMsg").html("적합하지 않은 이메일 형식입니다.").css('color','red');
                                chkEmail = 0;
                            } else if (inserted == "" && data == '0') {
                                $(".modi").prop("disabled", true);
                                $("#emailMsg").html("이메일을 입력해주세요.").css('color','black');
                                chkEmail = 0;
                            } else if (data == '0') {
                                $("#emailMsg").html("사용 가능한 이메일입니다.").css('color','black');
                                chkEmail = 1;
                                if (chkPwd == 1 && chkEmail == 1 && chkPwdl ==1 &&
                                        chkGenre == 1 && chkFile == 1) {
                                    $(".modi").prop("disabled", false);
                                }
                            } else if (data >= '1') {
                                $(".modi").prop("disabled", true);
                                $("#emailMsg").html("이미 존재하는 이메일입니다.").css('color','red');
                                chkEmail = 0;
                            }
                        }
                    });
                }

                function readURL(input) {

                    var chkImg = document.getElementById('input_img').value
                    chkImg = chkImg.slice(chkImg.indexOf(".") + 1)
                            .toLowerCase();
                    if (chkImg != "jpg" && chkImg != "jpeg"
                            && chkImg != "gif" && chkImg != "png"
                            && chkImg != "bmp") {
                        chkFile = 0;
                        $(".modi").prop("disabled", true);
                        swal(" ","이미지 파일만 올려주세요","error");
                        $('#upload').attr('src', "/img/anonymous.png");
                    } else if (input.files && input.files[0]) {
                        var reader = new FileReader();
                        reader.onload = function(e) {
                            $('#upload').attr('src', e.target.result);
                            $('#photo-image').attr('src', e.target.result);
                        }
                        reader.readAsDataURL(input.files[0]);
                        chkFile = 1;
                        if (chkPwd == 1 && chkEmail == 1 && chkPwdl ==1 &&
                                chkGenre == 1 && chkFile == 1) {
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
        <h3 class="h3">회원 정보 수정</h3>
    </div> 
    <div class="container">
        <form action='edit' method='post' enctype="multipart/form-data" style="padding-left: 20px;">
            <div class="imgfile">
            <label for="input_img" id="label_pic">
            <c:choose>
                <c:when test="${not empty photo}">
                    <img id='photo-image' class="imgmodi" src='/upload/${photo}' alt="원본이미지" ><br>
                </c:when>
            <c:otherwise>
                <img class="imgmodi" src="/img/anonymous.png" alt="기본이미지"><br>
            </c:otherwise>
            </c:choose></label>
            <input type='file' name='file1' id='input_img' onchange="readURL(this);" style="display:none;"/>
            </div>
            <div class="pd">
            <h4>아이디</h4>
            <span id="id">${id}</span><br>
            <h4>비밀번호</h4>
            <input type="password" placeholder="8자 이상 영어, 숫자, 특수문자 포함"
                name="password" required class="pass" id="pwd" oninput="checkPwd()"
                size=30>
                <span><i class="fas fa-lock-open" style="display: none;"></i>
                <i class="fas fa-lock" style="display: none;"></i></span><br>
                 <div id="pwdMsg" class="guide"></div>
            <h4>비밀번호 확인</h4>
            <input type="password" placeholder="위와 같은 비밀번호를 써주세요"
                name="psd-repeat" required class="pass" id="repwd"
                oninput="checkPwd()" size=30> <br> <div
                id="rePassword" class="guide"></div>
            <h4>이메일</h4>
            <input type="email" placeholder="ex)xxx@naver.com" name="email" required class="email"
                oninput="checkEmail()" id="checkemail" size=30> <br> <div
                id="emailMsg" class="guide"></div>
            <h4>닉네임</h4>
            <span id="nick">${nick}</span><br>
            <h4>선호하는 장르</h4>
            <!-- <span class ="textgenre">3개를 필수적으로 골라주세요.</span> -->
            <div class="check"> 
            <input type="checkbox" name="genre" onclick="ChkCount(this)" value="ballad" id="ballad"> 
              <label for="ballad" class='chklabel'>발라드</label> 
              <input type="checkbox" name="genre" onclick="ChkCount(this)" value="dance" id="dance">
              <label for="dance" class='chklabel'>댄스</label> 
              <input type="checkbox" name="genre" onclick="ChkCount(this)" value="trot" id="trot"> 
              <label for="trot" class='chklabel'>트로트</label> 
              <input type="checkbox" name="genre" onclick="ChkCount(this)" value="folk" id="folk"> 
              <label for="folk" class='chklabel'>포크</label> 
              <input type="checkbox" name="genre" onclick="ChkCount(this)" value="rock" id="rock">
              <label for="rock" class='chklabel'>락</label> 
              <input type="checkbox" name="genre" onclick="ChkCount(this)" value="jazz" id="jazz"> 
              <label for="jazz" class='chklabel'>재즈</label> 
              <input type="checkbox" name="genre" onclick="ChkCount(this)" value="country" id="country"> 
              <label for="country" class='chklabel'>컨츄리</label> 
              <input type="checkbox" name="genre" onclick="ChkCount(this)" value="rnb" id="rnb">
              <label for="rnb" class='chklabel'>알앤비</label> 
              <input type="checkbox" name="genre" onclick="ChkCount(this)" value="rap" id="rap"> 
              <label for="rap" class='chklabel'>랩</label>
              </div><br>
              </div>
              <div id="modi-center">
            <button class="modi btns btns-outline-dark" disabled="disabled" type="submit">수정완료</button>
            </div>
        </form>
    </div>
</body>
<jsp:include page="../../footer.jsp"></jsp:include>
</html>