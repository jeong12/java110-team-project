<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" id="top">

<head>
<meta charset="UTF-8">
<title>공연장 현황</title>
<link rel="stylesheet" href="/css/common.css"/>
<link
    href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
    rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>

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
body{
margin: 0px;
padding: 0px;
}

#bodybody{
    min-height: 850px;
}

#genrediv{
margin-top: 80px;
}
.filter-button{
margin: 5px;
}


.teamnametr{
text-align: center;
}

#js-btn-wrap{
margin-bottom : 300px;
}

.teamPhotoImg {
    width: 230px;
    height: 230px;
    margin: 10px;
    border-radius: 0.25rem;

}

#titl {
    margin: 20px 10px 30px;
    padding: 10px;
}

#logo {
    width: 40px;
    height: 40px;
    margin: 5px;
}

#td3 {
    text-align: right;
    vertical-align: bottom;
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

#searchdiv {
    margin-bottom: 5px;
}

#selectsearch{
height: 35px;
width: 70px;
padding: 0;
text-align: center;
}
#selectsearchbtn{
height: 35px;
width: 35px;
padding: 0;
text-align: center;
}
#selectsearchinput{
height: 35px;
padding: 0;
}

a#movetop {
    position: fixed; right: 2%; bottom: 82px; display: none; z-index: 999;
}
/* 팀이름 크기조절 */
.teamnamefont{
font-size: large;
margin-left: 5px;
text-align: left;
padding:0 10px;
width: 150px;
/* font-family: -webkit-body; */
}
.teamlocalfont{
font-size:small;
color:red;
margin-right: 0;
text-align: right;
width: 100px;
}
/* 날짜 */
#startdateenddate{
    margin-left: 18%;
}
    #js-btn-wrap a.more-button:hover {
    color: white; text-decoration: none;
}
</style>
</head>
<jsp:include page="../header.jsp"></jsp:include>
<body>
<div id="bodybody">
<div id="pos"></div>
    <div class="container">
        <div id="titl">
            <h3><img id="logo" src="../../img/playButton.PNG" alt="플레이로고">공연장 현황</h3>
        </div>
    </div>
    <div class="container" id="searchdiv">
        <div class="row">
            <!-- 인기순 최신순 -->
            <div id="startdateenddate">
				<p style="font-size: 18px; margin: 0 0 20px 0;">조회기간 
				    <input type="text" id="from" name="sdt" placeholder=" 시작일" style="font-size: 12px; margin: 0 10px 0 5px;"
				    value="<%=request.getParameter("startDate") != null ? request.getParameter("startDate") : ""%>"> 
				    ~
				    <input type="text" id="to" name="edt" placeholder=" 종료일" style="font-size: 12px; margin: 0 5px 0 5px;"
				    value="<%=request.getParameter("endDate") != null ? request.getParameter("endDate") : ""%>"> 
				</p>
            </div>
        
            <div class="col-xs-8 col-xs-offset-2">
                <!-- <form method="get" class="form-inline"> -->
                <div class="input-group">
                    <div class="input-group-btn search-panel">
                        <select id="selectsearch" class="btn btn-default dropdown-toggle">
                            <!-- <option value="city">지역</option> -->
                            <option value="city" ${searchType eq "city" ? "selected" :""}>지역</option>
                            <!-- <option value="name">무대명</option> -->
                            <option value="name" ${searchType eq "name" ? "selected" :""}>무대명</option>
                            <!-- <option value="genre">장르</option> -->
                        </select>
                    </div>
                    <input type="text" class="form-control" name="city"
                        placeholder="정보를 입력해주세요" onkeydown="pushenter()" id="selectsearchinput" 
                        value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>" > 
                        <span class="input-group-btn">
	                        <button class="btn btn-default" id="selectsearchbtn" onclick="PageMove()">
	                            <span class="glyphicon glyphicon-search"></span>
	                        </button> <input type="hidden" name="searchType"
	                        value="<%=request.getParameter("searchType") != null ? request.getParameter("searchType") : ""%>" />
	                        <input type="hidden" name="keyword"
	                        value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>" />
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
                            <div class="gallery_product col-lg-3 col-md-4 col-sm-4 col-xs-6 filter ${list.genre}">
                                <a href="/app/applystages/page?sno=${list.sno}" 
                                style="text-decoration: none; color: #555; " class="js-load">
                                    <table>
                                        <tr>
                                            <td colspan="2"><img src="../../upload/${list.photoName}"
                                                class="teamPhotoImg"></td>
                                        </tr>
                                        <tr class="teamnametr">
                                            <td class="teamlocalfont">${list.local}</td>
                                            <td class="teamnamefont">${list.name}</td>
                                        </tr>
                                    </table>
                                </a>
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
                            <div class="gallery_product col-lg-3 col-md-4 col-sm-4 col-xs-6 filter ${name.genre}">
                                <a href="/app/applystages/page?sno=${name.sno}" 
                                style="text-decoration: none; color: #555; " class="js-load">
                                    <table>
                                        <tr>
                                            <td><img src="../../img/${name.photoName}.png"
                                                class="teamPhotoImg"></td>
                                        </tr>
                                        <tr class="teamnametr">
                                            <td class="teamlocalfont">${list.local}</td>
                                            <td class="teamnamefont">${name.name}</td>
                                        </tr>
                                    </table>
                                </a>
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
                            <div class="gallery_product col-lg-3 col-md-4 col-sm-4 col-xs-6 filter ${local.genre}">
                                <a href="/app/applystages/page?sno=${local.sno}" style="text-decoration: none; color: #555; " class="js-load">
                                    <table>
                                        <tr>
                                            <td><img src="../../img/${local.photoName}.png"
                                                class="teamPhotoImg"></td>
                                        </tr>
                                        <tr class="teamnametr">
                                            <td class="teamlocalfont">${list.local}</td>
                                            <td class="teamnamefont">${local.name}</td>
                                        </tr>
                                    </table>
                                </a>
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
                            <div class="gallery_product col-lg-3 col-md-4 col-sm-4 col-xs-6 filter ${genre.genre}">
                                <a href="/app/applystages/page?sno=${genre.sno}" 
                                style="text-decoration: none; color: #555; " class="js-load">
                                    <table>
                                        <tr>
                                            <td><img src="../../img/${genre.photoName}.png" class="teamPhotoImg"></td>
                                        </tr>
                                        <tr class="teamnametr">
                                            <td class="teamlocalfont">${list.local}</td>
                                            <td class="teamnamefont">${genre.name}</td>
                                        </tr>
                                    </table>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
    <div id="js-btn-wrap" class="btn-wrap">
        <a href="javascript:;" class="more-button">더보기</a>
    </div>

 <a href="#" id="movetop"><img src="../../img/topbtn.png"></a>

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="/js/headerfixing.js"></script>
    <script src="/js/promotion/promofilter.js"></script>
    <script src='../../js/jquery.easing.1.3.js'></script>
    <script src="//code.jquery.com/ui/1.8.18/jquery-ui.js"></script>    
    <script>
    //jequery-ui안에서 msie 프로퍼티를 불러오기 위한 jQery.browser 가 없어서 따로 만들어놓음 
    jQuery.browser = {};
    (function () {
        jQuery.browser.msie = false;
        jQuery.browser.version = 0;
        if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
            jQuery.browser.msie = true;
            jQuery.browser.version = RegExp.$1;
        }
    })();
    
    
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
