<%@ page
    language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" href="http://localhost:8080/css/indiesker.css"/>
<!-- <link
    href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
    rel="stylesheet"
    id="bootstrap-css"
>
<script
    src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
></script> -->
<script
    src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"
></script>

<style>
/*기본색*/
:root {
    -main-color: #000000;
    -accent-color: #BF6A7A;
    -dark-color: #2B5566;
    -text-bright-color: #fff;
    -icon-color: #fff;
    -icon-bk-color: lightslategray;
    -gray-color: #ddd;
    -middle-width: 800px;
}
/* 기본 설정: 폰트 크기 */
@media ( max-width :599px) {
    :root {
        font-size: 16px;
    }
}

@media ( min-width :600) and (max-width:799px) {
    :root {
        font-size: 18px;
    }
}

@media ( min-width :800px) {
    :root {
        font-size: 20px;
    }
}

#loginbysns a:hover {
    background-color: rgba(0, 0, 0, 0.2);
}
/*푸터*/
footer {
    color: #fff;
    color: var(-text-bright-color);
    background-color: #000000;
    background-color: var(-main-color);
}

footer .container_c {
    padding-top: 10px;
}

/* @media ( min-width : 768px) {
    footer .container_c {
        display: flex;
        flex-wrap: wrap;
        /*        max-width: 1000px;*/
        max-width: var(-large-width);
        margin-left: auto;
        margin-right: auto;
    }
    .footB {
        flex: 0 0 60%;
    }
} */

.footB {
    margin-bottom: 10px;
    padding-left: 250px;
}

.footB ul {
    margin: 0;
    padding: 0;
    width: 650px;
}

.footB ul li {
    list-style-type: none;
    display: inline-block;
}

.footB a {
    margin-right: 7px;
    color: inherit;
    font-size: 15px;
    text-decoration: none;
}

.footB a:hover {
    background-color: rgba(255, 255, 255, 0.3);
}

@media ( max-width : 768px ) {
    .footB {
        display: flex;
    }
    .footB {
        margin-bottom: 10px;
        padding-left: 50px;
    }
    .footB ul {
        width: 90%;
    }
    
    .footB a {
    margin-right: 7px;
    color: inherit;
    font-size: 11px;
    text-decoration: none;
}
}


</style>
</head>
<body>

    <footer>
        <div class="container_c">
            <div class="footB">
                <ul>
                    <li><a href="#">이용약관</a></li>
                    <li><a href="#">개인정보처리방침</a></li>
                    <li><a href="#">운영정책</a></li>
                    <li><a href="#">회사소개</a></li>
                    <li><a href="#">인디스커 정책</a></li>
                    <li><a href="#">고객센터</a></li>
                    <li id="Copy">Copyright &copy; INDIESKER Corp</li>
                </ul>
            </div>
        </div>
    </footer>
</body>
</html>