<%@page import="java.util.List"%>
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
    .mc{margin-left:52%;}
    .container{width: 80%; margin-left: 10%;}
    .pagination{margin-right: 39%;}    
    td{text-align: center;}
    th{text-align: center;}
    .slt{ margin-top: 30px;} 
    #start,#end{width: 140px; height: 25px; border-radius: 1%;}
    #selt{height: 25px; margin-right: 2px;}
    #input{height: 25px;}
    #bun{float: left;}
    #ccc{float: right;}
    .tab{display: none}
    .hide-bullets {list-style:none;}
    #img{margin:0auto;}
    #mttl,.bttl{margin-left:45%;}
 }
margin-left: -40px;
margin-top:20px;
}
    #mmain{margin-left:  8%; margin-top: 15px;}
    #myCarousel{width: 400px;}
    #myCarousel2{width: 400px;}
    .mmimg{width: 400px;height: 300px;}
    .bbbmimg{width: 400px;height: 300px;}
    #ig{width: 133px;height: 60px;}
    .thumbnail{padding: 0px; }
    .mli{width: 133px;height: 50px; float: left;}
   
    .aac{margin-left: -24px; margin-top: 0px;}
    .mtb{margin: auto; margin:26px auto 20px; ;
        border: 1px solid silver;
        border-radius: 10px;
        width: 500px;
        padding: 10px;
    }
    .close{margin-right: 15px;}
    #ttl{margin-left: 21px;}
    .mtb label{float: left}
</style>





<body>

<div class="container">
    <div class="row">       
        <div class="col-md-12">
        <h2>관리자 페이지</h2>
          <div class="slt">
        <div id="bun">
       <button class="bt btn-default btn-sm" onclick="openCity('bt1')">전체</button>
       <button class="bt btn-primary btn-sm" onclick="openCity('bt2')">일반</button>
       <button class="bt btn-sussess btn-sm"  onclick="openCity('bt3')">버스커</button>
       <button class="bt btn-warning btn-sm"  onclick="openCity('bt4')">제공자</button>
       <button class="bt btn-danger btn-sm"  onclick="openCity('bt5')">정지</button>
        </div>
       <div id="ccc">      
            <input type="date" class="date1" id="start">  ~  <input type="date" class="date2" id="end">
            <select name="st" class="flag" id="selt">
              <option value='0'>기간</option>
               <option value='1'>일</option>
               <option value='2'>닉네임</option> 
               <option value='3'>이메일</option>
        </select>
        <input type="text" id="input" class="text">
        <button type="button" onclick="check()">클릭</button>
        </div>    
       </div>
        <div class="table-responsive">
              
<!--  tab1 --> 
 <div class="tab" id="bt1" style="display: contents"> 
              <table id="mytable" class="table table-bordred table-striped">         
                  <thead>                   
	                   <th>아이디</th>
	                   <th>닉네임</th>
	                   <th>이메일</th>
	                   <th>등급</th>
	                   <th>가입일</th>
	                   <th>메모</th>
	                   <th>메모수정</th>
	                   <th>상세보기</th>
	                   <th>정지</th>
                   </thead>
    <tbody id="testappend">
          <c:forEach  items="${list}" var="m">
          <c:if test= "${m.flag eq '1'.charAt(0)}">
          
             <tr class="tt.col-xs-6">
				    <td>${m.id}</td>
				    <td class=niks>${m.nik}</td>
				    <td>${m.email}</td>
				    <td>회원</td>
				    <td>${m.cdt}</td>
				    <td id="memow">${m.memo}</td>
				    <td><button class="btt btn-primary btn-xs"  data-toggle="modal" data-target="#exampleModal"  value="${m.nik}">메모수정</button></td>
				    <td><button class="memberDetail btn-primary btn-xs"  data-toggle="modal" data-target="#memberDetail" value="${m.nik}">상세보기</button></td>
				    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon"></span>정지</button></p></td>
             </tr>
             
             
             </c:if>  
                   <c:if test= "${m.flag eq '2'.charAt(0)}">
          
             <tr class="tt.col-xs-6">
                    <td>${m.id}</td>
                    <td class=niks>${m.nik}</td>
                    <td>${m.email}</td>
                    <td>버스커</td>
                    <td>${m.cdt}</td>
                    <td id="memow">${m.memo}</td>
                    <td><button class="btt btn-primary btn-xs"  data-toggle="modal" data-target="#exampleModal"  value="${m.nik}">메모수정</button></td>
                    <td><button class="buskDetail btn-primary btn-xs"  data-toggle="modal" data-target=".modelbusk" value="${m.nik}">상세보기</button></td>
                    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon"></span>정지</button></p></td>
             </tr>
             
             
             </c:if>  
                   <c:if test= "${m.flag eq '3'.charAt(0)}">
          
             <tr class="tt.col-xs-6">
                    <td>${m.id}</td>
                    <td class=niks>${m.nik}</td>
                    <td>${m.email}</td>
                    <td>${m.flag}</td>
                    <td>${m.cdt}</td>
                    <td id="memow">${m.memo}</td>
                    <td><button class="btt btn-primary btn-xs"  data-toggle="modal" data-target="#exampleModal"  value="${m.nik}">메모수정</button></td>
                    <td><button class="btt2 btn-primary btn-xs"  data-toggle="modal" data-target="#model-id" value="${m.nik}">상세보기</button></td>
                    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon"></span>정지</button></p></td>
             </tr>
             
             
             </c:if>  
                   <c:if test= "${m.flag eq '4'.charAt(0)}">
          
             <tr class="tt.col-xs-6">
                    <td>${m.id}</td>
                    <td class=niks>${m.nik}</td>
                    <td>${m.email}</td>
                    <td>${m.flag}</td>
                    <td>${m.cdt}</td>
                    <td id="memow">${m.memo}</td>
                    <td><button class="btt btn-primary btn-xs"  data-toggle="modal" data-target="#exampleModal"  value="${m.nik}">메모수정</button></td>
                    <td><button class="btt2 btn-primary btn-xs"  data-toggle="modal" data-target="#model-id" value="${m.nik}">상세보기</button></td>
                    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon"></span>정지</button></p></td>
             </tr>
             
             
             </c:if>  
            </c:forEach>
    </tbody>
</table>
			<div class="clearfix"></div>
					<ul class="pagination pull-right">
						  <li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
						  <li class="active"><a href="#">1</a></li>
						  <li><a href="#">2</a></li>
						  <li><a href="#">3</a></li>
						  <li><a href="#">4</a></li>
						  <li><a href="#">5</a></li>
						  <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
					</ul>
			 </div>            
                 
                                       
<!--  tab2  -->   
     <div class="tab"  id="bt2"> 
              <table id="mytable" class="table table-bordred table-striped">         
                  <thead>                   
	                   <th>아이디</th>
	                   <th>닉네임</th>
	                   <th>이메일</th>
	                   <th>등급</th>
	                   <th>가입일</th>
	                   <th>메모</th>
	                   <th>메모수정</th>
	                   <th>상세보기</th>
	                   <th>정지</th>
                   </thead>
              
    <tbody id="testappend1">
         <c:forEach  items="${list}" var="m">
          
                    <tr class="tt.col-xs-6">
						    <td>${m.id}</td>
						    <td>${m.nik}</td>
						    <td>${m.email}</td>
						    <td>회원</td>
						    <td>${m.cdt}</td>
						    <td>${m.memo}</td>
						    <td><button class="btt btn-primary btn-xs"  data-toggle="modal" data-target="#exampleModal"  value="${m.nik}"></span>메모수정</button></td>
						     <td><button class="memberDetail btn-primary btn-xs"  data-toggle="modal" data-target="#memberDetail" value="${m.nik}">상세보기</button></td>
						    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon"></span>정지</button></p></td>
                      </tr> 
              
            
         </c:forEach> 
    </tbody>
</table>
		<div class="clearfix"></div>
				<ul class="pagination pull-right">
					  <li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
					  <li class="active"><a href="#">1</a></li>
					  <li><a href="#">2</a></li>
					  <li><a href="#">3</a></li>
					  <li><a href="#">4</a></li>
					  <li><a href="#">5</a></li>
					  <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
				</ul>
		 </div>  
                                            
                                                                        
 <!--     tab3   -->
     <div class="tab"  id="bt3"> 
              <table id="mytable" class="table table-bordred table-striped">         
                      <thead>                   
		                   <th>아이디</th>
		                   <th>닉네임</th>
		                   <th>이메일</th>
		                   <th>등급</th>
		                   <th>가입일</th>
		                   <th>메모</th>
		                   <th>메모수정</th>
		                   <th>상세보기</th>
		                   <th>정지</th>
                      </thead>
    <tbody id="testappend2">
        <c:forEach  items="${list}" var="m">
             <c:if test= "${m.flag eq '2'.charAt(0)}"> 
                  <tr class="tt.col-xs-6">
					    <td>${m.id}</td>
					    <td>${m.nik}</td>
					    <td>${m.email}</td>
					    <td>버스커</td>
					    <td>${m.cdt}</td>
					    <td>${m.memo}</td>
					    <td><button class="btn btn-primary btn-xs"  data-toggle="modal" data-target="#edit" ><span class="glyphicon"></span>메모수정</button></td>
					    <td><button class="buskDetail btn-primary btn-xs"  data-toggle="modal" data-target=".modelbusk" value="${m.nik}">상세보기</button></td>
					    <td><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon"></span>정지</button></td>

                    </tr>  
              </c:if>
        </c:forEach>
    </tbody>
</table>
<div class="clearfix"></div>
			<ul class="pagination pull-right">
				  <li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
				  <li class="active"><a href="#">1</a></li>
				  <li><a href="#">2</a></li>
				  <li><a href="#">3</a></li>
				  <li><a href="#">4</a></li>
				  <li><a href="#">5</a></li>
				  <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
			</ul>
      </div>  
                                                                                                              
<!--  tab4 -->                                                             
        <div class="tab"  id="bt4"> 
              <table id="mytable" class="table table-bordred table-striped">         
                  <thead>                   
	                   <th>아이디</th>
	                   <th>닉네임</th>
	                   <th>이메일</th>
	                   <th>등급</th>
	                   <th>가입일</th>
	                   <th>메모</th>
	                   <th>메모수정</th>
	                   <th>상세보기</th>
	                   <th>정지</th>
                   </thead>
        <tbody id="testappend3">
          <c:forEach  items="${list}" var="m">
          <c:if test= "${m.flag eq '3'.charAt(0)}"> 
             <tr class="tt.col-xs-6">
				    <td>${m.id}</td>
				    <td>${m.nik}</td>
				    <td>${m.email}</td>
				    <td>제공자</td>
				    <td>${m.cdt}</td>
				    <td>${m.memo}</td>
				    <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon"></span>메모수정</button></p></td>
				    <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon"></span>상세보기</button></p></td>
				    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon"></span>정지</button></p></td>

              </tr>  
            </c:if>
          </c:forEach>
        </tbody>
</table>
		<div class="clearfix"></div>
		      <ul class="pagination pull-right">
				  <li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
				  <li class="active"><a href="#">1</a></li>
				  <li><a href="#">2</a></li>
				  <li><a href="#">3</a></li>
				  <li><a href="#">4</a></li>
				  <li><a href="#">5</a></li>
				  <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
		      </ul>
		</div>                        
                         
<!-- tab5 -->
       <div class="tab"  id="bt5"> 
              <table id="mytable" class="table table-bordred table-striped">         
                  <thead>                   
                      <th>아이디</th>
                      <th>닉네임</th>
                      <th>이메일</th>
                      <th>등급</th>
                      <th>가입일</th>
                      <th>메모</th>
                      <th>메모수정</th>
                      <th>상세보기</th>
                      <th>정지</th>
                   </thead>
    <tbody id="testappend4">
         <c:forEach  items="${list}" var="m">
             <c:if test= "${m.flag eq '4'.charAt(0)}"> 
                
                <tr class="tt.col-xs-6">
				    <td>${m.id}</td>
				    <td>${m.nik}</td>
				    <td>${m.email}</td>
				    <td>정지</td>
				    <td>${m.cdt}</td>
				    <td>${m.memo}</td>
				    <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon"></span>메모수정</button></p></td>
				    <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon"></span>상세보기</button></p></td>
				    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon"></span>정지</button></p></td>
                 </tr>  
             </c:if>
        </c:forEach>
</tbody>
</table>
		<div class="clearfix"></div>
			<ul class="pagination pull-right">
				  <li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
				  <li class="active"><a href="#">1</a></li>
				  <li><a href="#">2</a></li>
				  <li><a href="#">3</a></li>
				  <li><a href="#">4</a></li>
				  <li><a href="#">5</a></li>
				  <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
			</ul>
		</div>                              
</div>
</div>
</div>
</div>
     

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">New memo</h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="message-text" class="cl control-label">:</label>
            <textarea class="texta form-control" id="message-text"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="button" class="gg btn btn-primary" >변경</button>
      </div>
    </div>
  </div>
</div>



<div id="model-id" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="ttl">용찬하우스</h3>
      </div>
      
      <div id="mmain">
        <div id="mmain">
                <!-- Slider -->
                <div class="row">
                    <div class="col-xs-12" id="slider" id="main">
                        <!-- Top part of the slider -->
                        <div class="row">
                            <div class="col-sm-4" id="carousel-bounding-box" >
                                <div class="carousel slide" id="myCarousel">
                                    <!-- Carousel items -->
                                    <div class="carousel-inner" >
                                        <div class="active item"   data-slide-number="0">
                                        <img id="ff" src="http://files.idg.co.kr/itworld/image/u100003/google-underwater-sunse-100005879-large.png"></div>

                                        <div class="item"  data-slide-number="1">
                                        <img id="ff"  src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4TAp455JRGhynwtLg84kRk_vZs6ZhNUA2omie8CVIF-hmtPgt"></div>

                                        <div class="item" data-slide-number="2">
                                        <img id="ff" src="http://www.womaneconomy.kr/news/photo/201803/58357_104401_4947.jpg"></div>

                               
                                    </div><!-- Carousel nav -->
                                    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                                        <span class="glyphicon glyphicon-chevron-left"></span>                                       
                                    </a>
                                    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                                        <span class="glyphicon glyphicon-chevron-right"></span>                                       
                                    </a>                                
                                    </div>
                            </div>        

                          
                        </div>
                    </div>
                </div><!--/Slider-->

                <div class="aab row hidden-xs" id="slider-thumbs">
                        <!-- Bottom switcher of slider -->
                        <ul class="aac hide-bullets">
                            <li class="mli">
                                <a class="thumbnail" id="carousel-selector-0"><img id="ig" src="http://files.idg.co.kr/itworld/image/u100003/google-underwater-sunse-100005879-large.png"></a>
                            </li>

                            <li class="mli">
                                <a class="thumbnail" id="carousel-selector-1"><img id="ig" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4TAp455JRGhynwtLg84kRk_vZs6ZhNUA2omie8CVIF-hmtPgt"></a>
                            </li>

                            <li class="mli">
                                <a class="thumbnail" id="carousel-selector-2"><img id="ig" src="http://www.womaneconomy.kr/news/photo/201803/58357_104401_4947.jpg"></a>
                            </li>

                        </ul>                 
                </div>
        </div>
</div>

     <div class="mtb">
         <p>장소명 : </p>
         <p>인원 : </p>
         <p>상세주소 : </p>
         <p>선호장르 : </p>
         <p>연락처 : </p>
         <p>희망사항 : </p>
         
        
         
     </div>
     
     
     
      <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
      </div>
    </div>
  </div>
  </div>
   



<div class="container"><!-- 버스커 모달 시작 -->
 
  <div class="modelbusk modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <div class="bttl">
        
        </div>
      </div>
      <div id="mmain">
        <div id="mmain">
                <div class="row">
                    <div class="col-xs-12" id="slider" id="main">
                        <!-- Top part of the slider -->
                        <div class="row">
                            <div class="col-sm-4" id="carousel-bounding-box" >
                                <div class="mc carousel slide" id="myCarousel">
                                                          
                                        <div class="bmimg active item"  data-slide-number="0">
                                        </div>
                                </div>                               
                            </div>                            
                        </div>
                    </div>
                </div>
        </div>
</div>
     <div class="mtb">
        <label>아이디 :</label><div class="bid"></div>
        <label>이메일 :</label><div class="bemail"></div>
        <label>닉네임 :</label><div class="bnik"></div>
        <label>팀명 :</label><div class="bteam"></div>
        <label>선호 장르 :</label><div class="bgenre"></div>
        <label>도시 :</label><div class="bcity"></div>
        <label>연락처 :</label><div class="btel"></div>
        <label>악기 :</label><div class="binst"></div>
        <label style="margin: 0px;">팀소개 :</label><div class="bmemo"></div>
     </div>
      <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
      </div>
    </div>
  </div>
  </div>
</div><!-- 버스커 모달끝 -->

<!-- 회원모달 시작 -->
<div class="container">

  <div id="memberDetail" class="memberDetail modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <div id="mttl">
        </div>
      </div>
      
      <div id="mmain">
        <div id="mmain">
                <!-- Slider -->
                <div class="row">
                    <div class="col-xs-12" id="slider" id="main">
                        <!-- Top part of the slider -->
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="mc" id="myCarousel2">
                                  
                                    <div class="carousel-inner" >
                                        <div class="mmimg active item">
                                        </div>
                                    </div><!-- Carousel nav -->
                                    </div>
                            </div>        
                        </div>
                    </div>
                </div>
        </div>
</div>

     <div class="mtb">
        <label>아이디 :</label><div class="mid"></div>
        <label>이메일 :</label><div class="meamil"></div>
        <label>닉네임 :</label><div class="mnik"></div>
        <label>선호장르:</label><div class="mgenre"></div>
        <label>메모 :</label><div class="mmemo"></div>
     </div>
      <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
      </div>
    </div>
  </div>
  </div>

</div>
<!-- 회원모달 끝 -->
<script>
$('.memberDetail').click(function(){
	var m = $(this).val();
	alert(m);
	
	$.ajax({
		type : "POST",
        url : "memberListDetail",
        dataType : 'json',
        data : {"nik":m},
        success : function(data){
        	$("#mttl").empty();
            $(".mid").empty();
            $(".meamil").empty();
            $(".mnik").empty();
            $(".mgenre").empty();
            $(".mmemo").empty();
            $(".mmimg").empty();
            
            $(".mmimg").append("<img src='/upload/"+data.photo+"'>")
            $("#mttl").append('<h3>'+data.nickname+'</h3>')
            $(".mid").append('<p>'+data.id+'</p>')
            $(".meamil").append('<p>'+data.email+'</p>')
            $(".mnik").append('<p>'+data.nickname+'</p>')
            $(".mgenre").append('<p>'+data.genre0+','+data.genre1+','+data.genre2+'</p>')
            $(".mmemo").append('<p>'+data.memo+'</p>')
        }
	})
	
})
                                                                           
$('.buskDetail').click(function(){
    var b = $(this).val();
    alert(b);
	
    $.ajax({
    	type : "POST",
    	url : "buskListDetail",
    	dataType : 'json',
    	data : {"nik":b},
    	success : function(data){
    		$(".bttl").empty();
    		$(".bid").empty();
    		$(".bemail").empty();
    		$(".bnik").empty();
    		$(".bteam").empty();
    		$(".bgenre").empty();
    		$(".bcity").empty();
    		$(".btel").empty();
    		$(".binst").empty();
    		$(".bmemo").empty();
    		$(".bmimg").empty();
    		
    	    $(".bmimg").append("<img class='bbbmimg' src='/upload/"+data.teamPhoto+"'>")
    		$(".bttl").append('<h3>'+data.teamname+'</h3>')
    		$(".bid").append('<p>'+data.id+'</p>')
    	    $(".bemail").append('<p>'+data.email+'</p>')
            $(".bnik").append('<p>'+data.nickname+'</p>')
            $(".bteam").append('<p>'+data.teamname+'</p>')
            $(".bgenre").append('<p>'+data.teamgenre+'</p>')
            $(".bcity").append('<p>'+data.city+'</p>')
            $(".btel").append('<p>'+data.tel+'</p>')
            $(".binst").append('<p>'+data.instrument+'</p>')
            $(".bmemo").append("<p>"+data.teamInfo+"</p>")
    	}
    })
    
})




function openCity(cityName) {
var i;
var x = document.getElementsByClassName("tab");
for (i = 0; i < x.length; i++) {
x[i].style.display = "none"; 
}
document.getElementById(cityName).style.display = "contents"; 
}
/* 
$('#btt1').click(function(){
console.log(this.value)
 alert("fff") 
});*/


/*  $('#btt1').click(function(){

$("#message-text").append($("#memo").val());

}  */

$('.btt').click(function(){
	nik =$(this).val();

//$("#message-text").append(memo); 
	$(".cl").empty();
	$('.cl').append("<h1 class='nikval' value="+nik+">"+nik+"님의 메모수정:</h1>"); 
	

}) 

$('.gg').click(function(){
    
     var texta = $(".texta").val();
     var nik = $(".nikval").attr("value");
        console.log(texta);
     var values = {nik : nik,
    		      memo : texta}
    
     $.ajax({
    	 type : "POST",
    	    url : "update",
    	    dateType : "json",
    	    data :values, 
    	   
    	    success : function(data){
    	    // alert("변경했뜸")
    	    	window.location.href=window.location.href;
    	    }           
  
    	
    });
})











function check(){
var data1= $('.date1').val();
var data2 =$('.date2').val();
var flag = $('.flag').val();
var text = $('.text').val();
console.log(data1);
console.log(data2);
console.log(flag);
console.log(text);
var values={
          "cdt1":data1,
          "cdt2":data2,
          "flag":flag,
          "text":text
          }

$.ajax({
    type : "POST",
    url : "dateselect",
    dataType: 'json',
    data : values,
    success : function(data){
            alert("받아와찌롱");
            //console.log(data)
         $("#testappend1").empty();
         $("#testappend2").empty();
         $("#testappend3").empty();
         $("#testappend4").empty();
         $("#testappend").empty();
         
         $.each(data,function(index,item){
            console.log('--------------')
            console.log(item.id);
            console.log(item.nik);
            console.log(item.email);
            
            $("#testappend").append('<tr><td>'+item.id+'</td>'
                    +'<td>'+item.nik+'</td>'
                    +'<td>'+item.email+'</td>'
                    +'<td>'+item.flag+'</td>'
                    +'<td>'+item.ncdt+'</td>'
                    +'<td>'+item.memo+'</td>'
                    +'<td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon"></span>메모수정</button></p></td>'
                    +'<td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon"></span>상세보기</button></p></td>'
                    +'<td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon"></span>정지</button></p></td></tr>'
                    );
            
            if(item.flag==1){
            	$("#testappend1").append('<tr><td>'+item.id+'</td>'
                    +'<td>'+item.nik+'</td>'
                    +'<td>'+item.email+'</td>'
                    +'<td>'+item.flag+'</td>'
                    +'<td>'+item.ncdt+'</td>'
                    +'<td>'+item.memo+'</td>'
                    +'<td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon"></span>메모수정</button></p></td>'
                    +'<td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon"></span>상세보기</button></p></td>'
                    +'<td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon"></span>정지</button></p></td></tr>'
                    );
            }else if(item.flag==2){
            	$("#testappend2").append('<tr><td>'+item.id+'</td>'
                        +'<td>'+item.nik+'</td>'
                        +'<td>'+item.email+'</td>'
                        +'<td>'+item.flag+'</td>'
                        +'<td>'+item.ncdt+'</td>'
                        +'<td>'+item.memo+'</td>'
                        +'<td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon"></span>메모수정</button></p></td>'
                        +'<td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon"></span>상세보기</button></p></td>'
                        +'<td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon"></span>정지</button></p></td></tr>'
                        );
            }else if(item.flag==3){
                $("#testappend3").append('<tr><td>'+item.id+'</td>'
                        +'<td>'+item.nik+'</td>'
                        +'<td>'+item.email+'</td>'
                        +'<td>'+item.flag+'</td>'
                        +'<td>'+item.ncdt+'</td>'
                        +'<td>'+item.memo+'</td>'
                        +'<td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon"></span>메모수정</button></p></td>'
                        +'<td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon"></span>상세보기</button></p></td>'
                        +'<td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon"></span>정지</button></p></td></tr>'
                        );
            }else if(item.flag==4){
                $("#testappend4").append('<tr><td>'+item.id+'</td>'
                        +'<td>'+item.nik+'</td>'
                        +'<td>'+item.email+'</td>'
                        +'<td>'+item.flag+'</td>'
                        +'<td>'+item.ncdt+'</td>'
                        +'<td>'+item.memo+'</td>'
                        +'<td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon"></span>메모수정</button></p></td>'
                        +'<td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon"></span>상세보기</button></p></td>'
                        +'<td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon"></span>정지</button></p></td></tr>'
                        );
            }
           
       
        /*   if(item.memo==null){
                $("#testappend1").append('<tr><td>'+item.id+'</td>'
                +'<td>'+item.nik+'</td>'
                +'<td>'+item.email+'</td>'
                +'<td>'+item.flag+'</td>'
                +'<td>'+item.ncdt+'</td>'
                +'<td>'+" "+'</td>'
                +'<td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon"></span>메모수정</button></p></td>'
                +'<td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon"></span>상세보기</button></p></td>'
                +'<td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon"></span>정지</button></p></td></tr>'
                );
            }else{
                $("#testappend1").append('<tr><td>'+item.id+'</td>'
                        +'<td>'+item.nik+'</td>'
                        +'<td>'+item.email+'</td>'
                        +'<td>'+item.flag+'</td>'
                        +'<td>'+item.ncdt+'</td>'
                        +'<td>'+item.memo+'</td>'
                        +'<td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon"></span>메모수정</button></p></td>'
                        +'<td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon"></span>상세보기</button></p></td>'
                        +'<td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon"></span>정지</button></p></td></tr>'
                );
                
            }  */
        }); 
    },
    error : function(request, status, error) {
        alert("에러가 발생했습니다. 관리자에게 문의하시기 바랍니다");
    }
    
});

}

$('#myCarousel').carousel({
    interval: 5000
});


$('#carousel-text').html($('#slide-content-0').html());

//Handles the carousel thumbnails
$('[id^=carousel-selector-]').click( function(){
    var id = this.id.substr(this.id.lastIndexOf("-") + 1);
    var id = parseInt(id);
    $('#myCarousel').carousel(id);
});


// When the carousel slides, auto update the text
$('#myCarousel').on('slid.bs.carousel', function (e) {
         var id = $('.item.active').data('slide-number');
        $('#carousel-text').html($('#slide-content-'+id).html());
});
	   
	 
   

</script>
</body>
</html>