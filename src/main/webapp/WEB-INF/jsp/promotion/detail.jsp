<%@ page language="java" 
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
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css"/>
<link rel='stylesheet' href='../../css/common.css'> <!-- 웹 브라우저 입장에서의 경로 -->
<style>
#logo{width:40px; height:40px; float: left; margin-top: -4px; margin-right: 0.5rem;}
#titl{margin-top: 3%; margin-bottom: 3%;}
#titl h3{float: left; margin-top: 4px; margin-left 2.4 rem;}
#phot{    width: 15rem;
    border-radius: 0.25rem;
    height: 12.4rem;} 
.media{height: 56%;}
    .mm{width: 800px; height:60px;}    
    .media-body{margin-top: 10px;}
    .titl{position: relative ;text-align: center; margin-bottom: 30px;}
    .pto{width: 40px; height: 40px; border-radius: 100px;position: relative; left: 9px;} 
    .nik{width: 3rem; height: 1.1rem; border-radius: 100px; text-align: center; 
        background-color: darkgray; color: azure ;margin-bottom: auto; margin-top: 4%;}
    .box{width: 50%; margin: auto;}
    .container{margin-left: -15px; width: 100%;}
    .td{width: 100%}
    #c-box{border: 1px solid silver; width: 93%; height: 60px; margin-bottom: 20px; 
    margin-top: 10px; border-radius: 6px;}
    #text{border-radius: 5px; width: 92%; height: 70px; margin-bottom: 15px;}
    #btn{margin-left: 90%;margin-bottom: 10px; border-radius: 5px; width: 10%;height:30px;
    margin-left: 91%;}
    #btn2{  
     width: 7%;
    height: 3.5rem;
    margin-left: 1%;
    }
    .c-t{width: 100%;  display: flex;}
    #bp{width: 98%;}
    #te{margin-top: 50px;}
    .t-top{border: border; border-top: 1px solid silver}
    textarea{resize: none; overflow:hidden;}
    .cdtContext{float: right;}
    #tobbox{
        border: 1px solid silver;
    border-radius: 5px;
    height: 12.8rem;
    padding: 0.3%;
    background-color: white;
        }
    #textbox{margin-top: 3%;}
    #topbtn{
              font-size: 0.8rem;
    width: 5rem;
    height: 2rem;
    padding: 0;
    float: right;
    clear: both;
    margin-top: -5%;
    margin-right: 1%;

}

    #ctnt{width: 10%;}
    .fas,.far{float: left;}
     .far{margin-left: 1.5%;} 
    #commenttop{border-top: 1px solid silver;}
    .t{border-bottom: 1px solid silver; display: -webkit-box; /* height: 3.8rem; */}
    .comments{background-color: white;}
    .pn{margin: 0.5%; width: 5%;}
    .cc{width: 6%; text-align: center;}
    .text{width: 88%; padding-right: 0.3rem;}
    .cdtr{float: right; color: gray;}
    .icon{
    display: -webkit-inline-box;
    float: right;
    clear: both;
    margin-top: 3%;
    }
    .far,.fas{font-size: 1rem;}
    .cc div{margin-top: 43%;}
    .t1{margin-left: 16rem;}
    .ft{ float: left; height: 100%; margin-right: 3%; }
    .t1 label{float: left;}
    footer{clear: both;}
    #mang{display: flex;
    margin-right: -9%;}
    .contm{border: 1px solid white; overflow:hidden;  overflow-wrap:break-word; width: 94%;}
    .pages{text-align: center;}
    .ftt{font-weight:800; }
    #titlt{margin-top: 2%; margin-bottom: 2%;     margin-left: 23rem;}
#logo{float: left;}
#haha{margin-top: 0rem; margin-top: 0.2rem;}
#tabl{    margin-top: 5%;
    margin-left: 7%;}
.contents i{margin-right: 1rem;}
.contents div{margin-bottom: 0.5rem;}
.contents{margin-top: 1rem;}
.far{margin-right: 0.2rem;}
.modibtn{display: inline-block; float: right; width: 3rem; height: 1.8rem; font-size: 0.6rem; text-align: center; margin-top: 3.4%;}
.delbtn{float: right; width: 3rem; height: 1.8rem; font-size: 0.6rem; text-align: center; margin-top: 3.4%;}
</style>
</head>
<jsp:include page="../header.jsp"></jsp:include>
<body>
<div id="titlt" class="container">
        <img id="logo" src="/img/playButton.PNG" alt="플레이로고">
        <h3 id="haha">버스킹 홍보</h3>
    </div>
    
<div class="container">
     <div class="box">
  <div class="td">
          <div class='delete'>
            <c:if test="${busk == sessionScope.loginUser.no}">
          <button class="modibtn btns btns btns-outline-m" onclick="editPage()">수정</button>
          <form action='editform' class='editform'>
          <input type="hidden" name="bbno" id="bbno">
          </form>
          <button class="delbtn btns btns btns-outline-m" onclick="deletePage()">삭제</button>
          </c:if>
          </div>
          <h1 class="titl">${list.titl}</h1>

          
          <div id="tobbox">
        <a class="pull-left" href="#">
            <img class="media-object" id="phot" src='/upload/${list.phot}'>
          </a>
          <div class="t1">
               <div class="ft"><h3 id="tabl">${list.teamname}</h3>
            <div class='contents'>
              <i class="fas fa-music"></i><div>${list.genre}<br></div>
              <i class="fas fa-map-marked-alt"></i><div>${list.city}<br></div>
              <div id="mang"><i class="far fa-calendar-alt"></i>${list.nsdt}~${list.nedt}<br></div>
              <i id="ctnt" class="fas fa-male" style="text-align: center;"></i><div>${list.cnt}<br></div>
              <i class="far fa-sticky-note"></i><div>${list.etc}<br></div>
            </div>
      </div>
    </div>
     <a href='../buskerfeed/enter?no=${list.bno}'><button id="topbtn" class="btns btns btns-outline-m">피드가기</button></a>
     
 </div>
         </div>
     <div id="textbox">
     <div class="c-t">


            <c:choose>
             <c:when test="${sessionScope.loginUser.id != null}">
              <textarea id="text" class='commentscontext' placeholder="댓글을 입력해주세요"></textarea>
             </c:when>
             <c:otherwise>
              <textarea id="text" class='commentscontext' placeholder="로그인 후 이용해주세요" readonly="readonly"></textarea>
             </c:otherwise>
            </c:choose>

         <button id="btn2" name="singlebutton" class="btns btns-outline-m">입력</button>
         </div>
         <div id="commenttop"></div>
         <!-- 댓글  -->
    <div class='comments'>
    <c:forEach  items="${comment}" var="com">
    <div class="t">

    <div class="pn">
        <a><img src="/upload/${com.phot}" class="pto"></a>
        <c:choose>
        <c:when test="${com.type == '일반회원' }">
         <p class="nik" style="background-color: #92a8d1;">${com.type}</p>
         </c:when>

        <c:when test="${com.type == '버스커'}">
        <p class="nik" style="background-color: #FF8B8B;">${com.type}</p>        
        </c:when>
        <c:when test="${com.type == '제공자'}">
        <p class="nik" style="background-color: #61BFAD;">${com.type}</p>  
        </c:when>
        </c:choose>
    </div>
    
    <div class="cc">
           <div  class="ftt">${com.nik}</div>
    </div>
    
      <div class="text">
          <div class="cdtr" >${com.ncdt}</div><br>
          <textarea class="contm" onkeydown="resize(this)" onkeyup="resize(this)" readonly="readonly" rows="2" maxlength="100" >${com.cont}</textarea> <!-- m -->
       <c:choose>
             <c:when test="${sessionScope.loginUser.no == com.mno}">
             <div class="icon">
                <div class="editcomment" value="${com.bcno}" style="display:none;"><i class="far fa-check-square"></i></div>
                <div class="modifycomment" ><i class="far fa-edit"></i></div>
                <div class="removecomment" onclick="removeComment(${com.bcno})"><i class="fas fa-minus"></i></div>
              </div>
              
             </c:when>
             <c:otherwise>
             </c:otherwise>
            </c:choose>
            </div>
         </div>
       </c:forEach>
        </div> 
        <!-- 댓글끝 --> 
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
        </div>
    <script type="text/javascript">
    //textarea
    function resize(obj) {
    	
  var str = $(obj).val();
  var str_arr = str.split("\n");  // 줄바꿈 기준으로 나눔 
  var row = str_arr.length;  // row = 줄 수 
  if(row >3){
  //마지막 입력문자 삭제

  swal("3줄 이상 입력할 수 없습니다.");
  var lastChar = str.slice(0,-1); //열 

  $(obj).val(lastChar);

  obj.style.height = "1px";
  obj.style.height = (12+obj.scrollHeight)+"px";
  }
  
  obj.style.height = "1px";
  obj.style.height = (12+obj.scrollHeight)+"px";
}
    
    // 댓글 입력
    $('#btn2').click(function(){
    	
    if($('.commentscontext').val().length == 0){
    		swal("경고","내용을 입력하세요!","warning");
    		return;
    	}
    	
         $.ajax({
             type : "POST",
                url : "comments",
                dateType : "json",
                data :{"comment":$('.commentscontext').val(), "bbno":${list.bbno}},
                success : function(data){
                	window.location.reload() ;
            	   $('.comments').empty();
                       $('.commentscontext').empty();
                       $('.pages').empty();
                       $.each(data.list,function(index,item){
                    	   if(item.type == '일반회원'){
                    	   var content =   
                    		   '<div class="t">'
                               +'<div class="pn">'
                               +'<a><img src="/upload/'+item.phot+'"class="pto"></a>'
                               +'<p class="nik"  style="background-color: #92a8d1;">'+item.type+'</p>'
                               +'</div>'
                               +'<div class="cc">'
                               +'<div class="ft">'+item.nik+'</div>'
                               +'</div>'
                               +'<div class="text">'
                               +'<div class="cdtr">'+item.ncdt+'</div><br>'
                               +'<textarea class="contm" readonly="readonly">'+item.cont+'</textarea>';
                    	   }else if(item.type == '버스커'){
                               var content =   
                                   '<div class="t">'
                                   +'<div class="pn">'
                                   +'<a><img src="/upload/'+item.phot+'"class="pto"></a>'
                                   +'<p class="nik" style="background-color: #FF8B8B;">'+item.type+'</p>'
                                   +'</div>'
                                   +'<div class="cc">'
                                   +'<div class="ft">'+item.nik+'</div>'
                                   +'</div>'
                                   +'<div class="text">'
                                   +'<div class="cdtr">'+item.ncdt+'</div><br>'
                                   +'<textarea class="contm" readonly="readonly">'+item.cont+'</textarea>';
                    		   
                    	   }else if(item.type == '제공자'){
                               var content =   
                                   '<div class="t">'
                                   +'<div class="pn">'
                                   +'<a><img src="/upload/'+item.phot+'"class="pto"></a>'
                                   +'<p class="nik" style="background-color: #61BFAD;">'+item.type+'</p>'
                                   +'</div>'
                                   +'<div class="cc">'
                                   +'<div class="ft">'+item.nik+'</div>'
                                   +'</div>'
                                   +'<div class="text">'
                                   +'<div class="cdtr">'+item.ncdt+'</div><br>'
                                   +'<textarea class="contm" readonly="readonly">'+item.cont+'</textarea>';
                    		   
                    	   }
                               if(item.mno == data.mno){ 
                                   /* $('.comments').append( */
                                content += '<div class="icon">'
                                             +'<div class="modifycomment" onclick="modifyComment(${com.bcno})"><i class="far fa-edit"></i></div>'
                                           +'<div class="removecomment" onclick="removeComment(${com.bcno})"><i class="fas fa-minus"></i></div></div>';
                               }
                               $('.comments').append(content);
                               
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
                    $('.comments').empty();
                    $('.commentscontext').empty();
                    $('.pages').empty();
                    $.each(data.list,function(index,item){
                    if(item.type == '일반회원'){
                    $('.comments').append('<div class="t"><div class="pn"><a><img src="/upload/'+item.phot+'" class="pto"></a><p class="nik" style="background-color: #92a8d1;">'+
                            item.type+'</p></div>'+'<div class="cc"><tr><th>'+item.nik+'</th><br><td>'+item.ncdt+'</td></tr></div>'+
                    '<textarea class="contm" readonly="readonly">'+item.cont+'</textarea></div>');
                    }else if(item.type == '버스커'){
                    $('.comments').append('<div class="t"><div class="pn"><a><img src="/upload/'+item.phot+'" class="pto"></a><p class="nik" style="background-color: #FF8B8B;">'+
                       item.type+'</p></div>'+'<div class="cc"><tr><th>'+item.nik+'</th><br><td>'+item.ncdt+'</td></tr></div>'+
                      '<textarea class="contm" readonly="readonly">'+item.cont+'</textarea></div>');	
                    }else if(item.type == '제공자'){
                    $('.comments').append('<div class="t"><div class="pn"><a><img src="/upload/'+item.phot+'" class="pto"></a><p class="nik" style="background-color: #61BFAD;">'+
                      item.type+'</p></div>'+'<div class="cc"><tr><th>'+item.nik+'</th><br><td>'+item.ncdt+'</td></tr></div>'+
                      '<textarea class="contm" readonly="readonly">'+item.cont+'</textarea></div>');	
                    }
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
            	   if(item.type == '일반회원'){
                       var content =   
                           '<div class="t">'
                           +'<div class="pn">'
                           +'<a><img src="/upload/'+item.phot+'"class="pto"></a>'
                           +'<p class="nik"  style="background-color: #92a8d1;">'+item.type+'</p>'
                           +'</div>'
                           +'<div class="cc">'
                           +'<div class="ft">'+item.nik+'</div>'
                           +'</div>'
                           +'<div class="text">'
                           +'<div class="cdtr">'+item.ncdt+'</div><br>'
                           +'<textarea class="contm" readonly="readonly">'+item.cont+'</textarea>';
                       }else if(item.type == '버스커'){
                           var content =   
                               '<div class="t">'
                               +'<div class="pn">'
                               +'<a><img src="/upload/'+item.phot+'"class="pto"></a>'
                               +'<p class="nik" style="background-color: #FF8B8B;">'+item.type+'</p>'
                               +'</div>'
                               +'<div class="cc">'
                               +'<div class="ft">'+item.nik+'</div>'
                               +'</div>'
                               +'<div class="text">'
                               +'<div class="cdtr">'+item.ncdt+'</div><br>'
                               +'<textarea class="contm" readonly="readonly">'+item.cont+'</textarea>';
                           
                       }else if(item.type == '제공자'){
                           var content =   
                               '<div class="t">'
                               +'<div class="pn">'
                               +'<a><img src="/upload/'+item.phot+'"class="pto"></a>'
                               +'<p class="nik" style="background-color: #61BFAD;">'+item.type+'</p>'
                               +'</div>'
                               +'<div class="cc">'
                               +'<div class="ft">'+item.nik+'</div>'
                               +'</div>'
                               +'<div class="text">'
                               +'<div class="cdtr">'+item.ncdt+'</div><br>'
                               +'<textarea class="contm" readonly="readonly">'+item.cont+'</textarea>';
                           
                       }
               if(item.mno == data.mno){
                   /* $('.comments').append( */
               content += '<div class="icon">'
                             +'<div class="modifycomment" onclick="modifyComment(${com.bcno})"><i class="far fa-edit"></i></div>'
                           +'<div class="removecomment" onclick="removeComment(${com.bcno})"><i class="fas fa-minus"></i></div></div>';
               }
               $('.comments').append(content);
               
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
$(".modifycomment").click(function(){
	
	$(this).parent().siblings('textarea').removeAttr('readonly').css('border','1px solid blue');
	$(this).siblings().css('display','block');
	$(this).css('display','none');//.css('background-color','red')
			//parent().attr('class'));//test
});

$(".editcomment").click(function(){
	function getUrlParams() {
        var params = {};
        window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { params[key] = value; });
        return params;
    } 
    var bbno = getUrlParams().bbno;
	var bcno=$(this).attr('value'); 
	var comment = $(this).parent().siblings('textarea').val();
	
	$(this).parent().siblings('textarea').attr('readonly','readonly').css('border','0');
    $(this).siblings().css('display','block');
    $(this).css('display','none');
	///test
	
	$.ajax({ 
        type : "POST", 
        url : "bcContentEdit",
        dataType: 'json',
        data: {
        	'bbno':bbno,
        	'bcno':bcno,
        	'comment':comment
        }, 
        success : function(data) {
        	swal("짜잔","댓글이 수정완료!","success");
        },
        error : function(request, status, error) {
            swal("오류","달력데이터 오류","error");
        }
    });
	
});


function deletePage(){
    function getUrlParams() {
        var params = {};
        window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { params[key] = value; });
        return params;
    } 
  
    var bbno = getUrlParams().bbno;
    
    swal({
        text: "해당 게시글을 삭제하시겠습니까?",
        icon: 'info',
        buttons: {
            cancel:'취소',
            confirm:"삭제"
        }
    }).then((will)=>{
        if(will){
	$.ajax({ 
        type : "POST", 
        url : "deletePage",
        dataType: 'json',
        data: {'bbno':bbno}, 
        success : function(data) {
        	location.href = "list.jsp";
        },
        error : function(request, status, error) {
            swal("오류","삭제 오류","error");
        }
    });
    }
});
}
   
function editPage(){    
	function getUrlParams() {
    var params = {};
    window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { params[key] = value; });
    return params;
} 

    var bbno = getUrlParams().bbno;
    
    $('#bbno').val(bbno);
    $('.editform').submit();
    
	
}


/* function modifyComment(event){
	console.log("::"); 
	var bcno=$(event).attr('value');
	var parent = $(event.parentNode);
	console.log(parent);
	parent.sibling().removeAttr('readonly');
} */
    </script>   
</body>
<div class="footer">
<footer>
<jsp:include page="../footer.jsp"></jsp:include>
</footer>
</div>
</html>