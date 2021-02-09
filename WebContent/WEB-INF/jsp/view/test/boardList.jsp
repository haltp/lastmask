<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<title>메인 페이지</title>
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
	 /*
	 $('#example').DataTable( {
	        "ajax": "data/objects.txt",
	        "columns": [
	            { "data": "name" },
	            { "data": "position" },
	            { "data": "office" },
	            { "data": "extn" },
	            { "data": "start_date" },
	            { "data": "salary" }
	        ]
	    } );
	 */
	 
		$('#example').DataTable({
			"ajax": '/MaskTest/GetBoardListTest',
			"columns": [
				{ "data": "boardNumber" },
				{ "data": "boardTitle" },
				{ "data": "boardWriter" },
				{ "data": "boardDate" },
				{ "data": "boardHit" }
			]
		});
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
<%-- <jsp:include page="../main/menu.jsp" /> --%>
</head>

<body>

 <!-- Navigation-->
        <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="main.do">MASK</a>
                <button class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                    <!-- 수정 -->
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#portfolio">마스크 구매</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="showBoardTest.do">게시판</a></li>
                        <c:if test="${memberId eq null}">
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="loginForm.do">로그인</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#contact">회원가입</a></li>
                        </c:if>
                        <c:if test="${memberId ne null }">
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="logout.do">로그아웃</a></li>
                        </c:if>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/MaskTest/indexAdmin.jsp">관리자</a></li>
                    </ul>
                </div>
            </div>
        </nav>
<div style="width:1280px; margin:0 auto;">
<div class="cateTit_v2 join">
<br>
	<br>
<div class="cateTit_v2 title">
	<em class="title">문의게시판</em>
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

</div>

</div>

</body>

</html>