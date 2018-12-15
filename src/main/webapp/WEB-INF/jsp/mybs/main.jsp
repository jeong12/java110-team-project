<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8' />
    <title>내 의뢰현황</title>
<!-- 모달 -->
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css"
    href="/../css/jquery.datetimepicker.css">
<link rel="stylesheet" type="text/css"
    href="/../css/common.css">
    

<link href="/css/fullcalendar.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha256-3dkvEK0WLHRJ7/Csr0BZjAWxERc5WH7bdeUya2aXxdU= sha512-+L4yy6FRcDGbXJ9mPG8MT/3UCDzwR9gPeyFNMCtInsol++5m3bk2bXWKdZjvybmohrAsn3Ua5x8gfLnbE1YkOg==" crossorigin="anonymous">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
.pricing-divider h3{color: white;}

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
    background: #C64545;
    color: #fff;
    border-radius: 20px
}

.img-float {
    width: 50px;
    position: absolute;
    top: -3.5rem;
    right: 1rem
}

.princing-item {
    transition: all 150ms ease-out;
    float: right;
    margin-top:    0rem;
    margin-right: 0rem;
    width: 20rem;
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
th{text-align: -webkit-center !important; }
/* sdfajkl;sdfajkl;fasd */
#calendar {
	max-width: 900px;
	margin: 0 auto;
}

#calendar{
	display: inline-block;
}

#logo {
	width: 40px;
	height: 40px;
}

#addschedule {
	float: right;
}

.cc {
	margin-left: 30%
}

.detailinfobtn,.removebtn{
    font-size: 20%;
}
.fc-day-number.fc-sat.fc-past { color:#0000FF; }     /* 토요일 */
.fc-day-number.fc-sun.fc-past { color:#FF0000; }    /* 일요일 */

.label-info,.badge-info{background-color:#3a87ad;}

/* Tabs css */
.list-group-horizontal .list-group-item {
    display: inline-block;
    cursor:pointer;
}
.list-group-horizontal .list-group-item {
    margin-bottom: 0;
    margin-left:-4px;
    margin-right: 0;
}
.list-group-horizontal .list-group-item:first-child {
    border-top-right-radius:0;
    border-bottom-left-radius:4px;
}
.list-group-horizontal .list-group-item:last-child {
    border-top-right-radius:4px;
    border-bottom-left-radius:0;
}

ul{
    padding-left: 0px;
}

.span12{
display: none;
}

.span12.current{
display:inherit;
} 

#map,#reqmap,#permap,#editmap{
    margin-top: 10px;
    border: 3px solid gray;
}

#map img {
  max-width: none;
  height: auto;
  border: 0;
  -ms-interpolation-mode: bicubic;
}
.pages{
  text-align: center;
    
}

.btns{
    padding: 0;
    width: 4rem;
    height: 2rem;
    font-size:0.8rem;    
}
#titl{margin-top: 2%; margin-bottom: 2%;}
#logo{float: left;}
#haha{    margin-top: 0.7%;
    margin-left: 5%;}
#addschedulebtn{
    width: 6rem;
    margin-top: 1%;
    margin-left: 13%;
}

.table td{
    vertical-align: middle !important;
}

.table th{
    text-align: center;
}


.label{
    padding: .3em .6em .3em;
    font-size: 86%;
    font-weight: 700;
}
.nodata{
    margin-bottom: 0;
    background-color: white;
    border-radius:0.25rem;
    height: 20.3rem;
}

.pricing-divider h5{
    text-align: center;
    vertical-align: middle;
}

#selectday{
    font-size:35px;
    margin-top: 10px;
    margin-bottom: 20px;
    color: black;
    
}

#databody{
    background-color: white;
    height: 20rem;
    border-radius: 0 0 1.1rem 1.1rem;
}
#nodata *{
    margin-top: 0;
}
#datatable{
    border: 0;
}
</style>

</head>
<body>
    <jsp:include page="../header.jsp"></jsp:include> 
	<div id="titl" class="container">
		<img id="logo" src="/img/playButton.PNG" alt="플레이로고">
		<h3 id="haha">내 의뢰현황</h3>
	</div>


	<div class="container">
		<div class="col-sm-6" style="float:left; width:60%;">
			<div id='calendar'></div>
		</div>

		<div class="col-lg-6" style="float:right; width:30%; text-align:center;"> <!-- 이거하면된다고?-->
			<div class="col-4 princing-item blue">
				<div class="pricing-divider ">
					<h3 id='selectday'>날짜를 선택해주세요</h3>
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

				<div class="card-body bg-white mt-0 shadow" id='databody' >
					<div class="list-unstyled mb-5 position-relative" class='nodata'>
					   <table  id='datatable'>
                            <thead>
                                <tr>
                                    <th width="140px">시간</th>
                                    <th width="140px">공연장소명</th>
                                    <th width="194px">주소</th>
                                </tr>
                            </thead>
                            <tbody id='clickdate'>

                            </tbody>
                        </table>
                        <h5 id='nodata'></h5>
					</div>
				</div>
			</div>

		</div>
	</div> 
	
<div class="container">
    <div class="row" style="padding-top:50px;">
        
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-left" style='display:inline-block;'>
                <div id="addschedule">
                   <button type="button" class="btns btns-outline-primary" data-toggle="modal"
                       data-target="#myModal" id="addschedulebtn">스케줄등록하기</button>
               </div>
            <div class="list-group list-group-horizontal">
               <ul class='tabs'>
                    <li class="list-group-item active current" data-tab='tab1'>전체보기</li>
                    <li class="list-group-item" data-tab='tab2'>진행중</li>
                    <li class="list-group-item" data-tab='tab3'>완료</li>
                    <li class="list-group-item" data-tab='tab4'>개인스케줄</li>
                </ul>
	           
            </div>
            <!-- 스케줄등록 모달  -->
        </div>
        
        
    </div>
</div>	


<div class="container" style="width=70%; text-align: center;">
    <div class="row" style="width=100%">
        <div class="span12 current" id='tab1'>
            <table class="table table-striped table-condensed">	
				<thead>
					<tr>
						<th>상호명</th>
						<th>지역</th>
						<th>공연시간</th>
						<th>신청인원</th>
						<th>진행상태</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody id='schedulelist'>
					<c:forEach items="${list}" var="list">
						<tr>
							<td>${list.shopname}</td>
							<td>${list.addr}</td>
							<td>${list.nsdt}~${list.nedt}</td>
							<td>${list.cnt}명</td>
							<td><c:choose>
									<c:when test="${list.flag eq '1'.charAt(0) }">
									      <span class="label label-warning">진행중</span>                                    
			                              
			                        </c:when>
									<c:when test="${list.flag eq '2'.charAt(0) }">
			                              <span class="label label-success">완료</span>
			                        </c:when>
									<c:otherwise>
			                              <span class="label label-info">개인스케줄</span>                                 
			                        </c:otherwise>
								</c:choose></td>
							<td>${list.ncdt}</td>
							<c:choose>
								<c:when test="${list.flag eq '3'.charAt(0)}">
									<td>
										<button data-toggle="modal" data-target="#detailperModal"
											class="btns btns-outline-secondary detailinfobtn" value="b${list.sno}">상세보기</button>
									</td>
									<td>
										<button class='btns btns-outline-danger removebtn' value="b${list.sno}">삭제</button>
									</td>
								</c:when>
								<c:otherwise>
									<td>
										<button data-toggle="modal" data-target="#detailreqModal"
											class="btns btns-outline-secondary detailinfobtn" value="a${list.sno}">상세보기</button>
									</td>
									<td>
										<button class='btns btns-outline-danger removebtn' value="a${list.sno}">삭제</button>
									</td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</tbody>
		   </table>
		   <nav aria-label="Page navigation example" class='pages' style="text-align: center;">
                            <ul class="pagination justify-content-center">
                                <li class="page-item">
                                    <a class="page-link" href="javascript:goPage(${listpaging.prevPageNo},'list')">Previous</a></li>
                                    
                                <c:forEach var="i" begin="${listpaging.startPageNo}" end="${listpaging.endPageNo}" step="1">
                                 <c:choose>
                                 <c:when test="${i eq listpaging.pageNo}">
                                    <li class="page-item active">
                                    <a href="javascript:goPage(${i},'list')" class="choice">${i}</a></li>
                                 </c:when>
                                 <c:otherwise>
                                  <li class="page-item">
                                  <a href="javascript:goPage(${i},'list')">${i}</a></li>
                                </c:otherwise>
                                </c:choose>
                                </c:forEach>
                                <li class="page-item">
                                    <a class="page-link" href="javascript:goPage(${listpaging.nextPageNo},'list')">Next</a></li>
                            </ul>
                  </nav>
        </div>
        
        <div class="span12" id='tab2'>
            <table class="table table-striped table-condensed"> 
                <thead>
                    <tr>
                        <th>상호명</th>
                        <th>지역</th>
                        <th>공연시간</th>
                        <th>신청인원</th>
                        <th>진행상태</th>
                        <th>작성일</th>
                        <th>상세보기</th>
                    </tr>
                </thead>
                <tbody id='ingschedulelist'>
                    <c:forEach items="${inglist}" var="inglist">
                        <tr>
                            <td>${inglist.shopname}</td>
                            <td>${inglist.addr}</td>
                            <td>${inglist.nsdt}~${inglist.nedt}</td>
                            <td>${inglist.cnt}명</td>
                            <td>
                                <span class="label label-warning">진행중</span>                                    
                            </td>
                            <td>${inglist.ncdt}</td>
                            <td>
                                <button data-toggle="modal" data-target="#detailreqModal"
                                            class="btns btns-outline-secondary detailinfobtn" value="a${inglist.sno}">상세보기</button>
                            </td>
                            <td>
                                <button class='btns btns-outline-danger removebtn' value="a${inglist.sno}">삭제</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
           </table>
            <nav aria-label="Page navigation example" class='pages'>
                            <ul class="pagination justify-content-center">
                                <li class="page-item">
                                    <a class="page-link" href="javascript:goPage(${inglistpaging.prevPageNo},'inglist')">Previous</a></li>
                                    
                                <c:forEach var="i" begin="${inglistpaging.startPageNo}" end="${inglistpaging.endPageNo}" step="1">
                                 <c:choose>
                                 <c:when test="${i eq inglistpaging.pageNo}">
                                    <li class="page-item">
                                    <a href="javascript:goPage(${i},'inglist')" class="choice">${i}</a></li>
                                 </c:when>
                                 <c:otherwise>
                                  <li class="page-item">
                                  <a href="javascript:goPage(${i},'inglist')">${i}</a></li>
                                </c:otherwise>
                                </c:choose>
                                </c:forEach>
                                <li class="page-item">
                                    <a class="page-link" href="javascript:goPage(${inglistpaging.nextPageNo},'inglist')">Next</a></li>
                            </ul>
                        </nav>
        </div>
        
        <div class="span12" id='tab3'>
            <table class="table table-striped table-condensed"> 
                <thead>
                    <tr>
                        <th>상호명</th>
                        <th>지역</th>
                        <th>공연시간</th>
                        <th>신청인원</th>
                        <th>진행상태</th>
                        <th>작성일</th>
                        <th>상세보기</th>
                    </tr>
                </thead>
                <tbody id="edschedulelist">
                    <c:forEach items="${edlist}" var="edlist">
                        <tr>
                            <td>${edlist.shopname}</td>
                            <td>${edlist.addr}</td>
                            <td>${edlist.nsdt}~${edlist.nedt}</td>
                            <td>${edlist.cnt}명</td>
                            <td>
                                <span class="label label-success">완료</span>                                    
                            </td>
                            <td>${edlist.ncdt}</td>
                            <td>
                                <button data-toggle="modal" data-target="#detailreqModal"
                                            class="btns btns-outline-secondary detailinfobtn" value="a${edlist.sno}">상세보기</button>
                            </td>
                            <td>
                                <button class='btns btns-outline-danger removebtn' value="a${edlist.sno}">삭제</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
           </table>
           <nav aria-label="Page navigation example" class='pages'>
                            <ul class="pagination justify-content-center">
                                <li class="page-item">
                                    <a class="page-link" href="javascript:goPage(${edlistpaging.prevPageNo},'edlist')">Previous</a></li>
                                    
                                <c:forEach var="i" begin="${edlistpaging.startPageNo}" end="${edlistpaging.endPageNo}" step="1">
                                 <c:choose>
                                 <c:when test="${i eq edlistpaging.pageNo}">
                                    <li class="page-item">
                                    <a href="javascript:goPage(${i},'edlist')" class="choice">${i}</a></li>
                                 </c:when>
                                 <c:otherwise>
                                  <li class="page-item">
                                  <a href="javascript:goPage(${i},'edlist')">${i}</a></li>
                                </c:otherwise>
                                </c:choose>
                                </c:forEach>
                                <li class="page-item">
                                    <a class="page-link" href="javascript:goPage(${edlistpaging.nextPageNo},'edlist')">Next</a></li>
                            </ul>
                        </nav>
        </div>
        
        
        <div class="span12" id='tab4'>
            <table class="table table-striped table-condensed"> 
                <thead>
                    <tr>
                        <th>상호명</th>
                        <th>지역</th>
                        <th>공연시간</th>
                        <th>신청인원</th>
                        <th>진행상태</th>
                        <th>작성일</th>
                        <th>상세보기</th>
                    </tr>
                </thead>
                <tbody id='pschedulelist'>
                    <c:forEach items="${plist}" var="plist">
                        <tr>
                            <td>${plist.shopname}</td>
                            <td>${plist.addr}</td>
                            <td>${plist.nsdt}~${plist.nedt}</td>
                            <td>${plist.cnt}명</td>
                            <td>
                                <span class="label label-info">개인스케줄</span>                                 
                            <td>${plist.ncdt}</td>
                            <td>
                                <button data-toggle="modal" data-target="#detailperModal"
                                            class="btns btns-outline-secondary detailinfobtn" value="b${plist.sno}">상세보기</button>
                            </td>
                            <td>
                                <button class='btns btns-outline-danger removebtn' value="b${plist.sno}">삭제</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
           </table>
           <nav aria-label="Page navigation example" class='pages'>
                            <ul class="pagination justify-content-center">
                                <li class="page-item">
                                    <a class="page-link" href="javascript:goPage(${plistpaging.prevPageNo},'plist')">Previous</a></li>
                                    
                                <c:forEach var="i" begin="${plistpaging.startPageNo}" end="${plistpaging.endPageNo}" step="1">
                                 <c:choose>
                                 <c:when test="${i eq plistpaging.pageNo}">
                                    <li class="page-item">
                                    <a href="javascript:goPage(${i},'plist')" class="choice">${i}</a></li>
                                 </c:when>
                                 <c:otherwise>
                                  <li class="page-item">
                                  <a href="javascript:goPage(${i},'plist')">${i}</a></li>
                                </c:otherwise>
                                </c:choose>
                                </c:forEach>
                                <li class="page-item">
                                    <a class="page-link" href="javascript:goPage(${plistpaging.nextPageNo},'plist')">Next</a></li>
                            </ul>
                        </nav>
        </div>
    </div>
</div>		
        		

<style>
input, textarea, button { margin-top:0px }

/* Required field START */

.required-field-block {
    position: relative;   
}

.required-field-block .required-icon {
    display: inline-block;
    vertical-align: middle;
    margin: -0.25em 0.25em 0em;
    background-color: #E8E8E8;
    border-color: #E8E8E8;
    padding: 0.5em 0.8em;
    color: rgba(0, 0, 0, 0.65);
    text-transform: uppercase;
    font-weight: normal;
    border-radius: 0.325em;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    -ms-box-sizing: border-box;
    box-sizing: border-box;
    -webkit-transition: background 0.1s linear;
    -moz-transition: background 0.1s linear;
    transition: background 0.1s linear;
    font-size: 75%;
}
    
.required-field-block .required-icon {
    background-color: transparent;
    position: absolute;
    top: 0em;
    right: 0em;
    z-index: 10;
    margin: 0em;
    width: 30px;
    height: 30px;
    padding: 0em;
    text-align: center;
    -webkit-transition: color 0.2s ease;
    -moz-transition: color 0.2s ease;
    transition: color 0.2s ease;
}

.required-field-block .required-icon:after {
    position: absolute;
    content: "";
    right: 1px;
    top: 1px;
    z-index: -1;
    width: 0em;
    height: 0em;
    border-top: 0em solid transparent;
    border-right: 30px solid transparent;
    border-bottom: 30px solid transparent;
    border-left: 0em solid transparent;
    border-right-color: inherit;
    -webkit-transition: border-color 0.2s ease;
    -moz-transition: border-color 0.2s ease;
    transition: border-color 0.2s ease;
}

.required-field-block .required-icon .text {
    color: #B80000;
    font-size: 26px;
    margin: -3px 0 0 12px;
}


.col-md-4.control-label{
    width:25%;
}  
    

    
</style>

	<!-- 스케줄 등록모달 -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- 모달 내부 설정 -->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">개인스케줄 등록하기</h4>
				</div>
				<div class="modal-body">
				
				    <!-- <div class="container"> -->
					<div class="row" style="width:auto">
					<div class="col-md-12">
					<form action='add' method='post' enctype="multipart/form-data" class="form-horizontal" id='scheduleaddform' >
					<fieldset>
					
					<!-- 장소 입력 input -->
					<div class="form-group">
					  <label class="col-md-4 control-label" for="shopname">장소명</label>  
					  <div class="col-md-5">
					 <div class="input-group">
					       <div class="input-group-addon">
					        <i class="fa fa-user">
					        </i>
					       </div>
					       <input id="shopname" name="shopname" type="text" placeholder="장소/상호명" autocomplete="off" class="form-control input-md" onkeydown='moveFocus("cnt")'>
					      </div>
					  </div>
					</div>
					
					<!-- 인원 입력 input -->
					<div class="form-group">
					  <label class="col-md-4 control-label" for="cnt">인원</label>  
					  <div class="col-md-5">
					  <div class="input-group">
					       <div class="input-group-addon" style="width: 18%;">
					      <i class="fa fa-male"></i>
					       </div>
					      <input id="cnt" name="cnt" type="number" autocomplete="off" placeholder="공연인원수" class="form-control input-md" onkeydown='moveFocus("regstarttimepicker")'>
					
					      </div>
					  </div>
					</div>
					
					<!-- 공연일시 input -->
					<div class="form-group">
					  <label class="col-md-4 control-label col-xs-12" for="regstarttimepicker">공연시간</label>  
					  <div class="col-md-4  col-xs-4">
					     <div class="input-group">
					          <div class="input-group-addon">
					             <i class="fa fa-clock-o"></i>
					           </div>
					          <input id="regstarttimepicker" name="nsdt" type="text" placeholder="시작일시" class="form-control input-md" autocomplete="off">
					      </div>
					  </div>
					
					  <div class="col-md-3 col-xs-4">
					    <div class="input-group">
					          <div class="input-group-addon">
					             <i class="fa fa-clock-o"></i>
					           </div>
					              <input id="regendtimepicker" name="nedt" type="text" placeholder="종료일시" class="form-control input-md" autocomplete="off">
					      </div>
					  </div>
					
					</div>
					
					<!-- 공연시간 발류 채크 -->
					<div class="form-group">
					  <label class="col-md-4 control-label" for="check"></label>  
					  <div class="col-md-5  col-xs-4">
					      <p id="datecheck"></p>  
					  </div>  
					</div>
					
					<div class="form-group">
					  <label class="col-md-4 control-label col-xs-12" for="addr">주소</label>  
					  <div class="col-md-5  col-xs-4">
					     <div class="input-group">
					          <div class="input-group-addon">
					             <i class="fa fa-street-view"></i>
					           </div>
					          <input id="addr" name="addr" type="text" placeholder="주소" class="form-control input-md" autocomplete="off">
					      </div>
					  </div>
					
					
					  <div>
					    <div class="input-group">
					            <input type='button' class="btn btn-default" onclick="search_addr()" value='주소검색' autocomplete="off">
					      </div>
					  </div>
					
					</div>
					
					
					<!-- 지도 -->
                    <div class="form-group">
                       <div id="map" style="width:400px;height:400px;margin-top:10px;display:none;margin:0 auto;"></div>
                        <input type="text" id="x" name="x" style="display:none"> 
                        <input type="text" id="y" name="y" style="display:none">
                    </div>
					
					<div class="form-group" style='float:right; margin-right: 10px;'>
					  <label class="col-md-4 control-label" ></label>  
					  <div class="col-md-4">
					  <input type='button' class="btn btn-success" id="addbtn" onclick="add()" value='등록하기'>
					  </div>
					</div>
					</fieldset>
					
					</form>
					</div>
					
					</div>
					</div>
				</div>
			</div>
	</div>
    
    <!-- 개인스케줄 수정모달 -->
    <div id="EditScheduleModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- 모달 내부 설정 -->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">개인스케줄 수정하기</h4>
                </div>
                <div class="modal-body">
                
                    <div class="row" style="width:auto">
                    <div class="col-md-12">
                    <form action='edit' method='post' enctype="multipart/form-data" class="form-horizontal" >
                    <fieldset>
                    
                    <!-- 장소 입력 input -->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="shopname">장소명</label>  
                      <div class="col-md-5">
                     <div class="input-group">
                           <div class="input-group-addon">
                            <i class="fa fa-user">
                            </i>
                           </div>
                           <input id="edit_shopname" name="shopname" type="text" class="form-control input-md">
                          </div>
                      </div>
                    </div>
                    
                    <!-- 인원 입력 input -->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="cnt">인원</label>  
                      <div class="col-md-5">
                      <div class="input-group">
                           <div class="input-group-addon" style="width: 18%;">
                          <i class="fa fa-male"></i>
                            
                           </div>
                          <input id="edit_cnt" name="cnt" type="number" class="form-control input-md">
                    
                          </div>
                        
                      </div>
                    </div>
                    
                    <!-- 공연일시 input -->
                    <div class="form-group">
                      <label class="col-md-4 control-label col-xs-12" for="editstarttimepicker">공연시간</label>  
                      <div class="col-md-4  col-xs-4">
                         <div class="input-group">
                              <div class="input-group-addon">
                                 <i class="fa fa-clock-o"></i>
                               </div>
                              <input id="editstarttimepicker" name="nsdt" type="text" placeholder="시작일시" class="form-control input-md" autocomplete="off">
                          </div>
                      </div>
                    
                      <div class="col-md-3 col-xs-4">
                        <div class="input-group">
                              <div class="input-group-addon">
                                 <i class="fa fa-clock-o"></i>
                               </div>
                                  <input id="editendtimepicker" name="nedt" type="text" placeholder="종료일시" class="form-control input-md" autocomplete="off">
                          </div>
                      </div>
                    
                    </div>
                    
                    <!-- 공연시간 발류 채크 -->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="check"></label>  
                      <div class="col-md-5  col-xs-4">
                          <p id="editdatecheck"></p>  
                      </div>  
                    </div>
                    
                    <div class="form-group">
                      <label class="col-md-4 control-label col-xs-12" for="edit_addr">주소</label>  
                      <div class="col-md-5  col-xs-4">
                         <div class="input-group">
                              <div class="input-group-addon">
                                 <i class="fa fa-street-view"></i>
                               </div>
                              <input id="edit_addr" name="edit_addr" type="text" placeholder="주소" class="form-control input-md ">
                          </div>
                      </div>
                    
                    
                      <div>
                        <div class="input-group">
                                <input type='button' class="btn btn-default" onclick="search_edit_addr()" value='주소검색'>
                          </div>
                      </div>
                    
                    </div>
                    
                    
                    <!-- 지도 -->
                    <div class="form-group">
                      <div id="editmap" style="width:400px;height:400px;margin-top:10px; margin:0 auto;"></div>
                        <input type="text" id="edit_x" name="x" style="display:none"> 
                        <input type="text" id="edit_y" name="y" style="display:none">
                    </div>
                    
                    <div class="form-group" style='float:right; margin-right: 10px;'>
                      <label class="col-md-4 control-label" ></label>  
                      <div class="col-md-12" style="padding:0;">
                      <button class="btns btns-outline-success" value="" id="editno" type="button" data-dismiss="modal">수정</button>
                      <button type="button" class="btns btns-outline-danger" data-dismiss="modal">Close</button>
                      </div>
                    </div>
                    </fieldset>
                    
                    </form>
                    </div>
                    
                    </div>
                    </div>
                </div>
            </div>
    </div>
 
<style>

* { margin: 0px; padding: 0px; }
body {
    
    font:14px "Open Sans", sans-serif; 
}

.tile{
    width: 100%;
    background:#fff;
    border-radius:5px;
    box-shadow:0px 2px 3px -1px rgba(151, 171, 187, 0.7);
    float:left;
    transform-style: preserve-3d;
    margin: 10px 5px;

}

.header{
    border-bottom:1px solid #ebeff2;
    padding:19px 0;
    text-align:center;
    color:#59687f;
    font-size:600;
    font-size:19px; 
    position:relative;
}

.banner-img {
    padding: 5px 5px 0;
}

.banner-img #carousel-example-generic {
    width: 48%;
    border-radius: 5px;
    height: 200px;
    margin: 1%;
    
}

.dates{
    border:1px solid #ebeff2;
    border-radius:5px;
    padding:20px 0px;
    margin:10px 20px;
    font-size:16px;
    color:#5aadef;
    font-weight:600;    
    overflow:auto;
}
.dates div{
    float:left;
    width:48%;
    text-align:center;
    position:relative;
}
.dates strong,
.stats strong{
    display:block;
    color:#adb8c2;
    font-size:11px;
    font-weight:700;
}
.dates span{
    width:1px;
    height:40px;
    position:absolute;
    right:0;
    top:0;  
    background:#ebeff2;
}
.stats{
    border-top:1px solid #ebeff2;
    background:#f7f8fa;
    overflow:auto;
    padding:15px 0;
    font-size:16px;
    color:#59687f;
    font-weight:900;
    border-radius: 0 0 5px 5px;
}
.stats div{
    border-right:1px solid #ebeff2;
    width: 100%;
    float:left;
    text-align:center
}

.stats div:nth-of-type(3){border:none;}

div.footer {
    text-align: right;
    position: relative;
    margin: 20px 5px;
}

div.footer a.Cbtn{
    padding: 10px 25px;
    background-color: #DADADA;
    color: #666;
    margin: 10px 2px;
    text-transform: uppercase;
    font-weight: bold;
    text-decoration: none;
    border-radius: 3px;
}

div.footer a.Cbtn-primary{
    background-color: #5AADF2;
    color: #FFF;
}

div.footer a.Cbtn-primary:hover{
    background-color: #7dbef5;
}

div.footer a.Cbtn-danger{
    background-color: #fc5a5a;
    color: #FFF;
}

div.footer a.Cbtn-danger:hover{
    background-color: #fd7676;
}

.dates p{
   width: auto;
}


</style>
	<!-- 상세조회 모달 css  -->
    
	<!-- 성사된스케줄 모달  -->
	<div id="detailreqModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- 모달 내부 설정 -->
            <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12 col-md-4 col-sm-6 col-xs-12" style="margin: auto">
                <div class="tile">
                    <div class="wrapper">
                        <div class="header">요청스케줄 상세보기</div><!--test  -->
                        <div class="banner-img">
                            <div id="reqmap" style="width:48%;height:10rem;margin-top:10px; float:left;"></div> 
                            
                             <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="float:right;">

  

							  <!-- Wrapper for slides -->
							  <div class="carousel-inner" style="width:100%; height:100%;">
							    <div class="item active" id="supimg1" style="width:100%; height:100%;">
							    </div>
							    <div class="item" id="supimg2" style="width:100%; height:100%;">
							    </div>
							     <div class="item" id="supimg3" style="width:100%; height:100%;">
							    </div>
							  </div>
							
							  <!-- Controls -->
							  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
							    <span class="glyphicon glyphicon-chevron-left"></span>
							  </a>
							  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
							    <span class="glyphicon glyphicon-chevron-right"></span>
							  </a>
							</div>
							
									
                        </div>
                        <div class="banner-img" style="float: right;">
                            
                        </div>

                        <div class="dates" style="width:93%">
                            <div class="start">
                                <strong>시작시간</strong> 
                                <p id='reqsdt'></p>
                                <span></span>
                            </div>
                            <div class="ends">
                                <strong>종료시간</strong> 
                                <p id='reqedt'></p>
                            </div>
                        </div>

                        <div class="stats">

                            <div>
                                <strong><label>장소명</label></strong>
                                <span id='reqname'></span> 
                            </div>
                        </div>

                        <div class="stats">
                            <div>
                                <strong><label>희망장르/퍼포먼스</label></strong>
                                <span id='reqgenre'></span> 
                            </div>
                        </div>
                        
                        <div class="stats">
                            <div>
                                <strong><label>연락처</label></strong>
                                <span id='reqtel'></span> 
                            </div>
                        </div>

                        <div class="stats">

                            <div>
                                <strong><label>공연인원</label></strong>
                                <span id='reqcnt'></span> 
                            </div>

                        </div>
                        
                        <div class="stats">

                            <div>
                                <strong><label>상세주소</label></strong>
                                <span id='reqaddr'></span> 
                            </div>

                        </div>
                        
                        <div class="stats">

                            <div>
                                <strong><label>희망사항</label></strong>
                                <span id='reqetc'></span> 
                            </div>

                        </div>

                        <div class="footer">
                            <button type="button" class="btns btns-outline-dark" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div> 
            </div>            
        </div>
    </div>
            </div>
    </div>
	
    <!-- 성사된스케줄 모달  -->
    <div id="detailperModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- 모달 내부 설정 -->
            <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12 col-md-4 col-sm-6 col-xs-12" style="margin: auto">
                <div class="tile">
                    <div class="wrapper">
                        <div class="header">개인스케줄 상세보기</div><!--test  -->

                        <div class="banner-img">
                            <div id="permap" style="width:97%;height:10rem;margin-top:10px;margin: auto;"></div>
                        </div>
                        <div class="banner-img" style="float: right;">
                            
                        </div>
                <form>
                        <div class="dates" style="width:95%; margin-left: 2.5%; ">
                            <div class="start">
                                <strong>시작시간</strong> 
                                <p id='persdt'></p>
                                <span></span>
                            </div>
                            <div class="ends">
                                <strong>종료시간</strong> 
                                <p id='peredt'></p>
                            </div>
                        </div>

                        <div class="stats">

                            <div>
                                <strong><label>장소명</label></strong>
                                <span id='pershopname'></span> 
                            </div>
                        </div>

                        <div class="stats">
                            <div>
                                <strong><label>희망장르/퍼포먼스</label></strong>
                                <span id='pergenre'></span> 
                            </div>
                        </div>

                        <div class="stats">

                            <div>
                                <strong><label>공연인원</label></strong>
                                <span id='percnt'></span> 
                            </div>

                        </div>
                        
                        <div class="stats">

                            <div>
                                <strong><label>상세주소</label></strong>
                                <span id='peraddr'></span> 
                            </div>
                            <div id="perx" style="display: none"></div>
                                <div id="pery" style="display: none"></div>

                        </div>
                </form>
                        <div class="footer">
                            <button data-toggle="modal" data-target="#EditScheduleModal" class="btns btns-outline-success"
                            id="editbtn" data-dismiss="modal">수정</button>
                            <button type="button" class="btns btns-outline-danger" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div> 
            </div>            
        </div>
    </div>
            </div>
    </div>
    
    
	<!-- 개인스케줄모달  -->
    <jsp:include page="../footer.jsp"></jsp:include>
<!-- 달력 -->
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script
    src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script src="/js/fullcalendar.min.js" type="text/javascript"></script>
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- 달력기간조회 -->

<script src="/js/time/jquery.datetimepicker.full.min.js"></script>



<!-- 카카오map,주소 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=15e2302756c9e7098ec0d79f7b4d53f4&libraries=services"></script>

<!-- 내가만든 script -->
<script src="/js/mybs.js" type="text/javascript"></script>
</body>
</html>
