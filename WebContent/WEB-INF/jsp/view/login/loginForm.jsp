<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Page Title - SB Admin</title>
        <link href="css/styles.css" rel="stylesheet" />
       
        <!-- script -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
       
       
    </head>
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Login</h3></div>
                                    <div class="card-body">
                                    <!-- 수정 -->
                                        <form id="frm" name="frm" action="login.do" method="post">
                                            <div class="form-group">
                                                <label class="small mb-1" for="inputId">ID</label>
                                                <input class="form-control py-4" id="inputEmailAddress" name="memberId" type="text" placeholder="Enter ID" />
                                            </div>
                                            <div class="form-group">
                                                <label class="small mb-1" for="inputPassword">Password</label>
                                                <input class="form-control py-4" id="inputPassword" name="memberPassword" type="password" placeholder="Enter password" />
                                            </div>
                                            
                                            <div class="form-group d-flex align-items-center justify-content-between mt-2 mb-0">
                                                <a class="small" href="passwordForgotForm.do">Forgot Password?</a>
                                                <a class="small" href="main.do">Want go Home?</a>
                                                <button class="btn btn-primary" type="submit">Login</button>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center">
                                        <div class="small"><a href="joinForm.do">Need an account? Sign up!</a></div>
                                    </div>
                                </div>
                                 <!-- <button class="btn btn-primary" id="kakaol" onclick="location.href='kakaotest.do'">kakao</button> -->
                                <!--  <button class="btn btn-primary" id="kakaol" onclick="Kakao.Auth.logout()">logout</button> -->
                            </div>
                          
                        </div>
                    </div>
                </main>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
