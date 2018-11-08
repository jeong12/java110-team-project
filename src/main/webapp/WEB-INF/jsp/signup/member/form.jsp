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
            <input type='text' name='id' 
            required class="id" oninput="checkId()" id="checkid" size=30>
            <h3>비밀번호</h3>
            <input type="password" placeholder="10자 이상 영어, 숫자, 특수문자 포함" name="upwd" 
             required class="pass" oninput="checkPwd()" size=30>
            <h3>비밀번호 확인</h3>
             <input type="password" placeholder="위와 같은 비밀번호를 써주세요" name="psd-repeat" 
                required class="pass" id="repwd" oninput="checkPwd()" size=30> 
            <h3>이메일</h3>
            <input type="text" name="email" 
               required class="id" oninput="checkEmail()" id="checkemail" size=30> 
            <h3>이름</h3>
            <input type="text" placeholder="실명을 적어주세요" name='name' size=30>
            <h3>닉네임</h3>
            <input type="text" name="nickname"
            required class="id" id="nickname" oninput="checkNickname()" size=30> 
            <h3>사진</h3>
            <input type='file' name='file1'>
            <h3>선호하는 장르</h3>
            <select name="genre" multiple>
                <option valuse="">선호장르 선택</option>
                <option valuse="발라드">발라드</option>
                <option valuse="재즈">재즈</option>
                <option valuse="힙합">힙합</option><br>
            </select> 
            <p>팬으로 가입하셔도, 이후 메인화면의 <br>
            '버스커되기' '제공자되기'로 변경 가능합니다.
            </p>
            <button>팬으로 가입</button>
            <button>버스커로 가입</button>
            <button>무대 제공자로 가입</button>
        </form>
    </div>
</body>
</html>