<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
<title>게시글 등록하기</title>
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
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" type="text/javascript"></script>
 	 <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
	<script type="text/javascript">


$(function () {

	   $.ajax({
	     url: '/MaskTest/getProductServletTest',
	     type: 'get',
	     dataType: 'json',
	     success: showContents,
	     error: showErrors
	   });

	 })

	 function showErrors(result) {
	   console.log(result)
	  
	 }

	 function showContents(result) { // [{},{},{}]

	   //console.log(result)

	   let list = result;
	   for (val of list) {
		   
		   
			let opt = $('<option />').attr('id','memberAuth').attr('value',val.productSeller).html(val.productName);
			
			$('.sominSelect').append(opt);
			
	   }
	 }
	 


</script>


</head>
<body>
<jsp:include page="../main/menu.jsp" />
	<div id="wrap" align="center">
	<br>
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
                                문의사항 등록
                        </div>
                        <!-- card body -->
						<div class="card-body">
                           <div class="table-responsive">
					          <form id="boardForm" name="boardForm" action="boardWirte.do" method="post">
								<input type="hidden" name="boardWriter" value="${memberId }">
								<input type="hidden" name="boardValue" value="questions">
								 <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
									 <tr align="center">
										<th>작성자</th>
										<td><input style="border:none" type="text"  id="boardWriter" name="boardWriter" size="130" value="${memberId }" readonly></td>
									</tr> 
									<tr align="center">
										<th>제목</th>
										<td><input style="border:none" type="text" id="boardTitle" name="boardTitle" size="150" required></td>
									</tr>
									<tr align="center">
										<th>내용</th>
										<td><textarea style="border:none" id="boardContent" name="boardContent" rows="10" cols="150" ></textarea></td>
									</tr>
									
									<tr align="center">
										<th>선택</th>
										<td><select class="form-control form-control-lg sominSelect" name="boardSelect"></select></td>
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