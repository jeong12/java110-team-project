<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css"
	href="/../css/jquery.datetimepicker.css">
<link href="/css/fullcalendar.min.css" rel="stylesheet">
<link href="/../css/common.css" rel="stylesheet">
<style>
body {
	background-color: snow;
}

#calendar {
	margin: 0 auto;
	margin-top: 12%;
	width: 50%;
	float: left;
}

#calendar, #selectday {
	display: inline-block;
}

#selectday {
	float: right;
	position: relative;
}

#titl {
	margin-top: 4%;
	margin-bottom: 2%;
}

#logo {
	float: left;
	width: 40px;
	height: 40px;
}

#haha {
	margin-top: 0.8%;
	margin-left: 5.5%;
}

#name {
	text-align: center;
	margin: 50px;
	margin-bottom: 4%; 
}
#name h2.article{
    text-align: center;
    font-size: 320%;
}
.tobtbody{
}
#info {
	clear: both;
}

#info table tbody td {
	padding: 10px;
}
.calenderSelectBox {
	float: left;
}

ul li {
	list-style: none;
}

.Atable {
    width: 60%;
    margin: auto;
    border: 1px solid silver;
    border-radius: 17px;
    margin-top: 2%;
    margin-bottom: 2%;
    padding-bottom: 2.5%;
    background-color: white;
}

.maptable1 {
	width: 50%;
	float: left;
}

.Ttable {
	margin-bottom: 34%;
}

.Mtable {
	width: 100%;
	margin-bottom: 112%;
	display: inline;
}

#calendar {
	width: 50%;
	float: left;
	margin-top: 9%;
}

#selectday {
	width: 50%;
	margin-top: 9%;
}

.btable {
	width: 100%;
	height: 40%;
    margin-top: 86%;
}

#photo {
	float: left;
	width: 100%;
	margin-bottom: 7%;
	margin: auto;
	margin-top: 3%;
}

#map {
	clear: both;
	margin-left: 15%;
	margin-top: 5%
}

.maptable {
	padding-left: 8%;
	padding-right: 8%;
}

.calenderSelectBox {
	text-align: center;
	margin-left: 10%;
}

.applydates {
	margin-left: 25%;
	width: 48%;
}

.applydates tbody {
	border: 1px solid silver;
	border-radius: 3%;
}

.tbody tr td {
	border-right: 1px solid silver;
	border-radius: 3%;
}

.abtn {
	margin: 1%;
}

.slideimg {
	float: right;
	margin-top: 2%;
}

#tyy {
	width: 20rem;
	height: 17rem;
}

.ty {
	width: 100%;
	height: 100%;
}

#photo {
	height: 12rem;
	text-align: center;
}

.img {
	margin-left: 0.5%;
	margin-right: 0.5%;
}

<!--boot snipp syule-->
.pricing-divider h3{color: white;} 

.list-unstyled{overflow: auto; min-height: 150px;}
.bg-gradient {
	background: #C9D6FF;
	background: -webkit-linear-gradient(to right, #E2E2E2, #C9D6FF);
	background: linear-gradient(to right, #E2E2E2, #C9D6FF);
}

ul li {
	margin-bottom: 1.4rem;
}
.pricing-divider  {
	border-radius: 20px;
	background: #b9d5e5;
	padding: 1em 0 4em;
	position: relative;
}

.blue b {
	color: #2D5772
}

.pricing-divider-img {
	position: absolute;
	bottom: -2px;
	left: 0;
	width: 100%;
	height: 80px;
}

.deco-layer {
	-webkit-transition: -webkit-transform 0.5s;
	transition: transform 0.5s;
}

.btn-custom {
	background: #f3cccc;
	color: #fff;
	border-radius: 20px
}
.btn-custom:hover{
    background: #dc9090;
    color: #fff;
}

.img-float {
	width: 50px;
	position: absolute;
	top: -3.5rem;
	right: 1rem
}

.princing-item {
	transition: all 150ms ease-out;
	margin-top:	7rem; 
	margin-right: 2rem;
	width: 17rem;
    display: inline-block;
}

.princing-item:hover {
	transform: scale(1.05);
}

.princing-item:hover .deco-layer--1 {
	-webkit-transform: translate3d(15px, 0, 0);
	transform: translate3d(15px, 0, 0);
}

.princing-item:hover .deco-layer--2 {
	-webkit-transform: translate3d(-15px, 0, 0);
	transform: translate3d(-15px, 0, 0);
}
#date{
    font-size:35px;
    margin-top: 2px;
}
input[type="checkbox"] {
    display:none;
}

input[type="checkbox"] + label span {
    display:inline-block;
    width:19px;
    height:19px;
    margin:-2px 10px 0 0;
    vertical-align:middle;
    background:url(/img/check_radio_sheet.png) left top no-repeat;
    cursor:pointer;
}

input[type="checkbox"]:checked + label span {
    background:url(/img/check_radio_sheet.png) -19px top no-repeat;
    background-color:inherit;
}
.modal-header{
    background: #151313;
    color: #fff;
}
.modal-content{
    top:10rem;
}
div h3.article{
    color:#666;
    text-align: center;
    margin-bottom: .7rem;
}
.content{
    margin: 0 1rem 1rem;
}
h4.teamnum{
    display:inline-block;
    min-width: 6rem;
}
#cont{
    resize:none;
    left: 3px;
    
}
#countMsg{
    padding: .4rem 6.1rem;
}
#applbtn{
    text-align: center;
    margin-top: .6rem;
}
#applbtn button.btns {
    font-size: 16px;
    padding: 5px 10px;
    cursor: not-allowed;
}
button.close{
    color: white;
    opacity: 1;
}
}
</style>
<jsp:include page="../header.jsp" />
</head>
<body>
	<div id="titl" class="container">
		<img id="logo" src="../../img/playButton.PNG" alt="플레이로고">
		<h3 id="haha">무대 신청</h3>
	</div>
	<div class='contatiner'>
		<div class="Atable">
			<div class="Ttable">
				<!--  -->
				<!-- 타이틀 -->
				<div id="name">
					<h2 class="article">${list.name}</h2>
				</div>
				<!-- 타이틀끝 -->
				<div class="maptable">

					<!-- 장소내용  -->
					<div class="maptable1" id='info'>
						<table>
							<tbody class="tobtbody">
								<tr>
									<td><h4>상호명/장소명</h4></td>
									<td>${list.name}</td>
								</tr>
								<tr>
									<td><h4>상세주소</h4></td>
									<td>${list.baseaddr}${list.detailaddr}</td>
								</tr>
								<tr>
									<td><h4>수용가능인원</h4></td>
									<td>${list.capa}</td>
								</tr>
								<tr>
									<td><h4>희망 장르</h4></td>
									<td>${list.sgnere}</td>
								</tr>
								<tr>
									<td><h4>연락처</h4></td>
									<td>${list.tel}</td>
								</tr>
								<tr>
									<td><h4>희망 글</h4></td>
									<td>${list.message}</td>
								</tr>
							</tbody>
						</table>


					</div>
					<!-- 장소내용 -->
					<!-- 장소사진 -->
					<div class="slideimg" id="carousel-bounding-box">
						<div class="carousel slide" id="myCarousel">
							<!-- Carousel items -->
							<div class="carousel-inner">

								<c:forEach items="${lists}" var="s">
									<div class="item" id="tyy">
										<img style="height: 100%;" width="100%;" src="/upload/${s.photo}">
									</div>
								</c:forEach>

							</div>
							<!-- Carousel nav -->
							<a class="left carousel-control" href="#myCarousel" role="button"
								data-slide="prev"> <span
								class="glyphicon glyphicon-chevron-left"></span>
							</a> <a class="right carousel-control" href="#myCarousel"
								role="button" data-slide="next"> <span
								class="glyphicon glyphicon-chevron-right"></span>
							</a>
						</div>
					</div>
					<!-- 장소사진끝 -->
				</div>
			</div>




			<div class="Mtable">
				<div class="calenderSelectBox">
					<!-- 캘린더 -->
					<div id='calendar'></div>
					<!-- 캘린더끝 -->

					<!-- 신청(부트스트랩) -->
					<div class="col-4 princing-item blue">
						<div class="pricing-divider ">
							<h3 id="date"></h3>
							<svg class='pricing-divider-img'
								enable-background='new 0 0 300 100' height='100px' id='Layer_1'
								preserveAspectRatio='none' version='1.1' viewBox='0 0 300 100'
								width='300px' x='0px' xml:space='preserve'
								xmlns:xlink='http://www.w3.org/1999/xlink'
								xmlns='http://www.w3.org/2000/svg' y='0px'>
                                <path class='deco-layer deco-layer--1'
									d='M30.913,43.944c0,0,42.911-34.464,87.51-14.191c77.31,35.14,113.304-1.952,146.638-4.729
                                        c48.654-4.056,69.94,16.218,69.94,16.218v54.396H30.913V43.944z'
									fill='#FFFFFF' opacity='0.6'></path>
                                <path class='deco-layer deco-layer--2'
									d='M-35.667,44.628c0,0,42.91-34.463,87.51-14.191c77.31,35.141,113.304-1.952,146.639-4.729
    c48.653-4.055,69.939,16.218,69.939,16.218v54.396H-35.667V44.628z'
									fill='#FFFFFF' opacity='0.6'></path>
          <path class='deco-layer deco-layer--3'
									d='M43.415,98.342c0,0,48.283-68.927,109.133-68.927c65.886,0,97.983,67.914,97.983,67.914v3.716
    H42.401L43.415,98.342z'
									fill='#FFFFFF' opacity='0.7'></path>
          <path class='deco-layer deco-layer--4'
									d='M-34.667,62.998c0,0,56-45.667,120.316-27.839C167.484,57.842,197,41.332,232.286,30.428
    c53.07-16.399,104.047,36.903,104.047,36.903l1.333,36.667l-372-2.954L-34.667,62.998z'
									fill='#FFFFFF'></path>
        </svg>
						</div>

						<div class="card-body bg-white mt-0 shadow">
							<ul class="list-unstyled mb-5 position-relative">
							</ul>
							<div class='stageapplybtn'><button type="button" class="abtn btn btn-lg btn-block  btn-custom"
							data-target="#addcontModal" onclick="addcont()">
							신청</button></div>
						</div>
					</div>
				</div>
				<!-- 신청끝 -->

			</div>

			<div class="btable">
				<!--  -->

				<!-- 지도 -->
				<div id="map" style="width: 800px; height: 450px;"></div>
				<!-- 지도끝 -->
			</div>
		</div>
	</div>



	<!-- 신청하기 모달 -->
	<div class="modal fade" id="addcontModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- header -->
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<button type="button" class="close" data-dismiss="modal">×</button>
					<!-- header title -->
					<h4 class="modal-title">신청하기</h4>
				</div>
				<!-- body -->
				<div class="modal-body">
					<div class="info">
						<h3 class="article">신청내역</h3>
					</div>
					<div class="content">
						<h4 class="teamnum">팀 인원</h4> <input type="number" id="count">
						<br> <div id="countMsg"></div>
                       <h4 class="teamnum" style="float:left;">추가 전달사항</h4>
						<textarea name="cont" id="cont" cols="40" rows="5"></textarea><br>
                        <div id="applbtn">
						<button type="button" class="btns btns-outline-dark" onclick="applyStage()" id='applybtn' disabled>신청하기</button>
                        </div>
					</div>
				</div>

			</div>
			<!-- Footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
	<script src="/js/time/jquery.datetimepicker.full.min.js"></script>
	<script src="/js/fullcalendar.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=15e2302756c9e7098ec0d79f7b4d53f4&libraries=services"></script>
	<script type="text/javascript">
	
$(".tobtbody tr td:nth-child(even)").css("width","73%");

$('.stageapplybtn').hide();
var _prevObj = null;
var sup = document.getElementById('sup').innerHTML;
var busk = document.getElementById('busker').innerHTML;

$(function() {  
  $('#calendar').fullCalendar({      
      dayClick: function(date, jsEvent, view, resourceObj) {
          var current_date = moment().format('YYYY-MM-DD')
          if(current_date > date.format()) {
              
              swal("","오늘 이후의 날짜를 골라주세요","info");
          }else{
              
              /* 캘린더를 누르는순간 제공자가아니면 다음을 진해하지못하게 막는 로직 */
              if(sup.length > 0){
                  swal("오류!","제공자는 무대를 신청할 수 없습니다.","error");
                  return false;
              } else if(busk.length <= 0){
                  swal("오류!","버스커 회원만 무대를 신청할 수 있습니다.","error");
                  return false;
              }
              
              if(_prevObj) {
                  _prevObj.css('background-color', 'white');
                  $(this).css('background-color', 'gray');
              } else 
                  $(this).css('background-color', 'gray');

              _prevObj = $(this); 
            $(".pricing-divider h3").empty();  
            $(".pricing-divider h3").html(date.format());
            $('.card-body ul li').empty();
            $('.applybtn').empty();
            
            
            function getUrlParams() {
                var params = {};
                window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { params[key] = value; });
                return params;
            } 
            var sno = getUrlParams().sno;
            
            
            $.ajax({ 
                type : "POST", 
                url : "chkDates",
                data: {"date":date.format(),"sno":sno},
                success : function(data) {
                        $(".card-body ul").empty();
                 if(data.length==0){
                    // 해당일의 데이터가 없을경우 
                    $(".list-unstyled").append('<li>해당일의 무대가 존재하지않습니다.</li>');
                    $('.stageapplybtn').hide();
                    return
                }else{
       $.each(data,function(index,item){
           var chk = 'chk'+index;
                $(".list-unstyled").append(
                 '<li><input type="checkbox" name="applydate" id="'+chk+'"' + 
                 'value="'+item.sno+'_'+item.nsdt+' - '+item.nedt+'"><label for="'+chk+'"><span></span>'+
                 item.nsdt+' - '+item.nedt+'</label>'+
                 '</li>');
                });
       $('.stageapplybtn').show();
                
                }},
                error : function(request, status, error) {
                    alert("에러가 발생했습니다. 관리자에게 문의하시기 바랍니다");
                }
            });
          }  
  }})
});



$(".item:first").removeClass("item").addClass("active item");
document.getElementById("cont").focus();

function addcont(){
    var chkbox = document.getElementsByName("applydate");
    var chkCnt=0;
    var chks = new Array();
    var j=0;
    for(var i=0;i<chkbox.length; i++){
        if(chkbox[i].checked){
            chks[j] = chkbox[i].value.split("_")[1];
            j++
            chkCnt++;
        }
    }

    if(chkCnt == 0){
        swal("","시간을 체크해야 신청이 가능합니다!","info");
        $('#addcontModal').modal('hide');
        return
    }
   
    $('#addcontModal').on('shown.bs.modal',function(){
        document.getElementById("count").focus();
    });
    
    $('#addcontModal').modal('show');
    $.each(chks,function(index,item){
    $('.card-body ul').append(
            '<li style="display:none;">'+item+'</li>');       
    });
};


function applyStage(){
    document.getElementById("count").focus(); 
    var chkbox = document.getElementsByName("applydate");
    var chkCnt=0;
    var addchk = new Array();
    var j=0;
    for(var i=0;i<chkbox.length; i++){
        if(chkbox[i].checked){
            addchk[j] = chkbox[i].value.split("_")[0];
            j++;
            chkCnt++;
        }
    }

    var cont = $('#cont').val();
    var count = $('#count').val();
    
        swal("","신청하시겠습니까 ?","success").then((will)=>{
            if(will){
                $.ajax({ 
                    type : "GET", 
                    url : "applyStage", 
                    traditional : true,
                    data : {"ssno" : addchk, "cont" : cont, "count":count},
                    success : function(data){
                        
                                window.location.href=window.location.href;  
                    },
                    error : function(request, status, error) {
                        alert("에러가 발생했습니다. 관리자에게 문의하시기 바랍니다");
                    }
                });
            }
        });
}


$('#count').on("focusout",function(){
    var cnt = $('#count').val();
    
    if(cnt == "" || cnt == 0){
       $('#applybtn').prop("disabled", true).css('cursor','not-allowed');
       $('#countMsg').html("1 이상의 팀원 수를 적어주세요").css('color','red');
    }else{
         $('#applybtn').prop("disabled", false).css('cursor','pointer');
          $('#countMsg').html("");
    }
});


 var container = document.getElementById('map');
 var options = {
     center: new daum.maps.LatLng(${list.x}, ${list.y}),
     level: 3
};

 var map = new daum.maps.Map(container, options);
 var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(${list.x}, ${list.y}),
        map: map
 });
 marker.setDraggable(false); // 마커를 움직일수 있게 설정 false일경우 고정!
 map.relayout();




</script>



</body>
<jsp:include page="../footer.jsp" />
</html>
