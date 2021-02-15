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
 	
	<title>공지사항 관리</title>
	
	<!-- link -->
  	<link href="dist/css/styles.css" rel="stylesheet" /> 
	<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
	  
	<!-- script -->
 	 <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
	<script type="text/javascript"> 
 		
		function replyUser(str){
			
				frm.action = "replyForm.do?row="+str;
				frm.submit();
			
		}
	</script>  
	



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
                                문의사항 목록
                        </div>
                        <!-- card body -->
						<div class="card-body">
                           <div class="table-responsive">
                              <form id="frm" name="frm" method="post">
                              
                                 <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
									<thead>
										<tr align="center" style="background-color: silver">
											<th width="50">게시글 번호</th>
											<!-- <th width="100">글쓴이</th> -->
											<th width="300">제목</th>
											<!-- <th width="70">내용</th> -->
											<th width="100">날짜</th>
								
											<th width="70">답변</th>
										</tr>
									 </thead>
				 					 <tbody>
										<c:forEach var="vo" items="${list }">
										<input type="hidden" name="boardValue2" value="${vo.boardValue}">
										<%-- <input type="hidden" name="boardValue" value="${vo.boardValue }"> --%>
											<tr align="center">
												<td width="70">${vo.boardNumber}</td>
												<%-- <td width="70">${vo.boardWriter}</td> --%>
												<td width="70">${vo.boardTitle}</td>
												<%-- <td width="70">${vo.boardContent}</td> --%>
												<td width="70">${vo.boardDate}</td>
											    
												<td ><button type="submit" onclick="replyUser(${vo.boardNumber})">답변</button></td> 
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