<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>Indisker: 버스커 회원가입</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link href="/../css/common.css" rel="stylesheet">
<style>
th {
    text-align: right;
}

#logo{
width: 40px; 
height:40px; 
float: left; 
margin-top: -4px;
margin-right: 0.5rem;
}

#titl{
margin-top: 5%;
margin-bottom: 3%;
}

#titl h3{
float: left; 
margin-top: 1px;
font-size: 24px;
}

body{
background-color: snow;
}

.container {
    background-color: white;
}

.join_form {
    border: 1px solid silver;
    border-radius: 10px;
    margin: 0px auto;
    margin-bottom: 10%;
    background-color: #ebebeb;
}

label {
    margin-bottom: 0px;
    font-family: "Open Sans", Helvetica, sans-serif;
    font-size: 14px;
    font-weight: 900;
    margin-top: 0.5rem;
}

span{
font-family: "Open Sans", Helvetica, sans-serif;
    font-size: 12px;
}

form {
    margin: 0px auto;
    padding: 5% 10%;
}

#join_form input {
    font-family: "Open Sans", Helvetica, sans-serif;
    font-size: 11px;
    position: relative;
    width: 80%;
    background-color: #ebebeb;
    border-bottom: 1px solid black;
    border-right: none;
    border-top: none;
    border-left: none;
}

input:focus {
    outline: none;
    border-bottom: 2px double black;
    background-color: #ebebeb;
}

 input:hover {
    border-bottom: 2px double black;
    background-color: #ebebeb;
} 

input:invalid {
    box-shadow: none;
}

#upload {width: 100%; height: 100%;/*  margin-top: 1rem; padding-left: 8rem; */}
/* #input_img {
    padding-top: 20px;
} */

.signupbtn:disabled {
    cursor: not-allowed;
    background-color: #3F51D1;
    border-radius: 12px;
}

.signupbtn {
    background-color: #3F51D1;
    border-radius: 12px;
    margin-right: 2%;
    margin-left: 79%;
    height: 2rem;
    padding-top: 0;
    padding-bottom: 0;
    }

#genre {
    width: 80%;
     font-family: "Open Sans", Helvetica, sans-serif;
    font-size: 13px;
    border-radius: 3px;
    margin-bottom: 6%;
    background-color: #ebebeb; 
    border-left: none;
    border-top: none;
    border-right: none;
    border-bottom: 1px solid black;
}

#teamInfo{resize: none;}
#input_img{opacity: 0;}
.txtsize{text-align: right; width: 21rem; font-size: small;}
</style>
</head>
<jsp:include page="../../header.jsp"></jsp:include>
<body>

<div class="title container">
<div class="row">
    <div id="titl" class='col-lg-8'>
        <img id="logo" src="../../../img/playButton.PNG" alt="플레이로고">
        <h3><b>버스커 되기</b>>> 동영상 올리기 >> 신청완료</h3>
    </div>
    </div>
    </div>
    
    <div class=container>
        <div class="row">
        <div class='col-lg-12'>
            <div class="join_form col-lg-8">
        <form action='addavi' method='post' enctype="multipart/form-data" id='join_form'>
            <label for="teamname">팀명</label><br>
            <input type='text' name='teamname' oninput="checkName()" id="teamname"
                size=30 autocomplete="off"><br> <span id="nameMsg"></span><br>
             <label for="genre">장르</label><br>
            <select name="teamgenre" id="genre" min-width:"100px">
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
             <label for="city">도시</label><br>
            <input type="text" name="city" id="city" oninput="checkCity()"
                size=30 autocomplete="off"><br> <span id="cityMsg"></span><br>
             <label for="tel">전화번호</label><br>
            <input type="tel" name="tel" id="tel" oninput="checkTel()" size=30 autocomplete="off" onfocus="checkCity()">
            <br> <span id="telMsg"></span><br>
             <label for="instrument">악기</label><br>
            <input type="text" name="instrument" size=30 id="instrument" autocomplete="off" onfocus="checkTel()"> <br>
            <label for="teamInfo">팀 소개</label><br>
            <textarea name="teamInfo" id="teamInfo" autocomplete="off" rows="4" cols="40" placeholder="최대 250자까지 입력됩니다."></textarea><br>
            <div class='txtsize'>(0/250)</div>
            <div class='teamphoto'>
            <label for="input_img">팀 사진
            <img id="upload" src="/img/anonymous.png" alt="기본이미지"></label><br>
            </div>
            <input type='file' name='file1' id='input_img' onchange="readURL(this);" />
            <br><br><button class="signupbtn btns btns btns-outline-light" disabled="disabled">다음으로</button>
        </form>
        </div>
        </div>
    </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="/js/signupBusker2.js" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</body>
<jsp:include page="../../footer.jsp"></jsp:include>
</html>