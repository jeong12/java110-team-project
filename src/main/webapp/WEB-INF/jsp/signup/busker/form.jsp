<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>Indisker: 버스커 회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="/js/signupBusker.js" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
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
/* margin-left: 11%; */
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
}

label {
    margin-bottom: 0px;
    font-family: "Open Sans", Helvetica, sans-serif;
    font-size: 14px;
    font-weight: 900;
}

span{
font-family: "Open Sans", Helvetica, sans-serif;
    font-size: 12px;
}

form {
    margin: 0px auto;
    padding: 5% 10%;
}

input {
    font-family: "Open Sans", Helvetica, sans-serif;
    font-size: 11px; border : none;
    border-bottom: 2px solid #ebebeb;
    position: relative;
    width: 80%;
    border: none; border-bottom : 2px solid #ebebeb; position : relative;
    width : 80%;
    margin-bottom: 5%;
}

input:focus {
    outline: none;
    border-bottom-color: #3CC !important;
}

input:hover {
    border-bottom-color: #3CC;
}

input:invalid {
    box-shadow: none;
}

#upload {
    width: 64%;
    padding-left: 25%;
}
#input_img {
    padding-top: 20px;
}

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

select {
    width: 80%;
     font-family: "Open Sans", Helvetica, sans-serif;
    font-size: 13px;
    border: 1px solid silver;
    border-radius: 3px;
    margin-bottom: 6%;
}

#input_img{opacity: 0;}
</style>
</head>
<jsp:include page="../../header.jsp"></jsp:include>
<body>

<div class="title container">
<div class="row">
    <div id="titl" class='col-lg-8'>
        <img id="logo" src="../../../img/tum.png" alt="플레이로고">
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
            <select name="teamgenre" onchange="checkGenre()" id="genre" min-width:"100px" autocomplete="off">
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
            <input type="tel" name="tel" id="tel" oninput="checkTel()" size=30 autocomplete="off">
            <br> <span id="telMsg"></span>
             <label for="instrument">악기</label><br>
            <input type="text" name="instrument" size=30 id="instrument" autocomplete="off"> <br>
            <label for="straming">스트리밍 url</label><br>
            <input type="text" name="streamingUrl" size=30 id="straming" autocomplete="off"> <br>
            <label for="teamInfo">팀 소개</label><br>
            <input type="text" name="teamInfo" size=30 id="teamInfo" autocomplete="off"> <br>
            
            <label for="input_img">사진</label><br>
            <img id="upload" src="/img/anonymous.png" alt="기본이미지"><br>
            <input type='file' name='file1' id='input_img' onchange="readURL(this);" />
            <br><br><button class="signupbtn btns btns btns-outline-light" disabled="disabled">다음으로</button>
        </form>
        </div>
        </div>
    </div>
    </div>
</body>
<jsp:include page="../../footer.jsp"></jsp:include>
</html>