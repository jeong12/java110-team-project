<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<link rel="stylesheet"
  href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
  integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
  crossorigin="anonymous">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>
<style>
.container.feed {
  background-color: white;
  padding: 0 0 30px 0;
  border: 1px solid gray;
}

body, .container.title {
  background-color: floralwhite;
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
  border: 1px solid gray;
}

.imgschecon table {
  border-collapse: separate;
  border-spacing: 0 10px;
}

.aviphotcont {
  float: right;
  width: 57%;
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
  margin-top: -7%;
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
  margin-left: 430px;
}

.teaminfo1 h1 {
  margin-right: 70px;
  color: white;
}

.teaminfo1 h3 {
  margin-right: 70px;
  color: white;
}

.infotextarea {
  background-color: white;
  font-size: 18px;
  border: none;
  width: 50%;
  resize: none;
  margin: 35px 0 0 40px;
  max-height: 165px;
}

.glyphicon-play-circle {
  color: white;
  font-size: 60px;
  opacity: 0.6;
  position: absolute;
  right: 39%;
  top: 31%;
  text-shadow: 0 1px 3px rgba(0, 0, 0, .5);
  transition: all 500ms ease-in-out;
}

.small.title {
  font-size: 14px;
  margin-top: 7px;
  font-weight: 500;
}

.posttitle {
  background-color: black;
  border-radius: 0.25rem;
}

.posttitle i {
  color: white;
  font-size: 20px;
  padding: 10px;
}

.row.feedphotos {
  margin: 0 20px 0 20px;
}

.avi, .photo, .imgschecon {
  background-color: #eee;
  border-radius: 0.25rem;
}

.imgschecon {
  margin-left: 5px;
}

.aviphotcont {
  margin-right: 5px;
}

.schetable {
  padding: 10px;
}

.schetable tr {
  padding: 10px;
}

.btn.btns-outline-dark {
  /*   line-height: 1;
  width: 35%;
  font-size: 0.8rem; */
  margin-right: 15px;
}

.far.fa-heart, .far.fa-star {
  font-size: 50px;
  color: white;
}

.changesuccess {
  color: #28a745;
  background-color: transparent;
  background-image: none;
  border-color: #28a745;
  border: 1px solid transparent;
  border-radius: 4px;
  user-select: none;
  touch-action: manipulation;
  cursor: pointer;
  display: inline-block;
  padding: 6px 12px;
  margin-bottom: 0;
  font-size: 14px;
  font-weight: 400;
  line-height: 1.42857143;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
}

.acomtcontlist.revrev {
  -webkit-appearance: textfield;
  background-color: white;
  -webkit-rtl-ordering: logical;
  cursor: text;
  padding: 1px;
  border-width: 2px;
  border-style: inset;
  border-color: initial;
  border-image: initial;
}

.pcomtcontlist.revrev {
  -webkit-appearance: textfield;
  background-color: white;
  -webkit-rtl-ordering: logical;
  cursor: text;
  padding: 1px;
  border-width: 2px;
  border-style: inset;
  border-color: initial;
  border-image: initial;
}

.schewrap {
  padding:20px 10px 10px 10px;
      margin-bottom: 13px;
}

.schedate {
      background-color: #f1bf08;
    text-align: center;
    color: white;
    font-size: 22px;
    padding: 3px;
        margin-bottom: 1px;
            border-radius: 0.25rem 0.25rem 0 0;
}

.timeshopname {
  height:30px;
  margin:1px 0;
}

.schetime {
  float:left;
  width:30%;
      font-size: 16px;
    padding: 3px 0;
    background-color: #9e9e9e38;
    color: black;
    text-align: center;
}

.scheshopname {
  float:right;
  width:70%;
      font-size: 16px;
    padding: 3px 16px 3px 0;
    background-color: #2a2b2d;
    color: white;
    text-align: right;
}

.scheaddr {
  font-size: 15px;
    padding: 3px 16px 3px 0;
    background-color: #2a2b2d;
    color: white;
    text-align: left;
}


/* ::-webkit-scrollbar#avimodal {
  width: 16px;
}

::-webkit-scrollbar-track {
  background-color: white;
}

::-webkit-scrollbar-thumb {
  background-color: grays;
  border-radius: 8px;
}

::-webkit-scrollbar-thumb:hover {
  background: #555;
}

::-webkit-scrollbar-button:start:decrement, ::-webkit-scrollbar-button:end:increment
  {
  width: 16px;
  height: 16px;
  background: black;
  border-radius: 8px
} */
/* 스크롤바 */
</style>
<body>
  <c:set var="sessionno" value="${sessionScope.loginUser.no }" />
  <c:set var="buskno" value="${busk.bno}" />
  <jsp:include page="../header.jsp"></jsp:include>

  <div class="container title">
    <div id="titl" style="display: none;">
      <h1 style="display: none" id="sessionno">
        <c:out value="${sessionno}" />
      </h1>
      <h1 style="display: none" id="buskno">
        <c:out value="${buskno}" />
      </h1>
    </div>
  </div>
  <div class="container feed" style="background-color: white;">
    <a class="twPc-bg twPc-block"></a>
    <div style="height: 270px; border: 1px dotted white;">
      <!-- 임시 높이 -->
      <div class="twPc-button">
        <table class="teaminfo1">
          <tr>
            <td><h1 style="margin-right: 330px;">${busk.teamname }</h1></td>
            <td><i class="far fa-heart" style="margin-right: 15px;" onclick="chkLike()">
            </i></td>
            <td><i class="fas fa-heart" style="display:none;"></i></td>
            <td><h2 style="margin-right: 30px; color: white;">${busk.likecount }</h2></td>
            <td><i class="far fa-star"></i></td>
          </tr>
        </table>
      </div>
      <c:choose>
        <c:when test="${not empty busk.teamPhoto }">
          <!-- 가수 유튜브채널로? -->
          <a title="team"
            href="https://www.youtube.com/channel/UCdtV_sB8WUWo-P_q3OwNfcw"
            class="twPc-avatarLink"> <img alt="에러"
            src="../../upload/${busk.teamPhoto }" class="twPc-avatarImg">
          </a>
        </c:when>
        <c:otherwise>
          <a title="team" class="twPc-avatarLink"> <img alt="에러"
            src="../../img/phot1.png" class="twPc-avatarImg">
          </a>
        </c:otherwise>
      </c:choose>
      <div class="twPc-divUser" style="height: 200px;">
        <textarea class="infotextarea" style="width: 60%; resize: none;"
          rows="5" disabled placeholder="반가워요~">${busk.teamInfo }</textarea>
        <!-- 250자 제한 -->
      </div>

      <!-- sessionScope.loginUser.no -->
      <c:choose>
        <c:when test="${busk.bno == sessionScope.loginUser.no }">
          <div style="padding-left: 75%;">
            <button id="aviupload" class="btn btns-outline-dark"
              data-target="#aviUploadModal" data-toggle="modal">영상올리기</button>
            <button id="photoupload" class="btn btns-outline-dark"
              data-target="#photoUploadModal" data-toggle="modal">사진올리기</button>
          </div>
        </c:when>
      </c:choose>
    </div>
    <!-- 여기까지 버스커 저옵~~~~~~~~ -->
    <div class="feedcontent" style="width: 100%">
      <div class="imgschecon" style="min-height: 200px;">
        <div class="posttitle">
          <i class="far fa-calendar-check"> 공연/버스킹 스케줄</i>
        </div>
        <div>
          <c:choose>
            <c:when test="${empty schelist }">
              <div style="padding-left: 20px;">
                <h3>스케줄이 없습니다!</h3>
              </div>
            </c:when>
            <c:otherwise>
              <c:forEach items="${schelist}" var="sche">
                <div class="schewrap">
                  <div class="schedate">
                    ${sche.feeddate }
                  </div>
                  <div class="timeshopname">
                    <div class="schetime">${sche.nsdt }~${sche.nedt }</div>
                    <div class="scheshopname">
                      ${sche.shopname }
                    </div>
                  </div>
                  <div class="scheaddr"><i class="fas fa-map-marker-alt"></i>  ${sche.addr }</div>
                </div>
              </c:forEach>
            </c:otherwise>
          </c:choose>
        </div>
      </div>

      <div class="aviphotcont" style="min-height: 300px;">
        <!-- 영상썸네일 -->
        <div class=avi
          style="border: 1px solid gray; margin-bottom: 20px; min-height: 200px;">
          <div class="posttitle">
            <i class="far fa-play-circle"> 영상게시글</i>
          </div>
          <!-- #eee -->
          <!-- class="row" -->
          <c:choose>
            <c:when test="${empty recentlist }">
              <div style="padding-left: 20px;">
                <h3>영상이 없습니다</h3>
              </div>
            </c:when>
            <c:otherwise>
              <c:forEach items="${recentlist}" var="m" begin="0" end="2">
                <div class="col-md-4 avi">
                  <button data-target="#avimodal" data-toggle="modal"
                    value="${m.aviboardno }">
                    <img src="${m.thumbnail }"
                      style="width: 100%; height: auto;"> <span
                      class="glyphicon glyphicon-play-circle"></span>
                  </button>
                  <c:set var="title" value="${m.title}" />
                  <c:choose>
                    <c:when test="${fn:length(title) > 21}">
                      <div class="small title">${fn:substring(title,0,21)}...</div>
                    </c:when>
                    <c:otherwise>
                      <div class="small title">${m.title}</div>
                    </c:otherwise>
                  </c:choose>
                </div>
              </c:forEach>
              <p
                style="text-align: right; margin: 5px 0; padding-right: 10px;">
                <a href="moreavi?no=${busk.bno }">동영상더보기</a>
              </p>
            </c:otherwise>
          </c:choose>

        </div>
        <!-- 사진 게시물 -->
        <div class="photo"
          style="border: 1px solid gray; min-height: 200px;">
          <div class="posttitle">
            <i class="far fa-image"> 사진게시글</i>
          </div>
          <div >
          <div class="row feedphotos">
            <c:choose>
              <c:when test="${empty recentplist }">
                <h3>사진이 없습니다</h3>
              </c:when>
              <c:otherwise>
                <c:forEach items="${recentplist}" var="t">
                  <div class="col-md-4 photo"
                    style="margin-bottom: 25px;">
                    <button data-target="#photomodal"
                      data-toggle="modal" value="${t.pbno }">
                      <img src="../../upload/${t.firphot }"
                        style="width: 110%; height: 150px;"
                        class="feedmainphoto">
                    </button>
                    <div class="small title" style="padding-left: 10px">게시일:
                      ${t.cdt }</div>
                  </div>
                </c:forEach>
              </c:otherwise>
            </c:choose>
            </div>
                       <nav aria-label="Page navigation example" class='pages' style="text-align: center;">
                            <ul class="pagination justify-content-center">
                                <li class="page-item">
                                    <a class="page-link" href="javascript:goPage(${photo.prevPageNo})">Previous</a></li>
                                    
                                <c:forEach var="i" begin="${photo.startPageNo}" end="${photo.endPageNo}" step="1">
                                 <c:choose>
                                 <c:when test="${i eq photo.pageNo}">
                                    <li class="page-item active">
                                    <a href="javascript:goPage(${i})" class="choice">${i}</a></li>
                                 </c:when>
                                 <c:otherwise>
                                  <li class="page-item">
                                  <a href="javascript:goPage(${i})">${i}</a></li>
                                </c:otherwise>
                                </c:choose>
                                </c:forEach>
                                <li class="page-item">
                                    <a class="page-link" href="javascript:goPage(${photo.nextPageNo})">Next</a></li>
                            </ul>
                  </nav>
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

.teaminfo td {
  padding: 10px 20px 10px 0;
}

.contents {
  padding: 10px;
  margin-right: 20px;
  border: 1px solid red;
  height: 140px;
}

/* ///////////////////////////////////// */
h2 {
  margin: 0;
}

.modal-header {
  background-color: black;
  color: white;
  font-size: 20px;
  padding: 10px;
}

.close {
  color: white;
  opacity: 1;
}

.modal-body {
  background-color: white;
}

.comment {
  float: right;
  width: 40%;
  border: 1px solid gray;
  padding: 5px;
}

#acomtcont, #pcomtcont {
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
}

#acomtcontlist, #pcomtcontlist {
  border-radius: 0.25rem;
  background-color: floralwhite;
  border: 0;
}

.acomtcontlist, .pcomtcontlist {
  border-radius: 0.25rem;
  background-color: inherit;
  border: 0;
}

.comtinsert {
  padding: 10px;
  border-bottom: 1px solid gray;
  height: 103px;
}

.comtcont, .comtdate {
  float: right;
}

.comtimg, .comtname {
  float: left;
}

.comttop {
  height: 50px;
}

.comtbottom {
  height: 25px;
}

.comtimg {
  width: 20%;
  height: 48px;
  padding: 2px 11px;
}

.comtcont {
  width: 80%;
  height: 48px;
}

.comtname {
  width: 20%;
  text-align: center;
  font-weight: 1000;
}

.comtdate {
  color: #777;
}

.comtwrap {
  padding: 10px 10px 0 0;
}

#teamphoto {
  border-radius: 20px;
}

.teamphoto {
  border-radius: 20px;
}

.pinfocontent {
  border: 1px solid gray;
  border-radius: 0.25rem;
  width: 96%;
  height: 190px;
  padding: 10px 10px 0 5px;
}

.ainfocontent {
  border: 1px solid gray;
  border-radius: 0.25rem;
  width: 96%;
  height: 190px;
  padding: 10px 10px 0 5px;
}

.infoimg {
  float: left;
  width: 9%;
  height: 44px;
  margin: 0 10px 5px 10px;
}

.mid {
  padding: 5px 50px 0 60px;
}

.bot {
  text-align: right;
}

.far.fa-heart.modallike {
  color: black;
  font-size: 24px;
}

#modalgenre, #modalcity {
  color: #777;
}

.btn.btns-outline-warning {
  float: right;
  margin-right: 2%;
}

.modal-dialog.modal-lg {
  margin-top: 170px;
}

.revdelacomt {
  text-align: right;
}

.revdelpcomt {
  text-align: right;
}

.revdelacomt i {
  margin-right: 4%;
  font-size: 15px;
}

.revdelpcomt i {
  margin-right: 4%;
  font-size: 15px;
}
</style>

  <div class="modal fade" id="avimodal" tabindex="-1" role="dialog"
    aria-labelledby="avimodal" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content avi">
        <div class="modal-header avi"></div>
        <div class="modal-body">
          <div class="modalcontainer">
            <div class="avicontent">
              <div class="feedavi"></div>


              <div class="ainfocontent"></div>

            </div>
            <div class="comment">
              <div class="comtinsert">

                <div class='ainsertcontent'></div>

              </div>
              <div class="nowacomt"></div>
              <div class="acomtlist" data-mcs-theme="light-thick"
                style="overflow: auto; height: 360px;"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- 사진모달 -->
  <style>
.modal-body.photo {
  height: 620px;
}

.photocontent {
  float: left;
  width: 60%;
}

.comment {
  float: right;
  width: 40%;
  border-radius: 0.25rem;
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

h2 {
  margin: 0;
}

.feedphotos button {
  border: 0;
  padding: 0;
  margin: 9px;
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
        <div class="modal-header photo">
          사진 상세 조회
          <button type="button" class="close" data-dismiss="modal"
            aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
          <div id="delrevbtn" style="margin-right: 8px;"></div>
        </div>
        <div class="modal-body photo">
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
              <div class="invisibleform" style="display: none;"></div>

              <div class="pinfocontent"></div>

            </div>
            <div class="comment">
              <div class="comtinsert">

                <div class='pinsertcontent'></div>

              </div>
              <div class="pcomtlist"
                style="overflow: auto; height: 484px;"></div>
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
  height: 410px;
}

.uploadbtn {
  color: snow;
}

#upload1, #upload2, #upload3, #uploadavi {
  border: 1px solid #ccc;
  border-radius: 0.25rem;
}

#imgtable>td {
  width: 33%;
  height: 164px;
}

#imgtable {
  width: 100%;
}

#upload1, #upload2, #upload3 {
  height: 164px;
  width: 265px;
  margin-bottom: 10px;
}

#revupload1, #revupload2, #revupload3 {
  border: 1px solid #ccc;
  border-radius: 0.25rem;
  height: 128px;
  width: 200px;
  margin-bottom: 8px;
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
          <div class="modalcontainer">
            <form action='addphoto' method='post'
              enctype="multipart/form-data">
              <div style="padding: 10px; height: 386px;">
                <div style="display: none">
                  <textarea name="bno" id="bno">${busk.bno }</textarea>
                </div>
                <div>
                  <div style="margin: 20px 0;">
                    <table id="imgtable">
                      <tr>
                        <!-- height: 70px; width: 100px;  -->
                        <td style="padding: 0 5px 0 5px;"><img
                          id="upload1" src="/img/default_image.png"
                          alt="기본이미지"></td>
                        <td style="padding: 0 5px 0 5px;"><img
                          id="upload2" src="/img/default_image.png"
                          alt="기본이미지"></td>
                        <td style="padding: 0 5px 0 5px;"><img
                          id="upload3" src="/img/default_image.png"
                          alt="기본이미지"></td>
                      </tr>
                      <tr>
                        <td style="padding: 0 0 0 10px;"><label
                          for="input_img1">파일업로드</label> <input
                          style="height: 0; width: 150px; opacity: 0;"
                          type='file' name='file1' id='input_img1'
                          onchange="readURL1(this);" /></td>
                        <td style="padding: 0 0 0 10px;"><label
                          for="input_img2">파일업로드</label> <input
                          style="height: 0; width: 150px; opacity: 0;"
                          type='file' name='file2' id='input_img2'
                          onchange="readURL2(this);" /></td>
                        <td style="padding: 0 0 0 10px;"><label
                          for="input_img3">파일업로드</label> <input
                          style="height: 0; width: 150px; opacity: 0;"
                          type='file' name='file3' id='input_img3'
                          onchange="readURL3(this);" /></td>
                      </tr>
                    </table>
                    <div style="margin-top: 40px; margin-bottom: 5px;">
                      <textarea
                        style="width: 100%; resize: none; border-radius: 0.25rem;"
                        rows="3" name="content" id="content"
                        placeholder="내용 입력"></textarea>
                    </div>
                    <button type="button" data-dismiss="modal"
                      style="float: right; margin: 0 10px 0 15px;"
                      class="btn btns-outline-dark">취소</button>
                    <button class="btn btns-outline-dark uploadbtn"
                      style="float: right; margin: 0 10px 0 15px;"
                      disabled="disabled" id="photoaddbtn">등록</button>
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
  height: 530px;
}

#title, #content {
  -webkit-appearance: textfield;
  background-color: white;
  -webkit-rtl-ordering: logical;
  cursor: text;
  padding: 1px;
  border-width: 2px;
  border-style: inset;
  border-color: initial;
  border-image: initial;
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
          <div class="modalcontainer">
            <!-- upload 폼 -->
            <form action='addavi' method='post'
              enctype="multipart/form-data">
              <div style="display: none">
                <input type="text" name="bno" id="bno"
                  value="${busk.bno}" />
              </div>
              <div style="padding: 10px; height: 500px;">
                <div>
                  <textarea id="title" name="title" rows="1"
                    style="width: 100%; resize: none; border-radius: 0.25rem;"
                    placeholder="제목 입력"></textarea>
                </div>
                <div>
                  <div style="margin: 20px 0;">
                    <table style="width: 100%">
                      <tr>
                        <td><img
                          style="height: 250px; width: auto; margin: 0 50px 10px 0;"
                          id="uploadavi" src="/img/default_image.png"
                          alt="기본이미지">
                      </tr>
                      <tr>
                        <td style="width: 60%;"><input
                          style="border-radius: 0.25rem; width: 98%; margin-right: 10px;"
                          type='text' name='url' id='url'
                          placeholder='URL 입력' /></td>
                        <td><button type="button"
                            class="btn btns-outline-dark urlchk">확인</button></td>
                      </tr>
                    </table>
                    <div style="margin-top: 12px;">
                      <textarea
                        style="width: 100%; resize: none; border-radius: 0.25rem;"
                        rows="3" name="content" id="content"
                        placeholder="내용 입력"></textarea>
                    </div>
                    <div style="padding-top: 25px; height: 60px;">
                      <button type="button" data-dismiss="modal"
                        style="float: right; margin: 0 10px 0 15px;"
                        class="btn btns-outline-dark">취소</button>
                      <button class="btn btns-outline-dark uploadbtn"
                        style="float: right; margin: 0 10px 0 15px;"
                        disabled="disabled" id="aviaddbtn">등록</button>
                    </div>
                  </div>
                </div>
              </div>
            </form>

          </div>
        </div>
      </div>
    </div>
  </div>





  <!-- =========================================================== -->
  <button type="button" class="btns btns-outline-primary">Primary</button>
  <button type="button" class="btns btns-outline-secondary">Secondary</button>
  <button type="button" class="btn btns-outline-success">Success</button>
  <button type="button" class="btns btns-outline-danger">Danger</button>
  <button type="button" class="btns btns-outline-warning">Warning</button>
  <button type="button" class="btns btns-outline-info">Info</button>
  <button type="button" class="btns btns-outline-light">Light</button>
  <button type="button" class="btn btns-outline-dark">Dark</button>
  <!-- ===================================================================== -->


  <script src="/js/feeddetail4.js" type="text/javascript"></script>
  <script src="/js/feedupload.js" type="text/javascript"></script>
  <script src="/js/feed.js" type="text/javascript"></script>
  <script>
            
  $('.pages li').click(function(){
      $('.pages li').siblings().removeClass('active');
      $(this).addClass('active');
  });
  
  function goPage(pageno){
      console.log("pageno:"+pageno);
      console.log("buskno:"+${busk.bno});
      var buskno = ${busk.bno}
      
      $(this).siblings().css('background-color','white')
      $(this).css('background-color','#337ab7')
      
       $.ajax({
          type:"GET",
          url:"photopaging",
          data:{
              "pageno":pageno,
              "buskno":buskno
          },
          success:function(data){
              $(".row.feedphotos").empty();
              
              $.each(data.plist,function(index,item){
                  $(".row.feedphotos").append(
                          '<div class="col-md-4 photo" style="margin-bottom: 25px;">'+
                              '<button data-target="#photomodal" data-toggle="modal" value="'+item.pbno+'">'+
                                '<img src="../../upload/'+item.firphot+'" style="width: 110%; height: 150px;" class="feedmainphoto">'+
                              '</button>'+
                              '<div class="small title" style="padding-left: 10px">게시일:'+item.strcdt+'</div>'+
                            '</div>'
                  );
              });
          }
      });
  }
  
  
  function chkLike(){
	  console.log("::::");
	  $('.far fa-heart').hide();
	  $('.likely').append('<i class="fas fa-heart"></i>');
	  
	  
  }
  </script>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>
















