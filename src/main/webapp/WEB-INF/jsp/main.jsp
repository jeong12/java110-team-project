<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Indiesker</title>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<!-- jquery 먼저 로딩 -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="../js/mainlist.js"></script>
<script src="../js/mainfilter.js"></script>

<style>
.disabled {
    cursor: default;
}

.carousel-item .Ad-slide {
    height: 400px;
}

.carousel-indicators li {
    width: 15px !important; height: 15px !important; border-radius: 15px;
}

#scheduleform {
    margin-top: 10px; margin-bottom: 10px;
}

table {
    text-align: center;
}

.container-mr {
    margin-left: 300px; margin-right: 300px;
}

.contents-menu {
    color: #iefix !important; letter-spacing: 0.1em; font-size: 1.25rem;
    font-weight: 600; margin-left: -20px;
}

.contents-a:hover {
    text-decoration-line: none;
}

.contents-sub {
    font-size: 0.75rem; margin-left: -36px;
}

.underline {
    border: 1px solid black;
}

.carousel-control-next {
    float: right; color: black;
}

.avi-margin {
    margin-left: 8.7rem;
}
.list-inline-item{
    width: 190px;
}
.carousel-control-next, .carousel-control-prev, .carousel-control-next:hover,
    .carousel-control-prev:hover, .carousel-control-next:focus,
    .carousel-control-prev:focus {
    color: black !important;
}

#mainList tr{
    cursor: pointer;
}
.placeMainImg, .BusMainImg{
    width:300px;
    height: 200px;
    margin-top: 1.5rem;
    margin-left:auto;
    margin-right:auto;
    display: block; 
    border-radius: 1rem;
}
.placeImg {
    width:167px;
    height:167px;
    border-radius: 2rem;
} 
.caption {
    position:absolute;
    top:1.3rem;
    right:6rem;
    background:rgba(0,0,0,0.5);
    width:56%;
    height:46%;
    padding:2%;
    text-align:center;
    color:#fff !important;
    z-index:2;
    border-radius: 1rem;
}
.caption h4{
  line-height: 0.5em;
  font-weight: 700;
  font-size: 1.2em;
  text-transform: uppercase;
  margin-top: 1.8rem;
}
.caption p{
  font-size: 0.8em;
  font-weight: 300;
  letter-spacing: 1px;
  -webkit-transform: translateY(40px);
  transform: translateY(40px);
  }
  .caption a, .caption a:hover {
    color:#fff;
  }
 .caption a i {
  position: absolute;
  bottom: 0.8rem;
  right: 0.5rem;
  padding: 0 0.5rem;
  font-size: 2rem;
  -webkit-transform: translateX(-10px);
  transform: translateX(-10px);
  border: 0.2rem solid #fff;
  border-radius: 2rem;
} 

    .custab{
    border: 1px solid #ccc; 
    box-shadow: 3px 3px 2px #ccc;
    transition: 0.5s;
    }
.custab:hover{
    box-shadow: 3px 3px 0px transparent;
    transition: 0.5s;
    }
    .busTh{
    border-right: 1px solid #ccc;
    width: 33%;
    } 
    
    

/* @media ( min-width : 750px) and ( max-width : 1281px) {
    .container-mr {
        margin-left: 3rem; margin-right: 3rem;
    }
    .contents-menu {
        font-size: 1rem; margin-left: -15px;
    }
    .fa-5x {
        font-size: 4em;
    }
} */

/* @media ( max-width : 1199px) {
    .container-mr {
        margin-left: 3rem; margin-right: 3rem;
    }
    .contents-menu {
        font-size: .8rem; margin-left: -13px;
    } 
    .fa-5x {
        font-size: 2rem !important;
    }
    .list-inline-item{
        width: 8rem;
    }
    .contents-sub{
        font-size: 0.55rem;
        margin-left: -1.6rem;
    }
} */

@media ( min-width : 1199px) and ( max-width : 1650px) {
    .container-mr {
        margin-left: 6rem; margin-right: 6rem;
    }
    .contents-menu {
        font-size: 1rem; margin-left: -15px;
    }
    .fa-5x {
        font-size: 4em !important;
    }
    .list-inline-item{
        width: 8rem;
    }
    .contents-sub{
        font-size: 0.55rem;
        margin-left: -1.6rem;
    }
    .placeMainImg{
      width:13rem;
      height: 10rem;
      margin-top: 1rem;
      margin-left:auto;
      margin-right:auto;
      display: block; 
    }
    .placeImg {
        width:6.4rem;
        height:8rem; 
    }
    .placMainSub{
        text-align: center;        
    } 
}
@media (max-width : 1919px){

 .placeMainImg{
      width:13rem;
      height: 10rem;
      margin-top: 1rem;
      margin-left:auto;
      margin-right:auto;
      display: block; 
    }
    .placeImg {
        width:6.4rem;
        height:8rem; 
    }
    .placMainSub{
        text-align: center;        
    } 
}
</style>
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>
  <div id="pos"></div>
  <div class="container-mr">
    <div id="carouselExampleIndicators" class="carousel slide"
      data-ride="carousel"
    >
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0"
          class="active"
        ></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img class="d-block w-100 Ad-slide"
            src="../img/main_test1.JPG" alt="첫번째 슬라이드"
          >
        </div>
        <div class="carousel-item">
          <img class="d-block w-100 Ad-slide"
            src="../img/main_test2.JPG" alt="두번째 슬라이드"
          >
        </div>
        <div class="carousel-item">
          <img class="d-inline-block w-100 Ad-slide"
            src="../img/main_test3.JPG" alt="세번째 슬라이드"
          >
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators"
        role="button" data-slide="prev"
      > <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">이전</span>
      </a> <a class="carousel-control-next"
        href="#carouselExampleIndicators" role="button"
        data-slide="next"
      > <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">다음</span>
      </a>
    </div>

    <div class="container-fluid">
      <div class="row">
        <div class="col-xs-5 col-md-5">
          <div class="input-group" id="scheduleform">
            <input class="form-control" type="text" name="test"
              size="100"
            />
            <button type="button" class="btn btn-outline" id="Sear">Search</button>
          </div>
          <h4 id="list_titl" style="text-align: center;"></h4>
          <div class="table-responsive">
            <table class="table">
            <!-- 비회원,일반 -->
              <thead class="thead-dark" id="mem_lis_head">
                <tr>
                  <th scope="col">팀명</th>
                  <th scope="col">장르</th>
                  <th scope="col">지역</th>
                  <th scope="col">시간</th>
                </tr>
              </thead>
              <!-- 버스커 -->
              <thead class="thead-dark" id="bus_lis_head" style="display:none;">
                <tr>
                  <th scope="col">장소명</th>
                  <th scope="col">선호장르</th>
                  <th scope="col">지역</th>
                </tr>
              </thead>
              <!-- 제공자 -->
              <thead class="thead-dark" id="sup_lis_head" style="display:none;">
                <tr>
                  <th scope="col">팀명</th>
                  <th scope="col">장르</th>
                  <th scope="col">주활동지역</th>
                </tr>
              </thead>
              <tbody id="mainList"></tbody>
            </table>
          </div>
          <div class="row">
            <div class="col-md-12 col-xs-12 mb-3" id="button"></div>
          </div>
        </div>
        <div class="col-md-2 col-xs-1"></div>
        <div class="col-md-5 col-xs-5">
          <!-- 스트리밍 -->
          <div class="streaming"> 
            <h1 class="text-center">현재 공연중</h1>
            <iframe width="400" height="300"
              src="https://www.youtube.com/embed/aR8Fe1lTKHo"
              frameborder="0"
              allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
              allowfullscreen style="display: block; margin: 0 auto;"
            ></iframe>
          </div>
          <!-- HOT PLACE 리스트 자세히 볼때 -->
          <div class="hotPlace" style="display: none">
            <div class="thumb">
              <div class="caption" style="display: none;">
                <h4>무대가 마음에 드시나요?</h4>
                <p>마음에 드신다면 신청하세요!</p>
                <a href=""><i
                  class="fas fa-angle-right"
                ></i></a>
              </div>
              <img class="placeMainImg" alt="test"><br>
            </div>
            <div class="placMainSub">
              <img class="placeImg" alt="test" onclick="placeImg();">
              <img class="placeImg" alt="test" onclick="placeImg();">
              <img class="placeImg" alt="test" onclick="placeImg();">
            </div>
          </div>
          <!-- Best Buskers 리스트 자세히 볼때 -->
          <div class="bestBus" style="display: none">
            <div class="thumb">
              <div class="caption" style="display: none;">
                <h4>더 자세히 보고 싶다면?</h4>
                <a href="#"><i class="fas fa-angle-right"></i></a>
              </div>
              <img class="BusMainImg" alt="test"><br>
            </div>
            <table class="table table-striped custab"></table>
          </div>
        </div>
        <div class="col-md-12">
          <ul class="list-inline nav justify-content-center">
            <li class="list-inline-item mr-2"><a
              href="#" class="contents-a"
            > <i class="far fa-calendar-alt fa-5x"></i> <br> <span
                class="contents-menu"
              >버스킹 일정</span></a> <br>
              <div class="contents-sub col-md-10">원하는 날짜의 버스킹 정보를
                한눈에!</div></li>

            <li class="list-inline-item mx-2"><a
              href="#" class="contents-a"
            > <i class="fas fa-map-marked-alt fa-5x"></i><br> <span
                class="contents-menu"
              >버스킹 위치</span></a><br>
              <div class="contents-sub col-md-10">한눈에 버스킹 위치와 정보를
                제공</div></li>

            <li class="list-inline-item ml-2" ><a
              href="#" class="contents-a"
            > <i class="fas fa-clipboard-list fa-5x"></i><br> <span
                class="contents-menu"
              >버스킹 목록</span></a><br>
              <div class="contents-sub col-md-10">버스커 피드와 정보를
                제공합니다.</div></li>

            <li class="list-inline-item ml-2 mr-2" ><a
              href="javascript:void(0)" class="contents-a" id="blueMenuB"
            > <i class="fas fa-microphone fa-5x"></i><br> <span
                class="contents-menu"
              >버스커 신청</span></a><br>
              <div class="contents-sub col-md-10">도전은 인생을 흥미롭게
                합니다.</div></li>

            <li class="list-inline-item ml-2"><a
              href="javascript:void(0)" class="contents-a" id="blueMenuS"
            > <i class="fas fa-user-plus fa-5x"></i><br> <span
                class="contents-menu"
              >제공자 신청</span></a><br>
              <div class="contents-sub col-md-10">공연,행사를 계획하고
                계신가요?</div></li>
          </ul>
        </div>
      </div>
      <!-- row -->
    </div>
    <!-- container-fluid -->
  </div>

  <div class="container">
    <div class="row mt-md-3">
      <h3>인기동영상</h3>
    </div>
    <p class="underline"></p>

    <div id="carouselPop" class="row carousel slide"
      data-rade="carousel"
    >
      <div class="carousel-inner">
        <div class="carousel-item custom-item">
          <div class="avi-margin">
            <c:forEach items="${avipop}" var="avi" begin="0" end="2">
              <div class="col-ms-3 px-md-1 my-md-1 d-inline-block">
                <a href="javascript:void(0)"
                  onClick="window.open('https://www.youtube.com/watch?v=${avi.urlid}')"
                > <img class="img-thumbnail" alt="avi"
                  src="https://img.youtube.com/vi/${avi.urlid}/hqdefault.jpg"
                  style="width: 250px;"
                >
                </a>
                <div class="text-center small">팀명 :
                  ${avi.teamname}</div>
                <div class="text-center small">제목 : ${avi.title}</div>
                <div class="text-center small">좋아요 수:
                  ${avi.likeAvi}</div>
              </div>
            </c:forEach>
          </div>
        </div>

        <div class="carousel-item custom-item">
          <div class="avi-margin">
            <c:forEach items="${avipop}" var="avi" begin="3" end="5">
              <div class="col-ms-3 px-md-1 my-md-1 d-inline-block">
                <a href="javascript:void(0)"
                  onClick="window.open('https://www.youtube.com/watch?v=${avi.urlid}')"
                > <img class="img-thumbnail" alt="avi"
                  src="https://img.youtube.com/vi/${avi.urlid}/hqdefault.jpg"
                  style="width: 250px;"
                >
                </a>
                <div class="text-center small">팀명 :
                  ${avi.teamname}</div>
                <div class="text-center small">제목 : ${avi.title}</div>
                <div class="text-center small">좋아요 수:
                  ${avi.likeAvi}</div>
              </div>
            </c:forEach>
          </div>
        </div>

        <div class="carousel-item custom-item">
          <div class="avi-margin">
            <c:forEach items="${avipop}" var="avi" begin="6">
              <div class="col-ms-3 px-md-1 my-md-1 d-inline-block">
                <a href="javascript:void(0)"
                  onClick="window.open('https://www.youtube.com/watch?v=${avi.urlid}')"
                > <img class="img-thumbnail" alt="avi"
                  src="https://img.youtube.com/vi/${avi.urlid}/hqdefault.jpg"
                  style="width: 250px;"
                >
                </a>
                <div class="text-center small">팀명 :
                  ${avi.teamname}</div>
                <div class="text-center small">제목 : ${avi.title}</div>
                <div class="text-center small">좋아요 수:
                  ${avi.likeAvi}</div>
              </div>
            </c:forEach>
          </div>
        </div>

      </div>
      <a class="carousel-control-prev" href="#carouselPop" role="button"
        data-slide="prev"
      > <span aria-hidden="true"><i class="fas fa-chevron-left"></i></span>
        <span class="sr-only">이전</span>
      </a> <a class="carousel-control-next" href="#carouselPop"
        role="button" data-slide="next"
      > <span aria-hidden="true"><i
          class="fas fa-chevron-right"
        ></i></span> <span class="sr-only">다음</span>
      </a>
    </div>

    <div class="rec_avi" style="display:none">
      <div class="row mt-md-3">
        <h3>최신 동영상</h3>
      </div>
      <p class="underline"></p>

      <div id="carouselRec" class="row carousel slide"
        data-rade="carousel"
      >
        <div class="carousel-inner">
          <div class="carousel-item custom-item">
            <div class="avi-margin">
              <c:forEach items="${avirec}" var="avi" begin="0" end="2">
                <div class="col-ms-3 px-md-1 my-md-1 d-inline-block">
                  <a href="javascript:void(0)"
                    onClick="window.open('https://www.youtube.com/watch?v=${avi.urlid}')"
                  > <img class="img-thumbnail" alt="avi"
                    src="https://img.youtube.com/vi/${avi.urlid}/hqdefault.jpg"
                    style="width: 250px;"
                  >
                  </a>
                  <div class="text-center small">팀명 :
                    ${avi.teamname}</div>
                  <div class="text-center small">제목 : ${avi.title}</div>
                </div>
              </c:forEach>
            </div>
          </div>
          <div class="carousel-item custom-item">
            <div class="avi-margin">
              <c:forEach items="${avirec}" var="avi" begin="3" end="5">
                <div class="col-ms-3 px-md-1 my-md-1 d-inline-block">
                  <a href="javascript:void(0)"
                    onClick="window.open('https://www.youtube.com/watch?v=${avi.urlid}')"
                  > <img class="img-thumbnail" alt="avi"
                    src="https://img.youtube.com/vi/${avi.urlid}/hqdefault.jpg"
                    style="width: 250px;"
                  >
                  </a>
                  <div class="text-center small">팀명 :
                    ${avi.teamname}</div>
                  <div class="text-center small">제목 : ${avi.title}</div>
                </div>
              </c:forEach>
            </div>
          </div>
          <div class="carousel-item custom-item">
            <div class="avi-margin">
              <c:forEach items="${avirec}" var="avi" begin="6">
                <div class="col-ms-3 px-md-1 my-md-1 d-inline-block">
                  <a href="javascript:void(0)"
                    onClick="window.open('https://www.youtube.com/watch?v=${avi.urlid}')"
                  > <img class="img-thumbnail" alt="avi"
                    src="https://img.youtube.com/vi/${avi.urlid}/hqdefault.jpg"
                    style="width: 250px;"
                  >
                  </a>
                  <div class="text-center small">팀명 :
                    ${avi.teamname}</div>
                  <div class="text-center small">제목 : ${avi.title}</div>
                </div>
              </c:forEach>
            </div>
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselRec"
          role="button" data-slide="prev"
        > <span aria-hidden="true"><i
            class="fas fa-chevron-left"
          ></i></span> <span class="sr-only">이전</span>
        </a> <a class="carousel-control-next" href="#carouselRec"
          role="button" data-slide="next"
        > <span aria-hidden="true"><i
            class="fas fa-chevron-right"
          ></i></span> <span class="sr-only">다음</span>
        </a>
      </div>
    </div>

    <div class="fol_avi" style="display:none">
      <div class="row mt-md-3">
        <h3>팔로우 동영상</h3>
      </div>
      <p class="underline"></p>

      <div id="carouselFol" class="row carousel slide"
        data-rade="carousel"
      >
        <div class="carousel-inner">
          <div class="carousel-item custom-item">
            <div class="avi-margin" id="chkFol">
              <c:forEach items="${folavi}" var="avi" begin="0" end="2">
                <div class="col-ms-3 px-md-1 my-md-1 d-inline-block">
                  <a href="javascript:void(0)"
                    onClick="window.open('https://www.youtube.com/watch?v=${avi.urlid}')"
                  > <img class="img-thumbnail" alt="avi"
                    src="https://img.youtube.com/vi/${avi.urlid}/hqdefault.jpg"
                    style="width: 250px;"
                  >
                  </a>
                  <div class="text-center small">팀명 :
                    ${avi.teamname}</div>
                  <div class="text-center small">제목 : ${avi.title}</div>
                </div>
              </c:forEach>
            </div>
          </div>
          <c:if test="${not empty folavi[3].urlid}"> 
          <div class="carousel-item custom-item">
            <div class="avi-margin">
              <c:forEach items="${folavi}" var="avi" begin="3" end="5">
                <div class="col-ms-3 px-md-1 my-md-1 d-inline-block">
                  <a href="javascript:void(0)"
                    onClick="window.open('https://www.youtube.com/watch?v=${avi.urlid}')"
                  > <img class="img-thumbnail" alt="avi"
                    src="https://img.youtube.com/vi/${avi.urlid}/hqdefault.jpg"
                    style="width: 250px;"
                  >
                  </a>
                  <div class="text-center small">팀명 :
                    ${avi.teamname}</div>
                  <div class="text-center small">제목 : ${avi.title}</div>
                </div>
              </c:forEach>
            </div>
          </div>
          </c:if>
          <c:if test="${not empty folavi[6].urlid}">
          <div class="carousel-item custom-item">
            <div class="avi-margin">
              <c:forEach items="${folavi}" var="avi" begin="6">
                <div class="col-ms-3 px-md-1 my-md-1 d-inline-block">
                  <a href="javascript:void(0)"
                    onClick="window.open('https://www.youtube.com/watch?v=${avi.urlid}')"
                  > <img class="img-thumbnail" alt="avi"
                    src="https://img.youtube.com/vi/${avi.urlid}/hqdefault.jpg"
                    style="width: 250px;"
                  >
                  </a>
                  <div class="text-center small">팀명 :
                    ${avi.teamname}</div>
                  <div class="text-center small">제목 : ${avi.title}</div>
                </div>
              </c:forEach>
            </div>
          </div>
          </c:if>
        </div>
        <a class="carousel-control-prev" href="#carouselFol"
          role="button" data-slide="prev"
        > <span aria-hidden="true"><i
            class="fas fa-chevron-left"
          ></i></span> <span class="sr-only">이전</span>
        </a> <a class="carousel-control-next" href="#carouselFol"
          role="button" data-slide="next"
        > <span aria-hidden="true"><i
            class="fas fa-chevron-right"
          ></i></span> <span class="sr-only">다음</span>
        </a>
      </div>
    </div>

  </div>
  <!-- custom -->
  <script src="../js/headerfixing.js"></script>
  <script src="../js/todayTime.js"></script>
  <script>
  <!--동영상 첫 슬라이드 활성화-->
  $('#carouselPop').find('.custom-item:first').addClass('active');
  $('#carouselRec').find('.custom-item:first').addClass('active');
  $('#carouselFol').find('.custom-item:first').addClass('active');
  </script>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>