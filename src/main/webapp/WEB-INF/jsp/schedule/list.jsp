<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
    rel="stylesheet" id="bootstrap-css">
<link href="/../css/common.css" rel="stylesheet">
<script
    src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style>
#logo {
	width: 50px;
	height: 50px;
}

.search {
	margin-top: 15px;
	margin-bottom: 15px;
}
</style>
<jsp:include page="../header.jsp"></jsp:include>
</head>
<body>
	<div id="titl">
		<img id="logo" src="../../img/tum.png" alt="플레이로고">
		<h3>버스킹 일정</h3>
	</div>
	<div class='container'>
		<div class='row'>
			<div class='col-lg-12'>
				<div class='search col-lg-10'>
					<form action="search">
						<select name="type">
							<option value="date" selected>기간</option>
							<option value="team">팀명</option>
							<option value="city">도시</option>
						</select> <input type="date" name="date"> <input type="text"
							name="keyword">
						<button type="submit">검색하기</button>
					</form>
				</div>
				<div class='col-lg-8'>
					<table class="table table-hover">
						<thead class='thead-dark'>
							<tr>
								<th scope="col">날짜</th>
								<th scope="col">시간</th>
								<th scope="col">팀명</th>
								<th scope="col">장소</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="m">
								<tr>
									<th scope="row">${m.ncdt}</th>
									<td>${m.nsdt}~ ${m.nedt}</td>
									<td onClick="location.href='detail?no=${m.sno}'">${m.busker.teamname}</td>
									<td>${m.addr}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
<nav aria-label="Page navigation example" class='pages'>
                            <ul class="pagination justify-content-center">
                                <li class="page-item prev">
                                    <a class="page-link" href="javascript:goPage(${paging.prevPageNo})">Previous</a></li>
                                <c:forEach var="i" begin="${paging.startPageNo}" end="${paging.endPageNo}" step="1">
                                 <c:choose>
                                 <c:when test="${i eq paging.pageNo}">
                                    <li class="page-item active">
                                    <a href="javascript:goPage(${i})" class="choice">${i}</a></li>
                                 </c:when>  
                                 <c:otherwise>
                                  <li class="page-item">
                                  <a href="javascript:goPage(${i})">${i}</a></li>
                                </c:otherwise>
                                </c:choose>
                                </c:forEach>
                                <li class="page-item">
                                    <a class="page-link" href="javascript:goPage(${paging.nextPageNo})">Next</a></li>
                            </ul>
                        </nav>
                        <form action="list" class="pageForm">
                        <input type="hidden" class="pageNO" name="pageNo">
                        </form>
				</div>
			</div>
<%-- 			    <div class='col-lg-4 float-right'>
    <table class='teaminfo'>
    <tbody>
    <tr><td colspan="2"><img class='bphoto' src='/upload/${busker.teamPhoto}' alt='버스커사진'></td></tr>
    <tr><td>팀명</td><td>${busker.teamname}</td></tr>
    <tr><td>주요 장르</td><td>${busker.teamgenre}</td></tr>
    <tr><td>팀 소개</td><td>${busker.teamInfo}</td></tr>
    <tr><td colspan="2" align="center"><button type="button" class="btn btn-info" value=${busker.no}>피드로 가기</button></td></tr>  
    </tbody>
    </table>
    </div> --%>
		</div>
	</div>
	
	<script>
	function goPage(e){
	    $('.pageNO').val(e);
	    $('.pageForm').submit();
	}
	</script>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>
