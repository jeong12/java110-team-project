<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>버스커 리스트</title>
<link rel='stylesheet' href='/css/common.css'> <!-- 웹 브라우저 입장에서의 경로 -->
<style>
    #container{
        width: 900px;
        height: 550px;
        border: 1px solid black;
    }
    #pro{
        width: 50px;
        border-radius: 100px;
    }  
    .content{
        border: 1px solid black;
        width: 600px;
        height: 100px;
    }
    .info td{
        border: 1px solid black;
    }
    #avi,#imgtb{ 
        float: left;
    }
    #comment{
        float: right;
        
    }
    #comment td{
        border: 1px solid black;
        width: 290px;
        height: 100px;
    }
    #id{
        padding: 30px;
    }
</style>
</head>
<body>
    <div>
        <h1>${avi.title }</h1>
    </div>
    <div id="container">
        <div id="avi">
        <div style="position:relative;height:0;padding-bottom: 380px">
        <iframe src="${avi.url }" 
            style="position:absolute;left:0" width="600" height="360" 
            frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div>
        <div>
            <table id="imgtb">
                <tr><td><img id="pro" src="${avi.teamPhoto }" alt="image"></td></tr>
            </table>
            <table class="info">
                <tr><td>${avi.teamname }</td><td>${avi.teamgenre }</td><td>${avi.city }</td></tr>
            </table>
        </div>
        <div>
           <table class="content">
                <tr><td>${avi.content }</td></tr>
                <tr><td>${avi.avilikecount }</td></tr>
            </table>
        </div>
    </div>
    <div id="comment">
        <table>
            <tbody>
                <tr><td>댓글1</td></tr>
                <tr><td>댓글2</td></tr>
                <tr><td>댓글3</td></tr>
                <tr><td>댓글4</td></tr>
                <tr><td>댓글5</td></tr>
            </tbody>
        </table>
    </div>
    </div>
    
</body>
</html>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    