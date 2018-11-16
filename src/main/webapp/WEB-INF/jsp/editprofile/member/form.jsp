<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>회원정보수정</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
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
            height: 300px;
        }
        .imgfile {
            float: right;
        }
    </style>

    <script>
        var chkPwd = 0;
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
                if (chkPwd == 1 && chkEmail == 1 && chkGenre == 1 && chkFile == 1) {
                    $(".modi").prop("disabled", false);
                    $(".modi").css("background-color", "#4CAF50");
                }
            } else if (chkCnt > 3) {
                alert("최대 3개까지만 선택하실 수 있습니다.");
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

            if (/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test(inputed)) {
                $('#pwd').css("background-color", "#B0F6AC");
                $('#pwdMsg').html("사용가능한 비밀번호입니다.")
            } else {
                $("#pwd").css("background-color", "#FFCECE");
                $('#pwdMsg').html("8자 이상 영어,숫자,특수문자를 포함해주세요 ")
                $(".modi").prop("disabled", true);
            }

            if (reinputed == "" && (inputed != reinputed || inputed == reinputed)) {
                $("#rePassword").html("위와 같은 비밀먼호를 입력해주세요")
                $(".modi").prop("disabled", true);
                $(".modi").css("background-color", "#aaaaaa");
                $("#repwd").css("background-color", "#FFCECE");
            } else if (inputed == reinputed) {
                $("#repwd").css("background-color", "#B0F6AC");
                $("#rePassword").html("비밀번호가 일치합니다.")
                chkPwd = 1;
                if ( chkPwd == 1 && chkEmail == 1 && chkGenre == 1 && chkFile == 1) {
                    $(".modi").prop("disabled", false);
                    $(".modi").css("background-color", "#4CAF50");
                }
            } else if (inputed != reinputed) {
                $("#rePassword").html("비밀번호가 일치하지않습니다.")
                chkPwd = 0;
                $(".modi").prop("disabled", true);
                $(".modi").css("background-color", "#aaaaaa");
                $("#repwd").css("background-color", "#FFCECE");

            }
        }

        function checkEmail() {
            var inserted = $('#checkemail').val();
            $.ajax({
                data: {
                    email: inserted
                },
                url: "checkEmail",
                success: function(data) {
                    if (inserted == "" && data == '0') {
                        $(".modi").prop("disabled", true);
                        $(".modi").css("background-color", "#aaaaaa");
                        $("#checkemail").css("background-color", "#FFCECE");
                        $("#emailMsg").html("이메일을 입력해주세요.")
                        chkEmail = 0;
                    } else if (data == '0') {
                        $("#checkemail").css("background-color", "#B0F6AC");
                        $("#emailMsg").html("사용 가능한 이메일입니다.")
                        chkEmail = 1;
                        if (chkPwd == 1 && chkEmail == 1 && chkGenre == 1 && chkFile == 1) {
                            $(".modi").prop("disabled", false);
                            $(".modi").css("background-color", "#4CAF50");
                        }
                    } else if (data >= '1') {
                        $(".modi").prop("disabled", true);
                        $("#emailMsg").html("이미 존재하는 이메일입니다.")
                        $(".modi").css("background-color", "#aaaaaa");
                        $("#checkemail").css("background-color", "#FFCECE");
                        chkEmail = 0;
                    }
                }
            });
        }

        function readURL(input) {

            var chkImg = document.getElementById('input_img').value
            chkImg = chkImg.slice(chkImg.indexOf(".") + 1).toLowerCase();
            if (chkImg != "jpg" && chkImg != "jpeg" && chkImg != "gif" && chkImg != "png" && chkImg != "bmp") {
                chkFile = 0;
                $(".modi").prop("disabled", true);
                alert("이미지 파일만 올려주세요");
                $('#upload').attr('src', "/img/anonymous.png");
            } else if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    $('#upload').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
                chkFile = 1;
                if (chkPwd == 1 && chkEmail == 1 && chkGenre == 1 && chkFile == 1) {
                    $(".modi").prop("disabled", false);
                    $(".modi").css("background-color", "#4CAF50");
                }
            }
        }
    
</script>
</head>
<body>

    <div id="titl">
        <img id="logo" src="/img/playButton.PNG" alt="플레이로고">
        <h2>회원 정보 수정</h2>
    </div>
    <div id=container>
        <form action='edit' method='post' enctype="multipart/form-data">
            <h3>아이디</h3>
            <div id="id">${id}</div>
            <h3>비밀번호</h3>
            <input type="password" placeholder="8자 이상 영어, 숫자, 특수문자 포함"
                name="password" required class="pass" id="pwd" oninput="checkPwd()"
                size=30><br> <span id="pwdMsg"></span>
            <h3>비밀번호 확인</h3>
            <input type="password" placeholder="위와 같은 비밀번호를 써주세요"
                name="psd-repeat" required class="pass" id="repwd"
                oninput="checkPwd()" size=30> <br> <span
                id="rePassword"></span>
            <div class="imgfile">
            <h3>사진</h3>
            <img id="upload" src="/img/anonymous.png" alt="기본이미지" style="height:200px; width: 200px;"><br>
            <input type='file' name='file1' id='input_img' onchange="readURL(this);"/>
            </div>
            <h3>이메일</h3>
            <input type="email" name="email" required class="email"
                oninput="checkEmail()" id="checkemail" size=30> <br> <span
                id="emailMsg"></span>
            <h3>닉네임</h3>
            <div id="nick">${nick}</div>
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
                onclick="ChkCount(this)" value="rap"><label for="rap">랩</label><br><br>
            <button class="modi" disabled="disabled" type="submit">수정완료</button>
        </form>
    </div>
</body>
</html>