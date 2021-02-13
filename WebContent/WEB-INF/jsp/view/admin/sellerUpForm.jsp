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
 	
	<title>거래처정보 수정</title>
	
	<!-- link -->
  	<link href="dist/css/styles.css" rel="stylesheet" /> 
	<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
	  
	<!-- script -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
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
 
 <jsp:include page="../admin/adminMenu.jsp"></jsp:include> 
 <div id="layoutSidenav">
 <jsp:include page="../admin/adminMenuLeft.jsp"></jsp:include> 
            
            <!-- 내용 -->
            <div id="layoutSidenav_content">
               <main><br /><br /><br />              
            	<div class="container-fluid">

					
             		<div class="card mb-4">
                       <div class="card-header">
	                      <i class="fas fa-table mr-1"></i>
                                회원정보 수정
                        </div>
                        <!-- card body -->
						<div class="card-body">
                           <div class="table-responsive">
					          <form id="frm" name="frm" action="sellerUpdate.do?memberId=${vo.memberId }" method="post">
								 <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
									 <!-- <tr>
										<th>작성자</th>
										<td><input style="border:none" type="text" name="boardTitle" size="150" /></td>
									</tr> -->
											<tr>
												<th>회원 아이디</th>
												<td ><input style="border:none" type="text" size="130" placeholder="${vo.memberId }" /></td>
											</tr>
											<tr>
												<th>회원 이름</th>
												<td><input style="border:none" type="text" id="memberName" name="memberName" size="130" placeholder="${vo.memberName }"></td>
											</tr>
											<tr>
												<th>전화 번호</th>
												<td><input style="border:none" type="text" id="memberPhone" name="memberPhone" size="130" placeholder="${vo.memberPhone }"></td>
											</tr>
											<tr>
												<th>우편번호</th>
												<td><input style="border:none" type="text" id="memberZipcode" name="memberZipcode" size="50" placeholder="${vo.memberZipcode }">
													<button type="button" onclick="openZipSearch()">우편번호 검색</button></td>
											</tr>
											<tr>
												<th>주소</th>
												<td><input style="border:none" type="text" id="memberAddress" name="memberAddress" size="130" placeholder="${vo.memberAddress }"></td>
											</tr>
											<tr>
												<th>이메일</th>
												<td><input style="border:none" type="text" id="memberEmail" name="memberEmail" size="130" placeholder="${vo.memberEmail }"></td>
											</tr>
											<tr>
												<th>권한</th>
												<td>${vo.memberAuth }</td>
											</tr> 

											<tr align="center" valign="middle">
												<td colspan="5"><input type="submit" value="수정"> 
												<input type="reset" value="리셋"> 
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