<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<script type="text/javascript" src="<c:url value="../../js/fullcal/lib/moment.min"/>"></script>
<script type="text/javascript" src="<c:url value="../../js/fullcal/fullcalendar.js"/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="../../js/fullcal/fullcalendar.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="../../js/fullcal/fullcalendar.min.css"/>">
<link rel="stylesheet" media="print" type="text/css" href="<c:url value="../../js/fullcal/fullcalendar.min.css"/>">


<script>
    $(document).ready(function() {
        
        $('#calendar').fullCalendar({
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,basicWeek,basicDay'
            },
            defaultDate: '2016-05-12',
            editable: true,
            eventLimit: true, // allow "more" link when too many events
            events: [
                {
                    title: 'All Day Event',
                    start: '2016-05-01'
                },
                {
                    title: 'Long Event',
                    start: '2016-05-07',
                    end: '2016-05-10'
                },
                {
                    id: 999,
                    title: 'Repeating Event',
                    start: '2016-05-09T16:00:00'
                },
                {
                    id: 999,
                    title: 'Repeating Event',
                    start: '2016-05-16T16:00:00'
                },
                {
                    title: 'Conference',
                    start: '2016-05-11',
                    end: '2016-05-13'
                },
                {
                    title: 'Meeting',
                    start: '2016-05-12T10:30:00',
                    end: '2016-05-12T12:30:00'
                },
                {
                    title: 'Lunch',
                    start: '2016-05-12T12:00:00'
                },
                {
                    title: 'Meeting',
                    start: '2016-05-12T14:30:00'
                },
                {
                    title: 'Happy Hour',
                    start: '2016-05-12T17:30:00'
                },
                {
                    title: 'Dinner',
                    start: '2016-05-12T20:00:00'
                },
                {
                    title: 'Birthday Party',
                    start: '2016-05-13T07:00:00'
                },
                {
                    title: 'Click for Google',
                    url: 'http://google.com/',
                    start: '2016-05-28'
                }
            ]
        });
        
    });

</script>
<style>

    body {
        margin: 40px 10px;
        padding: 0;
        font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
        font-size: 14px;
    }

    #calendar {
        max-width: 900px;
        margin: 0 auto;
    }

</style>
</head>
<body>

    <div id='calendar'></div>
    
    <div id="titl">
        <img id="logo" src="../../img/playButton.PNG" alt="플레이로고">
        <h2>버스킹 일정</h2>
    </div>

    <div id="calender"></div>

    <table>
        <thead>
            <tr>
                <th>상호명</th>
                <th>지역</th>
                <th>공연시간</th>
                <th>신청인원</th>
                <th>진행상태</th>
                <th>작성일</th>
                <th>위도</th>
                <th>경도</th>
                <th>상세보기</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${plist}" var="perlist">
                <tr>
                    <td>${perlist.shopname}</td>
                    <td>${perlist.addr}</td>
                    <td>${perlist.nsdt}~ ${perlist.nedt}</td>
                    <td>${perlist.cnt}</td>
                    <td>개인스케줄</td>
                    <td>${perlist.cdt}</td>
                    <td>${perlist.x}</td>
                    <td>${perlist.y}</td>
                    <td><button>상세보기</button></td>
                </tr>
            </c:forEach>
            <c:forEach items="${list}" var="list">
                <tr>
                    <td>${list.name}</td>
                    <td>${list.addr}</td>
                    <td>${list.nsdt}~ ${list.nedt}</td>
                    <td>${list.cnt}</td>
                    <td><c:if test="${list.flag >= 2}">완료</c:if></td>
                    <td>${list.cdt}</td>
                    <td>${list.x}</td>
                    <td>${list.y}</td>
                    <td><button>상세보기</button></td>
                </tr>
            </c:forEach>

        </tbody>
    </table>

</body>
</html>
