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
 	
	<title>상품관리</title>
	
	<!-- link -->
  	<link href="dist/css/styles.css" rel="stylesheet" /> 
	<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
	  
	<!-- script -->
 	 <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
	<script>
		function updateproduct(str) {
			 var form = document.frm; 
				 form.action="toUpdateProduct.do?row="+str;
				 form.submit();	
				 }
		
		function PdDelete(str){
			let deletee = confirm("정말 삭제하시겠습니까?");
			if(deletee){
				location.href="deleteExec.do?row="+str;
			}
			else{
				alert("삭제 하였습니다.");
			}
		}

		
		/* function productInsert() {
			 var form = document.frm;
			 var name = form.productName;
			 var qt = form.productQunt;
			 var price = form.productPrice;
			 var seller = form.ProductSeller;
			 
			
			  form.submit();
		 } */
		 
		 function file_open() {
			 window.open('productImageUploadForm.do', 'upload', 'width=300 height=200 left=300 top=30');
			 
		 }
		 
	</script>
</head>

<body class="sb-nav-fixed">
 
 <jsp:include page="productMenu.jsp"></jsp:include> 
 <div id="layoutSidenav">
 <jsp:include page="productMenuLeft.jsp"></jsp:include> 
            
            <!-- 내용 -->
            <div id="layoutSidenav_content">
               <main><br /><br /><br />              
            	<div class="container-fluid">
            	             		<div class="card mb-4">
                       <div class="card-header">
	                      <i class="fas fa-table mr-1"></i>
                                상품목록
                        </div>
                        <!-- card body -->
						<div class="card-body">
                           <div class="table-responsive">
                              <form id="frm" name="frm" method="post">
                                 <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
									<thead>
										<tr align="center" style="background-color: silver">
											<th width="70" >상품번호</th>
										    <th width="100">상품이름</th> 
										    <th width="70">수량</th>
										    <th width="70">판매가격</th>
										    <th width="70">판매자</th>
										    <th width="70">수정</th>
										    <th width="70">삭제</th>
										</tr>
									 </thead>
				 					 <tbody>
										<c:forEach var="vo" items="${list }">
											<tr align="center">
												<td width="70">${vo.productNum}</td>
											    <td width="70">${vo.productName}</td>
											    <td width="70">${vo.productQunt}</td>
											    <td width="70">${vo.productPrice}</td>
											    <td width="70">${vo.productSeller}</td>
											    <td ><button type="button" onclick="updateproduct('${vo.productNum}')">수정</button></td>
												<td ><button type="button" onclick="PdDelete('${vo.productNum}')" >삭  제</button>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</form><br/>
						 </div>
						</div>
						<!-- card body 끝 -->
					</div>
					<!-- 공지목록 card 끝 -->
					
             		<div class="card mb-4">
                       <div class="card-header">
	                      <i class="fas fa-table mr-1"></i>
                                상품등록
                        </div>
                        <!-- card body -->
						<div class="card-body">
                           <div class="table-responsive">
					          <form id="frm1" name="frm1" action="insertExec.do" method="post">
								<%-- <input type="hidden" name="boardWriter" value="${memberId }"> --%>
								 <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
									 <tr align="center">
										<th>상품이름</th>
										<td><input style="border:none" type="text"  id="productName" name="productName" size="130" required></td>
									</tr> 
									<tr align="center">
										<th>수량</th>
										<td><input style="border:none" type="text" id="productQunt" name="productQunt" size="130" required></td>
									</tr>
									<tr align="center">
										<th>가격</th>
										<td><input style="border:none" type="text" id="productPrice" name="productPrice" size="130" /></td>
									</tr>	
									<tr align="center">
										<th>판매자</th>
										<td><input style="border:none" type="text" id="ProductSeller" name="ProductSeller" size="130" value='${memberId }' readonly></td>
									</tr>
									<tr align="center">
										<th>사진첨부</th>
										<td><input style="border:none" type="text" id="image" name="image" onclick="file_open()" size="130" /></td>
									</tr>
				
									<tr align="center" valign="middle">
										<td colspan="5"><input type="submit" value="등록"> 
										<input type="reset" value="작성취소"> 
										
										</td>
									</tr>
								</table>
							</form>
						 </div>
						</div>
						<!-- card body 끝 -->
					</div>
					<!-- 공지등록 card 끝 -->
					
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