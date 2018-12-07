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
<link rel="stylesheet" href="../../css/common.css">
</head>
<style>
body, container.title{
    background-color: floralwhite;
}
container{
    background-color: white;
}
#titl {
  width: 700px;
  margin: 10px;
  padding: 10px;
}

#logo {
  width: 40px;
  height: 40px;
  margin: 10px;
}

#titl h3 {
  margin-left: 70px;
  margin-top: -6.5%;
}

.imgschecon {
  float: left;
  width: 40%;
  padding: 10px;
  border: 1px dotted red;
}

.imgschecon table {
  border-collapse: separate;
  border-spacing: 0 10px;
}

.aviphotcont {
  float: right;
  width: 60%;
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

.twPc-button {
  margin: 0 -10px;
  margin-top: -8%;
  width: 100%;
}

.twPc-bg {
  background-image: url("../../img/feedheader.png");
  background-position: 0 50%;
  background-size: 100% auto;
  border-bottom: 1px solid #e1e8ed;
  border-radius: 4px 4px 0 0;
  height: 300px;
  width: 100%;
  background-position: 0 50%;
}

.twPc-block {
  display: block !important;
}

.twPc-avatarLink {
  background-color: #fff;
  border-radius: 6px;
  display: inline-block !important;
  float: left;
  margin: -30px 5px 0 70px;
  max-width: 100%;
  padding: 1px;
  vertical-align: 30px;
  margin-top: -12%;
}

.twPc-avatarImg {
  border: 2px solid #fff;
  border-radius: 7px;
  box-sizing: border-box;
  color: #fff;
  height: 300px;
  width: 300px;
}

.teaminfo1 {
  height: 60px;
  margin-left:430px;
}

.teaminfo1 h2 {
  margin-right: 70px;
  color: white;
}
.teaminfo1 h4 {
  margin-right: 70px;
  color: white;
}

.infotextarea {
  background-color: white;
  font-size: 20px;
  border: none;
  width: 50%;
  resize: none;
  margin: 13px 0 0 190px;
  max-height: 165px;
}
.glyphicon-play-circle{
    color:white;
    font-size: 60px;
    opacity: 0.6;
    position: absolute;
    right: 39%;
    top: 31%;
    text-shadow: 0 1px 3px rgba(0,0,0,.5);
    transition:all 500ms ease-in-out;
}
</style>
<body>
  <jsp:include page="../header.jsp"></jsp:include>
  
  <div class="container title">
    <div id="titl">
      <img id="logo" src="../../img/tum.png" alt="플레이로고">
      <h3>버스커피드: ${busk.bno }</h3>
      <h1>${sessionScope.no }</h1>
    </div>
  </div>
  <div class="container" style="background-color: white;">
    <a class="twPc-bg twPc-block"></a>
    <div style="height: 250px; border: 1px dotted green">
      <!-- 임시 높이 -->
      <div class="twPc-button">
       <table class="teaminfo1">
          <tr>
            <td><h4>팀명</h4><h2>${busk.teamname }</h2></td>
<%--             <td><h4>장르</h4><h2>${busk.teamgenre }</h2></td>
            <td><h4>주활동지</h4><h2>${busk.city }</h2></td> --%>
          </tr>
        </table>
      </div>
      <c:choose>
        <c:when test="${not empty busk.teamPhoto }">
          <a title="team" href="https://www.naver.com//"
            class="twPc-avatarLink"> <img alt="에러"
            src="http://img.enews24.cjenm.skcdn.com/News/Contents/20170731/92145538.jpg" class="twPc-avatarImg">
          </a>
        </c:when>
        <c:otherwise>
          <a title="team" class="twPc-avatarLink"> <img alt="에러"
            src="/img/phot1.png" class="twPc-avatarImg">
          </a>
        </c:otherwise>
      </c:choose>
      <div class="twPc-divUser" style="height: 200px;">
            <p>장르 발라드</p>
        <textarea class="infotextarea"
          style="width: 60%; resize: none; margin: 20px 0 0 50px;"
          rows="7" readonly="readonly" disabled placeholder="반가워요~">${busk.teamInfo }</textarea>
      </div>

    </div>
    <!-- 여기까지 버스커 저옵~~~~~~~~ -->

    <div class="feedcontent" style="width: 100%">
      <div class="imgschecon">
      
          <%-- <c:choose>
            <c:when test="${empty schelist }">
              <tr>
                <td>스케줄이 없습니다!</td>
              </tr>
            </c:when>
            <c:otherwise>
              <c:forEach items="${schelist}" var="sche">
                <tr>
                  <td colspan="3"><h2>${sche.date }</h2></td>
                </tr>
                <tr>
                  <td>${sche.nsdt }~${sche.nedt }</td>
                  <td id="shopname">
                    <h4>${sche.shopname }</h4>
                  </td>
                  <td>${sche.addr }</td>
                </tr>
              </c:forEach>
            </c:otherwise>
          </c:choose> --%>
      </div>
      <div class="aviphotcont" style="min-height: 300px;">
        <div style="padding-left: 170px;">
          <button id="aviupload" data-target="#aviUploadModal"
            data-toggle="modal">영상올리기</button>
          <button id="photoupload" data-target="#photoUploadModal"
            data-toggle="modal">사진올리기</button>
        </div>
        <!-- 영상썸네일 -->
        <div class=avi
          style="border: 1px dotted red; margin: 3px; height: 200px;">
            <!-- class="row" -->
            <c:choose>
              <c:when test="${empty recentlist }">
                <p>영상이 없습니다!</p>
              </c:when>
              <c:otherwise>
                <c:forEach items="${recentlist}" var="m" begin="0"
                  end="2">
                  <div class="col-md-4 avi">
                    <button data-target="#avimodal" data-toggle="modal"
                      value="${m.aviboardno }">
                      <img src="${m.thumbnail }"
                        style="width: 200px; height: auto;">
                    <span class="glyphicon glyphicon-play-circle"></span>
                    </button>
                    제목:
                  </div>
                </c:forEach>
                <p
                  style="text-align: right; margin: 5px 0; padding-right: 10px;">
                  <a href="http://www.naver.com">동영상더보기</a>
                </p>
              </c:otherwise>
            </c:choose>

        </div>
        <!-- 사진 게시물 -->
        <div class="photo" style="border: 1px dotted red; margin: 3px;">
          <div class="row">
            <c:choose>
              <c:when test="${empty recentplist }">
                <p style="padding-left: 15px;">사진이 없습니다!</p>
              </c:when>
              <c:otherwise>
                <c:forEach items="${recentplist}" var="t">
                  <div class="col-md-4 photo">
                    <button data-target="#photomodal"
                      data-toggle="modal" value="${t.pbno }">
                      <img src="../../upload/${t.firphot }"
                        style="width: 200px; height: 150px;">
                    </button>
                    <div id="pageno"></div>
                  </div>
                </c:forEach>
              </c:otherwise>
            </c:choose>
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

#teamphoto {
  width: 30px;
  height: 30px;
}

h2 {
  margin: 0;
}
</style>

  <div class="modal fade" id="avimodal" tabindex="-1" role="dialog"
    aria-labelledby="avimodal" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <button type="button" class="close" data-dismiss="modal"
          aria-label="Close" style="padding-right: 10px;">
          <span aria-hidden="true">×</span>
        </button>
        <div class="avimodal-header"></div>
        <div class="modal-body">
          <div class="modalcontainer">
            <div class="avicontent">
              <div class="feedavi"></div>
              <div class="teaminfo">
                <table class="aviteamimgtb">

                </table>
              </div>
              <div class="contents" style="overflow: auto;">
                <div class="content" style="height: 80%;"></div>
                <div class="likecount" style="text-align: right;">

                </div>
              </div>
            </div>
            <div class="comment">
              <div class="comtinsert"
                style="border: 1px dotted blue; height: 100px;">
                <!-- 영상댓글 -->
              </div>
              <div style="overflow: auto; height: 370px;">
                <ul class="list-unstyled comt">

                </ul>
              </div>
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

.list-unstyled.comtphoto {
  height: 590px;
}

#teamphoto {
  width: 30px;
  height: 30px;
}

h2 {
  margin: 0;
}

.feedphoto button {
  border: 0;
  padding: 0;
  margin: 9px;
}

.smallimg {
  width: 150px;
  height: 100px;
}

.bigimg {
  width: 95%;
  height: 290px;
}

.modal-content.photo {
  height: 670px;
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
                <div class="feedphoto1"></div>
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
              <div class="contents" style="overflow: auto;">
                <div class="content" style="height: 80%"></div>
                <div class="likecount" style="text-align: right;">

                </div>
              </div>
            </div>
            <div class="comment" style="overflow: auto;">

              <ul class="list-unstyled comtphoto">
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- ==============================업로드 모달======================================= -->
  <!-- 사진업로드 모달 -->
  <style>
.modal-body.photup {
  height: 450px;
}

.uploadbtn {
  color: snow;
}
</style>
  <div class="modal fade" id="photoUploadModal" tabindex="-1"
    role="dialog">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header">
          사진업로드
          <button type="button" class="close" data-dismiss="modal">
            <span>×</span>
          </button>
        </div>
        <div class="modal-body photup">
          <div class="modalcontainer" style="border: 1px dotted red;">
            <form action='addphoto' method='post'
              enctype="multipart/form-data">
              <div style="border: 1px dotted orange; padding: 10px;">
                <div style="display: none">
                  <textarea name="bno" id="bno">${busk.bno }</textarea>
                </div>
                <div>
                  <textarea style="width: 100%; height: 250px;"
                    name="content" id="content" placeholder="내용 입력"></textarea>
                </div>
                <div>
                  <div style="margin: 20px 0;">
                    <table>
                      <tr>
                        <td><img
                          style="height: 70px; width: 100px; margin: 0 50px 10px 0;"
                          id="upload1" src="/img/default_image.png"
                          alt="기본이미지"></td>
                        <td><img
                          style="height: 70px; width: 100px; margin: 0 50px 10px 0;"
                          id="upload2" src="/img/default_image.png"
                          alt="기본이미지"></td>
                        <td><img
                          style="height: 70px; width: 100px; margin: 0 50px 10px 0;"
                          id="upload3" src="/img/default_image.png"
                          alt="기본이미지"></td>
                      </tr>
                      <tr>
                        <td><label for="input_img1">파일업로드</label> <input
                          style="height: 0; width: 150px; opacity: 0;"
                          type='file' name='file1' id='input_img1'
                          onchange="readURL1(this);" /></td>
                        <td><label for="input_img2">파일업로드</label> <input
                          style="height: 0; width: 150px; opacity: 0;"
                          type='file' name='file2' id='input_img2'
                          onchange="readURL2(this);" /></td>
                        <td><label for="input_img3">파일업로드</label> <input
                          style="height: 0; width: 150px; opacity: 0;"
                          type='file' name='file3' id='input_img3'
                          onchange="readURL3(this);" /></td>
                      </tr>
                    </table>
                    <button type="button" data-dismiss="modal"
                      style="float: right; margin-left: 20px;">취소</button>
                    <button class="uploadbtn"
                      style="float: right; margin-left: 20px;"
                      disabled="disabled">등록</button>
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 영상 업로드 모달 -->
  <style>
.modal-body.aviup {
  height: 490px;
}
</style>
  <div class="modal fade" id="aviUploadModal" tabindex="-1"
    role="dialog">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header">
          영상 게시글 업로드
          <button type="button" class="close" data-dismiss="modal">
            <span>×</span>
          </button>
        </div>
        <div class="modal-body aviup">
          <div class="modalcontainer" style="border: 1px dotted red;">
            <!-- upload 폼 -->
            <form action='addavi' method='post'
              enctype="multipart/form-data">
              <div style="display: none">
                <textarea name="bno" id="bno"></textarea>
              </div>
              <div style="border: 1px dotted orange; padding: 10px;">
                <div>
                  <textarea id="title" name="title" rows="1"
                    style="width: 100%;" placeholder="제목 입력"></textarea>
                </div>
                <div>
                  <textarea style="width: 100%; height: 250px;"
                    name="content" id="content" placeholder="내용 입력"></textarea>
                </div>
                <div>
                  <div style="margin: 20px 0;">
                    <table>
                      <tr>
                        <td><img
                          style="height: 70px; width: 100px; margin: 0 50px 10px 0;"
                          id="uploadavi" src="/img/default_image.png"
                          alt="기본이미지"></td>
                      </tr>
                      <tr>
                        <td><input
                          style="width: 600px; margin-right: 20px;"
                          type='text' name='url' id='url'
                          placeholder='URL 입력' /></td>
                        <td><button type="button" class="urlchk">확인</button></td>
                      </tr>
                    </table>
                    <button type="button" data-dismiss="modal"
                      style="float: right; margin-left: 20px;">취소</button>
                    <button class="uploadbtn"
                      style="float: right; margin-left: 20px;"
                      disabled="disabled">등록</button>
                  </div>
                </div>
              </div>
            </form>

          </div>
        </div>
      </div>
    </div>
  </div>
  <button type="button" class="btns btns-outline-primary">Primary</button>
  <button type="button" class="btns btns-outline-secondary">Secondary</button>
  <button type="button" class="btns btns-outline-success">Success</button>
  <button type="button" class="btns btns-outline-danger">Danger</button>
  <button type="button" class="btns btns-outline-warning">Warning</button>
  <button type="button" class="btns btns-outline-info">Info</button>
  <button type="button" class="btns btns-outline-light">Light</button>
  <button type="button" class="btns btns-outline-dark">Dark</button>
  <!-- ===================================================================== -->


  <script src="/js/feeddetail.js" type="text/javascript"></script>
  <script src="/js/feedupload.js" type="text/javascript"></script>
  <script src="/js/feed.js" type="text/javascript"></script>
  <script>
            /* $(".modal.fade .modal-content:not").on("click",function(){
             console.log("kkkk");
             $(".feedavi").find("iframe").remove();
             })
             */
        </script>
  <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
















