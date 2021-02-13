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
 	
	<title>회원관리</title>
	
	<!-- link -->
  	<link href="dist/css/styles.css" rel="stylesheet" /> 
	<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
	  
	<!-- script -->
 	 <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
	<script type="text/javascript"> 
 		function updateUser(str){
			frm.action = "userUpForm.do?row="+str;
			frm.submit();
		}
		function deleteUser(str){
			var yn = confirm("정말 삭제하시겠습니까?");
			if (yn) {
				frm.action = "userDelete.do?row="+str;
				frm.submit();
			}
		}
	</script>  


</head>

<body class="sb-nav-fixed">
 
 <jsp:include page="adminMenu.jsp"></jsp:include> 
 <div id="layoutSidenav">
 <jsp:include page="adminMenuLeft.jsp"></jsp:include> 
            
            <!-- 내용 -->
            <div id="layoutSidenav_content">
               <main><br /><br /><br />              
            	<div class="container-fluid">
             		<div class="card mb-4">
                       <div class="card-header">
	                      <i class="fas fa-table mr-1"></i>
                                회원목록
                        </div>
                        <!-- card body -->
						<div class="card-body">
                           <div class="table-responsive">
                              <form id="frm" name="frm" method="post">
                                 <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
									<thead>
										<tr align="center" style="background-color: silver">
											<th width="100">회원 아이디</th>
											<th width="100">회원명</th>
											<th width="200">전화번호</th>
											<!-- <th width="100">우편번호</th>
											<th width="300">주소</th> -->
											<th width="200">이메일</th>
											<th width="100">권한</th>
											<th width="100">수정</th>
											<th width="100">삭제</th>
										</tr>
									 </thead>
				 					 <tbody>
										<c:forEach var="vo" items="${list }">
											<tr align="center">
												<td>${vo.memberId }</td>
												<td >${vo.memberName }</td>
												<td >${vo.memberPhone }</td>
												<%-- <td >${vo.memberZipcode }</td>
												<td >${vo.memberAddress }</td> --%>
												<td >${vo.memberEmail }</td>
												<td >${vo.memberAuth }</td>
												<td ><button type="button" onclick="updateUser('${vo.memberId}')">수정</button></td>
												<td ><button type="submit" onclick="deleteUser('${vo.memberId}')">삭제</button></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</form><br/>
						 </div>
						</div>
						<!-- card body 끝 -->
					</div>
					<!-- card 끝 -->
				</div>
				<!-- container 끝 -->
			</main>
		</div>
		<!-- 내용 끝 -->
	</div>
	
	<!-- script -->
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