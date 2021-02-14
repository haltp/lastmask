<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Kakao JavaScript SDK</title>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('6acd454d1f45a89b54474cecd8cb2b8b');

        // SDK 초기화 여부를 판단합니다.
        console.log(Kakao.isInitialized());
        
        function loginFormWithKakao() {
            Kakao.Auth.loginForm({
              success: function(authObj) {
            	  Kakao.API.request({
                      url: '/v2/user/me',
                      success: function(res) {
                    	  var userId = res.id;
                    	  var userGener = res.gender;
                    	  console.log("userGener", userGener);
                    	  
                        alert(JSON.stringify(res))
                      },
                      fail: function(error) {
                        alert(
                          'login success, but failed to request user information: ' +
                            JSON.stringify(error)
                        )
                      },
                    })
            	  
            	  
                showResult(JSON.stringify(authObj))
              },
              fail: function(err) {
                showResult(JSON.stringify(err))
              },
            })
            
            
            
          }
          function showResult(result) {
            document.getElementById('reauthenticate-popup-result').innerText = result
          }
        
         
        
        
        
        function kakaoLogout() {
            if (!Kakao.Auth.getAccessToken()) {
              alert('Not logged in.')
              return
            }
            Kakao.Auth.logout(function() {
              alert('logout ok\naccess token -> ' + Kakao.Auth.getAccessToken())
            })
          }
    </script>
</head>
<body>


<a id="reauthenticate-popup-btn" href="javascript:loginFormWithKakao()">
  <img
    src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
    width="222"
  />
</a>
<p id="reauthenticate-popup-result"></p>

<a id="kakao-login-btn"></a>

<button class="api-btn" onclick="kakaoLogout()">로그아웃</button>

</body>
</html>