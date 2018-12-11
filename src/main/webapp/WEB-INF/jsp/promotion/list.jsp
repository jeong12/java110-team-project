<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" id="top">

<head>
<meta charset="UTF-8">
<title>버스커홍보</title>
<link
  href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
  rel="stylesheet" id="bootstrap-css"
>
<link rel="stylesheet" href="/css/common.css" />
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script>
    $(window).on('load', function() {
        load('.js-load', '5');
        $("#js-btn-wrap .more-button").on("click", function() {
            load('.js-load', '5', '#js-btn-wrap');
        })
    });

    function load(id, cnt, btn) {
        var girls_list = id + ":not(.active)";
        var girls_length = $(girls_list).length;
        var girls_total_cnt;
        if (cnt < girls_length) {
            girls_total_cnt = cnt;
        } else {
            girls_total_cnt = girls_length;
            $('.more-button').hide()
        }
        $(girls_list + ":lt(" + girls_total_cnt + ")").addClass("active");
    }
</script>
<style>
.container {
    width: 1000px;
}

#titl {
    margin: 0 auto; padding: 10px; width: 1000px;
}

#logo {
    width: 40px; height: 40px; margin: 10px;
}

h3 {
    display: inline-block; position: relative; top: .5rem;
}

#td2 .more-button {
    font-size: 1rem;
}

#td3 {
    text-align: right; vertical-align: bottom;
}

ul li.promotion {
    list-style-type: none; line-height: 1.4rem; font-size: .8rem;
}

.td2 {
    width: 700px;
}

.js-load {
    display: none;
}

.js-load.active {
    display: block;
}

.js-load:after {
    display: none;
}

.btn-wrap, .lists {
    display: block;
    margin-bottom: 100px;
}

.btn-wrap {
    text-align: center;
}

tbody tr td {
    background-color: #fff !important;
}

.mb {
    margin-bottom: .8rem;
}

.proimg {
    border-radius: 2rem; height: 9rem; width: 9.2rem; margin-top: 20px;
}

td {
    padding-bottom: 0.1rem !important;
}

.pro_list {
    padding-left: 0.8rem; margin: 15px 0 0.1rem 0;
}

.btns-outline-dark {
    float: right; margin-bottom: 7px;
}

.btn-enroll {
    left: 28.5rem;
}

ul li.promotion.titl {
    font-size: 20px; font-weight: 600;
}

.listbtn {
    display: inline;
}

.form-control, #selectsearchbtn {
    height: 36px;
}

a#movetop {
    position: fixed; right: 2%; bottom: 82px; display: none; z-index: 999;
}

.listbtn a{
    margin-right:.5rem; 
}
.input-group {
margin-top: 30px;
}
#enroll{
    margin-top: 15px;
    margin-right: 5%;
}
</style>
</head>
<jsp:include page="../header.jsp"></jsp:include>
<body>
  <div id="pos"></div>
  <div id="titl">
    <img id="logo" src="../../img/playButton.PNG" alt="플레이로고">
    <h3>버스킹 홍보</h3>

    <c:choose>
      <c:when test="${sessionScope.type == 2}">
        <a href='form' class="btns btns-outline-dark btn-enroll"
          id='enroll'
        >홍보등록</a>
      </c:when>
      <c:otherwise></c:otherwise>
    </c:choose>

  </div>
  <div class="container">
    <div class="row mb">
      <div class="col-xs-8 col-xs-offset-2">
        <!-- <form method="post" class="form-inline"> -->
        <div class="input-group">
          <div class="input-group-btn search-panel">
            <select id="selectsearch"
              class="btn btn-default dropdown-toggle"
            >
			<option value="city" ${searchType eq "city" ? "selected" :""}>도시</option>
			<option value="teamname" ${searchType eq "teamname" ? "selected" :""}>팀명</option>
            </select>
          </div>
            <input type="text" class="form-control" name="city"
            placeholder="정보를 입력해주세요" onkeydown="pushenter()" id="selectsearchinput" 
            value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>" > 
          <!-- <input type="hidden" name="search_param" value="all" id="search_param"> -->
          <span class="input-group-btn">
            <button class="btn btn-default" id="selectsearchbtn" onclick="PageMove()" >
              <span class="glyphicon glyphicon-search"></span>
            </button>
          </span>
        </div>
        <!-- </form>  -->
      </div>
    </div>
  </div>

  <div class="container default">
    <div class="row">
      <div class="col-md-12">
        <div class="main">
          <table class="table table-list-search">
            <c:forEach items="${list}" var="pro">
              <tr class="js-load">
                <td>
                  <img src="../../upload/${pro.phot}" alt="test1"
                    class="proimg"
                  >
                </td>
                <td class="td2">
                  <ul class="pro_list">
                    <li class="promotion"><h2 class="article">${pro.titl}</h2></li>
                    <li class="promotion">팀명 : ${pro.teamname}</li>
                    <li class="promotion">장르 : ${pro.genre}</li>
                    <li class="promotion">공연지역 : ${pro.city}</li>
                    <li class="promotion">날짜 : ${pro.sdt} ~
                      ${pro.edt}</li>
                    <li class="promotion">인원 : ${pro.cnt}
                      <div class="listbtn">
                        <a href='../buskerfeed/enter?no=${pro.bno}'
                          class="btns btns-outline-dark"
                        >피드가기</a> <a href='detail?bbno=${pro.bbno}'
                          class="btns btns-outline-dark"
                        >상세보기</a>
                      </div>
                    </li>
                  </ul>
                </td>
              </tr>
            </c:forEach>

          </table>
        </div>
      </div>
    </div>
  </div>

  <div class="container city">
    <div class="row">
      <div class="col-md-12">
        <div class="main">
          <table class="table table-list-search">
            <c:forEach items="${city}" var="pro">
              <tr class="js-load">
                <td>
                  <img src="../../upload/${pro.phot}" alt="test1"
                    style="height: 200px; width: 200px;"
                  >
                </td>
                <td class="td2">
                  <ul class="pro_list">
                    <li class="promotion titl">${pro.titl}</li>
                    <li class="promotion">팀명 : ${pro.teamname}</li>
                    <li class="promotion">장르 : ${pro.genre}</li>
                    <li class="promotion">공연지역 : ${pro.city}</li>
                    <li class="promotion">날짜 : ${pro.sdt} ~
                      ${pro.edt}</li>
                    <li class="promotion">인원 : ${pro.cnt}
                      <div class="listbtn">
                        <a href='../buskerfeed/enter?no=${pro.bno}'
                          class="btns btns-outline-dark"
                        >피드가기</a> <a href='detail?bbno=${pro.bbno}'
                          class="btns btns-outline-dark"
                        >상세보기</a>
                      </div>
                    </li>
                  </ul>
                </td>
              </tr>
            </c:forEach>
          </table>
        </div>
      </div>
    </div>
  </div>

  <div class="container teamname">
    <div class="row">
      <div class="col-md-12">
        <div class="main">
          <table class="table table-list-search">
            <c:forEach items="${teamname}" var="pro">
              <tr class="js-load">
                <td>
                  <img src="../../upload/${pro.phot}" alt="test1"
                    style="height: 200px; width: 200px;"
                  >
                </td>
                <td class="td2">
                  <ul class="pro_list">
                    <li class="promotion titl">${pro.titl}</li>
                    <li class="promotion">팀명 : ${pro.teamname}</li>
                    <li class="promotion">장르 : ${pro.genre}</li>
                    <li class="promotion">공연지역 : ${pro.city}</li>
                    <li class="promotion">날짜 : ${pro.sdt} ~
                      ${pro.edt}</li>
                    <li class="promotion">인원 : ${pro.cnt}
                      <div class="listbtn">
                        <a href='../buskerfeed/enter?no=${pro.bno}'
                          class="btns btns-outline-dark"
                        >피드가기</a> <a href='detail?bbno=${pro.bbno}'
                          class="btns btns-outline-dark"
                        >상세보기</a>
                      </div>
                    </li>
                  </ul>
                </td>
              </tr>
            </c:forEach>
          </table>
        </div>
      </div>
    </div>
  </div>
  <div id="js-btn-wrap" class="btn-wrap">
    <button class="more-button">더보기</button>
  </div>
  <a href="#" id="movetop"><img src="../../img/topbtn.png"></a>

  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script src="/js/headerfixing.js"></script>
  <script src="/js/promotion/promofilter.js"></script>
  <script src='../../js/jquery.easing.1.3.js'></script>
  <script>
            // document.getElementById("selectsearchbtn").onclick = function() {PageMove()};

            function PageMove() {
                var searchType = $("#selectsearch option:selected").val();
                var keyword = $("input[name='city']").val();

				location.href = '/app/promotion/list?searchType=' + searchType + '&keyword=' + keyword;
                // location.href="?city="+i;
                // location.href="?teamname="+i;
            }

            function pushenter() {
                if (window.event.keyCode == 13) {
                    PageMove();
                }
            }
            
            $(document).scroll(function(){
               var st = $(window).scrollTop();
               var movetop = document.getElementById('movetop');
               if(st > 50){
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
