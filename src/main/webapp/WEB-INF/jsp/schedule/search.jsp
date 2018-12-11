<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="../../css/common.css" rel="stylesheet">
<style>
#logo {
    width: 40px;
    height: 40px;
}

.rigth{float: right;}
.tableleft{float: left; width:100%; }
.tablerigth{width: 18%; position: absolute; right: 10rem;}
.fter{clear: both;}
.thead-dark tr th{background-color: #212529; color: white;}
img{width: 16rem;}
.serchin{height: 1.5rem;}
.search{display: inline; text-align: center;}
#titl{margin-top: 2%; margin-bottom: 2%;}
#logo{float: left;}
#haha{margin-top: 1.2%; margin-left: 5.5%;}
#m{margin-bottom: 4px; font-size: 0.6rem;
    padding: .35rem .35rem;} 
nav.pages {text-align: center;}
#md{
    margin-top:5px;
}
table.table.table-hover, tr th{ 
text-align: center; 
}
div.tablerigth .rdetail ul{
    text-align: center;
}
div.tablerigth .rdetail ul li{
    font-size:20px;
    font-weight: 600;
    margin-top: 5px;
}
div.tablerigth .rdetail ul li:last-child{
    text-align:left;
}
div.tablerigth .rdetail ul span{
    margin-left:5px;
    font-weight: 400;
}
#haha{margin-top: 0.7%; margin-left: 5%;}
</style>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<jsp:include page="../header.jsp"></jsp:include>
</head>
<body>
<div id="pos" style="display:none"></div>
	<div id="titl" class='container'>
		<img id="logo" src="/img/playButton.PNG" alt="플레이로고">
		<h3 id="haha">버스킹 일정</h3>
	</div>
    <div class='container'>
<<<<<<< HEAD
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
=======
    <div class='row'>
    <div class='col-lg-12'>
    <div class='search col-lg-10'>
    <button type="button" class="btn btn-outline-secondary" a onclick="window.location.reload()">목록</button><br>
    <form action="search">
    <select name="type">
    <option value="date" selected>기간</option>
    <option value="team">팀명</option>
    <option value="city">도시</option>
    </select>
    <input type="date" name="date"> 
    <input type="text" name="keyword"><button type="submit">검색하기</button>
    </form>
    </div>
    <div class='col-lg-12'>
	<table class="table table-hover">
	<thead class='thead-dark'>
	<tr>
	   <th scope="col">날짜</th>
	   <th scope="col">시간</th>
	   <th scope="col">팀명</th>
	   <th scope="col">장소</th>
	</tr>
	</thead>
	<tbody class='content'>
	<c:forEach items="${list}" var="m">
	<tr>
	   <th scope="row">${m.ncdt}</th>
	   <td>${m.nsdt} ~ ${m.nedt}</td>
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
>>>>>>> branch 'master' of https://github.com/moo-93/java110-team-project.git
	</div>
<<<<<<< HEAD
  <script>
  function goPage(e){
      $('.pageNO').val(e);
      $('.pageForm').submit();
  }
  
  
  function showDetail(e){
      console.log(e);
       $.ajax({
           type : "POST",
              url : "detail",
              data :{"bno":e},               
              success : function(data){
                  $('.tableleft').css('width','80%');
                  $(".tablerigth").empty();
                  $(".tablerigth").append(
                  '<div class="rdetail">'
                  +'<ul class="list-inline">'
                  +'<li><img src="/upload/'+data.teamPhoto+'"></li>'
                  +'<li>팀명<span>'+data.teamname+'</span></li>'
                  +'<li>주요장르<span>'+data.teamgenre+'</span></li>'
                  +'<li>소개말<span>'+data.teamInfo+'</span></li>'
                  +'</ul>'
                  +'</div>'
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
  </script>
=======
	</div>
	</div>
	</div>
	<script type="text/javascript">
	function goPage(e){
		$.ajax({ 
	        type : "POST", //보내는 타입을 Post방식으로 할지,  GET방식으로 할지 결정
	        url : "searchPaging", 
	        dataType: 'json',
	        data : {"pageNo":e},
	        success : function(data) { 
	        	$('.content').empty();
	        	$('.pages').empty();
	        	 $.each(data.list,function(index,item){
	        	$('.content').append(  
	        	'<tr><th scope="row">'+item.ncdt+'</th><td>'+item.nsdt+'~'+item.nedt+'</td>'+
	            '<td onClick="location.href=' +"'detail?no="+item.sn+"'"+'">'+
	            item.busker.teamname+'</td><td>'+item.addr+'</td></tr>');
	        });
	        	 $('.pages').append(' <ul class="pagination justify-content-center">'+
	                     '<li class="page-item prev">'+
	                     '<a class="page-link" href="javascript:goPage('+data.paging.prevPageNo+
	                             ')">Previous</a></li>');
	                for(var i = data.paging.startPageNo;i<=data.paging.endPageNo;i++){
	                    if(i == data.paging.pageNo){
	                        $('.pagination.justify-content-center').append('<li class="page-item active">'+
	                        '<a href="javascript:goPage('+i+')" class="choice">'+i+'</a></li>');
	                    }else{
	                        $('.pagination.justify-content-center').append('<li class="page-item">'+
	                        '<a href="javascript:goPage('+i+')">'+i+'</a></li>');
	                    }
	                } 
	             $('.pagination.justify-content-center').append('<li class="page-item">'+
	                     '<a class="page-link" href="javascript:goPage('+data.paging.nextPageNo+')">Next</a></li>'+
	                     '</ul></nav>');
	             },
	              error : function(request, status, error) {
	              }
		});
		
		
	}
	
	</script>
>>>>>>> branch 'master' of https://github.com/moo-93/java110-team-project.git
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>

