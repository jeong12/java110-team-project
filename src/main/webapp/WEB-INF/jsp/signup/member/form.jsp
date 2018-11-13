<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 회원 가입</title>
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

#upload{
    width: 150px;
    heigh:300px;
}
</style>
</head>
<body>

    <div id="titl">
        <img id="logo" src="/img/playButton.PNG" alt="플레이로고">
        <h2>회원가입</h2>
    </div>
    <div id=container>
        <form action='add' method='post' enctype="multipart/form-data">
            <h3>아이디</h3>
            <input type='text' name='id' required class="id" oninput="checkId()"
                id="checkid" size=30><br> <span id="idMsg"></span>
            <h3>비밀번호</h3>
            <input type="password" placeholder="8자 이상 영어, 숫자, 특수문자 포함"
                name="upwd" required class="pass" id="pwd" oninput="checkPwd()"
                size=30><br> <span id="pwdMsg"></span>
            <h3>비밀번호 확인</h3>
            <input type="password" placeholder="위와 같은 비밀번호를 써주세요"
                name="psd-repeat" required class="pass" id="repwd"
                oninput="checkPwd()" size=30> <br> <span
                id="rePassword"></span>
            <h3>이메일</h3>
            <input type="email" name="email" required class="email"
                oninput="checkEmail()" id="checkemail" size=30> <br> <span
                id="emailMsg"></span>
            <h3>닉네임</h3>
            <input type="text" name="nickname" required class="id"
                id="checknickname" oninput="checkNickname()" size=30> <br>
            <span id="nickMsg"></span>
            <h3>사진</h3>
            <img id="upload" src="/img/anonymous.png" alt="기본이미지"><br>
            <input type='file' name='file1' id='input_img' onchange="readURL(this);"/>
            <h3>선호하는 장르</h3>
            <h5>3개를 필수적으로 골라주세요.</h5>
            <input type="checkbox" name="genre" onclick="ChkCount(this)"
                value="ballad"><label for="ballad">발라드</label> <input
                type="checkbox" name="genre" onclick="ChkCount(this)" value="dance"><label
                for="dance">댄스</label> <input type="checkbox" name="genre"
                onclick="ChkCount(this)" value="trot"><label for="trot">트로트</label>
            <input type="checkbox" name="genre" onclick="ChkCount(this)"
                value="folk"><label for="folk">포크</label> <input
                type="checkbox" name="genre" onclick="ChkCount(this)" value="rock"><label
                for="rock">락</label> <input type="checkbox" name="genre"
                onclick="ChkCount(this)" value="jazz"><label for="jazz">재즈</label>
            <input type="checkbox" name="genre" onclick="ChkCount(this)"
                value="country"><label for="country">컨츄리</label> <input
                type="checkbox" name="genre" onclick="ChkCount(this)" value="rnb"><label
                for="rnb">알앤비</label> <input type="checkbox" name="genre"
                onclick="ChkCount(this)" value="rap"><label for="rap">랩</label>
            <p>
                팬으로 가입하셔도, 이후 메인화면의 <br> '버스커되기' '제공자되기'로 변경 가능합니다.
            </p>
            <button class="signupbtn" disabled="disabled" onclick="sendMsg()">팬으로
                가입</button>
            <button>버스커로 가입</button>
            <button>무대 제공자로 가입</button>
        </form>
    </div>

    <script>
    var chkId=0;
    var chkPwd=0;
    var chkEmail=0;
    var chkNick=0;
    var chkGenre=0;
    var chkFile=1;
        
    function ChkCount(obj){
        console.log(chkFile);
        var chkbox = document.getElementsByName("genre");
        var chkCnt=0;
        for(var i=0;i<chkbox.length; i++){
            if(chkbox[i].checked){
                chkCnt++;
                console.log("chk"+chkCnt);
            }
        }
        if(chkCnt==3){
            chkGenre =1;
            if(chkId==1 && chkPwd == 1 && chkEmail ==1 && chkNick ==1 && chkGenre==1 && chkFile==1){
                $(".signupbtn").prop("disabled", false);
                $(".signupbtn").css("background-color", "#4CAF50");
            }
        }else if(chkCnt>3){
            alert("최대 3개까지만 선택하실 수 있습니다.");
            chkGenre=1;
            obj.checked = false;
            return false;
          }else if(chkCnt<3){
            $(".signupbtn").prop("disabled", true);          
        }
    }
    
    function sendMsg(){
        alert($('#checknickname').val() + '님 환영합니다!')
        }
    
    function checkId(){
        console.log(chkFile);
        var inputed =$('#checkid').val();
        $.ajax({
            data : {
                date : inputed
            },
            url : "checkId",
            success : function(data) {
                if(inputed=="" && data=='0') {
                    $(".signupbtn").prop("disabled", true);
                    $(".signupbtn").css("background-color", "#aaaaaa");
                    $("#checkid").css("background-color", "#FFCECE");
                    $("#idMsg").html("아이디를 입력해주세요.")
                    chkId = 0;
                } else if (data == '0') {
                    $("#checkid").css("background-color", "#B0F6AC");
                    $("#idMsg").html("사용 가능한 아이디입니다.")
                    chkId = 1;
                    if(chkId==1 && chkPwd == 1 && chkEmail ==1 && chkNick ==1 && chkGenre==1 && chkFile==1) {
                        $(".signupbtn").prop("disabled", false);
                        $(".signupbtn").css("background-color", "#4CAF50");
                    } 
                } else if (data >= '1') {
                    $(".signupbtn").prop("disabled", true);
                    $(".signupbtn").css("background-color", "#aaaaaa");
                    $("#checkid").css("background-color", "#FFCECE");
                    $("#idMsg").html("이미 존재하는 아이디입니다.")
                    chkId = 0;
                } 
            }
        });
    }
    
    function checkPwd() {
        console.log(chkFile);
        var inputed = $('.pass').val();
        var reinputed = $('#repwd').val();
            
        if(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test(inputed)){
            $('#pwd').css("background-color", "#B0F6AC");
            $('#pwdMsg').html("사용가능한 비밀번호입니다.")
        }else{
            $("#pwd").css("background-color", "#FFCECE");
            $('#pwdMsg').html("8자 이상 영어,숫자,특수문자를 포함해주세요 ")
            $(".signupbtn").prop("disabled", true);
        }
        
        if(reinputed=="" && (inputed != reinputed || inputed == reinputed)){
            $("#rePassword").html("위와 같은 비밀먼호를 입력해주세요")
            $(".signupbtn").prop("disabled", true);
            $(".signupbtn").css("background-color", "#aaaaaa");
            $("#repwd").css("background-color", "#FFCECE");
        }
        else if (inputed == reinputed) {
            $("#repwd").css("background-color", "#B0F6AC");
                $("#rePassword").html("비밀번호가 일치합니다.")
            chkPwd = 1;
            if(chkId==1 && chkPwd == 1 && chkEmail ==1 && chkNick==1 && chkGenre==1 && chkFile==1) {
                $(".signupbtn").prop("disabled", false);
                $(".signupbtn").css("background-color", "#4CAF50");
            }
        } else if (inputed != reinputed) {
            $("#rePassword").html("비밀번호가 일치하지않습니다.")
            chkPwd = 0;
            $(".signupbtn").prop("disabled", true);
            $(".signupbtn").css("background-color", "#aaaaaa");
            $("#repwd").css("background-color", "#FFCECE");
            
        }
    }
    
    function checkEmail(){
        console.log(chkFile);
        var inserted =$('#checkemail').val();
        $.ajax({
            data : {
                email : inserted
            },
            url : "checkEmail",
            success : function(data) {
                if(inserted=="" && data=='0') {
                    $(".signupbtn").prop("disabled", true);
                    $(".signupbtn").css("background-color", "#aaaaaa");
                    $("#checkemail").css("background-color", "#FFCECE");
                    $("#emailMsg").html("이메일을 입력해주세요.")
                    chkEmail = 0;
                } else if (data == '0') {
                    $("#checkemail").css("background-color", "#B0F6AC");
                    $("#emailMsg").html("사용 가능한 이메일입니다.")
                    chkEmail = 1;
                    if(chkId==1 && chkPwd == 1 && chkEmail ==1 && chkNick ==1 && chkGenre==1 && chkFile==1) {
                        $(".signupbtn").prop("disabled", false);
                        $(".signupbtn").css("background-color", "#4CAF50");
                    } 
                } else if (data >= '1') {
                    $(".signupbtn").prop("disabled", true);
                    $("#emailMsg").html("이미 존재하는 이메일입니다.")
                    $(".signupbtn").css("background-color", "#aaaaaa");
                    $("#checkemail").css("background-color", "#FFCECE");
                    chkEmail = 0;
                } 
            }
        });
    }
    
    function checkNickname(){
        var nick =$('#checknickname').val();
        $.ajax({
            data : {
                nickname : nick
            },
            url : "checkNick",
            success : function(data) {
                if(nick=="" && data=='0') {
                    $(".signupbtn").prop("disabled", true);
                    $(".signupbtn").css("background-color", "#aaaaaa");
                    $("#checknickname").css("background-color", "#FFCECE");
                    $("#nickMsg").html("닉네임을 입력해주세요.")
                    chkNick = 0;
                } else if (data == '0') {
                    $("#checknickname").css("background-color", "#B0F6AC");
                    $("#nickMsg").html("사용 가능한 닉네임입니다.")
                    chkNick = 1;
                    if(chkId==1 && chkPwd == 1 && chkEmail==1 && chkNick==1 && chkGenre==1 & chkFile==1) {
                        $(".signupbtn").prop("disabled", false);
                        $(".signupbtn").css("background-color", "#4CAF50");
                    } 
                } else if (data >= '1') {
                    $(".signupbtn").prop("disabled", true);
                    $("#nickMsg").html("이미 존재하는 닉네임입니다.")
                    $(".signupbtn").css("background-color", "#aaaaaa");
                    $("#checknickname").css("background-color", "#FFCECE");
                    chkNick = 0;
                } 
            }
        });
    }

    function readURL(input) { 
    
    var chkImg = document.getElementById('input_img').value
    chkImg=chkImg.slice(chkImg.indexOf(".")+1).toLowerCase();
    if(chkImg !="jpg" && chkImg !="jpeg" && chkImg !="gif" && chkImg !="png" && chkImg !="bmp"){
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
    if(chkId==1 && chkPwd == 1 && chkEmail==1 && chkNick==1 && chkGenre==1 & chkFile==1) {
        $(".signupbtn").prop("disabled", false);
        $(".signupbtn").css("background-color", "#4CAF50");
    } 
    }
    }
    function ChkCount(obj){
        console.log(chkFile);
        var chkbox = document.getElementsByName("genre");
        var chkCnt=0;
        for(var i=0;i<chkbox.length; i++){
            if(chkbox[i].checked){
                chkCnt++;
                console.log("chk"+chkCnt);
            }
        }
        if(chkCnt==3){
            chkGenre =1;
            if(chkId==1 && chkPwd == 1 && chkEmail ==1 && chkNick ==1 && chkGenre==1 && chkFile==1){
                $(".signupbtn").prop("disabled", false);
                $(".signupbtn").css("background-color", "#4CAF50");
            }
        }else if(chkCnt>3){
            alert("최대 3개까지만 선택하실 수 있습니다.");
            chkGenre=1;
            obj.checked = false;
            return false;
          }else if(chkCnt<3){
            $(".signupbtn").prop("disabled", true);          
        }
    }
    
    </script>

</body>
</html>