<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>무대 목록</title>
<link
    href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
    rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script
    src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
    $(window).on('load', function() {
        load('.js-load', '12');
        $("#js-btn-wrap .more-button").on("click", function() {
            load('.js-load', '12', '#js-btn-wrap');
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
.teamPhotoImg {
    width: 250px;
    height: 250px;
    margin: 5px;
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

body {
    margin-top: 20px;
}

#td3 {
    text-align: right;
    vertical-align: bottom;
}

ul li {
    list-style-type: none;
    line-height: 30px;
    width: 80%;
}

.td2 {
    width: 700px;
}

.js-load {
    display: none;
    margin: 30px;
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

/* 날짜 */
#startdateenddate{
    margin-left: 18%;
}
</style>
</head>
<body>
    <div id="titl">
        <img id="logo" src="../../img/playButton.PNG" alt="플레이로고">
        <h2>무대 목록</h2>
    </div>
    <div class="container">
        <div class="row">
            <!-- 인기순 최신순 -->
            <div id="startdateenddate">
				<p>조회기간:
				    <input type="text" id="from" name="sdt" placeholder="날짜를 선택하세요"> ~
				    <input type="text" id="to" name="edt" placeholder="날짜를 선택하세요">
				</p>
            </div>
        
            <div class="col-xs-8 col-xs-offset-2">
                <!-- <form method="get" class="form-inline"> -->
                <div class="input-group">
                    <div class="input-group-btn search-panel">
                        <select id="selectsearch" class="btn btn-default dropdown-toggle">
                            <option value="city">도시</option>
                            <option value="teamname" selected="selected">팀명</option>
                            <option value="genre">장르</option>
                        </select>
                    </div>
                    <input type="text" class="form-control" name="city"
                        placeholder="정보를 입력해주세요" onkeydown="pushenter()"> <span
                        class="input-group-btn">
                        <button class="btn btn-default" id="selectsearchbtn"
                            onclick="PageMove()">
                            <span class="glyphicon glyphicon-search"></span>
                        </button> <input type="hidden" name="searchType"
                        value="<%=request.getParameter("searchType") != null ? request.getParameter("searchType") : ""%>" />
                        <input type="hidden" name="keyword"
                        value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>" />
                        <!-- <button class="btn btn-default" id="selectsearchbtn" onclick="button1_click();"><span class="glyphicon glyphicon-search"></span></button> -->
                    </span>

                </div>

                <!-- </form>  -->
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="main">
                    <div class="table table-list-search">

                        <c:forEach items="${list}" var="list">
                            <div
                                class="gallery_product col-lg-3 col-md-4 col-sm-4 col-xs-6 filter ${tf.teamgenre}">
                                <button class="js-load">
                                    <table>
                                        <tr>
                                            <td><img src="../../img/${list.photoName}.png"
                                                class="teamPhotoImg"></td>
                                        </tr>
                                        <tr>
                                            <td>${list.name}</td>
                                        </tr>
                                    </table>
                                </button>
                            </div>
                        </c:forEach>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="main">
                    <div class="table table-list-search">
                        <c:forEach items="${city}" var="city">
                            <div
                                class="gallery_product col-lg-3 col-md-4 col-sm-4 col-xs-6 filter ${tf.teamgenre}">
                                <button class="js-load">
                                    <table>
                                        <tr>
                                            <td><img src="../../img/${city.photoName}.png"
                                                class="teamPhotoImg"></td>
                                        </tr>
                                        <tr>
                                            <td>${city.name}</td>
                                        </tr>
                                    </table>
                                </button>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="main">
                    <div class="table table-list-search">
                        <c:forEach items="${name}" var="name">
                            <div
                                class="gallery_product col-lg-3 col-md-4 col-sm-4 col-xs-6 filter ${tf.teamgenre}">
                                <button class="js-load">
                                    <table>
                                        <tr>
                                            <td><img src="../../img/${name.photoName}.png"
                                                class="teamPhotoImg"></td>
                                        </tr>
                                        <tr>
                                            <td>${name.name}</td>
                                        </tr>
                                    </table>
                                </button>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="main">
                    <div class="table table-list-search">
                        <c:forEach items="${local}" var="local">
                            <div
                                class="gallery_product col-lg-3 col-md-4 col-sm-4 col-xs-6 filter ${tf.teamgenre}">
                                <button class="js-load">
                                    <table>
                                        <tr>
                                            <td><img src="../../img/${local.photoName}.png"
                                                class="teamPhotoImg"></td>
                                        </tr>
                                        <tr>
                                            <td>${local.name}</td>
                                        </tr>
                                    </table>
                                </button>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="main">
                    <div class="table table-list-search">
                        <c:forEach items="${genre}" var="genre">
                            <div
                                class="gallery_product col-lg-3 col-md-4 col-sm-4 col-xs-6 filter ${tf.teamgenre}">
                                <button class="js-load">
                                    <table>
                                        <tr>
                                            <td><img src="../../img/${genre.photoName}.png"
                                                class="teamPhotoImg"></td>
                                        </tr>
                                        <tr>
                                            <td>${genre.name}</td>
                                        </tr>
                                    </table>
                                </button>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="js-btn-wrap" class="btn-wrap">
        <a href="javascript:;" class="more-button">더보기</a>
    </div>


    <script>
    //날짜 선택
    $.datepicker.setDefaults({
      dateFormat: 'yy-mm',
      prevText: '이전 달',
      nextText: '다음 달',
      monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
      monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
      dayNames: ['일', '월', '화', '수', '목', '금', '토'],
      dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
      dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
      showMonthAfterYear: true,
      yearSuffix: '년'
    });

    var rangeDate = 365; // set limit day
    var setSdate, setEdate;
    $("#from").datepicker({
        dateFormat: 'yy-mm-dd',
        onSelect: function(selectDate){
            var stxt = selectDate.split("-");
                stxt[1] = stxt[1] - 1;
            var sdate = new Date(stxt[0], stxt[1], stxt[2]);
            var edate = new Date(stxt[0], stxt[1], stxt[2]);
                edate.setDate(sdate.getDate() + rangeDate);
            
            $('#to').datepicker('option', {
                minDate: selectDate,
                beforeShow : function () {
                    $("#to").datepicker( "option", "maxDate", edate );                
                    setSdate = selectDate;
                    console.log(setSdate)
            }});
            //to 설정
        }
        //from 선택되었을 때
    });
                
    $("#to").datepicker({ 
        dateFormat: 'yy-mm-dd',
        onSelect : function(selectDate){
            setEdate = selectDate;
            console.log(setEdate)
        }
    });
    $('.selectsearchbtn').on('click', function(e){
        if($('input#from').val() == ''){
            alert('시작일을 선택해주세요.');
            $('input#from').focus();
            return false;
        }else if($('input#to').val() == ''){
            alert('종료일을 선택해주세요.');
            $('input#to').focus();
            return false;
        }

        var t1 = $('input#from').val().split("-");
        var t2 = $('input#to').val().split("-");
        var t1date = new Date(t1[0], t1[1], t1[2]);
        var t2date = new Date(t2[0], t2[1], t2[2]);
        var diff = t2date - t1date;
        var currDay = 24 * 60 * 60 * 1000;
        if(parseInt(diff/currDay) > rangeDate){
            alert('로그 조회 기간은 ' + rangeDate + '일을 초과할 수 없습니다.');        
            return false;
        }

        PageMove();
    });
    //조회 버튼 클릭

    
    //검색
        function PageMove() {
            var searchType = $("#selectsearch option:selected").val();
            var keyword = $("input[name='city']").val();
            var startDate = $("input[name='sdt']").val();
            var endDate = $("input[name='edt']").val();
            
             if(startDate != "" && endDate != ""){
            location.href = '/app/stage/list?searchType='
                    + searchType + '&keyword=' + keyword +'&startDate='+startDate+'&endDate='+endDate;
            }else if(startDate != "" && endDate == ""){
            	location.href = '/app/stage/list?searchType='
                    + searchType + '&keyword=' + keyword +'&startDate='+startDate+'&endDate='+startDate;
            }else if(startDate == "" && endDate != ""){
                location.href = '/app/stage/list?searchType='
                    + searchType + '&keyword=' + keyword +'&startDate='+endDate+'&endDate='+endDate;
            }else {
            	location.href = '/app/stage/list?searchType='+ searchType + '&keyword=' + keyword;
            } 
            
//            location.href = '/app/stage/list?searchType='
//                + searchType + '&keyword=' + keyword +'&startDate='+startDate+'&endDate='+endDate;
        }

        function pushenter() {
            if (window.event.keyCode == 13) {
                PageMove();
            }
        }
    </script>
</body>

</html>
