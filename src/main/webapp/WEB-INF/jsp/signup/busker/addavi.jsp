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
<style>
.titl {
	margin: 10px;
	padding: 10px;
}

.titl img {
	width: 50px;
	height: 50px;
	margin: 10px;
}

h2 {
	margin-top: -50px;
	margin-left: 70px;
}

.join_form {
	margin: 0px auto;
	border: 1px solid silver;
	border-radius: 10px;
	padding-bottom: 8%;
}

p {
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

#btn {
	float: right;
	background-color: #1FBC02;
	border-radius: 12px;
	color: white;
	display: inline-block;
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
    margin: 0 auto;
    float: right;
}

label{
margin: 0 auto;
padding-right: 1%;
}

input::-webkit-input-placeholder{text-align: center;}

</style>
</head>
<body>

<div class='titl'>
<img id="logo" src="/img/playButton.PNG" alt="플레이로고">
<h2>버스커 되기 >> <b>동영상 올리기</b> >> 신청완료</h2>
</div>

<div class='container'>
 <div class='row'>
  <div class='col-lg-12'>
   <div class='join_form col-lg-10'>
    <p>영상이 제대로 올려졌는지 재생버튼을 눌러서 확인해 주시길 바랍니다.</p>
     <div class='countsort col-log-6'>
	  <iframe type="text/html" src='https://www.youtube.com/embed/GeeM2V15QFY' frameborder="0"
	          class="video">동영상</iframe>
     </div>
	 <form action='add' method='post' enctype="multipart/form-data" class='form-group'>
	   <div class="insert">
	   <label for="url1">url1</label>
	   <input type="text" placeholder="youtube url를 적어주세요"  name=url1 id="url1">
	   <button type="button" class='insertbtn btn-primary btn-sm' id="btn1" onclick="btn1_click()">추가</button><br>
	   </div>
	   <div class="insert">
	   <label for="url2">url2</label>
	   <input type="text" placeholder="youtube url를 적어주세요" name=url2 id="url2">
	   <button type="button" class='insertbtn btn-primary btn-sm' onclick="btn2_click()" id="btn2">추가</button><br>
	   </div>
	   <button disabled="disabled" id="btn">가입하기</button>
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
				$('#btn').prop("disbled", true);
				alert("영상 주소를 입력해주세요");
			} else if (furl.length > 0) {
				chkUrl1 = 1;
				if(contain<0) {
					$('#btn').prop("disbled", true);
					alert("정확한 영상 주소를 입력해주세요");
				}else{
				$('.video').attr('src', 'https://www.youtube.com/embed/'+id);				   
				}
				if (chkUrl1 == 1 && chkUrl2 == 1) 
					$('#btn').prop("disabled", false);
			}
		};

		function btn2_click(e) {
			var surl = ($('#url2').val());
			var contain = surl.indexOf('=');
            var id = surl.split('=')[1];
            
			if (surl.length <= 0) {
				$('#btn').prop("disbled", true);
				alert("영상 주소를 입력해주세요");
			} else if (surl.length > 0) {
				chkUrl2 = 1;
				if(contain<0) {
                    $('#btn').prop("disbled", true);
                    alert("정확한 영상 주소를 입력해주세요");
				}else{
				$('.video').attr('src', 'https://www.youtube.com/embed/'+id);
				}
				if (chkUrl1 == 1 && chkUrl2 == 1) {
					$('#btn').prop("disabled", false);
				}
			}
		}
	</script>

</body>
</html>