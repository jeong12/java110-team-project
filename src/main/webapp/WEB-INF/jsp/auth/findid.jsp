<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="en" id="top">
<head>
<meta charset="UTF-8">
<title>아이디 비밀번호 찾기</title>
<link rel="stylesheet" href="/css/common.css"/>
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>
#titl {
    margin: 20px 10px 20px 0;
    padding: 0;
}

#logo {
    width: 40px;
    height: 40px;
    margin: 6px;
}

.findidcontent {
    /* margin-top: 150px; */
    position:static;
    margin-left: auto;
    margin-right: auto;
/*     margin-bottom: 200px; */
}
.findidcontent p {
margin: 5px 0;
padding: 5px 0;
}

#titlefind {
    margin-top: 50px;
    margin-bottom: 100px;
    margin-left: 10%;
}

.btns btns-outline-dark {
    margin-bottom: 150px;
}
.contitl{
/*     margin-top: 130px; */
/*     color: #fff;
    background-color: #000000; */
    font-weight: 600;
    padding: 10px;
    /* border-radius: 0.25rem; */
    width: 320px;
/*     border-bottom: 1px double #555; */
    margin-left: auto;
    margin-right: auto;
}
.conp{
    width: 100%;
    /* border-bottom: 5px solid #000000; */
}
.email{
    border-radius: 0.25rem;
    background-color: white;
    -webkit-appearance: textfield;
    background-color: white;
    -webkit-rtl-ordering: logical;
    cursor: text;
    padding: 1px;
    border-width: 2px;
    border-style: inset;
    border-color: initial;
    border-image: initial;
    margin: 5px 2px 3px 0;
    width: 250px;
}
.btns{
    padding: 2px 8px;
    margin: 10px 5px 5px;
    font-size: 15px;
    width: 300px;
}
.btns-outline-dark {
  color: #fff;
  background-color: #555;
  border-color: #555;
}
.btns-outline-dark:hover {
  color: #555;
  background-color: transparent;
  background-image: none;
  border-color: #555;
}
.more-button{
    margin-top: 25px;
    margin-bottom: 30px; 
}
.more-button:hover{
    color: #fff;
}

/* button{
  background:#000000;
  color:#fff;
  border:none;
  position:relative;
  height:30px;
  font-size:0.9em;
  padding:4px 10px;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:#000000;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #000000;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
} */

a#movetop {
    position: fixed; right: 2%; bottom: 82px; display: none; z-index: 999;
}
    </style>
</head>
<jsp:include page="../header.jsp"></jsp:include>
<body>
    <div class="container"> 
          <div class="findidcontent" style="width: 40rem">
	        <div id="pos"></div>
	        <div id="titl">
            <h3><img id="logo" src="../../img/playButton.PNG" alt="플레이로고">아이디 비밀번호 찾기</h3>
        </div>
	          <!-- <form action="idis" method="get" class="contentdetail"> -->
	               <div style="text-align: center; border: 2px solid #555; border-radius:0.25rem; margin-bottom: 25px; padding-bottom: 10px;">
		               <h2 class="contitl">아이디 찾기</h2>
		               <p class="conp">회원가입시 입력한 이메일을 입력해 주세요.</p>
		               <p style="font-weight: 600;">이메일 <input type="email" name="email" class="email" placeholder="email" id='findemail' autocomplete="off">
	                   <br><button class="btns btns-outline-dark" id='findemailbtn'>전송</button></p>
	               </div>
	          <!-- </form> -->
	
	           <!-- <form action="checkemail" method="post" class="contentdetail"> -->
		           <div style="text-align: center; border: 2px solid #555; border-radius:0.25rem; padding-bottom: 10px;">
		               <h2 class="contitl">비밀번호 찾기</h2>
		               <p>회원가입시 등록한 아이디와 이메일 주소를 입력하시면 </p>
		               <p class="conp">해당 메일로 비밀번호와 초기화 메일이 발송됩니다.</p>
		               <p style="font-weight: 600;">아이디 <input type="text" class="email" name="id" placeholder="ID" id='findpwid' autocomplete="off">
		               <br>이메일 <input type="email" name="email" class="email" placeholder="email" id='findpwemail' autocomplete="off">
		               <br><button class="btns btns-outline-dark" id='findpwbtn'>전송</button></p>
		           </div>
	           <!-- </form> -->
	           <div style="text-align: center;">
	               <a href="/app/main" class="more-button" style="text-decoration: none;">메인으로 돌아가기</a>
	           </div>
           </div>
       </div>
<!-- <a href="#" id="movetop"><img src="../../img/topbtn.png"></a> -->

  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script src="/js/headerfixing.js"></script>
  <script src="/js/promotion/promofilter.js"></script>
  <script src='../../js/jquery.easing.1.3.js'></script>

<script>
$('#findemailbtn').click(function(){
	var email= $('#findemail').val();
	
	$.ajax({ 
        type : "POST", //보내는 타입을 Post방식으로 할지,  GET방식으로 할지 결정
        url : "nodata", 
        dataType: 'json',
        data : { 'email' : email }, //파라미터 넘겨줄 부분? : 이게 할말이 많은데 원래 GET방식으로 하라했다가 
        success : function(data) { // delete, update문 같은 경우에는 기본적으로 int값을 반환함.
        	if(data.id==null){
        		swal("확인해주세요","입력하신 이메일과 일치하는 정보가 없습니다.","error");
        	}else{
        		 window.location = '/app/auth/idis?id='+data.id;
        		 //callidis(data.id);
        	}
        },
        error : function(request, status, error) {
        	swal("오류","시스템 오류","error");
        }
    });
});

$('#findpwbtn').click(function(){
	var id = $('#findpwid').val();
    var email= $('#findpwemail').val();
    
    $.ajax({ 
        type : "POST", //보내는 타입을 Post방식으로 할지,  GET방식으로 할지 결정
        url : "nodatapw", 
        dataType: 'json',
        data : { 'id' : id,
                 'email': email}, //파라미터 넘겨줄 부분? : 이게 할말이 많은데 원래 GET방식으로 하라했다가 
        success : function(data) { // delete, update문 같은 경우에는 기본적으로 int값을 반환함.
            if(data.yes==null){
                swal("확인해주세요","입력하신 이메일과 아이디가 일치하지 않습니다.","error");
            }else{
                 window.location = '/app/auth/checkemail';
                 console.log(data.yes)
            }
        },
        error : function(request, status, error) {
            swal("확인해주세요","입력하신 이메일과 아이디가 일치하지 않습니다.","error");
        }
    });
});



$(document).scroll(function(){
    var pos = document.getElementById('pos'); 
    var movetop = document.getElementById('movetop');
    if($(pos).attr('value') > 50){
        movetop.style.display = 'block';
    } else{
        movetop.style.display = 'none';
    }
 });
 
 $('#movetop').click(function(){
     $('#top').animate({
          scrollTop:0
     }, 800, 'easeInQuart');
     return false;
 });
</script>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>