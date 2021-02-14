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
	
<title>장바구니</title>

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
<div id="layoutSidenav">
<div id="layoutSidenav_content">
<div class="container-fluid">
<div style="width:1280px; margin:0 auto;">
<br /><br /><br /> <br /><br /><br />
<div class="cateTit_v2 join">
<div class="cateTit_v2 title">
	<em class="title"><h1>구매내역</h1></em>
</div>


</div>
<main>

	<div class="table-responsive">
			<form action="" id="frm" name="frm" method="post">
			<input type="hidden" name="cartProduct" id="cartProduct">
			<input type="hidden" name="cartNumber" id="cartNumber">
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				<br /><br /><br /><br />
				<thead>
					<tr>
						<th>판매 번호</th>
						<th>상품 번호</th>
						<th>상 품 명</th>
						<th>상품 가격</th>
						<th>구매 갯수</th>						
						<th>판 매 자</th>
						<th>구 매 일</th>
					</tr>
					</thead>
					<tbody>
					<c:if test="${empty buyList}">
						<tr><td colspan="7" align="center">구매 내역이 없습니다.</td></tr>
					</c:if>
					<c:if test="${not empty buyList}">
						<c:forEach var="vo" items="${buyList }">
							<tr>
								<td>${vo.sellNumber }</td>
								<td>${vo.sellProductNumber }</td>
								<td>${vo.productName }</td>
								<td>${vo.productPrice }</td>
								<td>${vo.sellQunt }</td>
								<td>${vo.productSeller }</td>
								<td>${vo.sellDate }</td>
							</tr> 
						</c:forEach>
					</c:if>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	</main>
	
	<br /><br /><br /><br />
	</div>
	</div>
	</div>
	
	
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