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
 	 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> 
	 <script type="text/javascript">
	  google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
		
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Sell List'],
        <c:forEach var="ct" items="${chartList }">
       		['${ct.chartProduct}', ${ct.chartProductQunt}],
        </c:forEach>
        ]);

        var options = {
          title: '판매 순위'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
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
                                상품목록
                        </div>
                        <!-- card body -->
						<div class="card-body">
                           <div class="table-responsive">
                              <form id="frm1" name="frm1" method="post">
                                 <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
									<thead>
										<tr align="center" style="background-color: silver">
											<th width="70" >판매번호</th>
										    <th width="100">상품번호</th> 
										    <th width="70">상 품 명</th>
										    <th width="70">상품 가격</th>
										    <th width="70">판 매 자</th>
										    <th width="70">구 매 자</th>
										    <th width="70">구 매 일</th>
										</tr>
									 </thead>
				 					 <tbody>
				 					 	<c:if test="${empty list}"> 
											<tr><td colspan="7" align="center">구매 내역이 없습니다.</td></tr>
										</c:if>
										<c:if test="${not empty list}">
										 <c:forEach var="vo" items="${list }">
											<tr align="center">
												<td width="70">${vo.sellNumber }</td>
											    <td width="70">${vo.sellProductNumber}</td>
											    <td width="70">${vo.productName}</td>
											    <td width="70">${vo.productPrice}</td>
											    <td width="70">${vo.productSeller}</td>
											    <td width="70">${vo.sellUser}</td>
											    <td width="70">${vo.sellDate}</td>
											    
											</tr>
										 </c:forEach>
										</c:if>
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
                                판매내역
                        </div>
                        <!-- card body -->
						<div class="card-body">
                           <div class="table-responsive">
					          <form action="" id="frm" name="frm" method="post">
								<div id="piechart" style="width: 900px; height: 500px;"></div>
								 
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