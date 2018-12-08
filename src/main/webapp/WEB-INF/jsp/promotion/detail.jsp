`<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>버스커 홍보 상세보기</title>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css"/>
<link rel='stylesheet' href='../../css/common.css'> <!-- 웹 브라우저 입장에서의 경로 -->
<style>

#logo{width:40px; height:40px; float: left; margin-top: -4px; margin-right: 0.5rem;}
#titl{margin-top: 3%; margin-bottom: 3%;}
#titl h3{float: left; margin-top: 4px; margin-left 2.4 rem;}
#phot{width: 320px; height: 240px;} 
.media{width: 100%;height: 330px;}
    .mm{width: 800px; height:60px;}    
    .media-body{margin-top: 10px;}
    .titl{position: relative ;text-align: center; margin-bottom: 30px;}
    .pto{width: 40px; height: 40px; border-radius: 100px;position: relative; left: 9px;} 
    .nik{border: 1px solid silver;width: 60px; height: 20px; border-radius: 100px;
        text-align: center; background-color: darkgray; color: azure ;margin-bottom: auto;}
    .t{border-bottom: 1px solid silver; border-bottom: 1px solid silver; padding-top: 3px;
    padding-bottom: 42px; height: 67px;}
    .pto,.nik{margin-left: 10px;}
    .pn{ width: 100px; float: left}
    .cc{position: relative ; left: 100px; bottom: 50px; margin: -10px; width: 100px;}
    .text{position: relative; bottom:90px; left: 200px; width: 1000px; height: 60px;margin-top: 20px;}
    .box{width: 65%; margin-left: 17%}
    .container{margin-left: -15px; width: 101%;}
    .td{width: 101%}
    #c-box{border: 1px solid silver; width: 93%; height: 60px; margin-bottom: 20px; 
    margin-top: 10px; border-radius: 6px;}
    #text{border-radius: 5px; width: 92%; height: 70px; margin-bottom: 15px;}
    #btn{margin-left: 90%;margin-bottom: 10px; border-radius: 5px; width: 10%;height:30px;
    margin-left: 91%;}
    #btn2{width: 7%; height: 70px;}
    .c-t{width: 101%; margin-bottom: 30px;}
    #bp{width: 98%;}
    #te{margin-top: 50px;}
    .t-top{border: border; border-top: 1px solid silver}
    textarea{resize: none;  rows=5;}
</style>
</head>
<jsp:include page="../header.jsp"></jsp:include>
<body>

<div class="container">
<div class="row">
    <div id="titl" class='col-lg-12'>
        <img id="logo" src="../../img/playButton.png" alt="플레이로고">
        <h3>무대관리</h3>
    </div>
    </div>
    </div>


     <div class="box">

<div class="container">
  <div class="td">
      <div class="media">
          <h1 class="titl">${list.titl}</h1>
        <a class="pull-left" href="#">
            <img class="media-object" id="phot" src=${list.phot}>
          </a>
        <div class="">
   
          <div class="t1">
                <tr><th>팀명:</th><td>${list.teamname}<td></tr><br>
                <tr><th>장르:</th><td>${list.genre}</td></tr><br>
                <tr><th>공연지역:</th><td>${list.city}</td></tr><br>
                <tr><th>날짜:</th><td>${list.nsdt}</td>~<td>${list.nedt}</td></tr><br>
                <tr><th>인원:</th><td>${list.cnt}</td></tr><br>
                <tr><th>내용:</th><td class="mm">${list.etc}</td></tr><br>
            </div>
          </div>
      </div>
      <a href='../buskerfeed/enter?no=${list.bno}'><button class="btns btns-outline-dark">피드가기</button></a>
     <!--  <button id="btn" name="singlebutton" class="btn btn-primary btn-xs" >버스커 피드</button> -->
   
    </div>
        </div>
     <div>
     <div class="c-t">


            <c:choose>
             <c:when test="${sessionScope.loginUser.id != null}">
              <textarea id="text" class='commentscontext' placeholder="댓글을 입력해주세요"></textarea>
             </c:when>
             <c:otherwise>
              <textarea id="text" class='commentscontext' placeholder="로그인 후 이용해주세요" readonly="readonly"></textarea>
             </c:otherwise>
            </c:choose>


         <button id="btn2" name="singlebutton" class="btn btn-primary">클릭</button>
 

         </div>
    <div class="t-top"></div>
    <div class='comments'>
    <c:forEach  items="${comment}" var="com">
    <div class="t">

    <div class="pn">
        <a><img src=${com.phot} class="pto"></a>
       <p class="nik">버스커</p>
    </div>
    
    <div class="cc">
        <tr>
            <th>${com.nik}</th><br>
            <td>${com.cdt}</td>
        </tr>
    </div>

      <div class="text" style="margin-top: 20px;">
          <td>${com.cont}</td>
    </div>   

         </div>
        
       <c:choose>
             <c:when test="${sessionScope.loginUser.no == com.mno}">
              <div class="removecomment" onclick="removeComment(${com.bcno})"><i class="fas fa-minus"></i></div>
              <div class="modifycomment" onclick="modifyComment(${com.bcno})"><i class="far fa-edit"></i></div>
             </c:when>
             <c:otherwise>
             </c:otherwise>
            </c:choose>
       </c:forEach>
        </div>  
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
    </div>
    </div>
    
    
    <script type="text/javascript">
    
    // 댓글 입력
    $('#btn2').click(function(){
    	
    	 $.ajax({
             type : "POST",
                url : "comments",
                dateType : "json",
                data :{"comment":$('.comments').val(), "bbno":${list.bbno}},
                success : function(data){
                		$('.comments').empty();
                		$('.commentscontext').empty();
                		$('.pages').empty();
                		$.each(data.list,function(index,item){
                		$('.comments').append('<div class="t"><div class="pn"><a><img src="'+item.phot+'" class="pto"></a><p class="nik">'+
                				item.type+'</p></div>'+'<div class="cc"><tr><th>'+item.nik+'</th><br><td>'+item.ncdt+'</td></tr></div>'+
                		'<div class="text"><td>'+item.cont+'</td></div></div>'); 
                		if(item.mno == data.mno){
                			$('.comments').append('<div class="removecomment" onclick="removeComment(${com.bcno})"><i class="fas fa-minus"></i></div>'+
                		              '<div class="modifycomment" onclick="modifyComment(${com.bcno})"><i class="far fa-edit"></i></div>');
                		}
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
                }, error : function(request, status, error) {
                    alert("에러가 발생했습니다. 관리자에게 문의하시기 바랍니다");
                }           
        });
    	
    });
    
    
    // 댓글 삭제
function removeComment(e){
    	
	 $.ajax({
         type : "GET",
            url : "removeComment",
            dateType : "json",
            data :{"bcno":e},
            success : function(data){
            	if(data>=1){
            		alert("성공!");
                        $('.comments').empty();
                        $('.commentscontext').empty();
                        $('.pages').empty();
                        $.each(data.list,function(index,item){
                        $('.comments').append('<div class="t"><div class="pn"><a><img src="'+item.phot+'" class="pto"></a><p class="nik">'+
                                item.type+'</p></div>'+'<div class="cc"><tr><th>'+item.nik+'</th><br><td>'+item.ncdt+'</td></tr></div>'+
                        '<div class="text"><td>'+item.cont+'</td></div></div>');
                        if(item.mno == data.mno){
                            $('.comments').append('<div class="removecomment" onclick="removeComment(${com.bcno})"><i class="fas fa-minus"></i></div>'+
                                      '<div class="modifycomment" onclick="modifyComment(${com.bcno})"><i class="far fa-edit"></i></div>');
                        }
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
            		
            		
            	}else{
            		alert("삭제!");
            	}
            }, error : function(request, status, error) {
                alert("에러가 발생했습니다. 관리자에게 문의하시기 바랍니다");
            }           
    });
	
}

// 페이지 이동
function goPage(e){
	function getUrlParams() {
	    var params = {};
	    window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { params[key] = value; });
	    return params;
	} 

	var bbno = getUrlParams().bbno;
	
	$.ajax({
        type : "GET",
           url : "pagination",
           dateType : "json",
           data :{"pageNo":e, "bbno":bbno},
           success : function(data){
               $('.comments').empty();
               $('.pages').empty();
               $.each(data.list,function(index,item){
               $('.comments').append('<div class="t"><div class="pn"><a><img src="'+item.phot+'" class="pto"></a><p class="nik">'+
                       item.type+'</p></div>'+'<div class="cc"><tr><th>'+item.nik+'</th><br><td>'+item.ncdt+'</td></tr></div>'+
               '<div class="text"><td>'+item.cont+'</td></div></div>'); 
               if(item.mno == data.mno){
                   $('.comments').append('<div class="removecomment" onclick="removeComment(${com.bcno})"><i class="fas fa-minus"></i></div>'+
                             '<div class="modifycomment" onclick="modifyComment(${com.bcno})"><i class="far fa-edit"></i></div>');
               }
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
           }, error : function(request, status, error) {
               alert("에러가 발생했습니다. 관리자에게 문의하시기 바랍니다");
           }           
   });
	
	
}
    
    
function modifyComment(e){
	console.log("::");
}
    </script>   
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    