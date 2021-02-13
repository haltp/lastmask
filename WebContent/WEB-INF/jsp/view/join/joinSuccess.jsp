<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" /> 
	
<title>회원가입 성공</title>

<!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->

	<!-- link -->
	<link href="css/styles.css" rel="stylesheet" />
  	<!-- <link href="dist/css/styles.css" rel="stylesheet" />  -->
	<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
	  
	<!-- script -->
 	 <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>


</head>
<body class="sb-nav-fixed">

 <!-- Navigation-->
<jsp:include page="../main/menu.jsp"></jsp:include> 
<br/><br/><br/><br/><br/><br/><br/>
<div align="center">
	<h3>${vo.memberName } 님의 회원가입을 축하합니다.</h3>
	<h3>${vo.memberAuth } 권한을 갖습니다.</h3>
	<button type="button" onclick="location.href='loginForm.do'">로그인 창</button>
</div>
<br/><br/><br/><br/><br/><br/><br/>
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