<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>버스커홍보</title>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function(e){
            $('.search-panel .dropdown-menu').find('a').click(function(e) {
            e.preventDefault();
            var param = $(this).attr("href").replace("#","");
            var concept = $(this).text();
            $('.search-panel span#search_concept').text(concept);
            $('.input-group #search_param').val(param);
            });
        });

        $(window).on('load', function () {
            load('.js-load', '2');
            $("#js-btn-wrap .more-button").on("click", function () {
                load('.js-load', '1', '#js-btn-wrap');
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
   #titl{ margin: 10px; padding: 10px;}
   #logo {width: 50px; height: 50px; margin: 10px;}
   h2{margin-top: -50px; margin-left: 70px; }
   body{margin-top: 20px;}
   #td3{text-align:right; vertical-align: bottom;}
   ul li{list-style-type: none; line-height: 30px; width: 80%;}
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
    </style>
</head>
<body>
    <div id="titl">
        <img id="logo" src="../../img/playButton.PNG" alt="플레이로고">
        <h2>버스킹 홍보</h2>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-xs-8 col-xs-offset-2">
                <form method="post" class="form-inline">
                    <div class="input-group">
                        <div class="input-group-btn search-panel">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                            <span id="search_concept">시간설정</span> <span class="caret"></span>
                            </button>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu">
                            <li><a href="#">행동</a></li>
                            <li><a href="#">다른 행동</a></li>
                            <li><a href="#">여기에는 또 다른</a></li>
                            <li class="divider">ㅎㅇ</li>
                            <li><a href="#">따로 떨어진 링크</a></li>
                        </ul>
                        </div>
                        <input type="text" class="form-control" name="city" placeholder="시,도,군">
                        <!-- <input type="hidden" name="search_param" value="all" id="search_param"> -->
                        <span class="input-group-btn">  
                        <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span></button>
                    </span>
                    </div>
               </form> 
            </div>
        </div>
    </div>
    
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="main">
                    <table class="table table-list-search">
                    <c:forEach items="${list}" var="pro">
                        <tr class="js-load">
                            <td><img src="../../img/${pro.phot}.png" alt="test1" style="height: 200px; width: 200px;"></td>
                            <td class="td2">
                                <ul>
                                    <li>제목 : ${pro.titl}</li>
                                    <li>팀명 : ${pro.teamName}</li>
                                    <li>장르 : ${pro.genre}</li>
                                    <li>공연지역 : ${pro.city}</li>
                                    <li>날짜 : ${pro.sdt} ~ ${pro.edt}</li>
                                    <li>인원 : ${pro.cnt}</li>
                                    <li>내용 : ${pro.etc}</li>
                                </ul>
                            </td>
                            <td id="td3"><button type="button" class="btn btn-primary">버스커피드</button>
                                    <button type="button" class="btn btn-primary">상세보기</button></td>
                        </tr>
                        </c:forEach>
                    
                    </table>
                </div>
            </div>
        </div>
    </div>
    
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="main">
                    <table class="table table-list-search">
                    <c:forEach items="${city}" var="pro">
                        <tr class="js-load">
                            <td><img src="../../img/${pro.phot}.png" alt="test1" style="height: 200px; width: 200px;"></td>
                            <td class="td2">
                                <ul>
                                    <li>제목 : ${pro.titl}</li>
                                    <li>팀명 : ${pro.teamName}</li>
                                    <li>장르 : ${pro.genre}</li>
                                    <li>공연지역 : ${pro.city}</li>
                                    <li>날짜 : ${pro.sdt} ~ ${pro.edt}</li>
                                    <li>인원 : ${pro.cnt}</li>
                                    <li>내용 : ${pro.etc}</li>
                                </ul>
                            </td>
                            <td id="td3"><button type="button" class="btn btn-primary">버스커피드</button>
                                    <button type="button" class="btn btn-primary">상세보기</button></td>
                        </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div id="js-btn-wrap" class="btn-wrap"> <a href="javascript:;" class="more-button">더보기</a> </div>


</body>

</html>
