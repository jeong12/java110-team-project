<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!--     <link
    href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    rel="stylesheet" id="bootstrap-css">
<script
    src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script> -->
<style>
#titl {
    margin: 10px;
    padding: 10px;
}

#logo {
    width: 50px;
    height: 50px;
    margin: 10px;
}

/*페이지네이션*/
.OutOfpagination {
    text-align: center;
}

.pagination {
    display: inline-block;
}

.pagination a {
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
}

.pagination a.active {
    background-color: #4CAF50;
    color: white;
}

.pagination a:hover:not(.active) {background-color: #ddd;}


/*리스트 출력*/

.gallery-title
{
    font-size: 36px;
    color: #42B32F;
    text-align: center;
    font-weight: 500;
    margin-bottom: 70px;
}
.gallery-title:after {
    content: "";
    position: absolute;
    width: 7.5%;
    left: 46.5%;
    height: 45px;
    border-bottom: 1px solid #5e5e5e;
}
.filter-button
{
    font-size: 18px;
    border: 1px solid #42B32F;
    border-radius: 5px;
    text-align: center;
    color: #42B32F;
    margin-bottom: 30px;

}
.filter-button:hover
{
    font-size: 18px;
    border: 1px solid #42B32F;
    border-radius: 5px;
    text-align: center;
    color: #ffffff;
    background-color: #42B32F;

}
.btn-default:active .filter-button:active
{
    background-color: #42B32F;
    color: white;
}

.port-image
{
    width: 100%;
}

.gallery_product
{
    margin-bottom: 30px;
}
/**/
</style>
<script>
//장르별로 표시
$(document).ready(function(){

    $(".filter-button").click(function(){
        var value = $(this).attr('data-filter');
        
        if(value == "all")
        {
            //$('.filter').removeClass('hidden');
            $('.filter').show('1000');
        }
        else
        {
//            $('.filter[filter-item="'+value+'"]').removeClass('hidden');
//            $(".filter").not('.filter[filter-item="'+value+'"]').addClass('hidden');
            $(".filter").not('.'+value).hide('3000');
            $('.filter').filter('.'+value).show('3000');
            
        }
    });
    
    if ($(".filter-button").removeClass("active")) {
$(this).removeClass("active");
}
$(this).addClass("active");

});    

</script>
</head>
<body>
    <div id="titl">
        <h2><img id="logo" src="../../img/playButton.PNG" alt="플레이로고">Follow 리스트</h2>
    </div>

    <div>
<div class="container">
        <div class="row">
        <div class="gallery col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <h1 class="gallery-title">Follower</h1>
        </div>

        <div align="center">
            <button class="btn btn-default filter-button" data-filter="all">All</button>
            <button class="btn btn-default filter-button" data-filter="ballad">발라드</button>
            <button class="btn btn-default filter-button" data-filter="dance">댄스</button>
            <button class="btn btn-default filter-button" data-filter="trot">트로트</button>
            <button class="btn btn-default filter-button" data-filter="folk">포크</button>
            <button class="btn btn-default filter-button" data-filter="rock">락</button>
            <button class="btn btn-default filter-button" data-filter="jazz">재즈</button>
            <button class="btn btn-default filter-button" data-filter="country">컨츄리</button>
            <button class="btn btn-default filter-button" data-filter="rnb">알앤비</button>
            <button class="btn btn-default filter-button" data-filter="rap">랩</button>
        </div>
        <div id="followPagenation">
            <c:forEach items="${followerList}" var="bno">
            <div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter ${bno.teamgenre}">
	                <button class="followerbtn" value="${bno.bno}">
		                <table class="innertable">
		                   <%-- <tr><td><img src="/upload/../${bno.teamPhoto}" class="img-responsive"></td></tr> --%>
		                    <%-- <tr><td>${bno.teamPhoto}</td></tr> --%>
		                    <tr><td>${bno.teamname}</td></tr>
		                </table>
	                </button>
            </div>
            </c:forEach>
        </div>
        </div>
    </div>
    
<!-- 페이지네이션 -->

 
<div class="toolbar-bottom">
  <div class="toolbar mt-lg">
    <div class="sorter">
    <div class="OutOfpagination">
      <ul class="pagination">
               <c:forEach var="i" begin="${PageMove.startPageNo}" end="${paging.endPageNo}" step="1">
                  <c:choose>
                      <c:when test="${i eq paging.pageNo}">
                <li class="active"><a href="javascript:PageMove(${i})">${i}</a></li>
                      </c:when>
                      <c:otherwise>
                        <li><a href="javascript:PageMove(${i})">${i}</a></li>
                      </c:otherwise>
                  </c:choose>
              </c:forEach> 
      </ul>
      </div>
    </div>
  </div>
</div>

 
        <table id='followerdetail'><!--우측 자세히 보기-->
            <h3>
            
            </h3>
            <tbody>
            
            </tbody>
        </table>
    </div>
    
<script>
//페이징

$('.followPagenation').click(function PageMove(i){
    var pageNo = $(this).val();
    console.log(pageNo);
    console.log(i);
    

   })


 

//자세히 보기
$('.followerbtn').click(function(){
    
    var bno = $(this).val();
    console.log(bno);
    
    $.ajax({ 
        type : "POST", //보내는 타입을 Post방식으로 할지,  GET방식으로 할지 결정
        url : "clickDetail", // /내 프로젝트명/XML파일의namespace/내가불러올XML의Query이름.do
        //header :'Content-Type: application/json',
        dataType: 'json',
        data : { bno : bno }, //파라미터 넘겨줄 부분? : 이게 할말이 많은데 원래 GET방식으로 하라했다가 
                               //다시 POST방식으로 하게됬는데 파라미터를 넘겨줄 값이 없어서 다시 GET으로 바꾸면서 주석 
        //contentType : "application/x-www-form-urlencoded; charset=utf-8",  // 기본값이라고 하니까 건들이지 않았고 
        success : function(data) {
           $("#followerdetail tbody ").empty();
                
           $("#followerdetail tbody ").append(
          	  '<tr><td>팀명 : </td><td>'+data.teamname+'</td></tr>'
              +'<tr><td>주요장르 : </td><td>'+data.teamgenre+'</td></tr>'
              +'<tr><td>주요활동도시</td><td>'+data.city+'</td></tr>'
              +'<tr><td>소개말</td><td>'+data.teamInfo+'</td></tr>'
              +'<tr><td><button value='+data.bno+'>피드가기</button></td></tr>');
        },
        error : function(request, status, error) {
            alert("에러가 발생했습니다. 관리자에게 문의하시기 바랍니다");
        }
    });
    
    
})

</script>
    
</body>
</html>