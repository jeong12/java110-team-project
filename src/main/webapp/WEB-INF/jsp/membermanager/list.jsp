<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>관리자</title>
</head>
<body>

<table>
<thead>
<tr>
    <th>아이디</th><th>닉네임</th><th>이메일</th> <th>등급</th><th>가입일</th><th>메모</th>
</tr>
</thead>
<tbody id="testappend">
<c:forEach  items="${list}" var="m">
<tr>
    <td>${m.id}</td>
    <td>${m.nik}</td>
    <td>${m.email}</td>
    <td>${m.flag}</td>
    <td>${m.cdt}</td>
    <td>${m.memo}</td>
</tr>

</c:forEach>

<button type='button' onclick='location.href = "list"'>전체보기</button>
<button type='button' onclick='location.href = "select?flag=1"'>일반</button>
<button type='button' onclick='location.href = "select?flag=2"'>버스커</button>
<button type='button' onclick='location.href = "select?flag=3"'>제공자</button>
<button type='button' onclick='location.href = "select?flag=4"'>정지</button>
</tbody>
</table>



           <input type="date" class="date1" id="start">
           <input type="date" class="date2" id="end">
           <select name="st" class="flag">
               <option value='0'>기간</option>
               <option value='1'>일</option>
               <option value='2'>닉네임</option> 
               <option value='3'>이메일</option>
           </select>
        <input type="text" class="text">
        <button type="button" onclick="check()">클릭</button>
        
       <h3 class=err></h3>
<script>
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
         $("#testappend").empty();
         
         $.each(data,function(index,item){
            console.log('--------------')
            console.log(item.id);
            console.log(item.nik);
            console.log(item.email);
            if(item.memo==null){
                $("#testappend").append('<tr><td>'+item.id+'</td>'
                +'<td>'+item.nik+'</td>'
                +'<td>'+item.email+'</td>'
                +'<td>'+item.flag+'</td>'
                +'<td>'+item.ncdt+'</td>'
                +'<td>'+" "+'</td></tr>');
            }else{
                $("#testappend").append('<tr><td>'+item.id+'</td>'
                        +'<td>'+item.nik+'</td>'
                        +'<td>'+item.email+'</td>'
                        +'<td>'+item.flag+'</td>'
                        +'<td>'+item.ncdt+'</td>'
                        +'<td>'+item.memo+'</td></tr>');
                
            }
        }); 
    },
    error : function(request, status, error) {
        alert("에러가 발생했습니다. 관리자에게 문의하시기 바랍니다");
    }
    
});
}
</script>
</body>
</html>