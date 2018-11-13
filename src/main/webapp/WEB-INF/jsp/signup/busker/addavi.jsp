<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>버스커 회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
        <h2>버스커 되기    >>  <u>동영상 올리기</u> >>  신청완료</h2>
    </div>
    <div id=container>
            <h4>영상이 제대로 올려졌는지 재생버튼을 눌러서 확인해 주시길 바랍니다.</h4>
             <iframe type="text/html" width="560" height="315" src='https://www.youtube.com/embed/GeeM2V15QFY' frameborder="0" id="video" >동영상</iframe>
        <form action='add' method='post' enctype="multipart/form-data">
        <table>
        <tr><td>url 1</td>
        <td><input type="text" placeholder="ex)유뷰트, 네이버 TV..." name=url1 id="url1"></td>
        <td><button type="button" id="btn1" onclick="btn1_click()">추가</button></td>
        <tr><td>url 2</td>
        <td><input type="text" placeholder="ex)유뷰트, 네이버 TV..." name=url2 id="url2"></td>
        <td><button type="button" onclick="btn2_click()" id="btn2">추가</button></td>
        </table>
        <button disabled="disabled" id="btn">가입하기</button>
        </form>
    </div>

  <script>
  
  var chkUrl1=0;
  var chkUrl2=0;
  
  function btn1_click(){
      var furl=($('#url1').val());
      if(furl.length<=0){
          $('#btn').prop("disbled",true);
         alert("영상 주소를 입력해주세요");
      }else if(furl.length>0){
      chkUrl1=1;
      $('#video').attr('src',furl);
      if(chkUrl1==1 && chkUrl2==1){
          $('#btn').prop("disabled",false);
      }
   } 
  }
  
  function btn2_click(e){
      var surl=($('#url2').val());
      if(surl.length<=0){
          $('#btn').prop("disbled",true);
         alert("영상 주소를 입력해주세요");
      }else if(surl.length>0){
      chkUrl2=1;
      $('#video').attr('src',surl);
      if(chkUrl1==1 && chkUrl2==1){
          $('#btn').prop("disabled",false);
      }
   } 
  }

  </script>

</body>
</html>