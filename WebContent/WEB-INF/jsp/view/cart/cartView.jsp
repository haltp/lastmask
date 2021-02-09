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
        <title>Dashboard - SB Admin</title>
        <link href="dist/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
<title>Insert title here</title>




<!-- jsp -->
<jsp:include page="../main/menu.jsp"></jsp:include>


<style type="text/css">
	input{
		border: none;
	}
</style>
<script type="text/javascript">
	function buyProduct(str) {
		frm.cartProduct.value = str;
		frm.action = "bootPay.do";
		frm.submit();
	}
	function DeleteProduct(str) {
		frm.cartNumber.value = str;
		frm.action = "cartDelete.do";
		frm.submit();
	}
</script>   
</head>
<body class="sb-nav-fixed">

            
            <div id="layoutSidenav_content">
                <main>
            <div class="container-fluid">
            <br>
             <br>
             <br>
             <br>
             <br>
             <br>
             <br>
             <div class="card mb-4">
             
             
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                DataTable Example
                            </div>
	<div class="card-body">
                                <div class="table-responsive">
                                <form action="" id="frm" name="frm" method="post">
			<input type="hidden" name="cartProduct" id="cartProduct">
			<input type="hidden" name="cartNumber" id="cartNumber">
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<tr>
						<th>장바구니 번호</th>
						<th>구 매 자</th>
						<th>상품 번호</th>
						<th>상 품 명</th>
						<th>상품 가격</th>
						<th>구매 수량</th>
						<th>판 매 자</th>
						<th>구 매</th>
						<th>삭 제</th>
					</tr>
					<c:if test="${empty cartList }">
						<tr align="center">
							<th colspan="9">장바구니에 등록된 상품이 없습니다.</th>
						</tr>
					</c:if>
					<c:if test="${not empty cartList }">
						<c:forEach var="vo" items="${cartList }">
							<tr>
								<td>${vo.cartNumber }</td>
								<td>${vo.cartUser }</td>
								<td>${vo.cartProduct }</td>
								<td>${vo.productName }</td>
								<td>${vo.productPrice }</td>
								<td>${vo.cartSelect }</td>
								<td>${vo.productSeller }</td>
								<td><button type="button" onclick="buyProduct(${vo.cartProduct})">구 매</button></td>
								<td>
									<button type="button" onclick="DeleteProduct(${vo.cartNumber})">삭 제</button>
									<input type="hidden" name="cartUser" id="cartUser" value=${vo.cartUser }>
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</form><br/>
		</div>
		</div>
	</div>
	</div>
	</main>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="dist/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="dist/assets/demo/chart-area-demo.js"></script>
        <script src="dist/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="dist/assets/demo/datatables-demo.js"></script>
</body>
</html>