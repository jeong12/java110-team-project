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
</head>
<title>관리자</title>
</head>

<style>

.tab{display: none;}
.hide-bullets {list-style:none;margin-left:-40px;margin-top:20px;}
    #mmain{margin-left:8%; margin-top: 15px;}
    #myCarousel{width: 400px;}
    #myCarousel2{width: 400px;}
    #ff{width: 400px;height: 200px;}
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
    background-color:red;
        border: 1px solid silver;
        width: 500px; padding: 10px; padding-bottom: 30px;
    }
    .close{margin-right: 15px;}
    #ttl{margin-left: 21px;}
    .mtb label{float:left;}
    .carousel
</style>


<body>
       <button class="bt1 btn-default btn-sm"  onclick="openCity('bt1')">전체</button>
       <button class="bt2 btn-primary btn-sm" value="2" onclick="openCity('bt2')">버스커</button>
       <button class="bt3 btn-sussess btn-sm" value="3" onclick="openCity('bt3')">제공자</button>
       <div id="ccc">      

            <select class="gradle">
                <option value="busk">버스커</option>
                <option value="sup">제공자</option>
            </select>
                        
            <select name="st" id="selt" class="flag">
           <option class="select" value="nik">닉네임</option> 
           <option class="select" value="email">이메일</option>
        </select>
        <input type="text" id="input" class="text">
        <button type="button"  class="slectbtn">클릭</button>
        </div>  

       
        <div class="tab" id="bt1" style="display: contents">
      
 <table>         
                  <thead>                   
                       <th>닉네임</th>
                       <th>팀명/장소</th>
                       <th>선호장르</th>
                       <th>이메일</th>
                       <th>요청등급</th>
                       <th>상세보기</th>
                       <th>확정</th>
                   </thead>
    <tbody id="ajappend1">
          <c:forEach items="${sup}" var="m">
             <tr>
                    <td>${m.nik}</td>
                    <td>${m.name}</td>
                    <td>${m.genre}</td>
                    <td>${m.email}</td>
                    <td>${m.flag}</td>
                    <td><button type="button" class="dtailSupbutton" value="${m.sno}" 
                    data-target="#model-id" data-toggle="modal">상세보기</button></td>
                    <td><button class="gradleSupUpdate" type="button" value="${m.sno}">확정</button></td>
                   
             </tr>
             </c:forEach>
                <c:forEach  items="${list}" var="m">
             <tr>
                 <td>${m.nik}</td>
                    <td>${m.name}</td>
                    <td>${m.genre}</td>
                    <td>${m.email}</td>
                    <td>${m.flag}</td>
                    <td><button type="button" class="dtailbuskbutton" value="${m.bno}"
                     data-target="#model-id2" data-toggle="modal">상세보기</button></td>
                    <td><button class="gradleBuskUpdate" type="button" value="${m.bno}">확정</button></td>
             </tr>
             </c:forEach>
          </tbody>   
      </table>  
      </div>     
      <div class="tab" id="bt2">
       
 <table>         
                  <thead>                   
                       <th>닉네임</th>
                       <th>팀명/장소</th>
                       <th>선호장르</th>
                       <th>이메일</th>
                       <th>요청등급</th>
                        <th>상세보기</th>
                       <th>확정</th>
                   </thead>
    <tbody id="ajappend2">
      
            <%--     <c:forEach  items="${list}" var="m">
             <tr>
                 <td>${m.nik}</td>
                    <td>${m.name}</td>
                    <td>${m.genre}</td>
                    <td>${m.email}</td>
                    <td>${m.flag}</td>
             </tr>
             </c:forEach> --%>
          </tbody>   
      </table>  
      </div>     
      <div class="tab" id="bt3">
     
 <table>         
                  <thead>                   
                       <th>닉네임</th>
                       <th>팀명/장소</th>
                       <th>선호장르</th>
                       <th>이메일</th>
                       <th>요청등급</th>
                        <th>상세보기</th>
                       <th>확정</th>
                   </thead>
    <tbody id="ajappend3">
         <%--  <c:forEach items="${sup}" var="m">
             <tr>
                    <td>${m.nik}</td>
                    <td>${m.name}</td>
                    <td>${m.genre}</td>
                    <td>${m.email}</td>
                    <td>${m.flag}</td>
             </tr>
             </c:forEach> --%>
         
          </tbody>   
      </table>  
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
      
      <div class="container">
    <div class="row">
        <div class="col-md-12">
            <div id="carousel-example-generic" class="bbbbs carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target=".carousel slide abc" data-slide-to="0" class="active"></li>
                    <li data-target=".carousel slide abc" data-slide-to="1"></li>
                    <li data-target=".carousel slide abc" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="http://i.imgur.com/2PBLK.jpg" alt="First slide">
                        <div class="carousel-caption">
                        </div>
                    </div>
                    <div class="item">
                        <img src="http://i.imgur.com/2PBLK.jpg" alt="Second slide">
                        <div class="carousel-caption">
                        </div>
                    </div>
                    <div class="item">
                        <img src="http://i.imgur.com/2PBLK.jpg" alt="Third slide">
                        <div class="carousel-caption">
                        </div>
                    </div>
                </div>
                <a class="left carousel-control" href=".bbbbs" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span></a><a class="right carousel-control"
                        href=".bbbbs" data-slide="next"><span class="glyphicon glyphicon-chevron-right">
                        </span></a>
            </div>
        </div>
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
        <div id="mmain">
             
                <div class="row">
                    <div class="col-xs-12" id="slider" id="main">
                     
                        <div class="row">
                            <div class="col-sm-4" id="carousel-bounding-box" >
                                <div class="carousel slide" id="myCarousel2">
                          
                                    <div class="carousel-inner" >
                                        <div class="active item"   data-slide-number="0">
                                        <div class="iframe1">
                                        <iframe id="ff" src="https://www.youtube.com/embed/fiGSDywrX1Y" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                                       </div>
                                        </div>

                                        <div class="item"  data-slide-number="1">
                                        <div class="iframe2">
                                        <iframe id="ff" src="https://www.youtube.com/embed/OYNcPTat5pY" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                                        </div>
                                        </div>
                               
                                    </div>
                                    <a class="left carousel-control" href="#myCarousel2" role="button" data-slide="prev">
                                        <span class="glyphicon glyphicon-chevron-left"></span>                                       
                                    </a>
                                    <a class="right carousel-control" href="#myCarousel2" role="button" data-slide="next">
                                        <span class="glyphicon glyphicon-chevron-right"></span>                                       
                                    </a>                                
                                    </div>
                            </div>        

                        
                        </div>
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
        </div>
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


$('.dtailSupbutton').click(function(){
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
			 $(".aac").empty();
			console.log(data);
			console.log(data.det_addr);
			console.log(data.etc);
			console.log(data.capa);
	         $.each(data.stagephotos,function(index,item){
	        	 $(".ttttt").append("<div class='item' data-slide-number='"+index+"'><img id='ff' src="+item.photo+"></div>")
	         });
	          $.each(data.stagephotos,function(index,item){
         	 $(".aac").append("<button value="+item.photo+" class='mli'><img id='ig'class='photoimg' src="+item.photo+"></button>")
	         }); 
	         $(".mli").click(function(){
	             var src = $(this).val();
	             $(".ttttt").empty();
	             $(".ttttt").append("<img id='ff'class='photoimg' src="+src+">")
	         })  
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

$('.dtailbuskbutton').click(function(){
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
             $(".iframe1").empty();  
             $(".iframe2").empty();
           
             
              $(".iframe1").append("<iframe id='ff' src='"+data.avi1+"' frameborder='0' allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>");
               $(".iframe2").append("<iframe id='ff' src='"+data.avi2+"' frameborder='0' allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>");
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
			
			$("#ajappend2").empty();
			
			$.each(data,function(index,item){
			$("#ajappend2").append('<tr><td>'+item.nik+'</td>'
					+'<td>'+item.name+'</td>'
					+'<td>'+item.genre+'</td>'
					+'<td>'+item.email+'</td>'
					+'<td>'+item.flag+'</td></tr>'
         
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
            
            $("#ajappend3").empty();
            
            $.each(data,function(index,item){
            $("#ajappend3").append('<tr><td>'+item.nik+'</td>'
                    +'<td>'+item.name+'</td>'
                    +'<td>'+item.genre+'</td>'
                    +'<td>'+item.email+'</td>'
                    +'<td>'+item.flag+'</td></tr>'
                  
                    )
            });
                      
        }
    })
    
})

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

//////////////////////////////////////////////////탭
function openCity(cityName) {
	var i;
	var x = document.getElementsByClassName("tab");
	for (i = 0; i < x.length; i++) {
	x[i].style.display = "none"; 
	}
	document.getElementById(cityName).style.display = "contents"; 
	} 
//////////////////////////////////////////////////모달서포터
 $('#carousel-text').html($('#slide-content-0').html());

//Handles the carousel thumbnails
$('[id^=carousel-selector-]').click( function(){
    var id = this.id.substr(this.id.lastIndexOf("-") + 1);
    var id = parseInt(id);
    $('#myCarousel2').carousel(id);
});
// When the carousel slides, auto update the text
$('#myCarousel2').on('slid.bs.carousel', function (e) {
         var id = $('.item.active').data('slide-number');
        $('#carousel-text').html($('#slide-content-'+id).html());
}); 
//////////////////////////////////////////////////버스커 모달

	$('[class^=carousel-selector-]').on('click', function(){
		console.log("aaa");
    var id = this.className.substr(this.className.lastIndexOf("-") + 1);
    var id = parseInt(id);
    $('#myCarousel').carousel(id);
});

	// When the carousel slides, auto update the text
	$('#myCarousel').on('slid.bs.carousel', function(e) {
		var id = $('.item.active').data('slide-number');
		$('#carousel-text').html($('#slide-content-' + id).html());
	});
</script>
</html>