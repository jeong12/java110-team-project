<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<!-- 모달 -->
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<!-- <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css"> -->
<link rel="stylesheet" type="text/css"
    href="/../css/jquery.datetimepicker.css">
    
<!-- 모달내부 css -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha256-3dkvEK0WLHRJ7/Csr0BZjAWxERc5WH7bdeUya2aXxdU= sha512-+L4yy6FRcDGbXJ9mPG8MT/3UCDzwR9gPeyFNMCtInsol++5m3bk2bXWKdZjvybmohrAsn3Ua5x8gfLnbE1YkOg==" crossorigin="anonymous">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha256-7s5uDGW3AHqw6xtJmNNtr+OBRJUlgkNJEo78P4b0yRw= sha512-nNo+yCHEyn0smMxSswnf/OnX6/KwJuZTlNZBjauKhTK0c+zT+q5JOCx0UFhXQ6rJR9jg6Es8gPuD2uZcYDLqSw==" crossorigin="anonymous">

<link href="/css/fullcalendar.min.css" rel="stylesheet">
<style>
#calendar {
	max-width: 900px;
	margin: 0 auto;
}

#calendar, #selectday {
	display: inline-block;
}

#logo {
	width: 50px;
	height: 50px;
}

#addschedule {
	float: right;
}

.cc {
	margin-left: 30%
}


p{
    width: 400px;
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

#map{
    margin-top: 10px;
    border: 3px solid gray;
}
</style>

</head>
<body>
    <%-- <jsp:include page="../header.jsp"></jsp:include> --%> 


	<div id="titl">
		<img id="logo" src="/img/playButton.PNG" alt="플레이로고">
		<h2>버스킹 일정</h2>
	</div>


	<div class="container">
		<div class="col-sm-6">
			<div id='calendar'></div>
		</div>

		<div class="col-lg-6" style="float: left;"><!-- 이거하면된다고?  -->
			<div class="agenda" style="float: left;">
				<div class="table-responsive">
					<div id='selectday'>
						<h4>날짜를 선택해주세요.</h4>
						<table class="table table-condensed table-bordered">
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
						<h3></h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<div class="container">
    <div class="row" style="padding-top:10px;">
        
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-left" style='display:inline-block;'>
                <div id="addschedule">
                   <button type="button" class="btn btn-info btn-lg" data-toggle="modal"
                       data-target="#myModal">스케줄등록하기</button>
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

<!-- <div class="container">
	<div class="flagsearch">
			<button value="1">진행중</button>
			<button value="2">완료</button>
			<button value="3">개인스케줄</button>
		</div>
</div> -->

<div class="container" style="width=70%">
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
						<th>상세보기</th>
					</tr>
				</thead>
				<tbody>
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
							<td>${list.cdt}</td>
							<c:choose>
								<c:when test="${list.supporter eq null }">
									<td>
										<button data-toggle="modal" data-target="#detailperModal"
											class="detailinfobtn" value="b${list.sno}">상세보기</button>
									</td>
									<td>
										<button class='removebtn' value="b${list.sno}">삭제</button>
									</td>
								</c:when>
								<c:otherwise>
									<td>
										<button data-toggle="modal" data-target="#detailreqModal"
											class="detailinfobtn" value="a${list.sno}">상세보기</button>
									</td>
									<td>
										<button class='removebtn' value="a${list.sno}">삭제</button>
									</td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</tbody>
		   </table>
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
                <tbody>
                    <c:forEach items="${inglist}" var="inglist">
                        <tr>
                            <td>${inglist.shopname}</td>
                            <td>${inglist.addr}</td>
                            <td>${inglist.nsdt}~${inglist.nedt}</td>
                            <td>${inglist.cnt}명</td>
                            <td>
                                <span class="label label-warning">진행중</span>                                    
                            </td>
                            <td>${inglist.cdt}</td>
                            <td>
                                <button data-toggle="modal" data-target="#detailreqModal"
                                            class="detailinfobtn" value="a${inglist.sno}">상세보기</button>
                            </td>
                            <td>
                                <button class='removebtn' value="a${inglist.sno}">삭제</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
           </table>
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
                <tbody>
                    <c:forEach items="${edlist}" var="edlist">
                        <tr>
                            <td>${edlist.shopname}</td>
                            <td>${edlist.addr}</td>
                            <td>${edlist.nsdt}~${edlist.nedt}</td>
                            <td>${edlist.cnt}명</td>
                            <td>
                                <span class="label label-success">완료</span>                                    
                            </td>
                            <td>${edlist.cdt}</td>
                            <td>
                                <button data-toggle="modal" data-target="#detailreqModal"
                                            class="detailinfobtn" value="a${edlist.sno}">상세보기</button>
                            </td>
                            <td>
                                <button class='removebtn' value="a${edlist.sno}">삭제</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
           </table>
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
                <tbody>
                    <c:forEach items="${plist}" var="plist">
                        <tr>
                            <td>${plist.shopname}</td>
                            <td>${plist.addr}</td>
                            <td>${plist.nsdt}~${plist.nedt}</td>
                            <td>${plist.cnt}명</td>
                            <td>
                                <span class="label label-info">개인스케줄</span>                                 
                            <td>${plist.cdt}</td>
                            <td>
                                <button data-toggle="modal" data-target="#detailperModal"
                                            class="detailinfobtn" value="b${plist.sno}">상세보기</button>
                            </td>
                            <td>
                                <button class='removebtn' value="b${plist.sno}">삭제</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
           </table>
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
					<form action='add' method='post' enctype="multipart/form-data" class="form-horizontal" >
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
					       <input id="shopname" name="shopname" type="text" placeholder="장소/상호명" class="form-control input-md">
					      </div>
					  </div>
					</div>
					
					<!-- 인원 입력 input -->
					<div class="form-group">
					  <label class="col-md-4 control-label" for="cnt">인원</label>  
					  <div class="col-md-5">
					  <div class="input-group">
					       <div class="input-group-addon">
					      <i class="fa fa-male" style="font-size: 20px;"></i>
					        
					       </div>
					      <input id="cnt" name="cnt" type="text" placeholder="공연인원수" class="form-control input-md">
					
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
					  <div class="col-md-2  col-xs-4">
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
					          <input id="addr" name="addr" type="text" placeholder="주소" class="form-control input-md ">
					      </div>
					  </div>
					
					
					  <div>
					    <div class="input-group">
					            <input type='button' class="btn btn-default" onclick="search_addr()" value='주소검색'>
					      </div>
					  </div>
					
					</div>
					
					
					<!-- 지도 -->
                    <div class="form-group">
                      <div id="map" style="width:400px;height:400px;margin-top:10px;display:none; margin:0 auto;"></div>
                        <input type="text" id="x" name="x" style="display:none"> 
                        <input type="text" id="y" name="y" style="display:none">
                    </div>
					
					<div class="form-group" style='float:right; margin-right: 10px;'>
					  <label class="col-md-4 control-label" ></label>  
					  <div class="col-md-4">
					  <button class="btn btn-success" id="addbtn">등록하기</button>
					  <!-- <a href="#" class="btn btn-danger"><span class="glyphicon glyphicon-remove-sign"></span> Clear</a> -->
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
    
    <!-- 스케줄 등록모달 -->
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
                           <input id="shopname" name="shopname" type="text" class="form-control input-md">
                          </div>
                      </div>
                    </div>
                    
                    <!-- 인원 입력 input -->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="cnt">인원</label>  
                      <div class="col-md-5">
                      <div class="input-group">
                           <div class="input-group-addon">
                          <i class="fa fa-male" style="font-size: 20px;"></i>
                            
                           </div>
                          <input id="cnt" name="cnt" type="text" class="form-control input-md">
                    
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
                      <div class="col-md-2  col-xs-4">
                          <p class="editdatecheck"></p>  
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
                      <div class="col-md-4">
                      <button class="btn btn-default" value="" id="editno" type="button">수정</button>
                      <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                      <!-- <button class="btn btn-success" id="addbtn">등록하기</button> -->
                      <!-- <a href="#" class="btn btn-danger"><span class="glyphicon glyphicon-remove-sign"></span> Clear</a> -->
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
    
	<!-- <div id="EditScheduleModal2" class="modal fade" role="dialog">
		<div class="modal-dialog">

			모달 내부 설정
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">개인스케줄 수정</h4>
				</div>
				<div class="modal-body">
					<form action='editperschedule' method='post'
						enctype="multipart/form-data">
						<table>
							<tbody>
								<tr>
									<th>장소명</th>
									<td><input type='text' name='shopname' id='shopname'></td>
								</tr>
								<tr>
									<th>스케줄일정</th>
									<td><input type="text" name='nsdt' id='editstarttimepicker'
										autocomplete="off">~<input type="text" name='nedt'
										id='editendtimepicker' autocomplete="off">
										<p id='editdatecheck'></p>
										</td>
								</tr>
								<tr>
									<th>인원</th>
									<td><input type="text" name='cnt' id='cnt'>명</td>
								</tr>
								<tr>
									<th>주소검색</th>
									<td><input type="text" id="edit_addr" name="addr"
										placeholder="주소" size='55'><br> <input type="button"
										onclick="search_edit_addr()" value="주소 검색"><br>
										<div id="map"
											style="width: 400px; height: 400px; margin-top: 10px; display: none"></div>
									</td>
								</tr>
								<tr>
									<td>
									<input type="text" id="edit_x" name="x" style="display: none">  
									<input type="text" id="edit_y" name="y" style="display: none"> test!!
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
				<div class="modal-footer">
					<button class="btn btn-default" value="" id="editno">수정</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div> -->

	<!-- 상세조회 모달 css  -->

	<!-- 성사된스케줄 모달  -->
	<div id="detailreqModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- 모달 내부 설정 -->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">개인스케줄 상세보기하기</h4>
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
                           <input id="shopname" name="shopname" type="text" class="form-control input-md">
                          </div>
                      </div>
                    </div>
                    
                    <!-- 인원 입력 input -->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="cnt">인원</label>  
                      <div class="col-md-5">
                      <div class="input-group">
                           <div class="input-group-addon">
                          <i class="fa fa-male" style="font-size: 20px;"></i>
                            
                           </div>
                          <input id="cnt" name="cnt" type="text" class="form-control input-md">
                    
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
                      <div class="col-md-2  col-xs-4">
                          <p class="editdatecheck"></p>  
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
                      <div class="col-md-4">
                      <button class="btn btn-default" value="" id="editno" type="button">수정</button>
                      <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                      <!-- <button class="btn btn-success" id="addbtn">등록하기</button> -->
                      <!-- <a href="#" class="btn btn-danger"><span class="glyphicon glyphicon-remove-sign"></span> Clear</a> -->
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
	
	
	<!-- 성사된스케줄 모달  -->
    <!-- <div id="detailreqModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            모달 내부 설정
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">요청스케줄</h4>
                </div>
                <div class="ct container">
                    <div class="eb row">
                        <div class="span5">
                            <div class="artist-title col-md-10 ">
                                <span>요청스캐줄 상세조회</span>
                            </div>

                            <div class="mimg center-block artist-collage col-md-14">

                                <div class="center-block" id="emg1">
                                    <img src="http://i.ytimg.com/i/MXDyVR2tclKWhbqNforSyA/mq1.jpg"
                                        alt="artist-image" width="150" height="150"
                                        class="center-block" />
                                </div>
                                <div id="map2" style="width: 250px; height: 250px;"></div>


                            </div>
                            <div class="listing-tab col-md-12">


                                Tab panes
                                <div class="container2">

                                    -Form starting--
                                    <div class="">
                                        - For ShopName--
                                        <div class="box col-sm-12">
                                            <div class="eb row">
                                                <div class="col-xs-5">
                                                    <label class="shopname">장소명 :</label>
                                                </div>
                                                <div class="reqname"></div>
                                            </div>
                                        </div>
                                        - For Genre--
                                        <div class="col-sm-12">
                                            <div class="row">
                                                <div class="col-xs-9">
                                                    <label class="genre">희망장르/퍼포먼스 :</label>
                                                </div>
                                                <div class="reqgenre"></div>
                                            </div>
                                        </div>
                                        ---For 공연시간--
                                        <div class="col-sm-12">
                                            <div class="row">
                                                <div class="col-xs-6">
                                                    <label class="time">공연시간 :</label>
                                                </div>
                                                <div class="reqtime"></div>
                                            </div>
                                        </div>
                                        ---For Tel--
                                        <div class="col-sm-12">
                                            <div class="row">
                                                <div class="col-xs-6">
                                                    <label class="tel">연락처 :</label>
                                                </div>
                                                <div class="reqtel"></div>
                                            </div>
                                        </div>
                                        ---For Address--
                                        <div class="col-sm-12">
                                            <div class="row">
                                                <div class="col-xs-6">
                                                    <label class="addr">상세주소 :</label>
                                                </div>
                                                <div class="reqaddr"></div>
                                            </div>
                                        </div>

                                        ---For etc--
                                        <div class="text col-sm-12">
                                            <div class="row">
                                                <div class="text2 col-xs-3">
                                                    <label class="etc" id="hect">메세지 :</label>
                                                </div>
                                                <div class="reqetc"></div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
    </div> -->

	<!-- 개인스케줄모달  -->
	<div class="modal fade" id="detailperModal" role="dialog">
		<div class="modal-dialog" >

			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">개인스케줄</h4>
				</div>
				<div class="ct container">
					<div class="eb row">
						<div class="span5">
							<div class="artist-title col-md-10 ">
								<span>개인스캐줄 상세조회</span>
							</div>

							<div class="cc center-block artist-collage col-md-4">
								<div id="map3" style="position: relative; width: 250px; height: 250px; margin-left:-30px"; ></div>
							</div>
							<div class="listing-tab col-md-12">


								<!--  Tab panes-->
								<div class="container-fluide">
								    <div class='boxborder'> 
									<!--Form starting-->
									<div class="row">
										<!-- For ShopName-->
										<div class="box col-sm-12">
											<div class="row">
												<div class="col-xs-5">
													<label class="shopname">장소명 :</label>
												</div>
												<div class="pershopname"></div>
											</div>
										</div>
										<!-- For Genre-->
										<div class="col-sm-12">
											<div class="row">
												<div class="col-xs-9">
													<label class="genre">희망장르/퍼포먼스 :</label>
												</div>
												<div class="pergenre"></div>
											</div>
										</div>
										<!--   For Cnt-->
										<div class="col-sm-12">
											<div class="row">
												<div class="col-xs-6">
													<label class="cnt">공연인원 :</label>
												</div>
												<div class="percnt"></div>
											</div>
										</div>
									<!---For Time-->
										<div class="col-sm-12">
											<div class="row">
												<div class="col-xs-6">
													<label class="time">공연시간 :</label>
												</div>
												<div class="pertime"></div>
											</div>
										</div>
										<!--For Address-->
										<div class="col-sm-12">
											<div class="row">
												<div class="col-xs-6">
													<label class="addr">상세주소 :</label>
												</div>
												<div class="peraddr"></div>
											</div>
										</div>
										<!--For x,y-->
										<div class="col-sm-12">
											<div class="row">
												<div class="perx" style="display: none"></div>
												<div class="pery" style="display: none"></div>
											</div>
										</div>
									</div>
								</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button data-toggle="modal" data-target="#EditScheduleModal" class="btn btn-default"
							id="editbtn">수정</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
	    </div>
	</div>

    <%-- <jsp:include page="../footer.jsp"></jsp:include> --%>
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

<script src="/js/mybs.js" type="text/javascript"></script>

    

</body>
</html>
