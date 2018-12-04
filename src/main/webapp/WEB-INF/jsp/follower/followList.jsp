<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>FollowList</title>
<link rel="stylesheet" href="/css/common.css"/>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

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

#bodybody{
    min-height: 700px;
}

/*페이지네이션*/
.OutOfpagination {
    text-align: center;
}

.pagination {
    margin-bottom: 150px;
    display: inline-block;
    color: #01DF01;
    text-decoration: none;
}

.pagination a {
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
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

.port-image
{
    width: 100%;
}

.gallery_product
{
    margin-bottom: 30px;
}

/*오른쪽 자세히*/
.wrapfollowerdetail:target {
    opacity:1;
    pointer-events: auto;
}

.wrapfollowerdetail{
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background: rgba(0, 0, 0, 0.8);
    opacity:0;
    -webkit-transition: opacity 400ms ease-in;
    -moz-transition: opacity 400ms ease-in;
    transition: opacity 400ms ease-in;
    pointer-events: none;
}

.wrapfollowerdetail > div {
    position: absolute;
    top: 25%;
    left: 25%;
    width: 50%;
    height: 50%;
    padding: 8px;
    border: 16px solid white;
    background-color: white;
    overflow: auto; 
}

.leftside{
width: 100px;
text-align: left;
}
#detailphoto{
width: 290px;
height: 290px;
}

.teamPhotoImg{
margin: 5px;
width : 250px;
height: 250px;
}

.bigdiv{
display: flex;
text-align: center;
}
</style>
</head>
<jsp:include page="../header.jsp"></jsp:include>
<body>
<div id="bodybody">
    <div id="titl">
        <h2><img id="logo" src="../../img/playButton.PNG" alt="플레이로고">Follow 리스트</h2>
    </div>

    <div class="container">
        <div class="row">
            <div id="followPagenation">
                <c:forEach items="${followerList}" var="bno">
                    <div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter ${bno.teamgenre}">
	                   <a href="#wrapfollowerdetail" value="${bno.bno}" class="followerbtn">
		                   <table class="innertable">
		                       <tr><td><img src="../../img/${bno.teamPhoto}" class="teamPhotoImg"></td></tr> 
		                       <tr><td>${bno.teamname}</td></tr>
		                   </table>
	                   </a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<!-- 페이지네이션 -->
    <div class="toolbar-bottom">
        <div class="toolbar mt-lg">
            <div class="sorter">
                <div class="OutOfpagination">
                    <ul class="pagination">
                        <c:forEach var="i"  begin="${pageMove.startPageNo}" end="${pageMove.endPageNo}" step="1">
                            <li><a href="javascript:PageMove(${i})" style="color: #000000;">${i}</a></li>
                        </c:forEach> 
                    </ul>
                </div>
            </div>
        </div>
    </div>


<!--우측 자세히 보기-->
    <div id="wrapfollowerdetail" class="wrapfollowerdetail">
        <div>
            <table id="followerdetail">
                <tbody>
                             <a href="#close">닫기</a> 
                            
                </tbody>
            </table>
        </div>
    </div>       

<script>
//페이징

function PageMove(i){
    location.href="?pageNo="+i;
   }


 

//자세히 보기
$('.followerbtn').click(function(){
    
    var bno = $(this).attr('value');
    console.log(bno);
    
    $.ajax({ 
        type : "POST", //보내는 타입을 Post방식으로 할지,  GET방식으로 할지 결정
        url : "followerdetail", // /내 프로젝트명/XML파일의namespace/내가불러올XML의Query이름.do
        //header :'Content-Type: application/json',
        dataType: 'json',
        data : { bno : bno }, //파라미터 넘겨줄 부분? : 이게 할말이 많은데 원래 GET방식으로 하라했다가 
        //contentType : "application/x-www-form-urlencoded; charset=utf-8",  // 기본값이라고 하니까 건들이지 않았고 
        success : function(data) {
           $("#followerdetail tbody").empty();
                
           $("#followerdetail tbody").append(
              '<tr><td colspan="2"><img src="../../img/'+data.teamPhoto+'" id="detailphoto"></td></tr>'
          	  +'<tr><td class="leftside">팀    명 : </td><td>'+data.teamname+'</td></tr>'
              +'<tr><td class="leftside">주요장르 : </td><td>'+data.teamgenre+'</td></tr>'
              +'<tr><td class="leftside">활동도시 : </td><td>'+data.city+'</td></tr>'
              +'<tr><td class="leftside">소 개 말 : </td><td>'+data.teamInfo+'</td></tr>'
              +'<tr><td class="leftside"><a href="/app/buskerfeed/enter?bno='+data.bno+'"> '+data.bno+'피드가기</a></td></tr>');
        },
        error : function(request, status, error) {
            alert("에러가 발생했습니다. 관리자에게 문의하시기 바랍니다");
        }
    });
});  

</script>
    
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>