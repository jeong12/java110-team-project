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
<link rel="stylesheet" type="text/css"
	href="/../css/jquery.datetimepicker.css">
<link href="/../css/fullcalendar.min.css" rel="stylesheet">
<link href="/../css/common.css" rel="stylesheet">
<style>


.cnd{
margin-bottom: 2.5rem;
}

#calendar {
	max-width: 600px;
	float: left;
	margin: 0 auto;
}

#calendar {
	display: inline-block;
}

#logo{
width: 40px; 
height:40px; 
float: left; 
margin-top: -4px;
margin-right: 0.5rem;

}

#titl{
margin-top: 3%;
margin-bottom: 2.3%;
padding-left: 28px;
}

#titl h3{
float: left; 
margin-top: 1px;
}

.flagdata td {
	width: 300px;
}

/*tab*/
.list-group-horizontal .list-group-item {
	display: inline-block;
	cursor: pointer;
}

.list-group-horizontal .list-group-item {
	margin-bottom: 0;
	margin-left: -4px;
	margin-right: 0;
}

.list-group-horizontal .list-group-item:first-child {
	border-top-right-radius: 0;
	border-bottom-left-radius: 4px;
}

.list-group-horizontal .list-group-item:last-child {
	border-top-right-radius: 4px;
	border-bottom-left-radius: 0;
}

ul {
	padding-left: 0px;
}

.span12 {
	display: none;
}

.span12.current {
	display: inherit;
}

.label-info {
	background-color: #3a87ad;
}

.cal {
	margin-right: 3%;
}

.cont {
	background-color: white;
	margin-left: auto;
    margin-right: auto;
    min-height: 810px;
}

.suggests {
	width: 100%;
}

.ttable {
	maring: 0 auto;
}

#filter {
	margin-top: 4%;
}

table {
	text-align: center;
}

tr th {
	text-align: center;
}

/*날짜 select css */
.dbtn {
	margin: 3%;
}

.big-lead {
	font-size: 40px;
}

.price-panel, .price-panel>.panel-heading {
	-webkit-transition: all .3s ease;
	-moz-transition: all .3s ease;
	-o-transition: all .3s ease;
	transition: all .3s ease;
}

.price-panel:hover {
	box-shadow: 0 0 30px rgba(0, 0, 0, .2);
}

.price-panel>.panel-heading {
	color: white;
	text-shadow: 0 3px 0 rgba(50, 50, 50, .6);
	border-radius: 0;
	box-shadow: 0 5px 0 rgba(50, 50, 50, .2) inset;
}

.price-panel>.panel-body {
	color: white;
	text-shadow: 0 3px 0 rgba(50, 50, 50, .3);
}

.price-panel>.list-group {
	font-weight: 600;
}

.price-panel>.panel-footer {
	box-shadow: 0 3px 0 rgba(0, 0, 0, .3);
}

.panel-green>.panel-heading {
	background-color: #57ac57;
    border-color: #71df71;
}
.panel-green>.panel-heading2{
    background-color: #EB9316;
    border-color: #efc07d;
}

.panel-green>.panel-body {
	background-color: #65c965;
}
.panel-green>.panel-body2{
    background-color: rgb(236, 179, 98);
}

.dates {
	overflow: auto;
}

/* 날짜 select button */
.typeadd {
    border-radius: 5px;
    background: #419641;
    color: #fff;
    border: none;
    position: relative;
    font-size: 0.8rem;
    height: 30px;
    width: 5rem;
    padding: 0 2em;
    cursor: pointer;
    transition: 800ms ease all;
    outline: none;
}
.typeremove {
	border-radius: 5px;
	background: #EB9316;
	color: #fff;
	border: none;
	position: relative;
	font-size: 0.8rem;
	height: 30px;
	width: 5rem;
	padding: 0 2em;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
}

.typeadd:hover {
	background: #fff;
	color: #419641;
}

.typeremove:hover {
	background: #fff;
	color: #EB9316;
}

.typeadd:before, .typeadd:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #419641;
	transition: 400ms ease all;
}

.typeremove:before, .typeremove:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #EB9316;
	transition: 400ms ease all;
}

.typeadd:after, .typeremove:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

.typeadd:hover:before, .typeadd:hover:after, .typeremove:hover:before,
	.typeremove:hover:after {
	width: 100%;
	transition: 800ms ease all;
}

/* 상세보기 */
.btns {
	width: 4rem;
	height: 1.8rem;
	font-size: 0.8rem;
	padding: 0;
}

.pages{
text-align: center;
}

input[type="checkbox"] {
    display:none;
}

input[type="checkbox"] + label span {
    display:inline-block;
    width:19px;
    height:19px;
    margin: -3px 6px 0 0;
    vertical-align:middle;
    background:url(/img/check_radio_sheet.png) left top no-repeat;
    cursor:pointer;
}

input[type="checkbox"]:checked + label span {
    background:url(/img/check_radio_sheet.png) -19px top no-repeat;
    background-color:inherit;
}

.modalimg{    
    width: 400px;
    height: 300px;
    margin: 15px auto;
    display: block;
    }
.abcdmang{border: 1px solid silver; width: 83%; border-radius: 8px; margin: auto;}
.apd1{text-align: center; margin: 15px 0;}
.bbutton{text-align:center; position: relative; right: 1%;}
.brno,.rbrno,.pdb{margin-rigth:3%; margin-left:3%;}
.label{
    vertical-align: middle;
   padding: .3em .6em .3em;
   font-size: 86%;
   font-weight: 700;
}
div.qwer.modal-header{
    background-color: black;
    color: #fff;
    padding: 10px;
}
.tabbus{
          margin: auto;
    width: 20rem;
    display: -webkit-box;
    text-align: center;
    background-color: bisque;
    padding-top: 3%;
    border-bottom: 1px solid snow;
    color: inherit;
    padding-bottom: 3%;
    border-radius: 5px 5px 0 0;
    border: 1px solid snow;
}
.tabb h4{margin-top: -1%;}
.tabbus tr td:nth-child(2n+1){
    font-weight: 600;
    width:40%;
}
.tabbus tr td:nth-child(2n){
    font-weight: 400;
}

.tabs{ width: 33.3333%
}
.tabb{
margin: auto;
    white-space: pre-line;
    background-color: lavenderblush;
    padding: 4%;
    }
 .tabt{
        margin: auto;
    width: 20.1rem;
 }
 .close{
     color: white;
    opacity: 1;
        margin-top: -4%;}
</style>
<jsp:include page="../header.jsp"></jsp:include>
</head>
<body>
<div class="titl container">

<div class="row">
	<div id="titl" class='col-lg-12'>
		<img id="logo" src="../../img/playButton.PNG" alt="플레이로고">
		<h3>무대관리</h3>
	</div>
	</div>
	</div>


	<div class="cont container">
		<div class="row">
			<div class='cnd col-lg-12'>
				<div class='cal col-lg-7 float-left'>
					<div id='calendar'></div>
				</div>
				<div class='check col-lg-4 float-right'>
					<button class='typeadd' onclick="add()">등록</button>
					<button class='typeremove' onclick="removes()">삭제</button>
					<div class="panel text-center price-panel panel-green">
						<div class="panel-heading">
							<h4></h4>
						</div>
						<div class="panel-body">
							<h2 style="margin-top: 6px;"></h2>
						</div>
						<div class='dates'>
							<ul class="selectdates list-group">
							</ul>
						</div>
						<div class="panel-footer"></div>
					</div>
				</div>
			</div>
 
			<!-- 필터 -->
			<div class='col-lg-12'>
				<div class='list-group list-group-horizontal'>
					<ul class='tabs'>
						<li class='list-group-item active current' data-tab='tab1'>전체</li>
						<li class='list-group-item' data-tab='tab2'>신청</li>
						<li class='list-group-item' data-tab='tab3'>완료</li>
						<li class='list-group-item' data-tab='tab4'>기한만료</li>
					</ul>
				</div>

				<div id="tab1" class="span12 current">
					<table class="table table-bordred table-striped">
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
						<tbody id='tab1list' onload="pasing();">
							<c:forEach items="${list}" var="list">
								<tr>
									<td>${list.busker.teamname}</td>
									<td>${list.busker.teamgenre}</td>
									<td>${list.nsdt}~${list.nedt}</td>
									<td>${list.cnt}명</td>
									<td><c:choose>
											<c:when test="${list.flag eq '1'.charAt(0) }">
												<span class="label label-info">신청중</span>
											</c:when>
											<c:when test="${list.flag eq '2'.charAt(0) }">
												<span class="label label-success">완료 </span>
											</c:when>
											<c:when test="${list.flag eq '3'.charAt(0) }">
												<span class="label label-danger">기한만료</span>
											</c:when>
										</c:choose></td>
									<td>${list.ncdt}</td>
									<td><button type="button"
											class="btns btns-outline-secondary"
											data-target="#detailModal" data-toggle="modal"
											value="${list.sno}" onclick="chk(this)">상세보기</button> <br /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
						<nav aria-label="Page navigation example" class='pages'>
							<ul class="pagination justify-content-center">
								<li class="page-item prev">
								    <a class="page-link" href="javascript:goPage(${listpaging.prevPageNo},'list')">Previous</a></li>
								<c:forEach var="i" begin="${listpaging.startPageNo}" end="${listpaging.endPageNo}" step="1">
								 <c:choose>
								 <c:when test="${i eq listpaging.pageNo}">
								    <li class="page-item">
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

				<div id="tab2" class="span12">
					<table class="table table-bordred table-striped">
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
						<tbody id='tab2list' onload="pasing();">
							<c:forEach items="${flist}" var="list">
								<tr>
									<td>${list.busker.teamname}</td>
									<td>${list.busker.teamgenre}</td>
									<td>${list.nsdt}~${list.nedt}</td>
									<td>${list.cnt}명</td>
									<td><span class="label label-info">신청중</span></td>
									<td>${list.ncdt}</td>
									<td><button type="button"
											class="btns btns-outline-secondary"
											data-target="#detailModal" data-toggle="modal"
											value="${list.sno}" onclick="chk(this)">상세보기</button> <br /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<nav aria-label="Page navigation example" class='pages'>
                            <ul class="pagination justify-content-center">
                                <li class="page-item">
                                    <a class="page-link" href="javascript:goPage(${flistpaging.prevPageNo},'flist')">Previous</a></li>
                                    
                                <c:forEach var="i" begin="${flistpaging.startPageNo}" end="${flistpaging.endPageNo}" step="1">
                                 <c:choose>
                                 <c:when test="${i eq flistpaging.pageNo}">
                                    <li class="page-item">
                                    <a href="javascript:goPage(${i},'flist')" class="choice">${i}</a></li>
                                 </c:when>
                                 <c:otherwise>
                                  <li class="page-item">
                                  <a href="javascript:goPage(${i},'flist')">${i}</a></li>
                                </c:otherwise>
                                </c:choose>
                                </c:forEach>
                                <li class="page-item">
                                    <a class="page-link" href="javascript:goPage(${flistpaging.nextPageNo},'flist')">Next</a></li>
                            </ul>
                        </nav>
				</div>

				<div id="tab3" class="span12">
					<table class="table table-bordred table-striped">
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
						<tbody id='tab3list' onload="pasing();">
							<c:forEach items="${slist}" var="list">
								<tr>
									<td>${list.busker.teamname}</td>
									<td>${list.busker.teamgenre}</td>
									<td>${list.nsdt}~${list.nedt}</td>
									<td>${list.cnt}명</td>
									<td><span class="label label-success">완료 </span></td>
									<td>${list.ncdt}</td>
									<td><button type="button"
											class="btns btns-outline-secondary"
											data-target="#detailModal" data-toggle="modal"
											value="${list.sno}" onclick="chk(this)">상세보기</button> <br /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<nav aria-label="Page navigation example" class='pages'>
                            <ul class="pagination justify-content-center">
                                <li class="page-item">
                                    <a class="page-link" href="javascript:goPage(${slistpaging.prevPageNo},'slist')">Previous</a></li>
                                    
                                <c:forEach var="i" begin="${slistpaging.startPageNo}" end="${slistpaging.endPageNo}" step="1">
                                 <c:choose>
                                 <c:when test="${i eq slistpaging.pageNo}">
                                    <li class="page-item">
                                    <a href="javascript:goPage(${i},'slist')" class="choice">${i}</a></li>
                                 </c:when>
                                 <c:otherwise>
                                  <li class="page-item">
                                  <a href="javascript:goPage(${i},'slist')">${i}</a></li>
                                </c:otherwise>
                                </c:choose>
                                </c:forEach>
                                <li class="page-item">
                                    <a class="page-link" href="javascript:goPage(${slistpaging.nextPageNo},'slist')">Next</a></li>
                            </ul>
                        </nav>
				</div>

				<div id="tab4" class="span12">
					<table class="table table-bordred table-striped">
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
						<tbody id='tab4list' onload="pasing();">
							<c:forEach items="${tlist}" var="list">
								<tr>
									<td>${list.busker.teamname}</td>
									<td>${list.busker.teamgenre}</td>
									<td>${list.nsdt}~${list.nedt}</td>
									<td>${list.cnt}명</td>
									<td><span class="label label-danger">기한만료</span></td>
									<td>${list.ncdt}</td>
									<td><button type="button"
											class="btns btns-outline-secondary"
											data-target="#detailModal" data-toggle="modal"
											value="${list.sno}" onclick="chk(this)">상세보기</button> <br /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<nav aria-label="Page navigation example" class='pages'>
                            <ul class="pagination justify-content-center">
                                <li class="page-item">
                                    <a class="page-link" href="javascript:goPage(${tlistpaging.prevPageNo},'tlist')">Previous</a></li>
                                    
                                <c:forEach var="i" begin="${tlistpaging.startPageNo}" end="${tlistpaging.endPageNo}" step="1">
                                 <c:choose>
                                 <c:when test="${i eq tlistpaging.pageNo}">
                                    <li class="page-item">
                                    <a href="javascript:goPage(${i},'tlist')" class="choice">${i}</a></li>
                                 </c:when>
                                 <c:otherwise>
                                  <li class="page-item">
                                  <a href="javascript:goPage(${i},'tlist')">${i}</a></li>
                                </c:otherwise>
                                </c:choose>
                                </c:forEach>
                                <li class="page-item">
                                    <a class="page-link" href="javascript:goPage(${tlistpaging.nextPageNo},'tlist')">Next</a></li>
                            </ul>
                        </nav>
				</div>

			</div>
		</div>
	</div>

	<!-- 상세보기 모달 -->
	<div class="modal fade" id="detailModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- header -->
				<div class="qwer modal-header">
					<!-- 닫기(x) 버튼 -->
					<div class="qwert"></div>
					<button type="button" class="close" data-dismiss="modal">×</button>
					<!-- header title -->
				</div>
				<!-- body -->
				<div class="modal-body">
					<div class="info"></div>
					<div class="dates2"></div>
					<div class="abtn"></div>
					<div class='bbtn'></div>
				</div>
				<!-- Footer -->
				<div class="modal-footer">
					<button type="button" class="btns btns-outline-dark" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>


	<!-- 달력 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
	<script src="/js/fullcalendar.min.js" type="text/javascript"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<!-- 달력기간조회 -->
	<script src="/js/time/jquery.datetimepicker.full.min.js"></script>

<!-- sweet alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<!-- function -->
	<script src="/js/myss.ver2.js"></script>
</body>
<jsp:include page="../footer.jsp"/>
</html>