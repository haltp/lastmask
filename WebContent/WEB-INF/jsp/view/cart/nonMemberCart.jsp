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
	<script type="text/javascript">
		function buyProduct(str) {
			frm.productNum.value = str;
			frm.action = "nonMemberBootPay.do";
			frm.submit();
		}
		function DeleteProduct(str) {
			frm.productNum.value = str;
			frm.action = "cartDelete.do";
			frm.submit();
		}
	</script>

<style type="text/css">
	input{
		border: none;
	}
</style>

</head>
<body class="sb-nav-fixed">

 <!-- Navigation-->
<jsp:include page="../main/menu.jsp"></jsp:include> 
<div id="layoutSidenav">
<div id="layoutSidenav_content">
<div class="container-fluid">
<main><br /><br /><br />  

	<div class="table-responsive">
			<form action="" id="frm" name="frm" method="post">
			<input type="hidden" name="productNum" id="productNum">
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				<br /><br /><br /><br />
				<thead>
					<tr>
						<th>상품 번호</th>
						<th>상 품 명</th>
						<th>가 격</th>
						<th>구매 수량</th>
						<th>판 매 자</th>
						<th>구 매</th>
						<th>삭 제</th>
					</tr>
					</thead>
					<tbody>
					<c:if test="${empty NonMemberList }">
						<tr align="center" >
							<th colspan="7">장바구니에 등록된 상품이 없습니다.</th>
						</tr>
					</c:if>
					<c:if test="${not empty NonMemberList }">
						<c:forEach var="vo" items="${NonMemberList }">
							<tr>
								<td>${vo.productNum }</td>
								<td>${vo.productName }</td>
								<td>${vo.productPrice }</td>
								<td>구매수량수정</td>
								<td>${vo.productSeller }</td>
								<td><button type="button" onclick="buyProduct(${vo.productNum})">구 매</button></td>
								<td>
									<button type="button" onclick="DeleteProduct(${vo.productNum})">삭 제</button>
								</td>
							</tr>
						</c:forEach>
					</c:if>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	<br /><br /><br /><br />
	
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
        
        
        <!-- script -->
	<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="dist/js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="dist/assets/demo/chart-area-demo.js"></script>
    <script src="dist/assets/demo/chart-bar-demo.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
    <script src="dist/assets/demo/datatables-demo.js"></script>  
	 -->
</body>
</html>