<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Indisker : 버스커 회원가입</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"/>
<link href="/../css/common.css" rel="stylesheet">
<style>

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

.message {
	margin: 0px auto;
	padding: 5%;
	font-size: 1.2rem;
}

input {
	font-family: "Open Sans", Helvetica, sans-serif;
	border: none;
	border-bottom: 2px solid #ebebeb;
	padding-bottom: 10px;
	position: relative;
	width: 75%;
}
.join_form {
    margin: 0px auto;
    border: 1px solid silver;
    border-radius: 10px;
    padding-bottom: 5%;
    margin-bottom: 11%;
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

#btn:disabled {
	cursor: not-allowed;
	background-color: #aaaaaa;
	border-radius: 12px;
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
    margin-left: 83%;
    height: 2rem;
    padding-top: 0;
    padding-bottom: 0;
    margin-top: 5%;
    }

.countsort{
    position : relative;
    width : 100%;
    height : 0;
    padding-bottom : 56.25%;
}


.video{
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
}

.insert{
padding: 5% 3%;
}

.insertbtn{
    background-color: #3F51D1;
    margin: 0 auto;
    float: right;
    width: 4rem;
    height: 2rem;
    font-size: 0.8rem;
    padding: 0%;
}

label{
margin: 0 auto;
padding-right: 1%;
}

input::-webkit-input-placeholder{text-align: center;}

</style>
</head>
<jsp:include page="../../header.jsp"></jsp:include>
<body>

<div class="title container">
<div class="row">
    <div id="titl" class='col-lg-8'>
        <img id="logo" src="../../../img/tum.png" alt="플레이로고">
        <h3>버스커 되기 >> <b>동영상 올리기</b> >> 신청완료</h3>
    </div>
    </div>
    </div>
    

<div class='container'>
 <div class='row'>
  <div class='col-lg-12'>
   <div class='join_form col-lg-10'>
    <p class='message'>영상이 제대로 올려졌는지 재생버튼을 눌러서 확인해 주시길 바랍니다.</p>
     <div class='countsort col-log-6'>
	  <iframe type="text/html" src='https://www.youtube.com/embed/GeeM2V15QFY' frameborder="0"
	          class="video">동영상</iframe>
     </div>
	 <form action='add' method='post' enctype="multipart/form-data" class='form-group'>
	   <div class="insert">
	   <label for="url1">url1</label>
	   <input type="text" placeholder="youtube url를 적어주세요"  name=url1 id="url1" autocomplete="off">
	   <button type="button" class='insertbtn btns btns btns-outline-light' id="btn1" onclick="btn1_click()">추가</button><br>
	   </div>
	   <div class="insert">
	   <label for="url2">url2</label>
	   <input type="text" placeholder="youtube url를 적어주세요" name=url2 id="url2" autocomplete="off">
	   <button type="button" class='insertbtn btns btns btns-outline-light' onclick="btn2_click()" id="btn2">추가</button><br>
	   </div>
	   <button class= 'signupbtn btns btns btns-outline-light' disabled="disabled">가입하기</button>
	 </form>
	</div>
  </div>
</div>
</div>

	<script>
		var chkUrl1 = 0;
		var chkUrl2 = 0;

		function btn1_click() {
			var furl = ($('#url1').val());
			var contain = furl.indexOf('=');
			var id = furl.split('=')[1];
			console.log(furl);
			console.log(contain);
			console.log(id);
			
			if (furl.length <= 0) {
				$('.signupbtn').prop("disbled", true);
				alert("영상 주소를 입력해주세요");
			} else if (furl.length > 0) {
				chkUrl1 = 1;
				if(contain<0) {
					$('.signupbtn').prop("disbled", true);
					alert("정확한 영상 주소를 입력해주세요");
				}else{
				$('.video').attr('src', 'https://www.youtube.com/embed/'+id);				   
				}
				if (chkUrl1 == 1 && chkUrl2 == 1) 
					$('.signupbtn').prop("disabled", false);
			}
		};

		function btn2_click(e) {
			var surl = ($('#url2').val());
			var contain = surl.indexOf('=');
            var id = surl.split('=')[1];
            
			if (surl.length <= 0) {
				$('.signupbtn').prop("disbled", true);
				alert("영상 주소를 입력해주세요");
			} else if (surl.length > 0) {
				chkUrl2 = 1;
				if(contain<0) {
                    $('.signupbtn').prop("disbled", true);
                    alert("정확한 영상 주소를 입력해주세요");
				}else{
				$('.video').attr('src', 'https://www.youtube.com/embed/'+id);
				}
				if (chkUrl1 == 1 && chkUrl2 == 1) {
					$('.signupbtn').prop("disabled", false);
				}
			}
		}
	</script>

</body>
<jsp:include page="../../footer.jsp"></jsp:include>
</html>