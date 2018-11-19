<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>로그인</title>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<style>

    #test{position: relative; top: 200px;}
</style>
</head>
<body>
<div class="container">
    <div class="row" id="test">
        <div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Indiesker</h3>
                </div>
                <div class="panel-body">
                    <form accept-charset="UTF-8" role="form" action="login" method="post">
                    <fieldset>
                        <div class="form-group">
                            <input class="form-control" placeholder="ID" name="id" type="text" value='${cookie.id.value}'>
                        </div>
                        <div class="form-group">
                            <input class="form-control" placeholder="Password" name="password" type="password" value="">
                        </div>
                        <div class="checkbox">
                            <label>
                                <input name="save" type="checkbox"> 아이디 저장
                            </label>
                        </div>
                        <input class="btn btn-lg btn-success btn-block" type="submit" value="로그인">
                    </fieldset>
                    </form>
                      <hr/>
                    <center><h5>다른 계정으로 간편 로그인</h5>
                    <a id="custom-login-brn" href="javascript:loginWithKakao()">
                        <img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" alt="kakao" width="231px" height="50px">
                    </a>
                    
                        <div class="fb-login-button" data-width="231" data-size="medium"
                         data-button-type="login_with" data-show-faces="false"
                          data-auto-logout-link="false" data-use-continue-as="false"
                          onlogin="checkLoginState()"></div>
<!--                        <div id="fb-root"></div>-->
                        
                    <div id="naverIdLogin"></div></center>
                </div>
            </div>
        </div>
    </div>
</div>
<a href="http://developers.kakao.com/logout"></a><!-- 로그아웃 -->
<script type='text/javascript'>
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('6ef049e1fe28bd096b9163cf1aac8cf6');
    // 카카오 로그인 버튼을 생성합니다.
    function loginWithKakao(){
        Kakao.Auth.login({
            success: function(authObj) {
            Kakao.API.request({
              url:'/v1/user/me',
              success: function(res){
                  /* console.log("res: "+JSON.stringify(res));
                  console.log("res: "+res);
                  console.log("authObj: "+JSON.stringify(authObj)); */
                  console.log("res.id: "+JSON.stringify(res.properties));
                  var json = {};
                  json.id = res.id;
                  json.nickname = res.properties.nickname;
                  json.phot = res.properties.thumbnail_image;
                  jsonData(json);
              }
          })
      },
      fail: function(err) {
         alert(JSON.stringify(err)+"kakao 로그인 실패");
      }
    });
    }
    
    
    function getUserInfo(accessToken) {
        FB.api('/me?fields=id,name,email', function(response) {
            console.log(JSON.stringify(response));
            var json = {};
            json.id = response.id;
            json.nickname = response.name;
            json.email = response.email;
            jsonData(json);
        });
    }
      
    function checkLoginState() {
        FB.getLoginStatus(function(response) { 
            if (response.status === 'connected') { 
                getUserInfo(response.authResponse.accessToken);
            
            } else { 
                alert("facebook 로그인 실패");
            }
        });
    }

    window.fbAsyncInit = function() {
      console.log("window.fbAsyncInit() 호출됨!");
      FB.init({
        appId      : '2216454095044841', 
        cookie     : true,  
        xfbml      : true,  
        version    : 'v3.2' 
      });
      FB.AppEvents.logPageView();
    };

    (function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) return;
      js = d.createElement(s); js.id = id;
      js.src = "https://connect.facebook.net/en_US/sdk.js";
      fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
    
    var naverLogin = new naver.LoginWithNaverId(
            {
                clientId: "i7CWhQxEhKTYcem_vHnQ",
                callbackUrl: "http://localhost:8080/app/loginapi/callback",
                isPopup: false, /* 팝업을 통한 연동처리 여부 */
                loginButton: {color: "green", type: 3, height: 50}, /* 로그인 버튼의 타입을 지정 */
                // callback 페이지가 분리되었을 경우 그 페이지에서 callback 처리해줄지 여부 설정
                callbackHandle: false
            }
        );
        
        /* 설정정보를 초기화하고 연동을 준비 */
        naverLogin.init();
        
        function jsonData(json){
            $.ajax("http://localhost:8080/app/loginapi/form",{
                method: 'POST',
                headers: {
                    'Content-Type' : 'application/json'
                },
                data: JSON.stringify(json)
                ,
                success: function(result){
                    console.log(result);
                    location.href = "http://localhost:8080/app/editprofile/member/form"; 
                },
                error: function(xhr, status, msg){
                    console.log(status);
                    console.log(msg);
                    location.herf = "http://localhost:8080/app/loginapi/form"
                }
            });
        }

</script>
</body>
</html>