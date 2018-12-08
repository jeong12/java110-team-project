<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>버스커 리스트</title>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css"/>
<link rel="stylesheet" href="../../css/common.css"/>
<link rel="stylesheet" type="text/css"  href="/../css/jquery.datetimepicker.css">

<style>
    body{background-color: snow;}
    table{border-collapse: separate;border-spacing: 10px 20px; margin : 0 auto;}  
    .container{border:1px solid silver; height:47rem; margin: 0 auto; border-radius: 10px; background-color: white;
    margin-top: 7%; margin-bottom: 4%}
    .form-horizontal{ margin: auto;}
    .All{width:100%;  margin-top: 6%;}
    .left{width: 60%; float: left; padding-left: 4%;}
    .right{width: 40%; float: right; padding-left: 5%;}
     .bbtn{clear: both;}
    .leftlabel{float: left; margin-top: 1%;}
    .form-control{margin-right: 7%;}
    .imguppend{width: 10%; height: 10%;}
    #textinput{width: 40%; float:right; margin-right: 40%;margin-bottom: 1%;}
    #textinput2{width: 23%; float:left; margin-left: 11%; margin-right: 0%; margin-bottom: 1%;}
    #textinput3{width: 23%; margin-bottom: 1%;}
    label{float:left; margin-left: 5%;}
    #labelb{margin-left: 1%; margin-right: 1%; margin-top: 1%;}
    #textinputmember{width: 15%; margin-left: 20%;}
    .blabel{margin-left: 7%;}
    #textarea{width: 40%; margin-left:15%; height: 15rem;}
    #upload1{width: 29rem; height: 21rem; border: 1px solid silver;}
    .xybtn{width: 30%; margin: auto;}             
    .lbtn{float: left;}
    .rbtn{float: right;}
    #logo{width: 40px; height:40px; float: left; margin-top: -4px;}
    #titl{margin-top: 2%; margin-left: 19%;}
    #titleh2{float: left; margin-top: 0;}
</style>
</head>
<header>
<jsp:include page="../header.jsp"></jsp:include>
  </header>  
    <div id="titl">
        <img id="logo" src="../../img/playButton.png" alt="플레이로고">
        <h2 id="titleh2">무대관리</h2>
    </div>
    
<body>         

<div class="container">

<form action='add' method='post' enctype="multipart/form-data" id="add" class="form-horizontal">
<div class="All">
<div class="left">
<div class="form-group">
  <label class="leftlabel" for="textinput">제목</label>  
  <input id="textinput" name="titl" type="text" placeholder="제목을 입력하시오" class="form-control input-md">
</div>
<div class="form-group">
  <label class="leftlabel" for="textinput">장르</label>  
  <input id="textinput" name="genre" type="text" placeholder="장르를 입력하시오" class="form-control input-md">
</div>
<div class="form-group">
  <label class="leftlabel" for="textinput">도시</label>  
  <input id="textinput" name="city" type="text" placeholder="도시를 입력하시오" class="form-control input-md">
</div>     
<div class="form-group">
  <label class="leftlabel" for="textinput">인원</label>  
  <input id="textinputmember" name="cnt" type="number" min="1"  placeholder="인원" class="member form-control input-md">
</div>
<div class="form-group" id='datetimepicker1'>
  <label class="leftlabel" for="textinput">날짜</label>  
  <input id="textinput2" name="sdt" type="text" placeholder="시작일을 입력하시오" class="form-control input-md" autocomplete="off">
  <label id="labelb">~</label>
  <input id="textinput3" name="edt" type="text" placeholder="종료일을 입력하시오" class="form-control input-md" autocomplete="off">
</div>
<div class="form-group">
  <label class="leftlabel" for="textinput">연락처1</label>  
  <input id="textinput" name="tel1" type="tel" placeholder="연락처를 입력하시오" class="form-control input-md">
</div>
<div class="form-group">
  <label class="leftlabel" for="textinput">연락처2</label>  
  <input id="textinput" name="tel2" type="tel" placeholder="연락처를 입력하시오" class="form-control input-md">
</div>
</div>
<div class="right">
<div class="imguppend">
<img id="upload1" name="" alt="기본이미지" src="/img/anonymous.png">
</div>
<div class="form-group">
  <label class=" control-label" for="filebutton">사진</label>
    <input id="filebutton" name="file1" class="input-file" type="file" onchange="readURL1(this)">
</div>
</div>
</div>
<div class="bbtn">
<div class="form-group">
  <label class="blabel" for="textarea">홍보내용</label>  
   <textarea class="form-control" id="textarea" name="etc">입력좀</textarea>
</div>
</div>
<div class="xybtn">
<div>
    <button type="button" onclick="hihihi()" id="send" class="btns btns-outline-success btn-sm">확인</button>
</div>   
 <div>
    <button type="button" class="btns btns-outline-dark">뒤로가기</button>
</div> 
</div>

<!--  -->
</form>
</div>
<button type="button" class="btns btns-outline-primary">Primary</button>
<button type="button" class="btns btns-outline-secondary">Secondary</button>
<button type="button" class="btns btns-outline-success">Success</button>
<button type="button" class="btns btns-outline-danger">Danger</button>
<button type="button" class="btns btns-outline-warning">Warning</button>
<button type="button" class="btns btns-outline-info">Info</button>
<button type="button" class="btns btns-outline-light">Light</button>
<button type="button" class="btn btns-outline-dark">Dark</button>

<!--Dark-green-->
<button type="button" class="btn">Dark-green</button>

<!--Light-green-->
<button type="button" class="btn btn-light-green">Light-green</button>

<!--Yellow-->
<button type="button" class="btn btn-yellow">Yellow</button>

<!--Amber-->
<button type="button" class="btn btn-amber">Amber</button>

<!--Deep-orange-->
<button type="button" class="btn btn-deep-orange">Deep-orange</button>

<!--Brown-->
<button type="button" class="btn btn-brown">Brown</button>

<!--Blue-grey-->
<button type="button" class="btn btn-blue-grey">Blue-grey</button>

</body>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="/js/time/jquery.datetimepicker.full.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script src="/js/fullcalendar.min.js" type="text/javascript"></script>
<script
    src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script>
function hihihi(){
	var titl = $("input[name='titl']").val();
	var gnere = $("input[name='genre']").val();
	var city = $("input[name='city']").val();
	var cnt = $("input[name='cnt']").val();
	var sdt = $("input[name='sdt']").val();
	var edt = $("input[name='edt']").val();
	var tel1 = $("input[name='tel1']").val();
	var file1 = $("input[name='file1']").val();
	    if(titl == ''){
	    	swal("잠깐!","제목을 입력하세요.","error");}
	    else if(gnere == ''){
	    	swal("잠깐!","장르를 입력하세요.","error");}
	    else if(city == ''){
	    	swal("잠깐!","도시를 입력하세요.","error");}
	    else if(cnt == ''){       
	    	swal("잠깐!","인원을 입력하세요.","error");}
	    else if(sdt == ''){
	    	swal("잠깐!","시작일을 입력하세요.","error");}
	    else if(edt == ''){
	    	swal("잠깐!","끝일을 입력하세요.","error");}
	    else if(tel1 == ''){
	    	swal("잠깐!","전화번호를 입력하세요.","error");}
	    else if(file1 == ''){
	    	swal("잠깐!","사진을 추가해주세요.","error");}
	    else{
	    	$('#add').submit();
	    }
		   
}       

function readURL1(input) {
    var chkImg = document.getElementById('filebutton').value
    chkImg=chkImg.slice(chkImg.indexOf(".")+1).toLowerCase();
    console.log(chkImg);
    if(chkImg !="jpg" && chkImg !="jpeg" &&
            chkImg !="gif" && chkImg !="png" && chkImg !="bmp"){
        chkFile1=0;
        $(".signupbtn").prop("disabled", true);
        alert("이미지 파일만 올려주세요");
        $('#upload1').attr('src', "/img/default_image.png");}
    else if (input.files && input.files[0]){
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#upload1').attr('src', e.target.result); }
        reader.readAsDataURL(input.files[0]);
        chkFile1 = 1;

       /* if(chkName==1 && chkDetAddr ==1 && chkCapa ==1  && chkTel ==1 && chkFile1==1 && chkFile2==1 && chkFile3==1) {
            $(".signupbtn").prop("disabled", false);
            $(".signupbtn").css("background-color", "#4CAF50");
        } */
    }
};

var mini;
var maxi;
$(function(){
$('#textinput2').datetimepicker({
minDate:0,
timepicker:false,
dateformat:'yy-mm-dd',
});


$('#textinput2').change(function () {
	$('#textinput3').focus();
	var d = $('#textinput2').val()
	mini = d.substring(0,10);
	
	$('#textinput3').datetimepicker({
		minDate:mini
	})
})

$('#textinput3').datetimepicker({
	minDate:mini,
	timepicker:false,
	dateformat:'yy-mm-dd'
});

$('#textinput3').change(function () {
    var da = $('#textinput3').val()
    var maxi = da.substring(0,10);
    
    $('#textinput2').datetimepicker({
        maxDate:maxi
    })
})


});

</script>
<jsp:include page="../footer.jsp"></jsp:include>
</html>