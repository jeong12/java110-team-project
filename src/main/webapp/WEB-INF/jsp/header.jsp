<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="https://d19m59y37dris4.cloudfront.net/universal/2-0-1/vendor/font-awesome/css/font-awesome.min.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
.top-bar {
    background: black;
    color: #fff;
    font-size: 0.9rem;
    padding: 10px 0;
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

.top-bar a.login-btn i, .top-bar a.signup-btn i {
    margin-right: 10px;
}

.top-bar ul.social-custom a:hover {
    background: #4fbfa8;
    color: #fff;
}
        
        .top-bar div.flex-md-fill a{
            
            color: #fff;
            font-size: 20px;
            text-decoration: none;
            line-height: 26px;
            text-align: center;
            font-weight: 900;
        }
.top-bar ul.social-custom a {
    text-decoration: none !important;
    font-size: 0.7rem;
    width: 26px;
    height: 26px;
    line-height: 26px;
    color: #999;
    text-align: center;
    border-radius: 50%;
    margin: 0;
}
a:focus, a:hover {
    color: #348e7b;
    text-decoration: underline;
}
.top-bar a.login-btn, .top-bar a.signup-btn {
    color: #eee;
    text-transform: uppercase;
    letter-spacing: 0.1em;
    text-decoration: none !important;
    font-size: 0.75rem;
    font-weight: 700;
    margin-right: 10px;
}
        .top-bar .container img {
            height: 40px; width: auto;
        }
        #underline{
            border-bottom: 1px solid white;
            margin-top: 10px;
        }
    </style>
</head>
<body>


<div class="top-bar">
        <div class="container">
          <div class="row d-flex align-items-center">
            <div class="col-md-5 d-md-block d-none">
            <img src="../img/logos.JPG" alt="logos">
            <img src="../img/Indiesker.JPG" alt="indie">
            </div>
            <div class="col-md-7">
              <div class="d-flex justify-content-md-end justify-content-between">
                <!--<ul class="list-inline contact-info d-block d-md-none">
                  <li class="list-inline-item"><a href="#"><i class="fa fa-phone"></i></a></li>
                  <li class="list-inline-item"><a href="#"><i class="fa fa-envelope"></i></a></li>
                </ul>-->
                <div class="login"><a href="#" data-toggle="modal" data-target="#login-modal" class="login-btn"><i class="fa fa-sign-in"></i><span class="d-none d-md-inline-block">Sign In</span></a><a href="customer-register.html" class="signup-btn"><i class="fa fa-user"></i><span class="d-none d-md-inline-block">Sign Up</span></a></div>
                <!--<ul class="social-custom list-inline">
                  <li class="list-inline-item"><a href="#"><i class="fa fa-facebook"></i></a></li>
                  <li class="list-inline-item"><a href="#"><i class="fa fa-google-plus"></i></a></li>
                  <li class="list-inline-item"><a href="#"><i class="fa fa-twitter"></i></a></li>
                  <li class="list-inline-item"><a href="#"><i class="fa fa-envelope"></i></a></li>
                </ul>-->
              </div>
            </div>
          </div>
        </div>
        <p id ="underline"></p>
        <div class="container">
            <div class="row">
               <div class="col-md-12">
                   <div class="d-flex bd-highlight">
                      <div class="flex-md-fill bd-highlight"><a href="#">버스커 일정</a></div>
                        <div class="flex-md-fill bd-highlight"><a href="#">버스커 위치</a></div>
                        <div class="flex-md-fill bd-highlight"><a href="#">버스커 목록</a></div>
                        <div class="flex-md-fill bd-highlight"><a href="#">공연장 현황</a></div>
                        <div class="flex-md-fill bd-highlight"><a href="#">버스킹 홍보</a></div>
                   </div>
               </div>
            </div>
        </div>
      </div>
</body>
</html>