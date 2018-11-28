<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="http://localhost:8080/js/filter.js"></script>
<style>
.top-bar {
    background: black; color: #fff; font-size: 0.9rem; padding: 10px 0;
}

div.fix {
    position: fixed; top: 0; width: 100%; z-index: 9999;
}

.top-bar .contact-info {
    margin-right: 20px;
}

.top-bar ul {
    margin-bottom: 0;
}

.top-bar .contact-info a {
    font-size: 0.8rem;
}

.top-bar ul.social-custom {
    margin-left: 20px;
}

.top-bar ul {
    margin-bottom: 0;
}

.top-bar a.login-btn i, .top-bar a.signup-btn i .logout-btn i {
    margin-right: 10px;
}

.top-bar ul.social-custom a:hover {
    background: #4fbfa8; color: #fff;
}

.top-bar div.flex-md-fill a {
    color: #fff; font-size: 20px; text-decoration: none; line-height: 26px;
    text-align: center; font-weight: 900;
}

.top-bar ul.social-custom a {
    text-decoration: none !important; font-size: 0.7rem; width: 26px;
    height: 26px; line-height: 26px; color: #999; text-align: center;
    border-radius: 50%; margin: 0;
}

a:focus, a:hover {
    color: #348e7b; text-decoration: underline;
}

.top-bar a.login-btn, .top-bar a.signup-btn, .top-bar a.logout-btn,
    .top-bar a.pro-btn {
    color: #eee; text-transform: uppercase; letter-spacing: 0.1em;
    text-decoration: none !important; font-size: 0.75rem;
    font-weight: 700; margin-right: 10px;
}

.top-bar .container img {
    height: 40px; width: auto;
}

#underline {
    border-bottom: 1px solid white; margin-top: 10px;
}

#pro_img {
    height: 40px; width: 40px; border-radius: 20px;
}

/*accordion & icon-bar*/
.accordion {
    color: #eee; cursor: pointer; padding: 18px; width: 100%;
    text-align: left; border: none; outline: none; transition: 0.4s;
}

.tab {
    position: absolute; left:21rem; top:2.6rem; max-height: 0;
    transition: max-height 0.1s ease; overflow: hidden; z-index:1000;
}

.icon-bar {
    width: 11rem;
    background-color: #000;
}

.icon-bar a {
    display: block; text-align: center; padding: 11px;
    transition: all 0.5s ease; color: white; font-size: 17px;
    font-weight: 800; text-decoration-line: none;
}

.icon-bar a i {
    margin-right: .5rem;
}

.icon-bar a:hover {
    background-color: #50bcdf;
}
</style>
</head>
<body>

<div id=headerfix>
<div class="top-bar">
        <div class="container">
          <div class="row d-flex align-items-center">
            <div class="col-md-5 d-md-block d-none">
            <a href="http://localhost:8080/app/main" style="text-decoration: none;">
            <img src="http://localhost:8080/img/logos.JPG" alt="logos">
            <img src="http://localhost:8080/img/Indiesker.JPG" alt="indie"></a>
            </div>
            <div class="col-md-7">
              <div class="d-flex justify-content-md-end justify-content-between">
                <div class="login">
                <a href="http://localhost:8080/app/auth/form" class="login-btn">
                <i class="fas fa-sign-in-alt"></i>
                <span class="d-none d-md-inline-block">Sign In</span>
                </a><a href="http://localhost:8080/app/signup/member/form" class="signup-btn">
                <i class="fas fa-user" style="margin-right:0.5rem;"></i><span class="d-none d-md-inline-block">Sign Up</span>
                </a></div>
                <div class="prof" style="display:none;">
                <a href="#" class="pro-btn">
                <img alt="profile" src="http://localhost:8080/img/anonymous.png" id="pro_img">
                <span class="d-none d-md-inline-block">${sessionScope.loginUser.nickname}</span>
                </a>
                </div>
                <div class="logout" style="display:none">
                <span class="accordion"><i class="fas fa-chevron-circle-down fa-2x"></i></span>
                  <div class="tab">
                      <div class="icon-bar">
                          <a href="#"><i class="fas fa-chevron-circle-down"></i>
                          <span class="d-none d-md-inline-block">Follow 리스트</span></a>
                          <a href="http://localhost:8080//app/auth/logout" class="logout-btn">
                          <i class="fas fa-sign-out-alt"></i>
                          <span class="d-none d-md-inline-block">Sign Out</span></a>
                          <a href="#"><i class="fa fa-envelope"></i>
                          <span class="d-none d-md-inline-block">내 정보수정</span></a>
                          <a href="#"><i class="fa fa-globe"></i>
                          <span class="d-none d-md-inline-block">내 의뢰현황</span></a> <!--버스커일 경우-->
                          <span class="d-none d-md-inline-block">제공자뭐할까</span></a> <!--제공자일 경우--> 
                      </div>
                  </div>
                
                </div>
              </div>
            </div>
          </div>
        </div>
        <div id="memPro" style="display:none">${sessionScope.loginUser.photo}</div>
        <div id="memId" style="display:none">${sessionScope.loginUser.no}</div>
        <p id ="underline"></p>
        <div class="container">
            <div class="row">
               <div class="col-md-12">
                   <div class="d-flex bd-highlight">
                      <div class="flex-md-fill bd-highlight"><a href="http://localhost:8080/app/schedule/main">버스커 일정</a></div>
                        <div class="flex-md-fill bd-highlight"><a href="#">버스커 위치</a></div>
                        <div class="flex-md-fill bd-highlight"><a href="http://localhost:8080/app/buskerlist/list">버스커 목록</a></div>
                        <div class="flex-md-fill bd-highlight"><a href="http://localhost:8080/app/stage/list">공연장 현황</a></div>
                        <div class="flex-md-fill bd-highlight"><a href="http://localhost:8080/app/promotion/list">버스킹 홍보</a></div>
                   </div>
               </div>
            </div>
        </div>
      </div>
      </div>
      
<script>
    /* accordion & icon-bar */
    var acc = document.getElementsByClassName("accordion");
    var i;

    for (i = 0; i < acc.length; i++) {
        acc[i].addEventListener("click", function() {

            var panel = this.nextElementSibling;
            if (panel.style.maxHeight) {
                panel.style.maxHeight = null;
            } else {
                panel.style.maxHeight = panel.scrollHeight + "px";
            }
        });
    }
</script>
</body>
</html>