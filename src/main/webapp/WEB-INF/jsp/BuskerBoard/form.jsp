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
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
    body{background-color: snow; margin-top: 10%;}
    table{border-collapse: separate;border-spacing: 10px 20px; margin : 0 auto;}  
    .container{border:1px solid silver; width:60%; height:70rem; margin: 0 auto; border-radius: 10px; background-color: white;}
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
</style>
</head>
<body>         

<div class="container">

                         
<!-- text -->
<form action='add' method='post' enctype="multipart/form-data"  class="form-horizontal">
<div class="All">
<!-- Form Name -->
<div class="left">

<!-- Text input-->
<div class="form-group">
  <label class="leftlabel" for="textinput">제목</label>  
  <div class="">
  <input id="textinput" name="titl" type="text" placeholder="제목을 입력하시오" class="form-control input-md">
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="leftlabel" for="textinput">장르</label>  
  <div class="">
  <input id="textinput" name="genre" type="text" placeholder="장르를 입력하시오" class="form-control input-md">
  </div>               
</div>

<!-- Text input-->
<div class="form-group">
  <label class="leftlabel" for="textinput">도시</label>  
  <div class="">
  <input id="textinput" name="city" type="text" placeholder="도시를 입력하시오" class="form-control input-md">
  </div>
</div>     

<!-- Text input-->
<div class="form-group">
  <label class="leftlabel" for="textinput">인원</label>  
  <div class="">
  <input id="textinputmember" name="cnt" type="number" min="1" max="10" placeholder="인원" class="member form-control input-md">
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="leftlabel" for="textinput">날짜</label>  
  <div class="">
  <input id="textinput2" name="sdt" type="date" placeholder="시작일을 입력하시오" class="form-control input-md">
  <label id="labelb">~</label>
  <input id="textinput3" name="edt" type="date" placeholder="종료일을 입력하시오" class="form-control input-md">
  </div>
</div>


<!-- Text input-->
<div class="form-group">
  <label class="leftlabel" for="textinput">연락처1</label>  
  <div class="">
  <input id="textinput" name="tel1" type="tel" placeholder="연락처를 입력하시오" class="form-control input-md">
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="leftlabel" for="textinput">연락처2</label>  
  <div class="">
  <input id="textinput" name="tel2" type="tel" placeholder="연락처를 입력하시오" class="form-control input-md">
  </div>
</div>




</div>
<!--  -->

<div class="right">

<div class="imguppend">
<img id="upload1" name="" alt="" src="">
</div>

<!-- File Button --> 
<div class="form-group">
  <label class=" control-label" for="filebutton">사진</label>
  <div class="">
    <input id="filebutton" name="file1" class="input-file" type="file" onchange="readURL1(this)">
  </div>
</div>

<!-- File Button --> 
<div class="form-group">
  <label class="" for="">버스커 번호</label>
  <div class="">
    <input id="filebutton" name="bno" class="input-file" type="text" onchange="readURL1(this)">
  </div>
</div>


</div>


</div>


<div class="bbtn">

<!-- Text input-->
<div class="form-group">
  <label class="blabel" for="textarea">홍보내용</label>  
  <div class="">
   <textarea class="form-control" id="textarea" name="etc">입력좀</textarea>
  </div>
</div>




</div>
<div class="xybtn">
<!-- Button -->
<div>
    <button class="lbtn btn btn-primary">확인</button>
</div>   

<!-- Button -->
<!-- <div>
 
    <button type="button"  class="rbtn btn btn-primary">뒤로가기</button>
 
</div> -->
</div>

</form>
<!-- text end -->

<!--  insert 
<form action='add' method='post' enctype="multipart/form-data">
<table id="table">
<tbody>
<tr>
    <th>제목</th>
    <td><input type='text' name='titl'></td>
</tr>
<tr>
    <th>장르</th>
    <td><input type='text' name='genre'></td>
</tr>
<tr>
    <th>도시</th>
    <td><input type="text" name='city'></td>
</tr>
<tr>
    <th>인원</th>
    <td><input type='number' name='cnt'></td>
</tr>
<tr>
    <th>시작일</th>
    <td><input type='text' name='sdt'></td>
</tr>
<tr>
    <th>종료일</th>
    <td><input type='text' name='edt'></td>
    </tr>
<tr>
<tr>
    <th>연락처1</th>
    <td><input type='text' name='tel1'></td>
    </tr>
<tr>
<tr>
    <th>연락처</th>
    <td><input type='text' name='tel2'></td>
    </tr>
<tr>
<tr>
    <th>홍보내용</th>
    <td><input type='text' name='etc'></td>
    </tr>
<tr>
<tr>
    <th>사진</th>
    <td><input type='text' name='phot'></td>
    </tr>
<tr>
<tr>
    <th>버스커번호</th>
    <td><input type='text' name='bno'></td>
    </tr>
<tr>
    <th></th>
    <td><button>버스커 홍보올리기</button></td>
</tr>
</tbody>
</table>
insert끝
</form> -->
</div>
</body>

<script>
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

</script>
</html>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    