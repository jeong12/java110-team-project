<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css"/>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../../css/common.css">
<style>
#logo {	width: 40px; height: 40px;}
.rigth{float: right;}
.tableleft{float: left; width:100%; }
.tablerigth{width: 18%; position: absolute; right: 10rem;}
.fter{clear: both;}
.thead-dark tr th{background-color: #212529; color: white;}
.serchin{height: 1.5rem;}
.search{display: inline; text-align: center; float: right;}
#titl{margin-top: 2%; margin-bottom: 2%;}
#logo{float: left;}
#haha{margin-top: 0.7%; margin-left: 5%;}
#m{margin-bottom: 4px; font-size: 0.6rem;
    padding: .35rem .35rem;}
nav.pages {text-align: center;}
#md{
    margin-top:5px;
}
table.table.table-hover, tr th{ 
text-align: center; 
}
.imgtable{}
.rdetail img{margin-bottom: 1.5rem;}

.tablerigth div{display: inline-block;}
.rdetail{border: 1px solid black; border-radius: 8px 8px 0px 0px;}
img{width: 100%;height: 100%; border-radius: 8px 8px 5px 5px;}
.rimg{width: 17rem;
    height: 15rem;}
.imgtable{    padding: 1rem;
    padding-top: 0;}
.btn{background-color: #23272b;
 color: white;
  padding: .25rem .5rem;
    font-size: .875rem;
    line-height: 1.5;
    border-radius: .2rem;}
.teamname{margin-bottom: -17px;}

@media (min-width:1280px) {
    .tablerigth{
    width: 18%;
    right: 1rem;
    }
}

@media (min-width:1650px){
.tablerigth{width: 18%; right: 10%;}
.genre{color: gray;}
.intro{margin-top: 1rem};

</style>
<jsp:include page="../header.jsp"></jsp:include>
</head>
<body>
<div id="pos" style="display:none"></div>
	<div id="titl" class="container">
        <img id="logo" src="../../img/playButton.PNG" alt="플레이로고">
        <h3 id="haha">버스킹 일정</h3>
    </div>
	<div class='container'>
		<div class='tableleft'>
				<div class='search'>
					<form action="search">
						<select class="serchin" name="type">
							<option value="date" selected>기간</option>
							<option value="team">팀명</option>
							<option value="city">도시</option>
						</select> 
						<input class="serchin" type="date" name="date">
						 <input class="serchin" type="text"
							name="keyword">
						<button id="m" class="btns btns-outline-m" type="submit">검색하기</button>
					</form>
				</div>
				<div class='' id="md">
					<table class="table table-hover">
						<thead class='thead-dark'>
							<tr>
								<th>날짜</th>
								<th>시간</th>
								<th>팀명</th>
								<th>장소</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="m">
								<tr onClick="showDetail(${m.busker.bno})" style="cursor:pointer">
									<th scope="row">${m.ncdt}</th>
									<td>${m.nsdt}~ ${m.nedt}</td>
									<td>${m.busker.teamname}</td>
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
		<div class="tablerigth">
		
		</div>
	</div>
	
	<script>
	var bno;
	function goPage(e){
		console.log(e)
	    $('.pageNO').val(e);
	    $('.pageForm').submit();
	}
	
	
	function showDetail(e){
		console.log(e);
		bno=e;
		 $.ajax({
	         type : "POST",
	            url : "detail",
	            data :{"bno":e},	           
	            success : function(data){
	                $('.tableleft').css('width','80%');
	            	$(".tablerigth").empty();
	                $(".tablerigth").append(
	                '<div class="rdetail">'
	                +'<div class="rimg">'
	                +'<img src="/upload/'+data.teamPhoto+'"><br>'
	                +'</div>'
	                +'<div class="imgtable">'
	                +'<h3 class="teamname">'+data.teamname+'</h3><br>'
	                +'<div class="genre">'+data.teamgenre+'</div><br>'
	                +'<div class="intro">'+data.teamInfo+'<div>'
	                +'</div><br>'
	                +'<br><button class="btn" onclick="gofeed()">피드가기</button>'
	                );
	            }, error : function(request, status, error) {
	                alert("에러가 발생했습니다. 관리자에게 문의하시기 바랍니다");
	            }   
	    });
	}
	
	
	var currentPosition = 
		parseInt($(".tablerigth").css("top")); 
	   $(window).scroll(function() { 
		   var position = $(window).scrollTop(); 
		   $(".tablerigth").stop().animate({"top":position+currentPosition+"px"},1000); });
	   
	 function gofeed(){
	     location.href="../buskerfeed/enter?no="+bno;
	 }
/* 	$(function(){
		var $win = $(window);
		var top = $(window).scrollTop();
		
		var speed = 1000;
		var easing = 'linear';
		var $layer = $('.tablerigth');
		var layerTopOffset = 0;
		$layer.css('position','absolute');
		
		if(top>0)
			$win.scrollTop(layerTopOffset + top);
		else
			$win.scrollTop(0);
		
		$(window).scroll(function(){
			yPosition = $win.scrollTop() - 123;
			if(yPosition <0)
				yPosition = 0;
			
			$layer.animate({"top:yPosition"},{duration:speed, easing:easing,})
		})
		
	}); */
	
	
	
	</script>
	<!-- ki -->
	
<%-- 	           <div class='col-lg-4 float-right'>
   
    <tbody>
    <tr><td colspan="2"><img class='bphoto' src='/upload/${busker.teamPhoto}' alt='버스커사진'></td></tr>\

    <tr><td>팀명</td><td>${busker.teamname}</td></tr>
    <tr><td>주요 장르</td><td>${busker.teamgenre}</td></tr>
    <tr><td>팀 소개</td><td>${busker.teamInfo}</td></tr>
    <tr><td colspan="2" align="center"><button type="button" class="btn btn-info" value=${busker.no}>피드로 가기</button></td></tr>  
    </tbody>
    </table>
    </div> --%>
	
</body>
<footer class='fter'>
<jsp:include page="../footer.jsp"></jsp:include>
</footer>
</html>

