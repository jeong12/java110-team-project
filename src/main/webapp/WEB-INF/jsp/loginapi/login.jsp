<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>로그인 api</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
</head>
<body>
<a id="kakao-login-btn"></a>
<a href="http://developers.kakao.com/logout"></a><!-- 로그아웃 -->
<fb:login-button scope="public_profile,email" onlogin="checkLoginState();"></fb:login-button>
<div id="naverIdLogin"></div>
        
<script type='text/javascript'>
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('6ef049e1fe28bd096b9163cf1aac8cf6');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
          Kakao.API.request({
              url:'/v1/user/me',
              success: function(res){
                  console.log("res: "+JSON.stringify(res));
                  console.log("authObj: "+JSON.stringify(authObj));
                  //console.log("res.id: "+res.id);
                  //console.log("nickname: "+res.properties.nickname); 
              }
          })
      },
      fail: function(err) {
         alert(JSON.stringify(err)+"kakao 로그인 실패");
      }
    });
    
    function getUserInfo(accessToken) {
        FB.api('/me?fields=id,name,email', function(response) {
            console.log(JSON.stringify(response));
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
                loginButton: {color: "green", type: 3, height: 60}, /* 로그인 버튼의 타입을 지정 */
                // callback 페이지가 분리되었을 경우 그 페이지에서 callback 처리해줄지 여부 설정
                //callbackHandle: false
            }
        );
        
        /* 설정정보를 초기화하고 연동을 준비 */
        naverLogin.init();
        
        naverLogin.getLoginStatus(function (status) {
            if (status) {
                var email = naverLogin.user.getEmail();
                var name = naverLogin.user.getNickName();
                var profileImage = naverLogin.user.getProfileImage();
                var birthday = naverLogin.user.getBirthday();
                var uniqId = naverLogin.user.getId();
                var age = naverLogin.user.getAge();
                
                console.log(email, name, profileImage, birthday, uniqId, age);
            } else {
                console.log("AccessToken이 올바르지 않습니다.");
            }
        });

</script>
</body>
</html>