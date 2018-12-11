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
    <link rel="stylesheet" href="/css/indiesker.css"/>
    <!-- <link rel="stylesheet" href="https://d19m59y37dris4.cloudfront.net/universal/2-0-1/vendor/font-awesome/css/font-awesome.min.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="/js/filter.js"></script>
    
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

.top-bar div.flex-md-fill_c a {
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

.top-bar .container_c img {
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
    position: absolute; left:16rem; top:2.6rem; max-height: 0;
    transition: max-height 0.1s ease; overflow: hidden; z-index:1000;
}

.icon-bar {
    width: 11rem;
    background-color: #000;
}

.icon-bar a {
    display: block; padding: 11px; margin-left: 1.4rem;
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
        <div class="container_c">
          <div class="d-flex_c align-items-center_c">
            <div class="col-md-5_c d-md-block_c">
            <a href="/app/main" style="text-decoration: none;">
            <img src="/img/logos.JPG" alt="logos">
            <img src="/img/Indiesker.JPG" alt="indie"></a>
            </div>
            <div class="col-md-7_c">
              <div class="d-flex_c justify-content-md-end_c justify-content-between_c">
                <div class="login">
                <a href="/app/auth/form" class="login-btn">
                <i class="fas fa-sign-in-alt"></i>
                <span class="d-md-inline-block_c">Sign In</span>
                </a><a href="/app/signup/member/form" class="signup-btn">
                <i class="fas fa-user" style="margin-right:0.5rem;"></i><span class="d-md-inline-block_c">Sign Up</span>
                </a></div>
                <div class="prof" style="display:none;">
                <a href="/app/editprofile/prosel" class="pro-btn">
                <img alt="profile" src="/img/anonymous.png" id="pro_img">
                <span class="d-md-inline-block_c">${sessionScope.loginUser.nickname}</span>
                </a>
                </div>
                <div class="logout" style="display:none">
                <span class="accordion"><i class="fas fa-chevron-circle-down fa-2x"></i></span>
                  <div class="tab">
                      <div class="icon-bar">
                          <a href="/app/follower/followList?no=${sessionScope.loginUser.no}"><i class="fas fa-bookmark"></i>
                          <span class="d-md-inline-block_c">Follow 리스트</span></a>
                          <!-- 일반회원일 경우 -->
                          <a href="/app/editprofile/member/form" class="myinfo" id="edit_icon"><i class="fas fa-info-circle"></i>
                          <span class=" d-md-inline-block_c">내 정보수정</span></a>
                          <!--버스커일 경우-->
                          <div id="busk_icon" style="display:none">
                          <a href="/app/mybs/main?no=${sessionScope.loginUser.no}"><i class="fa fa-globe"></i>
                          <span class=" d-md-inline-block_c">내 의뢰현황</span></a>
                          <a href="/app/buskerfeed/enter?no=${sessionScope.loginUser.no}"><i class="fas fa-drum"></i>
                          <span class=" d-md-inline-block_c">나의 피드</span></a>
                          </div>
                          <!--제공자일 경우--> 
                          <div id="sup_icon" style="display:none">
                          <a href="/app/myss/main"><i class="fa fa-globe"></i>
                          <span class=" d-md-inline-block_c">내 무대 관리하기</span></a>
                          </div>
                          <a href="/app/membermanager/list" id="user_manager" style="display:none;">
                          <i class="fas fa-users"></i>
                          <span class="d-md-inline-block_c">회원 관리하기</span></a>  
                          <a href="/app/auth/logout" class="logout-btn">
                          <i class="fas fa-sign-out-alt"></i>
                          <span class="d-md-inline-block_c">Sign Out</span></a>
                      </div>
                  </div>
                
                </div>
              </div>
            </div>
          </div>
        </div>
        <p id ="underline"></p>
        <div class="container_c">
            <div class="row_c">
               <div class="col-md-12_c">
                   <div class="d-flex_c">
                      <div class="flex-md-fill_c "><a href="/app/schedule/list">버스커 일정</a></div>
                        <div class="flex-md-fill_c"><a href="/app/map/main">버스커 위치</a></div>
                        <div class="flex-md-fill_c "><a href="/app/totalfeed/nonmembers">버스커 목록</a></div>
                        <div class="flex-md-fill_c "><a href="/app/stage/list">공연장 현황</a></div>
                        <div class="flex-md-fill_c "><a href="/app/promotion/list">버스킹 홍보</a></div>
                   </div>
               </div>
            </div>
        </div>
      </div>
      </div>

        <div id="memPro" style="display:none">${sessionScope.loginUser.photo}</div>
        <div id="memId" style="display:none">${sessionScope.loginUser.no}</div>
        <div id="busPro" style="display:none">${sessionScope.loginBusker.teamPhoto}</div>
        <div id="busker" style="display:none">${sessionScope.loginBusker.teamname}</div>
        <div id="sup" style="display:none">${sessionScope.loginSupporter.name}</div>
        
        
        <script src="/js/headerfixing.js"></script> 
  <script>
    /* accordion & icon-bar */
    
      var acc = document.getElementsByClassName("accordion");
      acc[0].addEventListener("click", function(e) {

          var panel = this.nextElementSibling;
          if (panel.style.maxHeight) {
              panel.style.maxHeight = null;
          } else {
              panel.style.maxHeight = panel.scrollHeight + "px";
          }
          
          $(document).click(function(e) {
              if (e.target.parentNode != acc[0]) {
                  if(panel.style.maxHeight){
                      panel.style.maxHeight = null;
                  }
              }
          }); 

      });
    </script>
</body>
</html>