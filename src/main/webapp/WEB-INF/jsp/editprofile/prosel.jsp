<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<link rel="stylesheet" href="/css/common.css"/> 
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
#titl {
    margin: 0 auto; 
    padding: 10px 0;
}

#logo {
    width: 40px; height: 40px; margin: 10px;
}

h3 {
    display: inline-block; position: relative; top: .2rem;
}
.default{
    min-height: 671px;
}
.h3{
top:0;
width: 30%;
}
.td2{width:80%;}

ul li.prolist {
    list-style-type: none;
    line-height: 1rem;
    width: 80%;
    font-size: 1.2rem;
    font-weight: 300;
}
#addr{
    display: inline-block;
    width: 68%;
    position: relative;
    top: 10px;
    line-height: 1.3rem;
}
.col-md-10{
    margin-bottom: 1rem;
}

.protitl{
    color:#2487ea;
}

.proimg {
    border-radius: 2rem; height: 300px; width: 300px;
}
.carousel-inner>.item>img{
    border-radius: 2rem; height: 300px; width: 300px;
}

.pro_list {
    padding-left: 0.8rem; margin: 0.1rem 0 0.1rem 0;
}

.genre {
    margin: 2% 4% 2% 0;
    padding: 5px 15px;
    text-align: center;
    border: 0;
    border-radius: 10px;
    background-color: #ddd;
    color: black;
    font-weight: 400;
}
.probtn {
    text-align: center;
    margin-top: 1rem;
}

#btnsbus, #btnssup{
    margin: 10px 15px; 
}

.prolist .teamtitl{
    vertical-align: top;
    width:25%;
}
.prolist .teamcom{
    width: 70%;
    display: inline-block;
    margin-top: 16px;
    line-height: 25px;
    font-size: 20px;
}
.carousel{
    width:300px;
}
.left.carousel-control{
    border-top-left-radius: 1.7rem;
    border-bottom-left-radius: 1.7rem;
}

.right.carousel-control{
    border-top-right-radius: 1.7rem;
    border-bottom-right-radius: 1.7rem;
}
@media (min-width: 768px){
  #titl {
      width: 750px;
  }
}

@media (min-width: 992px){
  #titl {
      width: 970px;
  }
}

@media (min-width: 1200px){
  #titl {
      width: 1170px;
  }
}
</style>
</head>
<jsp:include page="../header.jsp"></jsp:include>
<body>

   <div id="titl">
        <img id="logo" src="../../img/playButton.PNG" alt="플레이로고">
        <h3>내 정보</h3>
    </div>
   <div class="container default">
        <div class="row">
            <div class="col-md-10">
                <div class="main">
                 <h2 class="protitl">일반 회원 정보</h2>
                    <table class="table table-list-search">
                        <tr> <!-- class="js-load" -->
                          <td class="td2">
                              <ul class="pro_list">
                                  <li class="prolist"><h3 class="h3">아이디</h3> ${mem.id}</li>
                                  <li class="prolist"><h3 class="h3">이메일</h3> ${mem.email}</li>
                                  <li class="prolist"><h3 class="h3">닉네임</h3> ${mem.nickname}</li>
                                  <li class="prolist"><h3 class="h3">가입일</h3> ${mem.cdt}</li>
                                  <li class="prolist"><h3 class="h3">선호장르</h3>
                                  <span class="genre">${mem.genre0}</span>
                                  <span class="genre">${mem.genre1}</span>
                                  <span class="genre">${mem.genre2}</span></li>
                              </ul>
                          </td>
                          <td>
                          <c:choose>
                          <c:when test="${not empty mem.photo}">
                          <img src="../../upload/${mem.photo}" alt="profile" class="proimg">
                          </c:when>
                          <c:otherwise>
                          <img src="../../img/anonymous.png" alt="profile" class="proimg">
                          </c:otherwise>
                          </c:choose>
                          <div class="probtn"><button class="btns btns-outline-dark" onclick="EditMem()">수정하기</button></div>
                          </td>
                      </tr>
                    </table>
                    <c:if test="${empty bus.teamname} || ${empty sup.name}">
                    <div style="text-align: center;">
                        <button class="btns btns-outline-primary" id="btnsbus" onclick="SignBusker()">버스커되기</button>
                        <button class="btns btns-outline-primary" id="btnssup" onclick="SignSupporter()">제공자되기</button>
                    </div>
                    </c:if>
                </div>
            </div>
        </div>
        <c:if test="${not empty bus.teamname }">
        <div class="row">
            <div class="col-md-10">
                <div class="main">
                 <h2 class="protitl">버스커 회원 정보</h2>
                    <table class="table table-list-search">
                        <tr> <!-- class="js-load" -->
                          <td class="td2">
                              <ul class="pro_list">
                                  <li class="prolist"><h3 class="h3">팀명</h3> ${bus.teamname}</li>
                                  <li class="prolist"><h3 class="h3">퍼포먼스/장르</h3> ${bus.teamgenre}</li>
                                  <li class="prolist"><h3 class="h3">활동지역</h3> ${bus.city}</li>
                                  <li class="prolist"><h3 class="h3">연락처</h3> ${bus.tel}</li>
                                  <li class="prolist"><h3 class="h3">사용악기</h3> ${bus.instrument}</li>
                                  <li class="prolist" style="width:100%"><h3 class="h3 teamtitl">팀소개</h3><div class="teamcom"> ${bus.teamInfo}</div></li>
                              </ul>
                          </td>
                          <td>
                          <img src="../../upload/${bus.teamPhoto}" alt="test1" class="proimg">
                          <div class="probtn"><button class="btns btns-outline-dark" onclick="EditBus()">수정하기</button></div>
                          </td>
                      </tr>
                    </table>
                </div>
            </div>
        </div>
        </c:if><c:if test="${not empty sup.name}">
        <div class="row">
            <div class="col-md-10">
                <div class="main">
                 <h2 class="protitl">제공자 회원 정보</h2>
                    <table class="table table-list-search">
                        <tr> <!-- class="js-load" -->
                          <td class="td2">
                              <ul class="pro_list">
                                  <li class="prolist"><h3 class="h3">제공자명</h3> ${sup.name}</li>
                                  <li class="prolist"><h3 class="h3">선호장르</h3> ${sup.sgnere}</li>
                                  <li class="prolist"><h3 class="h3">주소</h3> <div id="addr">${sup.baseaddr} ${sup.detailaddr}</div></li>
                                  <li class="prolist"><h3 class="h3">연락처</h3> ${sup.tel}</li>
                                  <li class="prolist"><h3 class="h3">수용가능인원</h3> ${sup.capa}</li>
                                  <li class="prolist" style="width:100%"><h3 class="h3 teamtitl">희망</h3><div class="teamcom"> ${sup.message}</div></li>
                              </ul>
                          </td>
                          <td>
                          <%-- <img src="../../upload/${sup.stagephotos[0].photo}" alt="test1" class="proimg"> --%>
                          <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            
                              <!-- Wrapper for slides -->
                              <div class="carousel-inner">
                              <c:forEach items="${sup.stagephotos}" var="phot">
                                <div class="item">
                                  <img src="../../upload/${phot.photo}" alt="test1">
                                </div>
                              </c:forEach>
                              </div>
                              
                              <!-- Controls -->
                              <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                              </a>
                              <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                              </a>
                            </div>
                          <div class="probtn"><button class="btns btns-outline-dark" onclick="EditSup()">수정하기</button></div>
                          </td>
                      </tr>
                    </table>
                </div>
            </div>
        </div>
        </c:if>
    </div>
    <script src="../../js/editprofile/edit.js"></script>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>