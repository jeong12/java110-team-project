<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>버스커홍보</title>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="/css/button.css"/> 
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
    <script>
    
        $(window).on('load', function () {
            load('.js-load', '5');
            $("#js-btn-wrap .more-button").on("click", function () {
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
    .container{ 
        width:1000px;
    }
   #titl{ margin: 10px; padding: 10px;}
   #logo {width: 40px; height: 40px; margin: 10px;}
   h3{display:inline-block; position: relative; top:.5rem;}
   body{margin-top: 20px;}
   #td2 .more-button{
    font-size:1rem; 
   }
   #td3{text-align:right; vertical-align: bottom;}
   ul li.promotion{list-style-type: none; line-height: 1.2rem; width: 80%; font-size:.8rem;}
   .td2{width:700px;}
    
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
    }
    .btn-wrap {
        text-align: center;
    }
    tbody tr td {
        background-color: #fff !important;
    }
    .mb{
        margin-bottom: .4rem;
    }
    .proimg{
    border-radius:2rem;
        height: 8.5rem;
        width: 9.2rem;
    }
    td{ 
    padding-bottom:0.1rem !important; 
    }
    .pro_list{
        padding-left:0.8rem;
        margin:0.1rem 0 0.1rem 0;
    }
    .btn-list{
        left: 6rem;
    }
    .btn-enroll, .btn-enroll:hover, .btn-enroll:after,
     .btn-enroll:visited, .btn-enroll:active, .btn-enroll:link{
        top:0;
        left:-2rem;
        color:#fff;
        text-decoration: none;
    }
    </style>
</head>
<jsp:include page="../header.jsp"></jsp:include>
<body>
<div id="pos"></div>
    <div class="container">
    <div id="titl">
        <img id="logo" src="../../img/playButton.PNG" alt="플레이로고">
        <h3>버스킹 홍보</h3>
        <a href="javascript:void(0)" class="btns btn-dark btn-enroll">홍보하기</a>
    </div>
        <div class="row mb">
            <div class="col-xs-8 col-xs-offset-2">
                <!-- <form method="post" class="form-inline"> -->
                    <div class="input-group">
                        <div class="input-group-btn search-panel">
                            <select id="selectsearch" class="btn btn-default dropdown-toggle">
                                <option value="city">도시</option>
                                <option value="teamname" selected="selected">팀명</option>
                            </select>
                        </div>
                        <input type="text" class="form-control" name="city" placeholder="시,도,군" onkeydown="pushenter()">
                        <!-- <input type="hidden" name="search_param" value="all" id="search_param"> -->
                        <span class="input-group-btn">  
                        <button class="btn btn-default" id="selectsearchbtn" onclick="PageMove()"><span class="glyphicon glyphicon-search"></span></button>
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
                            <img src="../../upload/${pro.phot}" alt="test1" class="proimg">
                            </td>
                            <td class="td2">
                                <ul class="pro_list">
                                    <li class="promotion">제목 : ${pro.titl}</li>
                                    <li class="promotion">팀명 : ${pro.teamname}</li>
                                    <li class="promotion">장르 : ${pro.genre}</li>
                                    <li class="promotion">공연지역 : ${pro.city}</li>
                                    <li class="promotion">날짜 : ${pro.sdt} ~ ${pro.edt}</li>
                                    <li class="promotion">인원 : ${pro.cnt}</li>
                                    <li class="promotion">내용 : ${pro.etc}</li>
                                    <li class="promotion"><a href="#" class="btns btn-dark btn-list">피드가기</a>
                                    <a href="#" class="btns btn-dark btn-list">상세보기</a></li>
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
                            <td><img src="../../upload/${pro.phot}" alt="test1" style="height: 200px; width: 200px;"></td>
                            <td class="td2">
                                <ul class="pro_list">
                                    <li class="promotion">제목 : ${pro.titl}</li>
                                    <li class="promotion">팀명 : ${pro.teamname}</li>
                                    <li class="promotion">장르 : ${pro.genre}</li>
                                    <li class="promotion">공연지역 : ${pro.city}</li>
                                    <li class="promotion">날짜 : ${pro.sdt} ~ ${pro.edt}</li>
                                    <li class="promotion">인원 : ${pro.cnt}</li>
                                    <li class="promotion">내용 : ${pro.etc}</li>
                                    <li class="promotion"><a href="#" class="btns btn-dark">피드가기</a>
                                    <a href="#" class="btns btn-dark">상세보기</a></li>
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
                            <td><img src="../../upload/${pro.phot}" alt="test1" style="height: 200px; width: 200px;"></td>
                            <td class="td2">
                                <ul class="pro_list">
                                    <li class="promotion">제목 : ${pro.titl}</li>
                                    <li class="promotion">팀명 : ${pro.teamname}</li>
                                    <li class="promotion">장르 : ${pro.genre}</li>
                                    <li class="promotion">공연지역 : ${pro.city}</li>
                                    <li class="promotion">날짜 : ${pro.sdt} ~ ${pro.edt}</li>
                                    <li class="promotion">인원 : ${pro.cnt}</li>
                                    <li class="promotion">내용 : ${pro.etc}</li>
                                    <li class="promotion"><a href="#" class="btns btn-dark">피드가기</a>
                                    <a href="#" class="btns btn-dark">상세보기</a></li>
                                </ul>
                            </td>
                        </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div id="js-btn-wrap" class="btn-wrap"> <button class="more-button">더보기</button> </div>


<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="/js/headerfixing.js"></script>
<script src="/js/promotion/promofilter.js"></script>
<script>
   // document.getElementById("selectsearchbtn").onclick = function() {PageMove()};

    function PageMove(){
        var searchType = $("#selectsearch option:selected").val();
        var keyword = $("input[name='city']").val();

        location.href= '?' + searchType + '=' + keyword;
        // location.href="?city="+i;
        // location.href="?teamname="+i;
    }

    function pushenter() {
        if (window.event.keyCode == 13) {
            PageMove();
        }
    }


</script>
  
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>
