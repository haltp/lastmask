<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />

		<title>공지사항</title>
 		<link href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css" rel="stylesheet">
 		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 		<script src=https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js></script>
		<!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
 
 <!-- <link href="css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
  -->
 
 <script type="text/javascript">


 $(document).ready(function () {

	 var table = $('#example').DataTable({
			"ajax": '/MaskTest/GetBoardListTest',
			"columns": [
				{ "data": "boardNumber" },
				{ "data": "boardTitle" },
				{ "data": "boardWriter" },
				{ "data": "boardDate" },
				{ "data": "boardHit" }
			]
		});
	 
	 	$('#example tbody').on('click', 'tr', function() {
			var data = table.row(this).data();
		
			location.href="boardView.do?row="+data.boardNumber;
			
		})
	 
	});//end of ready


</script>
<style type="text/css">

.cateTit_v2.join {
    margin: 88px 0 20px;
    padding: 14px 0;
    border-bottom: 1px solid #77828C;
    color: #000;
}

.cateTit_v2 .title {
	
    font-size: 24px;
    color:#314759;
    line-height: 1;
    font-weight: bold;
    display: inline-block;
    *float: left;
    *line-height: 20px;
}

em {
    font-style: normal;
}



</style>

</head>

<body>

 <!-- Navigation-->
<jsp:include page="../main/menu.jsp"></jsp:include> 


<div style="width:1280px; margin:0 auto;">
<div class="cateTit_v2 join">
<br>
	<br>
<div class="cateTit_v2 title">
	<em class="title">공지사항</em>
</div>


</div>
<br>
	<br>
<div align="center">



<table id="example" class="display" cellspacing="0" style="width: 100%">
	<thead>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>

		</tr>
	</thead>
	

</table>
<br>
	<br>
	
	<br>
	<br>
	<br>

</div>

</div>

<!-- Footer-->
  		<jsp:include page="../main/footer.jsp"></jsp:include>
        <!-- Copyright Section-->
        <jsp:include page="../main/copyright.jsp"></jsp:include>
        <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes)-->
        <jsp:include page="../main/scroll.jsp"></jsp:include>

</body>

</html>