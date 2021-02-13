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
 	
	<title>글 상세보기</title>
	
	<!-- link -->
  	<link href="dist/css/styles.css" rel="stylesheet" /> 
	<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
	  

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
function deleteBoard(str){
	var yn = confirm("정말 삭제합니까");
	if(yn){
		frm.action="boardDelete.do?row="+str;
		frm.submit();
	}
}
function updateBoard(str){
	frm.action = "boardUpdateForm.do?row="+str;
	frm.submit();
}



</script>

</head>

<body class="sb-nav-fixed">
 
 <jsp:include page="../main/menu.jsp"></jsp:include> 
 <div id="layoutSidenav">
 
            
            <!-- 내용 -->
            <div id="layoutSidenav_content">
               <main><br /><br /><br />              
            	<div class="container-fluid">

					
             		<div class="card mb-4">
                       <div class="card-header">
	                      <i class="fas fa-table mr-1"></i>
                                글 상세보기
                        </div>
                        <!-- card body -->
						<div class="card-body">
                           <div class="table-responsive">
					          <form id="frm" name="frm" action="boardUpdateForm2.do?row=${vo.boardNumber }" method="post">
								<input type="hidden" name="boardWriter" value="${memberId }">
								<input type="hidden" name="boardValue2" value="${vo.boardValue }">
								 <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
									 <!-- <tr>
										<th>작성자</th>
										<td><input style="border:none" type="text" name="boardTitle" size="150" /></td>
									</tr> --> 
									<tr>
										<th>게시글 번호</th>
										<td><input style="border:none" type="text" name="boardNumber" size="50" value="${vo.boardNumber }" /></td>
									</tr>
									<tr>
										<th>작성자</th>
										<td><input style="border:none" type="text" name="boardWriter" size="50" value="${vo.boardWriter }" /></td>
									</tr>
									<tr>
										<th>제목</th>
										<td><input style="border:none" type="text" name="boardTitle" size="120" value="${vo.boardTitle }" /></td>
									</tr>
									<tr>
										<td id="title">내용</td>
										<td><textarea style="border:none" name="boardContent" rows="3" cols="120">${vo.boardContent }</textarea></td>
									</tr>
									<tr>
										<th>작성일</th>
										<td><input style="border:none" type="text" name="boardDate" size="50" value="${vo.boardDate }" /></td>
									</tr>
									<tr>
										<th>조회수</th>
										<td><input style="border:none" type="text" name="boardHit" size="50" value="${vo.boardHit }" /></td>
									</tr>
								
					
									<!-- <tr>
										<td id="title">파일첨부</td>
										<td><input type="file" name="boardFile" /></td>
									</tr> -->
					
									<tr align="center" valign="middle">
										
										<c:if test="${vo.boardValue eq 'notice' }">
										<td colspan="5">
										<c:if test="${memberId == vo.boardWriter }">
										<input type="submit" value="수정화면">
										</c:if>
										 <input type="button" onclick="location.href = 'showBoardTest.do'" value="목록">
										 </td>
										</c:if>
										<c:if test="${vo.boardValue eq 'questions' }">
										<td colspan="5">
										<c:if test="${memberId == vo.boardWriter }">
										<input type="submit" value="수정화면">
										<button type="button" onclick="deleteBoard('${vo.boardNumber}')">삭제</button>
										</c:if>
										 <input type="button" onclick="location.href = 'showBoardTest2.do'" value="목록">
										 </td>
										</c:if>
										
										
										
										 
										
										<!-- <input type="reset" value="작성취소"> --> 
										
										
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