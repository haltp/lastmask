<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Dashboard - SB Admin</title>
<link href="dist/css/styles.css" rel="stylesheet" />
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js"
	crossorigin="anonymous"></script>
<title>Insert title here</title>


<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 우편번호 api -->
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<!-- 우편번호 api -->
<script type="text/javascript">
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
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<a class="navbar-brand" href="/MaskTest/index.jsp">Mask</a>
		<!-- 수정 -->
		<button class="btn btn-link btn-sm order-1 order-lg-0"
			id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="Search for..."
					aria-label="Search" aria-describedby="basic-addon2" />
				<div class="input-group-append">
					<button class="btn btn-primary" type="button">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ml-auto ml-md-0">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="userDropdown" href="#"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="userDropdown">
					<a class="dropdown-item" href="#">Settings</a> <a
						class="dropdown-item" href="#">Activity Log</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="logout.do">Logout</a>
				</div></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">Interface</div>
						<a class="nav-link" href="adminUserForm.do">회원관리</a> <a
							class="nav-link" href="adminSellerForm.do">거래처관리</a>
					</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid">
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table mr-1"></i> DataTable Example
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<div align="center">
									<h1>${vo.memberId }.USER 회원 수정</h1>
								</div>
								<div align="center">
									<form id="frm" name="frm" action="userUpdate.do?memberId=${vo.memberId }" method="post">
										<table border="1">
											<tr>
												<th>회원 아이디</th>
												<td align="center">${vo.memberId }</td>
											</tr>
											<tr>
												<th>회원 이름</th>
												<td align="center"><input type="text" id="memberName"
													name="memberName" value="${vo.memberName }"></td>
											</tr>
											<tr>
												<th>전화 번호</th>
												<td align="center"><input type="text" id="memberPhone"
													name="memberPhone" value="${vo.memberPhone }"></td>
											</tr>
											<tr>
												<th>우편번호</th>
												<td align="center"><input type="text"
													id="memberZipcode" name="memberZipcode"
													value="${vo.memberZipcode }">
													<button type="button" onclick="openZipSearch()">우편번호
														검색</button></td>
											</tr>
											<tr>
												<th>주소</th>
												<td align="center"><input type="text"
													id="memberAddress" name="memberAddress"
													value="${vo.memberAddress }"></td>
											</tr>
											<tr>
												<th>이메일</th>
												<td align="center"><input type="text" id="memberEmail"
													name="memberEmail" value="${vo.memberEmail }"></td>
											</tr>
											<tr>
												<th>권한</th>
												<td align="center">${vo.memberAuth }</td>
											</tr>
										</table>
										<br />
										<button type="submit">수정</button>
										&nbsp;&nbsp;
										<button type="reset">취소</button>
										&nbsp;&nbsp;
										<button type="button"
											onclick="location.href='adminUserForm.do'">목록</button>
									</form>
								</div>
							</div>
							<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
								crossorigin="anonymous"></script>
							<script
								src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
								crossorigin="anonymous"></script>
							<script src="dist/js/scripts.js"></script>
							<script
								src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
								crossorigin="anonymous"></script>
							<script src="dist/assets/demo/chart-area-demo.js"></script>
							<script src="dist/assets/demo/chart-bar-demo.js"></script>
							<script
								src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
								crossorigin="anonymous"></script>
							<script
								src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
								crossorigin="anonymous"></script>
							<script src="dist/assets/demo/datatables-demo.js"></script>
</body>
</html>