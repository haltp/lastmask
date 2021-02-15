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
 	
	<title>답변</title>
	
	<!-- link -->
  	<link href="dist/css/styles.css" rel="stylesheet" /> 
	<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
	  



</head>

<body class="sb-nav-fixed">
 
 <jsp:include page="../product/productMenu.jsp"></jsp:include> 
 <div id="layoutSidenav">
 <jsp:include page="../product/productMenuLeft.jsp"></jsp:include> 
            
            <!-- 내용 -->
            <div id="layoutSidenav_content">
               <main><br /><br /><br />              
            	<div class="container-fluid">

					
             		<div class="card mb-4">
                       <div class="card-header">
	                      <i class="fas fa-table mr-1"></i>
                                공지사항 수정
                        </div>
                        <!-- card body -->
						<div class="card-body">
                           <div class="table-responsive">
					          <form id="frm" name="frm" action="reply.do?row=${vo.boardNumber }" method="post">
								<input type="hidden" name="boardWriter" value="${memberId }">
								<input type="hidden" name="boardValue" value="${vo.boardValue }">
								
								 <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
									 <!-- <tr>
										<th>작성자</th>
										<td><input style="border:none" type="text" name="boardTitle" size="150" /></td>
									</tr> --> 
									
									<tr align="center">
										<td id="title">답변</td>
										<td><textarea style="border:none" name="reply" rows="10" cols="150" ></textarea></td>
									</tr>
									
									<!-- <tr>
										<td id="title">파일첨부</td>
										<td><input type="file" name="boardFile" /></td>
									</tr> -->
					
									<tr align="center" valign="middle">
										<td colspan="5"><input type="submit" value="수정"> 
										<input type="reset" value="작성취소"> 
										<!-- <input type="button" onclick="location.href = 'boardListForm.do'" value="목록"> -->
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