<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
    <link href="/css/fullcalendar.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css"  href="/css/jquery.datetimepicker.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<style>
#calendar {
	max-width: 600px;
	margin: 0 auto;
	float: left;
}

#calendar{
	display: inline-block;
}

#logo {
	width: 50px;
	height: 50px;
}

.flagdata td {
	width: 300px;
}

.tabs {
	list-style: none;
}

.tabs li {
	display: inline-block;
	cursor: pointer;
}

.tab-content {
	display: none;
}

.tab-content.current {
	display: inherit;
}
.cal{
margin-right: 3%;
}
.container{margin-bottom: 5%; background-color: white;}
.suggests {width: 100%;}
.ttable{maring:0 auto;}
#filter{margin-top: 4%;}
table{text-align: center;}
tr th{text-align: center;}
.dbtn{margin: 3%;}

body{
background-color: snow;
}
.big-lead {
       font-size: 40px;
     }

     .price-panel,
     .price-panel > .panel-heading {
       -webkit-transition: all .3s ease;
       -moz-transition: all .3s ease;
       -o-transition: all .3s ease;
       transition: all .3s ease;
     }

     .price-panel:hover {
       box-shadow: 0 0 30px rgba(0,0,0, .2);
     }
     .price-panel:hover > .panel-heading {
       box-shadow: 0 0 30px rgba(0,0,0, .2) inset;
     }

     .price-panel > .panel-heading {
       color: white;
       text-shadow: 0 3px 0 rgba(50,50,50, .6);
       border-radius: 0;
       box-shadow: 0 5px 0 rgba(50,50,50, .2) inset;
     }
     .price-panel > .panel-body {
       color: white;
       text-shadow: 0 3px 0 rgba(50,50,50, .3);
     }
     .price-panel > .list-group {
       font-weight: 600;
     }
     .price-panel > .panel-footer {
       box-shadow: 0 3px 0 rgba(0,0,0, .3);
     }

     .panel-green > .panel-heading {
       background-color: #57ac57;
       border-color: #71df71;
     }
     .panel-green > .panel-body {
       background-color: #65c965;
     }
     
     .dates{
        overflow:auto;
     }
     
 .typeadd{
  border-radius:5px;
  background: #419641;
  color:#fff;
  border:none;
  position:relative;
  font-size:1.2rem;
  height:30px;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
.typeremove{
  border-radius:5px;
  background: #EB9316;
  color:#fff;
  border:none;
  position:relative;
  font-size:1.2rem;
  height:30px;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}

.typeadd:hover{
  background:#fff;
  color: #419641;
}
.typeremove:hover{
  background:#fff;
  color: #EB9316;
}
.typeadd:before,.typeadd:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background:  #419641;
  transition:400ms ease all;
}
.typeremove:before,.typeremove:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background:  #EB9316;
  transition:400ms ease all;
}
.typeadd:after,.typeremove:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
.typeadd:hover:before,.typeadd:hover:after,.typeremove:hover:before,.typeremove:hover:after{
  width:100%;
  transition:800ms ease all;
}

.suggests{
font-family: "Open Sans", Helvetica, sans-serif;
font-size: 0.7rem;
}


</style>

</head>
<body>
	<div id="titl">
		<img id="logo" src="/img/playButton.PNG" alt="플레이로고">
		<h2>무대관리</h2>
	</div>
	
	<div class="container">
		<div class="row">
			<div class='col-lg-12'>
			  <div class='cal col-lg-8'>
				<div id='calendar'></div>
				</div>
				<div class='check col-lg-4'>
                  <button class='typeadd' onclick="add()">등록</button>
                  <button class='typeremove' onclick="removes()">삭제</button>
				 <div class="panel text-center price-panel panel-green">
				 <div class="panel-heading">
				 <h4></h4>
                 </div>
				<div class="panel-body">
                 <h2></h2>
           </div>
           <div class='dates'>
           <ul class="list-group">
           </ul>
           </div>
           <div class="panel-footer">
           </div>
         </div>
       </div>
</div>

				<!-- 필터 -->
				<div class='col-lg-12' id="filter">
				<div id='showsuggests'>
					<ul class='tabs'>
						<li class='tab-link current' data-tab='tab1'><button class='btn btn-default'>전체</button></li>
						<li class='tab-link' data-tab='tab2'><button class='btn btn-success'>신청</button></li>
						<li class='tab-link' data-tab='tab3'><button class='btn btn-warning'>완료</button></li>
						<li class='tab-link' data-tab='tab4'><button class='btn btn-danger'>기한만료</button></li>
					</ul>


					<div id="tab1" class="tab-content current">
						<table class="suggests table-hover">
							<thead>
								<tr>
									<th>팀명</th>
									<th>장르</th>
									<th>신청기간</th>
									<th>신청인원</th>
									<th>진행상태</th>
									<th>작성일</th>
									<th>상세보기</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="list">
									<tr>
										<td>${list.busker.teamname}</td>
										<td>${list.busker.teamgenre}</td>
										<td>${list.nsdt}~ ${list.nedt}</td>
										<td>${list.cnt}명</td>
										<td><c:choose>
												<c:when test="${list.flag eq '1'.charAt(0) }">신청중 </c:when>
												<c:when test="${list.flag eq '2'.charAt(0) }">완료 </c:when>
												<c:when test="${list.flag eq '3'.charAt(0) }">기한만료 </c:when>
											</c:choose></td>
										<td>${list.ncdt}</td>
										<td><button type="button" class="btn btn-info"
												data-target="#detailModal" data-toggle="modal"
												value="${list.sno}" onclick="chk(this)">상세보기</button>
											<br /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

					<div id="tab2" class="tab-content">
						<table class="suggests table-hover">
							<thead>
								<tr>
									<th>팀명</th>
									<th>장르</th>
									<th>신청기간</th>
									<th>신청인원</th>
									<th>진행상태</th>
									<th>작성일</th>
									<th>상세보기</th>
								</tr>
							</thead> 
							<tbody>
								<c:forEach items="${flist}" var="list">
									<tr>
										<td>${list.busker.teamname}</td>
										<td>${list.busker.teamgenre}</td>
										<td>${list.nsdt}~ ${list.nedt}</td>
										<td>${list.cnt}명</td>
										<td>신청중</td>
										<td>${list.ncdt}</td>
										<td><button type="button" class="btn btn-info"
												data-target="#detailModal" data-toggle="modal"
												value="${list.sno}" onclick="chk(this)">상세보기</button>
											<br /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

					<div id="tab3" class="tab-content">
						<table class="suggests table-hover">
							<thead>
								<tr>
									<th>팀명</th>
									<th>장르</th>
									<th>신청기간</th>
									<th>신청인원</th>
									<th>진행상태</th>
									<th>작성일</th>
									<th>상세보기</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${slist}" var="list">
									<tr>
										<td>${list.busker.teamname}</td>
										<td>${list.busker.teamgenre}</td>
										<td>${list.nsdt}~ ${list.nedt}</td>
										<td>${list.cnt}명</td>
										<td>완료</td>
										<td>${list.ncdt}</td>
										<td><button type="button" class="btn btn-info"
												data-target="#detailModal" data-toggle="modal"
												value="${list.sno}" onclick="chk(this)">상세보기</button>
											<br /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					
                   <div id="tab4" class="tab-content">
                        <table class="suggests table-hover">
                            <thead>
                                <tr>
                                    <th>팀명</th>
                                    <th>장르</th>
                                    <th>신청기간</th>
                                    <th>신청인원</th>
                                    <th>진행상태</th>
                                    <th>작성일</th>
                                    <th>상세보기</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${tlist}" var="list">
                                    <tr>
                                        <td>${list.busker.teamname}</td>
                                        <td>${list.busker.teamgenre}</td>
                                        <td>${list.nsdt}~ ${list.nedt}</td>
                                        <td>${list.cnt}명</td>
                                        <td>기한만료</td>
                                        <td>${list.ncdt}</td>
                                        <td><button type="button" class="btn btn-info"
                                                data-target="#detailModal" data-toggle="modal"
                                                value="${list.sno}" onclick="chk(this)">상세보기</button>
                                            <br /></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
					
				</div>
			</div>
		</div>
		</div>


	<!-- 상세보기 모달 -->
	<div class="modal fade" id="detailModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- header -->
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<button type="button" class="close" data-dismiss="modal">×</button>
					<!-- header title -->
					<h4 class="modal-title">신청내역 상세보기</h4>
				</div>
				<!-- body -->
				<div class="modal-body">
					<div class="info"></div>
					<div class="dates"></div>
					<div class="abtn"></div>
					</table>
				</div>
				<!-- Footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	

      <!-- 달력 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
    
    <!-- 달력기간조회 -->
    <script src="/js/fullcalendar.min.js"></script>
    <script src="/js/time/jquery.datetimepicker.full.min.js"></script>
    
    <!-- function -->
    <script src="/js/myss.js"></script>
    

</body>
</html>