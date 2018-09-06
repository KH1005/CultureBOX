  <%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
   <!DOCTYPE html>
   <html lang="zxx" class="no-js">
   <head>
      <!-- Mobile Specific Meta -->
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <!-- Favicon-->
      <link rel="shortcut icon" href="img/fav.png">
      <!-- Author Meta -->
      <meta name="author" content="colorlib">
      <!-- Meta Description -->
      <meta name="description" content="">
      <!-- Meta Keyword -->
      <meta name="keywords" content="">
      <!-- meta character set -->
      <meta charset="UTF-8">
      <!-- Site Title -->
      <title>Interior</title>

      <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
         <!--
         CSS
         ============================================= -->
         <link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/linearicons.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/magnific-popup.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/nice-select.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/animate.min.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/owl.carousel.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/main.css">
   
<style type="text/css">


/* nav tag */
nav ul {
   padding-top: 10px;
} /*  상단 여백 10px  */
nav ul li {
   display: inline;
   border-left: 1px solid #999; 
   font: bold 12px Dotum; 
   padding: 0 10px; 
}

nav ul li:first-child {
   border-left: none;
}
</style>

      </head>
      
      <body>   
           
         <!-- start banner Area -->
         
         <!-- End banner Area -->   


         <!-- Start gallery Area -->
         <section class="gallery-area section-gap">
            <div class="container">
               <div class="row d-flex justify-content-center">
                  <div class="col-md-12 pb-40 header-text text-center">
                     <h1 class="pb-10">공연</h1>
                     <p>
                        Who are in extremely love with eco friendly system.
                     </p>
                  </div>
               </div>                     
               <div class="cultureList">



      <table class="table" width="700" align="center" id="work">
         <c:forEach items="${cultureList}" var="row" varStatus="stat">


            <c:if test="${stat.index % 4 eq 0}">
               <tr></tr>
            </c:if>
            <td width="230" align="center">
            <a href='http://localhost:8080/culture/concert/CultureDetail.cul?culture_idx=${row.CULTURE_IDX}'>
                <img src="http://localhost:8080/culture/cultureimg/${row.CULTURE_SAVNAME}" width="150px" height="200px">
            </a>
               <div class="property_details">
                   <p><h5>${row.CULTURE_NAME}</h5></p>
                   <p>
                    <h5><fmt:parseDate value="${row.CULTURE_START}" var="dateFmt" pattern="yyyy-MM-dd"/>
                           <fmt:formatDate value="${dateFmt}" pattern="yyyy-MM-dd"/></h5>
                        </p>
                  <p class="property_size">&nbsp;&nbsp;${row.CULTURE_LOCATION}</p>
               </div>
               
            <br> <br> <br>
         </c:forEach>

      </table>


      <!--  등록된 공연이 없을때 -->
      <c:if test="${fn:length(cultureList) le 0}">
         <font color="FFFFFF">등록된 상품이 없습니다</font>
      </c:if>
   </div>
</body>
            </div>   
         </section>
         <!-- End gallery Area -->
            
         <!-- Start brands Area -->
         <section class="brands-area pb-60 pt-60">
            <div class="container no-padding">
               <div class="brand-wrap">
                  <div class="row align-items-center active-brand-carusel justify-content-start no-gutters">
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
         <!-- End brands Area -->               

         <!-- start footer Area -->      
         <footer class="footer-area section-gap">
            <div class="container">
               <div class="row">
                  <div class="col-lg-5 col-md-6 col-sm-6">
                     <div class="single-footer-widget">
                        <h6>About Us</h6>
                        <p>
                           If you own an Iphone, you’ve probably already worked out how much fun it is to use it to watch movies-it has that.
                        </p>
                        <p class="footer-text"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a> and distributed by <a href="https://themewagon.com/" target="_blank">ThemeWagon</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>                        
                     </div>
                  </div>
                  <div class="col-lg-5  col-md-6 col-sm-6">
                     <div class="single-footer-widget">
                        <h6>Newsletter</h6>
                        <p>Stay update with our latest</p>
                        <div class="" id="mc_embed_signup">
                           <form target="_blank" novalidate="true" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01" method="get" class="form-inline">
                              <input class="form-control" name="EMAIL" placeholder="Email Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email Address'" required="" type="email">
                                        <button class="click-btn btn btn-default"><i class="lnr lnr-arrow-right" aria-hidden="true"></i></button>
                                        <div style="position: absolute; left: -5000px;">
                                    <input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value="" type="text">
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
                           <a href="#"><i class="fa fa-facebook"></i></a>
                           <a href="#"><i class="fa fa-twitter"></i></a>
                           <a href="#"><i class="fa fa-dribbble"></i></a>
                           <a href="#"><i class="fa fa-behance"></i></a>
                        </div>
                     </div>
                  </div>                     
               </div>
            </div>
         </footer>   
         <!-- End footer Area -->   

         <script src="js/vendor/jquery-2.2.4.min.js"></script>
         <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
         <script src="js/vendor/bootstrap.min.js"></script>         
         <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
           <script src="js/easing.min.js"></script>         
         <script src="js/hoverIntent.js"></script>
         <script src="js/superfish.min.js"></script>   
         <script src="js/jquery.ajaxchimp.min.js"></script>
         <script src="js/jquery.magnific-popup.min.js"></script>   
         <script src="js/owl.carousel.min.js"></script>                  
         <script src="js/jquery.nice-select.min.js"></script>                     
         <script src="js/mail-script.js"></script>   
         <script src="js/main.js"></script>   
      </body>
   </html>