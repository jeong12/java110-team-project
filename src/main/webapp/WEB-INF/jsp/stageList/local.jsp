<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
   <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
</head>
    
    <style>
 
    .img-responsive{
            margin: 20px;
            border: 1px solid silver;
            width: 365px ;height: 365px;
    }
    body{margin-top:20px;}
    #titl{ margin: 10px; padding: 10px;}
    #logo {width: 50px; height: 50px; margin: 10px;}
    h2{margin-top: -50px; margin-left: 70px; }
    nav{text-align: center;}\
    .container{margin-top: 80px;}
    .list{width: 365px; height: 450px;} 
    .list>h3{text-align: center;margin-left: 40px;}
    .modal-dialog{width: 1000px;}   
    .modal-content{height: 900px;}
        
        
        
    </style>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script>
  

   

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
         $('.search-panel .dropdown-menu').find('a').click(function(e) {
        e.preventDefault();
        var param = $(this).attr("href").replace("#","");
        var concept = $(this).text();
        $('.search-panel span#search_concept').text(concept);
        $('.input-group #search_param').val(param);
    });
   
    </script>
    
    

<body>
   
   <div id="titl">
       <img src="../../img/playButton.PNG" id="logo">
       <h2>무대 목록</h2>
   </div>
   
   <div class="container">
    <div class="row">    
        <div class="col-xs-8 col-xs-offset-2">
            <div class="input-group">
                <div class="input-group-btn search-panel">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        <span id="search_concept">Filter by</span> <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                      <li><a href="#contains">팀명</a></li>
                      <li><a href="#its_equal">해쉬태그</a></li>
                      <li><a href="#greather_than">장르</a></li>
                      
                      <li class="divider"></li>
                      <li><a href="#all">모두</a></li>
                    </ul>
                </div>
                <input type="hidden" name="search_param" value="all" id="search_param">         
                <input type="text" class="form-control" name="x" placeholder="검색해주세요...">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search"></span></button>
                </span>
            </div>
        </div>
    </div>
</div>



    <div class="container">
        <div class="row">
   
        <br/>
            <c:forEach  items="${local}" var="m">
            <div class="list col-lg-4 col-md-4 col-sm-4 col-xs-6" data-toggle="modal" data-target="#myModal">
                <img src="${m.photoName}" class="img-responsive" alt="${m.photoName}">
                <h3>${m.name}</h3>
            </div>
            </c:forEach>
    </div>
    </div>


<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-end">
    <li class="page-item disabled">
      <a class="page-link" href="#" tabindex="-1">Previous</a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item"><a class="page-link" href="#">4</a></li>
      <li class="page-item"><a class="page-link" href="#">5</a></li>
    <li class="page-item">
      <a class="page-link" href="#">Next</a>
    </li>
  </ul>
</nav>
  
  
  
   
 

<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <div class="list col-lg-4 col-md-4 col-sm-4 col-xs-6" data-toggle="modal" data-target="#myModal">
                <img src="img/%EB%B2%84%EC%8A%A4%ED%82%B9%202.jpg" class="img-responsive">
                <h3>가나다라마바사</h3>
            </div>
      
       
         <!-- Modal body 
      <div class="modal-body">
        Modal body..
      </div>
-->
      <!-- Modal footer 
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
-->
    </div>
  </div>
</div>
   
   
   
   
    
</body>
</html>