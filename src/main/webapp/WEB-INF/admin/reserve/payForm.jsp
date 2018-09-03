<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script type="text/javascript">

/* jQuery('#bank').change(function() {
	var state = jQuery('#bank option:selected').val();
	alert(state);
	if(state == '신한') {
		jQuery('.layer').show();
	} else {
		jQuery('.layer').hide();
	}
}); */

$(function(){
	$('#bank').change(function(){
		var state = $("#bank option:selected").text();
		alert(state);
		if(state == '신한'){
			$(".layer").show();
		} else{
			$(".layer").hide();
		}
	})
});

</script>

<style>
.layer{ display: none; }	
</style>
</head>
<body>
<div class="wrap">
         <div class="topArea">
         <div style="border: 0px solid gold; float: left; width: 25%;">
            <h4 style="color:white; margin-top:0px; padding-top: 20px">&nbsp;&nbsp;&nbsp;티켓 예매</h4>
          		
		<div class="culture_pic">
			<img src="/project/upload/movie/${ctDetail.CULTURE_SAVNAME}"
				width="150" height="300" /> 
		</div>
		<div class="id" >예약자 아이디 : ${id}</div>
    	      	<div class="seat_name">
    	      		<p class="tit">좌석 이름
    	      		<c:forEach var="stName" items="${stName}" varStatus="stat">
                     <c:set var="index_r" value="${stat.index mod 5}" />
                     <c:if test="${index_c == 0}">
                        <br>
                     </c:if>
                     <p class="tit">${stName}</p>
                     </c:forEach>
    	      	</div>
    	      	<div class="seat_price" id="seat_price">티켓 금액 : ${stModel.SEAT_PRICE}
    	      	</div>
    	      	<div class="selectBank" style="float: left; width: 637px; height: 637px;">입금 
               		<select id="bank" name="bank">
                         <option value="" selected="selected">은행 선택</option>
                         <option value="신한">신한</option>
                         </select>
                         	<div class="layer">
                         		신한 110&nbsp;-&nbsp;333&nbsp;-&nbsp;184633<br>
								예금주 : 김지훈                         		
                         	</div> 
            </div>
         </div>
        
         </div> 
         
       
    </div>
    
    <section class="brands-area pb-60 pt-60">
      <div class="container no-padding">
         <div class="brand-wrap">
            <div
               class="row align-items-center active-brand-carusel justify-content-start no-gutters">
               <div class="col single-brand">
                  <a href="#"><img class="mx-auto" src="img/l1.png" alt=""></a>
               </div>
               <div class="col single-brand">
                  <a href="#"><img class="mx-auto" src="img/l2.png" alt=""></a>
               </div>
               <div class="col single-brand">
                  <a href="#"><img class="mx-auto" src="img/l3.png" alt=""></a>
               </div>
               <div class="col single-brand">
                  <a href="#"><img class="mx-auto" src="img/l4.png" alt=""></a>
               </div>
               <div class="col single-brand">
                  <a href="#"><img class="mx-auto" src="img/l5.png" alt=""></a>
               </div>
            </div>
         </div>
      </div>
   </section>
         <!-- start footer Area -->
   <footer class="footer-area section-gap">
      <div class="container">
         <div class="row">
            <div class="col-lg-5 col-md-6 col-sm-6">
               <div class="single-footer-widget">
                  <h6>About Us</h6>
                  <p>If you own an Iphone, you’ve probably already worked out
                     how much fun it is to use it to watch movies-it has that.</p>
                  <p class="footer-text">
                     <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                     Copyright &copy;
                     <script>
                        document.write(new Date().getFullYear());
                     </script>
                     All rights reserved | This template is made with <i
                        class="fa fa-heart-o" aria-hidden="true"></i> by <a
                        href="https://colorlib.com" target="_blank">Colorlib</a> and
                     distributed by <a href="https://themewagon.com/" target="_blank">ThemeWagon</a>
                     <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                  </p>
               </div>
            </div>
            <div class="col-lg-5  col-md-6 col-sm-6">
               <div class="single-footer-widget">
                  <h6>Newsletter</h6>
                  <p>Stay update with our latest</p>
                  <div class="" id="mc_embed_signup">
                     <form target="_blank" novalidate="true"
                        action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
                        method="get" class="form-inline">
                        <input class="form-control" name="EMAIL"
                           placeholder="Email Address" onfocus="this.placeholder = ''"
                           onblur="this.placeholder = 'Email Address'" required=""
                           type="email">
                        <button class="click-btn btn btn-default">
                           <i class="lnr lnr-arrow-right" aria-hidden="true"></i>
                        </button>
                        <div style="position: absolute; left: -5000px;">
                           <input name="b_36c4fd991d266f23781ded980_aefe40901a"
                              tabindex="-1" value="" type="text">
                        </div>
                        <div class="info"></div>
                     </form>
                  </div>
               </div>
            </div>
            <div class="col-lg-2 col-md-6 col-sm-6 social-widget">
               <div class="single-footer-widget">
                  <h6>Follow Us</h6>
                  <p>Let us be social</p>
                  <div class="footer-social d-flex align-items-center">
                     <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
                        class="fa fa-twitter"></i></a> <a href="#"><i
                        class="fa fa-dribbble"></i></a> <a href="#"><i
                        class="fa fa-behance"></i></a>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </footer>
   <!-- End footer Area -->

<script src="<c:url value='/interior-master/js/vendor/jquery-2.2.4.min.js'/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="<c:url value='/interior-master/js/vendor/bootstrap.min.js'/>"></script>         
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
<script src="<c:url value='/interior-master/js/easing.min.js'/>"></script>         
<script src="<c:url value='/interior-master/js/hoverIntent.js'/>"></script>
<script src="<c:url value='/interior-master/js/superfish.min.js'/>"></script>   
<script src="<c:url value='/interior-master/js/jquery.ajaxchimp.min.js'/>"></script>
<script src="<c:url value='/interior-master/js/jquery.magnific-popup.min.js'/>"></script>   
<script src="<c:url value='/interior-master/js/owl.carousel.min.js'/>"></script>            
<script src="<c:url value='/interior-master/js/jquery.nice-select.min.js'/>"></script>         
<script src="<c:url value='/interior-master/js/mail-script.js'/>"></script>   
<script src="<c:url value='/interior-master/js/main.js'/>"></script>   
        </body>
</html>