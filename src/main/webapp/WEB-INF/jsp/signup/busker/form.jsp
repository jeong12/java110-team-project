<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>버스커 회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="/js/signupBusker.js" type="text/javascript"></script>
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
         <h2><u>버스커 되기 </u> >>  동영상 올리기   >>  신청완료 </h2>
    </div>
    <div id=container>
        <form action='addavi' method='post' enctype="multipart/form-data">
            <h3>팀명</h3>
            <input type='text' name='teamname' oninput="checkName()" id="name"
                size=30><br> <span id="nameMsg"></span>
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
            </select>
            <h3>도시</h3>
            <input type="text" name="city" id="city" oninput="checkCity()"
                size=30><br> <span id="cityMsg"></span>
            <h3>연락처</h3>
            <input type="tel" name="tel" id="tel" oninput="checkTel()" size=30>
            <br> <span id="telMsg"></span>
            <h3>악기</h3>
            <input type="text" name="inst" size=30> <br>
            <h3>스트리밍 url</h3>
            <input type="text" name="strurl" size=30> <br>
            <h3>팀소개</h3>
            <input type="text" name="info" size=30> <br>
            <h3>사진</h3>
            <img id="upload" src="/img/anonymous.png" alt="기본이미지"><br>
            <input type='file' name='file1' id='input_img'
                onchange="readURL(this);" />
            <br><br><button class="signupbtn" disabled="disabled">다음으로</button>
        </form>
    </div>
</body>
</html>