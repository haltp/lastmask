<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Freelancer - Start Bootstrap Theme</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        
        <!-- script -->
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>  <!-- 우편번호 api -->
		<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script> <!-- 우편번호 api -->
		<script type="text/javascript">
			function formCheck() {
				if (frm.memberPassword.value != frm.memberPassword1.value) {
					alert("패스워드가 일치하지 않습니다.");
					frm.memberPassword1.value = null;
					frm.memberPassword1.focus();
					return false;
				}
				return true;
			}
			
			function idCheck(str) {
				var url = "idCheck.do?memberId=" + str;
				if (str == "") {
					alert("아이디를 입력하세요.");
					frm.memberId.focus();
				} else {
					window.open(url, "아이디 중복확인",
							"width=600, height=200, top=100, left=100");
				}
			}
			function openZipSearch() {
				new daum.Postcode({
					oncomplete : function(data) {
						$('[name=memberZipcode]').val(data.zonecode); // 우편번호 (5자리)
						$('[name=memberAddress]').val(data.address);
					}
				}).open();
			}
		</script>
       
    </head>
    <body id="page-top">
        <!-- Navigation-->
       <jsp:include page="../main/menu.jsp"></jsp:include> 
        
        <section class="page-section" id="contact">
            <div class="container">
      
                <!-- Contact Section Heading-->
                <!-- 수정 -->
                <br>
                <br>
                <br>
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">Sign Up</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Contact Section Form-->
                <div class="row">
                    <div class="col-lg-8 mx-auto">
                        <!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19.-->
                        <form id="frm" name="frm" onsubmit="return formCheck()" action="join.do" method="post" novalidate="novalidate">
                        	<div class="control-group">
                        	<div class="form-row">
                                <div class="form-group floating-label-form-group controls col-md-10 mb-0">
                                    <label>Id</label>
                                    <input class="form-control" id="memberId" name="memberId" type="text" placeholder="Id"  data-validation-required-message="Please enter your Id." required />
                                    <p class="help-block text-danger"></p>
                                    </div>
                                <div class="form-group col-md-2">
                                <button class="btn btn-primary btn-l" id="Id Check" type="button" onclick="idCheck(memberId.value)" style="float: right">Id Check</button>
                                </div>
                			   </div>        
                            </div>
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                    <label>Password</label>
                                    <input class="form-control" id="memberPassword" name="memberPassword" type="password" 
                                    placeholder="password" required="required" data-validation-required-message="Please enter your password." />
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                        	<div class="control-group">
                                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                    <label>Password Check</label>
                                    <input class="form-control" id="memberPassword1" name="memberPassword1" type="password" 
                                    placeholder="password check" required="required" data-validation-required-message="Please enter your name." />
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                    <label>Name</label>
                                    <input class="form-control" id="memberName" name="memberName" type="text" 
                                    placeholder="Name" required="required" data-validation-required-message="Please enter your name." />
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                    <label>Phone Number</label>
                                    <input class="form-control" id="memberPhone" name="memberPhone" type="tel" 
                                    placeholder="Phone Number" required="required" data-validation-required-message="Please enter your phone number." />
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                             <div class="control-group">
                                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                    <label>우편번호</label>
                                    <input class="form-control" id="memberZipcode" name="memberZipcode" type="text" 
                                    onclick="openZipSearch()" placeholder="우편번호" required="required" data-validation-required-message="Please enter your 우편번호." />
                                    <p class="help-block text-danger"></p>
                                </div>
                               
                            </div>
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                    <label>주소</label>
                                    <input class="form-control" id="memberAddress" name="memberAddress"  type="text" 
                                    placeholder="Address" required="required" data-validation-required-message="Please enter your Address." />
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                    <label>Email Address</label>
                                    <input class="form-control" id="memberEmail" name="memberEmail" type="email" 
                                    placeholder="Email Address" required="required" data-validation-required-message="Please enter your email address." />
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                          	<!-- 삽입 -->
                          	<br>
                          	<br>
							<select class="form-control form-control-lg" name="memberAuth">
 							<option id="memberAuth" value="USER">USER</option>
 							<option id="memberAuth" value="SELLER">SELLER</option>
							</select>
                    

                            <!-- 삽입끝 -->
                        
                            <br />
                            <br />
                            <!-- <div id="success"> </div>-->
                            <div></div>
                            <div class="form-group"><button class="btn btn-primary btn-xl" id="sendMessageButton" type="submit" >Sign Up</button></div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <!-- Footer-->
        
        <!-- Footer-->
  		<jsp:include page="../main/footer.jsp"></jsp:include>
        <!-- Copyright Section-->
        <jsp:include page="../main/copyright.jsp"></jsp:include>
        <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes)-->
        <jsp:include page="../main/scroll.jsp"></jsp:include>
        
        
        <!-- Bootstrap core JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <!-- Contact form JS-->
        <script src="assets/mail/jqBootstrapValidation.js"></script>
        <script src="assets/mail/contact_me.js"></script> 
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
