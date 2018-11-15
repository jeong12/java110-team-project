<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link
    href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    rel="stylesheet" id="bootstrap-css">
<script
    src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
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
</style>
</head>
<body>
    <div id="titl">
        <h2><img id="logo" src="../../img/playButton.PNG" alt="플레이로고">Follow 리스트</h2>
    </div>

    <div>
        <table border="1" class="outertable"><!-- 리스트출력-->
            <th>테이블</th>
            <th>만들기</th>
            <th>만들기</th>
            <tr><!--첫번째줄-->
                <td><table class="innertable"><th>사진</th><tr>팀명</tr></table></td>
                <td><table class="innertable"><th>사진</th><tr>팀명</tr></table></td>
                <td><table class="innertable"><th>사진</th><tr>팀명</tr></table></td>
            </tr>
            <tr><!--두번째줄-->
                <td><table class="innertable"><th>사진</th><tr>팀명</tr></table></td>
                <td><table class="innertable"><th>사진</th><tr>팀명</tr></table></td>
                <td><table class="innertable"><th>사진</th><tr>팀명</tr></table></td>
            </tr>
            <tr><!--세번째줄-->
                <td><table class="innertable"><th>사진</th><tr>팀명</tr></table></td>
                <td><table class="innertable"><th>사진</th><tr>팀명</tr></table></td>
                <td><table class="innertable"><th>사진</th><tr>팀명</tr></table></td>
            </tr>
            <tr> <!-- 페이지네이션 -->
                <div>
                    <c:if test="${pagination.curRange ne 1 }">
                        <a href="#" onClick="fn_paging(1)">[처음]</a> 
                    </c:if>
                    <c:if test="${pagination.curPage ne 1}">
                        <a href="#" onClick="fn_paging('${pagination.prevPage }')">[이전]</a> 
                    </c:if>
                    <c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
                        <c:choose>
                            <c:when test="${pageNum eq  pagination.curPage}">
                                <span style="font-weight: bold;"><a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a></span> 
                            </c:when>
                            <c:otherwise>
                                <a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a> 
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
                        <a href="#" onClick="fn_paging('${pagination.nextPage }')">[다음]</a> 
                    </c:if>
                    <c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
                        <a href="#" onClick="fn_paging('${pagination.pageCnt }')">[끝]</a> 
                    </c:if>
                </div>
                
                <div>
                    총 게시글 수 : ${pagination.listCnt } /    총 페이지 수 : ${pagination.pageCnt } / 현재 페이지 : ${pagination.curPage } / 현재 블럭 : ${pagination.curRange } / 총 블럭 수 : ${pagination.rangeCnt }
                </div>
            </tr>
        </table>

        <table><!--우측 자세히 보기-->
            <th>사진</th>
            <tr><td>팀명</td><td>내용</td></tr>
            <tr><td>주요장르</td><td>내용</td></tr>
            <tr><td>주요활동도시</td><td>내용</td></tr>
            <tr><td>소개말</td><td>내용</td></tr>
            <tr><td><button>피드가기</button></td></tr>
        </table>
    </div>
</body>
</html>