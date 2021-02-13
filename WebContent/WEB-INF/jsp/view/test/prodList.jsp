<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>구매페이지</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
  

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script type="text/javascript">
 
 
 
  function buyNow(str) {
			var win = window.open("", "PopupWin", "width=680,height=800");
			frm1.target = "PopupWin";
			frm1.cartProduct.value = str;
			frm1.action = "bootPay.do";
			frm1.submit();
 } 


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
     //console.log(val.productNum, val.productName, val.productPrice);
     //console.log(val);
     
     
     let div3;
     let elem_3;
     
     div3 = $('<div />').addClass("row justify-content-center");
    elem_3 = $('<div />').addClass("col-md-6 col-lg-4 mb-5");
    let elem_4 = $('<div />').addClass("portfolio-item mx-auto").attr('data-toggle','modal').attr('data-target','#portfolioModal'+val.productNum);
    let e4_e1 = $('<div />').addClass("portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100");
    let e4_e1_e1 = $('<div />').addClass("portfolio-item-caption-content text-center text-white");
    let e4_e1_e1_i = $('<i />').addClass("fas fa-plus fa-3x");
    let e4_img = $('<img />').addClass("img-fluid").attr('src','images/'+val.image);
    
    e4_e1_e1.append(e4_e1_e1_i);
    e4_e1.append(e4_e1_e1);
    elem_4.append(e4_e1);
    elem_4.append(e4_img);
    elem_3.append(elem_4);
    
    
    $(div3).append(elem_3);
    
    $('.portContainer').append(div3);
    
    //modal
    
    let div4, div5,div6;
    
    div4 = $('<div />').addClass("portfolio-modal modal fade").attr('id','portfolioModal'+val.productNum).attr('tabindex','-1').attr('role','dialog').attr('aria-labelledby','portfolioModal'+val.productNum+'Label').attr('aria-hidden','true');
    div5 = $('<div />').addClass("modal-dialog modal-xl").attr('role','document');
    div6 = $('<div />').addClass("modal-content");
    
    
    let div6_e1 = $('<button />').addClass("close").attr('type','button').attr('data-dismiss', 'modal').attr('aria-label','Close');
    let div6_e1_e1 = $('<span />').attr('aria-hidden', 'ture');
    let div6_e1_e1_e1=$('<i />').addClass("fas fa-times");
   
    

    
    let div6_e2 = $('<div />').addClass("modal-body text-center");
    let div6_e2_e1=$('<div />').addClass("container");
    let div6_e2_e1_e1=$('<div />').addClass("row justify-content-center");
    let div6_e2_e1_e1_e1=$('<div />').addClass("col-lg-8");
    let div6_e2_e1_e1_e1_h=$('<h2 />').addClass("portfolio-modal-title text-secondary text-uppercase mb-0").attr('id','portfolioModal'+val.productNum+'Label');
    
    $(div6_e2_e1_e1_e1_h).html(val.productName);
    
    let div6_e2_e1_e1_e1_h_input = $('<input />').attr('type','text').attr('name','modalName').attr('id','modalName').attr('value', val.productName);
    let div6_e2_e1_e1_e1_e1=$('<div />').addClass("divider-custom");
    let div6_e2_e1_e1_e1_e1_e1=$('<div />').addClass("divider-custom-line");
    let div6_e2_e1_e1_e1_e1_e2=$('<div />').addClass("divider-custom-icon");
    let div6_e2_e1_e1_e1_e1_e2_i=$('<i />').addClass("fas fa-star");
    let div6_e2_e1_e1_e1_e1_e3=$('<div />').addClass("divider-custom-line");
    
    let div6_e2_e1_e1_e1_img=$('<img />').addClass("img-fluid rounded mb-5").attr('src','images/'+val.image);
    let div6_e2_e1_e1_e1_p=$('<p />').addClass("mb-5").html("가격 :"+val.productPrice);
    let div6_e2_e1_e1_e1_p2=$('<p />').addClass("mb-5").html("재고 :"+val.productQunt);
   
    let div6_e2_e1_e1_e1_button=$('<button />').addClass("btn btn-primary").html("구매하기").attr('onclick','buyNow('+val.productNum+')');
    let div6_e2_e1_e1_e1_cIf2=$('<c />').attr('test','${memberId ne null}')
    let div6_e2_e1_e1_e1_button2=$('<button />').addClass("btn btn-primary").html('회원장바구니').attr('onclick','location.href="inputCart.do?row='+val.productNum+'"');
    let div6_e2_e1_e1_e1_cIf3=$('<c />').attr('test','${memberId eq null}')
    let div6_e2_e1_e1_e1_button3=$('<button />').addClass("btn btn-primary").html('비회원장바구니').attr('onclick','location.href="nonMemberCart.do?row='+val.productNum+'"');
    let div6_e2_e1_e1_e1_button_i=$('<i />').addClass("fas fa-times fa-fw");
    
   
    
    
    $(div6_e2_e1_e1_e1_e1).append(div6_e2_e1_e1_e1_e1_e1);
    div6_e2_e1_e1_e1_e1_e2.append(div6_e2_e1_e1_e1_e1_e2_i);
    $(div6_e2_e1_e1_e1_e1).append(div6_e2_e1_e1_e1_e1_e2);
    $(div6_e2_e1_e1_e1_e1).append(div6_e2_e1_e1_e1_e1_e3);
    
    $(div6_e2_e1_e1_e1).append(div6_e2_e1_e1_e1_h);
    $(div6_e2_e1_e1_e1).append(div6_e2_e1_e1_e1_e1);
  
    $(div6_e2_e1_e1_e1).append(div6_e2_e1_e1_e1_img);
    $(div6_e2_e1_e1_e1).append(div6_e2_e1_e1_e1_p);
    $(div6_e2_e1_e1_e1).append(div6_e2_e1_e1_e1_p2);
    
   
    
    div6_e2_e1_e1_e1_button.append(div6_e2_e1_e1_e1_button_i);
    $(div6_e2_e1_e1_e1).append(div6_e2_e1_e1_e1_button);
    $(div6_e2_e1_e1_e1_cIf2).append(div6_e2_e1_e1_e1_button2);
    $(div6_e2_e1_e1_e1).append(div6_e2_e1_e1_e1_cIf2);
    $(div6_e2_e1_e1_e1_cIf3).append(div6_e2_e1_e1_e1_button3);
    $(div6_e2_e1_e1_e1).append(div6_e2_e1_e1_e1_cIf3);
    
    
    
    $(div6_e2_e1_e1).append(div6_e2_e1_e1_e1);
    $(div6_e2_e1).append(div6_e2_e1_e1);
    $(div6_e2).append(div6_e2_e1);
    
    $(div6).append(div6_e2);
    
    div6_e1_e1.append(div6_e1_e1_e1);
    div6_e1.append(div6_e1_e1);
    $(div6).append(div6_e1);
    
    $(div5).append(div6);
    $(div4).append(div5);
   
    $('#page-top').append(div4);
    
     
   }






 } //end of showContents


 </script>

</head>
<body id="page-top">
<!-- nav -->
<jsp:include page="../main/menu.jsp"></jsp:include>  
    
<section class="page-section portfolio" id="portfolio" name="portfolio"><br/><br/><br/>
 <div class="container portContainer">
 <!-- Portfolio Section Heading--> 
      <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">Purchase</h2>
      <!-- Icon Divider-->
      <div class="divider-custom">
          <div class="divider-custom-line"></div>
          <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
          <div class="divider-custom-line"></div>
      </div>
	
	</div>
 </section>
 <div class="portrow">

 </div>
 
 
 <!-- Bootstrap core JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Third party plugin JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
	<!-- Contact form JS-->
	<script src="assets/mail/jqBootstrapValidation.js"></script>
	<script src="assets/mail/contact_me.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
 
 
  
</body>
</html>