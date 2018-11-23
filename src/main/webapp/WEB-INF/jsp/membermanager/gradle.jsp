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
<title>Insert title here</title>
</head>
<style>
.tab{display: none}
</style>
<body>


       
        <div class="tab" id="bt1" style="display: contents">
         <button class="bt btn-default btn-sm"  onclick="openCity('bt1')">전체</button>
       <button class="bt2 btn-primary btn-sm" value="2" onclick="openCity('bt2')">버스커</button>
       <button class="bt3 btn-sussess btn-sm" value="3" onclick="openCity('bt3')">제공자</button>
       <div id="ccc">      
            
            <select name="st" id="selt" class="flag">
           <option class="select" value="nik">닉네임</option> 
               <option class="select" value="email">이메일</option>
        </select>
        <input type="text" id="input" class="text">
        <button type="button"  class="slectbtn" value="1">클릭</button>
        </div>  
 <table>         
                  <thead>                   
                       <th>닉네임</th>
                       <th>팀명/장소</th>
                       <th>선호장르</th>
                       <th>이메일</th>
                       <th>요청등급</th>
                   </thead>
    <tbody id="ajappend1">
          <c:forEach items="${sup}" var="m">
             <tr>
                    <td>${m.nik}</td>
                    <td>${m.name}</td>
                    <td>${m.genre}</td>
                    <td>${m.email}</td>
                    <td>${m.flag}</td>
             </tr>
             </c:forEach>
                <c:forEach  items="${list}" var="m">
             <tr>
                 <td>${m.nik}</td>
                    <td>${m.name}</td>
                    <td>${m.genre}</td>
                    <td>${m.email}</td>
                    <td>${m.flag}</td>
             </tr>
             </c:forEach>
          </tbody>   
      </table>  
      </div>     
      <div class="tab" id="bt2">
              <button class="bt btn-default btn-sm"  onclick="openCity('bt1')">전체</button>
       <button class="bt2 btn-primary btn-sm" value="2" onclick="openCity('bt2')">버스커</button>
       <button class="bt3 btn-sussess btn-sm" value="3" onclick="openCity('bt3')">제공자</button>
       <div id="ccc">      
            
            <select name="st" id="selt" class="flag">
           <option class="select" value="nik">닉네임</option> 
               <option class="select" value="email">이메일</option>
        </select>
        <input type="text" id="input" class="text2">
        <button type="button" class="slectbtn" value="2">클릭</button>
        </div> 
 <table>         
                  <thead>                   
                       <th>닉네임</th>
                       <th>팀명/장소</th>
                       <th>선호장르</th>
                       <th>이메일</th>
                       <th>요청등급</th>
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
       <button class="bt btn-default btn-sm"  onclick="openCity('bt1')">전체</button>
       <button class="bt2 btn-primary btn-sm" value="2" onclick="openCity('bt2')">버스커</button>
       <button class="bt3 btn-sussess btn-sm" value="3" onclick="openCity('bt3')">제공자</button>
       <div id="ccc">      
            
            <select name="st" id="selt" class="flag">
           <option class="select" value="nik">닉네임</option> 
               <option class="select" value="email">이메일</option>
        </select>
        <input type="text" id="input" class="text">
        <button type="button"  class="slectbtn" value="3">클릭</button>
        </div>  
 <table>         
                  <thead>                   
                       <th>닉네임</th>
                       <th>팀명/장소</th>
                       <th>선호장르</th>
                       <th>이메일</th>
                       <th>요청등급</th>
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
</body>
<script>

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

    var sflag = $('.select').val();  // nik,email
    var text = $('.text2').val(); // 입력값
    var flag = $(this).val(); // 플래그
    
    console.log(sflag);
    console.log(text);
    console.log(flag);
    var values={
    		"flag":flag,
    		"text":text,
    		"sflag":sflag
    }
                                                                                        
    if(flag == 2){
    	$.ajax({
    		type:"POST",
    		url :"gradleAjaxBuskerSelect",
    		data : values,
    		dataType : 'json',
    		success : function(data){
    			$("#ajappend1").empty();
    			$("#ajappend2").empty();
    			alert("1번이지롱");
    			                      
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
                                           
    if(flag ==3){
    	$.ajax({
            type:"POST",
            url :"gradleAjaxSupporterSelect",
            dataType : 'json',
            success : function(date){
            	$("#ajappend1").empty();
            	$("#ajappend3").empty();
            	alert("2번이지롱");
            }
            
        })
    	
    }
    

}) 


function openCity(cityName) {
	var i;
	var x = document.getElementsByClassName("tab");
	for (i = 0; i < x.length; i++) {
	x[i].style.display = "none"; 
	}
	document.getElementById(cityName).style.display = "contents"; 
	} 
</script>
</html>