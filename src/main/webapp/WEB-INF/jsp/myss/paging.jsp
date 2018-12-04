<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="paginate">
    <a href="javascript:goPage(${param.firstPageNo})" class="first">처음 페이지</a>
    <a href="javascript:goPage(${param.prevPageNo})" class="prev">이전 페이지</a>
    <span>
        <c:forEach var="i" begin="${param.startPageNo}" end="${param.endPageNo}" step="1">
            <c:choose>
                <c:when test="${i eq param.pageNo}">
                <a href="javascript:goPage(${i})" class="choice">${i}</a>
                </c:when>
                <c:otherwise><a href="javascript:goPage(${i})">${i}</a></c:otherwise>
            </c:choose>
        </c:forEach>
    </span>
    <a href="javascript:goPage(${param.nextPageNo})" class="next">다음 페이지</a>
    <a href="javascript:goPage(${param.finalPageNo})" class="last">마지막 페이지</a>
</div>

			
<script>
function goPage(pageNo) {
	console.log(pageNo);
var type = 	$('#pageform input[name="type"]').val();
console.log(type);
var page = $('#pageform input[name="pageNo"]').val(pageNo);
	   $.ajax({ 
	        type : "POST", 
	        url : "page", 
	        dataType: 'json',
	        data : {"pageNo" : page, "type" : type},
	        success : function(data){
	           alert("success!");
	        },
	            error : function(request, status, error) {
	                alert("에러가 발생했습니다. 관리자에게 문의하시기 바랍니다");
	            }});
	
    
    
}
</script>
