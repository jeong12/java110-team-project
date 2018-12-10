<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css"/>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../../css/common.css">
</head>
<title>관리자</title>
</head>

<style>
#ccc{display: inline-flex;}
body{background-color: snow;}
#titl{margin-top: 3.5%; margin-bottom: 2%;}
    #logo{float: left; width: 40px; height: 40px;}
    #haha{margin-top: 0.7%; margin-left: 4%;}
.tab{display: none;}
.hide-bullets {list-style:none;margin-left:-40px;margin-top:20px;}
.iframe1{height: 17rem;}
.iframe2{height: 17rem;}
    #ig{width: 129px;height: 60px;}  
    .mli{padding:0px; float: left;}
    .aac{ margin-top: 0px; margin-left:3%;}
    .aad{margin-left: -24px; margin-top: 0px;}
    .mtb{
        margin: auto; margin:26px auto 20px;
        border: 1px solid silver; !importatnt;
        width: 500px; padding: 10px; padding-bottom: 30px;
    }
    .btb{margin: auto; margin:26px auto 20px; 
        border: 1px solid silver;
        width: 500px; padding: 10px; padding-bottom: 30px;
    }
    .close{margin-right: 15px;}
    #ttl{margin-left: 21px;}
    .mtb label{float:left;}
    #supm{width: 25rem; margin-left: 2%;} 
    table{width: 100%; background-color: white;}
    #ccc{float: right;}
    .dtailSupbutton,.dtailbuskbutton{width: 4rem; height: 1.8rem; padding: 0; font-size: 0.8rem;}
    .gradleSupUpdate,.gradleBuskUpdate{width: 3rem; height:1.8rem; padding: 0; font-size : 0.8rem;}
    #input,#selt,.gradle{font-size: 0.8rem;}
    .slectbtn{width: 3rem; height:1.8rem; padding: 0; font-size : 0.8rem; margin-bottom: 1%;}
    #myCarousel2{
        width: 25rem;
    height: 17rem;
    }
    .btb label{float: left;}
    form-control{height: 2rem;}
    #input{width: 11rem;}
    .slectbtn{width: 3rem; margin-left: 1%; height: 2rem; margin-bottom: 1%; margin-top: -0.5%;}
    .gradle,#selt{width: 7rem; padding: 1%;}
    #imgcontainer{width: 26.5rem;}
    #buskp,#buskp2{height: 19rem;}
</style>
<header>
    <jsp:include page="../header.jsp"></jsp:include>
</header>

<div id="titl" class="container">
        <img id="logo" src="../../img/playButton.png" alt="플레이로고">
        <h3 id="haha">버스킹 일정</h3>
    </div>

<body>
<div class="container">
    <div class="toptop">
       <button class="bt1 btn-default btn-sm"  onclick="openCity('bt1')">전체</button>
       <button class="bt2 btn-primary btn-sm" value="2">버스커</button>
       <button class="bt3 btn-sussess btn-sm" value="3">제공자</button>

       <div id="ccc">      
            <select class="gradle form-control">
                <option value="busk">버스커</option>
                <option value="sup">제공자</option>
            </select>
                        
            <select name="st" id="selt" class="flag form-control">
           <option class="select" value="nik">닉네임</option> 
           <option class="select" value="email">이메일</option>
        </select>
        <input type="text" id="input" class="form-control">
        <button type="button"  class="slectbtn btns btns-outline-m">검색</button>
        </div>  
</div>
       
<div>
 <table class="table table-bordred table-striped">         
                  <thead>                   
                       <tr><th class="col-md-1 text-center">닉네임</th>
                       <th class="col-md-1 text-center">팀명/장소</th>
                       <th class="col-md-1 text-center">선호장르</th>
                       <th class="col-md-2 text-center">이메일</th>
                       <th class="col-md-1 text-center">요청등급</th>
                       <th class="col-md-1 text-center">상세보기</th>
                       <th class="col-md-1 text-center">확정</th></tr>
                   </thead>
    <tbody id="ajappend1">
          <c:forEach items="${sup}" var="m">
            <tr>
                    <td class="col-md-1 text-center">${m.nik}</td>
                    <td class="col-md-1 text-center">${m.name}</td>
                    <td class="col-md-1 text-center">${m.genre}</td>
                    <td class="col-md-1 text-center">${m.email}</td>
                    <td class="col-md-1 text-center">제공자</td>
                    <td class="col-md-1 text-center"><button type="button" class="dtailSupbutton btns btns-outline-secondary" value="${m.sno}" 
                    data-target="#model-id" data-toggle="modal">상세보기</button></td>
                    <td class="col-md-1 text-center"><button class="gradleSupUpdate btns btns-outline-success" type="button" value="${m.sno}">확정</button></td>
             </tr>
             </c:forEach>
                <c:forEach  items="${list}" var="m">
             <tr>
                 <td  class="col-md-1 text-center">${m.nik}</td>
                    <td  class="col-md-1 text-center">${m.name}</td>
                    <td  class="col-md-1 text-center">${m.genre}</td>
                    <td  class="col-md-1 text-center">${m.email}</td>
                    <td  class="col-md-1 text-center">버스커</td>
                    <td  class="col-md-1 text-center"><button type="button" class="dtailbuskbutton btns btns-outline-secondary" value="${m.bno}"
                     data-target="#model-id2" data-toggle="modal">상세보기</button></td>
                    <td  class="col-md-1 text-center"><button class="gradleBuskUpdate btns btns-outline-success" type="button" value="${m.bno}">확정</button></td>
             </tr>
             </c:forEach>
          </tbody>   
      </table>  
      </div>  
      </div>   
      
      
<!-- 모달 서포터 -->      
      <div class="container">

  <div id="model-id" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="ttl">용찬하우스</h3>
      </div>
      
      <div class="container" id="imgcontainer">
        
            <div id="carousel-example-generic" class="bbbbs carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target=".bbbbs" data-slide-to="0" class="active"></li>
                    <li data-target=".bbbbs" data-slide-to="1"></li>
                    <li data-target=".bbbbs" data-slide-to="2"></li>
                </ol>
                <div class="ttttt carousel-inner">
                    <div class="item active">
                        <img src="" alt="First slide">
                    </div>
                    <div class="item">
                        <img src="" alt="Second slide">
                    </div>
                    <div class="item">
                        <img src="" alt="Third slide">
                    </div>
                </div>
                <a class="left carousel-control" href=".bbbbs" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span></a><a class="right carousel-control"
                        href=".bbbbs" data-slide="next"><span class="glyphicon glyphicon-chevron-right">
                        </span></a>
    </div>
</div>
<div id="push">
</div>

<div class="maaa">
<div class="mtb">
        <label>장소명 :</label><div class="sname"></div>
        <label>인원 :</label><div class="scnt"></div>
        <label>상세주소 :</label><div class="saddr"></div>
        <label>선호장르 :</label><div class="sgenre"></div>
        <label>연락처 :</label><div class="stel"></div>
        <label>희망사항 :</label><div class="smessage"></div>
 </div>    
 </div>
      <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
      </div>
    </div>
  </div>
  </div>

</div>
<!-- 모달 서포터 여기까지 -->

  
<!-- 버스커 모달 -->
        <div class="container">


 

  <div id="model-id2" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="ttl">용찬하우스</h3>
      </div>
      
      <div id="mmain">
    <div class="container" id="imgcontainer">
        
            <div id="carousel-example-generic" class="bs carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target=".bs" data-slide-to="0" class="active"></li>
                    <li data-target=".bs" data-slide-to="1"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="item active" id="buskp">
                    </div>
                    <div class="item" id="buskp2">
                    </div>
                </div>
                <a class="left carousel-control" href=".bs" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span></a><a class="right carousel-control"
                        href=".bs" data-slide="next"><span class="glyphicon glyphicon-chevron-right">
                        </span></a>
    </div>
</div>
                    <!-- <div class="" id="slider" id="main">
                      
                            <div id="carousel-bounding-box" >
                                <div class="carousel slide" id="myCarousel2">
                          
                                    <div class="carousel-inner" >
                                        <div class="active item"   data-slide-number="0">
                                        <div class="iframe1">
                                        <iframe  src="https://www.youtube.com/embed/fiGSDywrX1Y" width="500" height="300" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                                       </div>
                                        </div>
                                        <div class="item"  data-slide-number="1">
                                        <div class="iframe2">
                                        <iframe class="ff" id="ff" src="https://www.youtube.com/embed/OYNcPTat5pY" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                                        </div>
                                        </div>
                               
                                    </div>
                                    <a class="left carousel-control" href="#myCarousel2" role="button" data-slide="prev">
                                        <span class="glyphicon glyphicon-chevron-left"></span>                                       
                                    </a>
                                    <a class="right carousel-control" id="ri" href="#myCarousel2" role="button" data-slide="next">
                                        <span class="glyphicon glyphicon-chevron-right"></span>                                       
                                    </a>                                
                                   
                             

                        
                        </div>
              
                </div>

                <div class="aab row hidden-xs" id="slider-thumbs">
                   
                        <ul class="aad hide-bullets">
                            <li class="mli">
                                 <a class="thumbnail" id="carousel-selector-0"><img id="ig" src="https://img.youtube.com/vi/fiGSDywrX1Y/hqdefault.jpg"></a> 
                            </li>

                            <li class="mli">
                                <a class="thumbnail" id="carousel-selector-1"><img id="ig" src="https://img.youtube.com/vi/fiGSDywrX1Y/hqdefault.jpg"></a>
                            </li>
                        </ul>                 
                </div>
        </div> -->
</div>

    <div class="btb">
        <label>팀명 :</label><div class="bname"></div>
        <label>선호지역 :</label><div class="bcity"></div>
        <label>장르 :</label><div class="bgenre"></div>
        <label>연락처 :</label><div class="btel"></div>
        <label>팀소개 :</label><div class="bintro"></div>
    </div>  
     
    <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
      </div>
    </div>
  </div>
  </div>
   
 
</div>                            
                  
 
 <!-- 버스커모달 여기까지 -->
 
</body>

<footer>
    <jsp:include page="../footer.jsp"></jsp:include>
</footer>


<script>
$('.gradleSupUpdate').click(function(){
	var no = $(this).val();
	alert(no);
	
	$.ajax({
		type : "POST",
		url : "gradlesupupdate",
		dataType : "json",
		data : {"no":no},
		success : function(data){
			alert("변경됨")
			window.location.href=window.location.href;
		},
		 error : function(request, status, error) {
             alert("에러가 발생했습니다. 관리자에게 문의하시기 바랍니다");
         }
		
	})
	
})

$('.gradleBuskUpdate').click(function(){
    var no = $(this).val();
    alert(no);
    
    $.ajax({
        type : "POST",
        url : "gradlebuskupdate",
        dataType : "json",
        data : {"no":no},
        success : function(data){
            alert("변경됨")
            window.location.href=window.location.href;
        },
         error : function(request, status, error) {
             alert("에러가 발생했습니다. 관리자에게 문의하시기 바랍니다");
         }
        
    })
    
})

$(document).on('click','.dtailSupbutton',function(){
	var n = $(this).val();
	alert(n);
    $.ajax({ 
        type : "POST", 
        url : "supdetail",
        dataType: 'json',
		data : {"no":n},
	     success : function(data) {
			 $(".sname").empty();
			 $(".scnt").empty();
			 $(".saddr").empty();
			 $(".sgenre").empty();
			 $(".stel").empty();
			 $(".smessage").empty();
			 $(".ttttt").empty();
			console.log(data);
			console.log(data.det_addr);
			console.log(data.etc);
			console.log(data.capa);
	         $.each(data.stagephotos,function(index,item){
	        	 console.log(item.photo);
	        	 $(".ttttt").append("<div class='item'><img src='/upload/"+item.photo+"' alt='First slide'></div>")
	         });
	   
	         $(".item:first").removeClass("item").addClass("active item");
	                                          
	                $(".sname").append('<p>'+data.name+'</p>');
	                $(".scnt").append('<p>'+data.capa+'</p>');
	                $(".saddr").append('<p>'+data.detailaddr+'</p>');
	                $(".sgenre").append('<p>'+data.sgnere+'</p>');
	                $(".stel").append('<p>'+data.tel+'</p>');
	                $(".smessage").append('<p>'+data.message+'</p>');
		}                                          
	})
})

$(document).on('click','.dtailbuskbutton',function(){
    var n = $(this).val();
    alert(n);
    $.ajax({ 
        type : "POST", 
        url : "buskdetail",
        dataType: 'json',
        data : {"no":n},
         success : function(data) {
             $(".bname").empty();
             $(".bcity").empty();
             $(".bgenre").empty();
             $(".btel").empty();
             $(".bintro").empty();
             $("#buskp").empty();
             $("#buskp2").empty();
              $("#buskp").append("<iframe style='width: 100%;height: 100%;' src='"+data.avi1+"' frameborder='0' allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>");
              $("#buskp2").append("<iframe style='width: 100%;height: 100%;' src='"+data.avi2+"' frameborder='0' allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>");
                    $(".bname").append('<p>'+data.teamname+'</p>');
                    $(".bcity").append('<p>'+data.city+'</p>');
                    $(".bgenre").append('<p>'+data.teamgenre+'</p>');
                    $(".btel").append('<p>'+data.tel+'</p>');
                    $(".bintro").append('<p>'+data.message+'</p>');
        } 
    })
})


$('.bt1').click(function(){
        	window.location.href=window.location.href;
})

$('.bt2').click(function(){
	var flag = $('.bt2').val();
	$.ajax({
		type : "POST",
		url : "gradleAjaxBusker",
        dataType: 'json',
        data : {"flag":flag},
		success :function(data){
			
			$("#ajappend1").empty();
			
			$.each(data,function(index,item){
			
			$("#ajappend1").append("<tr><td class='col-md-1 text-center'>"+item.nik+"</td>"
					+"<td class='col-md-1 text-center'>"+item.name+"</td>"
					+"<td class='col-md-1 text-center'>"+item.genre+"</td>"
					+"<td class='col-md-2 text-center'>"+item.email+"</td>"
					+"<td class='col-md-1 text-center'>"+item.flag+"</td>"
				    +"<td class='col-md-1 text-center'><button type='button' class='dtailbuskbutton btns btns-outline-secondary' value='"+item.bno+"'data-target='#model-id2' data-toggle='modal'>상세보기</button></td>"
				    +"<td class='col-md-1 text-center'><button type='button' class='gradleBuskUpdate btns btns btns-outline-success'  value='"+item.bno+"'>확정</button></td></tr>"
				   	)
			});
		}
	})
	
})

$('.bt3').click(function(){
    var flag = $('.bt3').val();
    $.ajax({
        type : "POST",
        url : "gradleAjaxSupporter",
        dataType: 'json',
        data : {"flag":flag},
        success :function(data){
            
            $("#ajappend1").empty();
            $.each(data,function(index,item){
            $("#ajappend1").append("<tr><td class='col-md-1 text-center'>"+item.nik+"</td>"
                    +"<td class='col-md-1 text-center'>"+item.name+"</td>"
                    +"<td class='col-md-1 text-center'>"+item.genre+"</td>"
                    +"<td class='col-md-1 text-center'>"+item.email+"</td>"
                    +"<td class='col-md-1 text-center'>"+item.flag+"</td>"
                    +"<td class='col-md-1 text-center'><button type='button' class='dtailSupbutton btns btns-outline-secondary' value='"+item.bno+"'data-target='#model-id' data-toggle='modal'>상세보기</button></td>"
                    +"<td class='col-md-1 text-center'><button type='button' class='gradleSupUpdate btns btns btns-outline-success'  value='"+item.bno+"'>확정</button></td></tr>"
                    )
            });
        }
    })
    
})


// search
$('.slectbtn').click(function(){
    var gradle = $('.gradle').val(); // grade
    var sflag = $('.flag').val();  // nik,email
    var text = $('.text').val(); // 입력값
    
    console.log("sflag:"+sflag);
    console.log("text:"+text);
    console.log("gradle:"+gradle);
    
    var values={
    		"text":text,
    		"sflag":sflag,
    }
                                                                                                                              
    if(gradle == 'busk'){
    	$.ajax({
    		type:"POST",
    		url :"gradleAjaxBuskerSelect",
    		data : values,
    		dataType : 'json',
    		success : function(data){
    			$("#ajappend1").empty();
    			$("#ajappend2").empty();
    			$("#ajappend3").empty();
    			alert("1번이지롱");
    			 if(data.length == 0){
    				 alert("다시입력해주세요");
                 }             
    			
    			  $.each(data,function(index,item){
    		            console.log('--------------');
    		                                              
    		                                                   
    		            $("#ajappend1").append('<tr><td>'+item.nik+'</td>'
    		                    +'<td>'+item.name+'</td>'
    		                    +'<td>'+item.genre+'</td>'
    		                    +'<td>'+item.email+'</td>'
    		                    +'<td>'+item.flag+'</td></tr>'
    		                    );
    		            $("#ajappend2").append('<tr><td>'+item.nik+'</td>'
    		                	+'<td>'+item.name+'</td>'
    	                        +'<td>'+item.genre+'</td>'
    	                        +'<td>'+item.email+'</td>'
    	                        +'<td>'+item.flag+'</td></tr>'
    		                    );
    		            $("#ajappend3").append('<tr><td>'+item.nik+'</td>'
                                +'<td>'+item.name+'</td>'
                                +'<td>'+item.genre+'</td>'
                                +'<td>'+item.email+'</td>'
                                +'<td>'+item.flag+'</td></tr>'
                                );
    		        }); 
    		    },
    		    error : function(request, status, error) {
    		        alert("에러가 발생했습니다. 관리자에게 문의하시기 바랍니다");
    		    }
    	})
    }
                                           
    if(gradle == "sup"){
    	   $.ajax({
               type:"POST",
               url :"gradleAjaxSupporterSelect",
               data : values,
               dataType : 'json',
               success : function(data){
                   $("#ajappend1").empty();
                   $("#ajappend2").empty();
                   $("#ajappend3").empty();
                   alert("2번이지롱");
                   if(data.length == 0){
                       alert("다시입력해주세요");
                   }             
                     $.each(data,function(index,item){
                           console.log('--------------');
                           $("#ajappend1").append('<tr><td>'+item.nik+'</td>'
                                   +'<td>'+item.name+'</td>'
                                   +'<td>'+item.genre+'</td>'
                                   +'<td>'+item.email+'</td>'
                                   +'<td>'+item.flag+'</td></tr>'
                                   );
                           $("#ajappend2").append('<tr><td>'+item.nik+'</td>'
                                   +'<td>'+item.name+'</td>'
                                   +'<td>'+item.genre+'</td>'
                                   +'<td>'+item.email+'</td>'
                                   +'<td>'+item.flag+'</td></tr>'
                                   );
                           $("#ajappend3").append('<tr><td>'+item.nik+'</td>'
                                   +'<td>'+item.name+'</td>'
                                   +'<td>'+item.genre+'</td>'
                                   +'<td>'+item.email+'</td>'
                                   +'<td>'+item.flag+'</td></tr>'
                                   );
                       }); 
                   },
                   error : function(request, status, error) {
                       alert("에러가 발생했습니다. 이태형에게 문의하시기 바랍니다");
                   }
           })
    }
}) 

   

</script>
</html>