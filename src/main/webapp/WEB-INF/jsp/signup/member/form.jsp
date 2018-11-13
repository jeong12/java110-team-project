<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 회원 가입</title>
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
                name="password" required class="pass" id="pwd" oninput="checkPwd()"
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
            <button class="signupbtn" disabled="disabled" onclick="sendMsg()" name="type" value="fan">팬으로 가입</button>
            <button class="signupbtn" disabled="disabled" onclick="sendMsg()" name="type" value="busker">버스커로 가입</button>
            <button class="signupbtn" disabled="disabled" onclick="sendMsg()" name="type" value="supporter">무대 제공자로 가입</button>
        </form>
    </div>
    <script src="/js/signupMember.js" type="text/javascript"></script>
</body>
</html>