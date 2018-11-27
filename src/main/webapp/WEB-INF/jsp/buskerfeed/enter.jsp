<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>버스커피드</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
body .container {
  border: 1px dotted red;
}

#titl {
  width: 700px;
  margin: 10px;
  padding: 10px;
}

#logo {
  width: 50px;
  height: 50px;
  margin: 10px;
}

#titl h2 {
  margin-top: -50px;
  margin-left: 70px;
}

.imgschecon {
  float: left;
  width: 300px;
  margin-right: 30px;
  border: 1px dotted red;
}

.aviphotcont {
  float: right;
  width: 50%;
  border: 1px dotted red;
}

.col-md-4 {
  margin-top: 10px;
  padding-left: 7px;
}

.col-md-4.avi button {
  border: 0;
  padding: 0;
}

.col-md-4.photo button {
  border: 0;
  padding: 0;
}
</style>
<body>
  <div class="feedpage" style="margin: 0 300px 0 300px;">
    <div>
      <p>
        <a href='../../app/avi/form'>영상 Insert</a>
      </p>
    </div>
    <div class="container"
      style="width: 750px; padding: 0 20px 20px 20px;">
      <div id="titl">
        <img id="logo" src="../../img/playButton.PNG" alt="플레이로고">
        <h2>버스커피드</h2>
      </div>
      <div class="buskerinfo"
        style="height: 300px; margin-bottom: 30px;">
        <div class="imgschecon" style="height: 300px;">
          <img style="max-width: 100%; max-height: 100%"
            src="${busk.teamPhoto }" alt="aa">
        </div>
        <div class="aviphotcont">
          <table>
            <tbody>
              <tr>
                <th><h4>팀명</h4></th>
                <td>
                  <h4>${busk.teamname }</h4>
                </td>
              </tr>
              <tr>
                <th><h4>주요장르</h4></th>
                <td>
                  <h4>${busk.teamgenre }</h4>
                </td>
              </tr>
              <tr>
                <th><h4>주활동지역</h4></th>
                <td>
                  <h4>${busk.city }</h4>
                </td>
              </tr>
              <tr>
                <th><h4>인원</h4></th>
                <td>
                  <h4>(인원) 어케할까연?</h4>
                </td>
              </tr>
            </tbody>
          </table>
          <table>
            <tr>
              <th><h4>소개말</h4></th>
            </tr>
            <tr>
              <td style="padding: 5px;">${busk.teamInfo }</td>
            </tr>
          </table>
        </div>
      </div>
      <div class="feedcontent" style="width: 100%">
        <div class="imgschecon">
          <table>
            <c:forEach items="${schelist}" var="sche">
              <tr>
                <td id="date">
                  <h3>${sche.date }</h3>${sche.nsdt }~${sche.nedt }</td>
                <td id="shopname">
                  <h4>${sche.shopname }</h4>
                </td>
                <td>${sche.addr }</td>
              </tr>
            </c:forEach>
          </table>
        </div>
        <div class="aviphotcont">
          <!-- 영상썸네일 -->
          <div class=avi style="border: 1px dotted red; margin: 3px;">
            <div class="row">
              <c:forEach items="${recentlist}" var="m" begin="0" end="2">
                <div class="col-md-4 avi">
                  <button data-target="#avimodal" data-toggle="modal"
                    value="${m.aviboardno }">
                    <img src="${m.thumbnail }"
                      style="width: 110px; height: auto;">
                  </button>
                </div>
              </c:forEach>
            </div>
            <p style="text-align: right; margin: 5px 0;">
              <a href="http://www.naver.com">동영상더보기</a>
            </p>
          </div>
          <!-- 사진 게시물 -->
          <div class="photo" style="border: 1px dotted red; margin: 3px;">
            <div class="row">
              <c:forEach items="${recentplist}" var="t">
                <div class="col-md-4 photo">
                  <button data-target="#photomodal" data-toggle="modal"
                   value="${t.pbno }" >
                    <img src="${t.firphot }"
                      style="width: 110px; height: 100px;">
                  </button>
                </div>
              </c:forEach>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- ====================================모달================================= -->
  <!-- 영상모달 -->
  <style>
.modal-body {
  height: 500px;
}

.avicontent {
  float: left;
  width: 60%;
}

.comment {
  float: right;
  width: 40%;
}

.teaminfo td {
  padding: 10px 20px 10px 0;
}

.contents {
  padding: 10px;
  margin-right: 20px;
  border: 1px solid red;
  height: 140px;
}

.list-unstyled {
  border: 1px solid red;
  height: 475px
}

.list-unstyled li {
  border: 1px solid black;
  height: 15%;
}
#teamphoto{
    width:30px;
    height:30px;
}

h2 {
  margin: 0;
}
</style>
  <div class="modal fade" id="avimodal" tabindex="-1" role="dialog"
    aria-labelledby="avimodal" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <div class="avimodal-header">
          <button type="button" class="close" data-dismiss="modal"
            aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="modalcontainer">
            <div class="avicontent">
              <div class="feedavi"></div>
              <div class="teaminfo">
                <table class="aviteamimgtb">

                </table>
              </div>
              <div class="contents">
                 <div class="content" style="height:80%">
                 
                 </div>
                <div class="likecount" style="text-align:right;">
                
                </div>
              </div>
            </div>
            <div class="comment">
              <ul class="list-unstyled comt">

              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- 사진모달 -->
    <style>
.modal-body {
  height: 500px;
}

.photocontent {
  float: left;
  width: 60%;
}

.comment {
  float: right;
  width: 40%;
}

.teaminfo td {
  padding: 10px 20px 10px 0;
}

.contents {
  padding: 10px;
  margin-right: 20px;
  border: 1px solid red;
  height: 140px;
}

.list-unstyled {
  border: 1px solid red;
  height: 475px
}

.list-unstyled li {
  border: 1px solid black;
  height: 15%;
}
.list-unstyled.comtphoto{
    height:590px;
}
#teamphoto{
    width:30px;
    height:30px;
}

h2 {
  margin: 0;
}
.feedphoto button{
border:0;
padding:0;
margin:9px;
}
.smallimg{
    width:150px;
    height:100px;
}
.bigimg{
    width:95%;
    height:290px;
}
.modal-content.photo{
    height:670px;
}
</style>
  <div class="modal fade" id="photomodal" tabindex="-1" role="dialog"
    aria-labelledby="enlargeImageModal" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content photo">
        <div class="modal-header">
          사진상세조회
          <button type="button" class="close" data-dismiss="modal"
            aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="modalcontainer">
            <div class="photocontent">
              <div class="feedphoto">
                <div class="feedphoto1">
                
                </div>
                <div>
                    <table>
                    <tr class="feedphoto2">
                    
                    </tr>
                    </table>
                </div>
              </div>
              <div class="teaminfo">
                <table class="phototeamimgtb">

                </table>
              </div>
              <div class="contents">
                 <div class="content" style="height:80%">
                 
                 </div>
                <div class="likecount" style="text-align:right;">
                
                </div>
              </div>
            </div>
            <div class="comment">
              <ul class="list-unstyled comtphoto">

              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- ===================================================================== -->
  
<script src="/js/feeddetail.js" type="text/javascript"></script>
</body>
</html>
















