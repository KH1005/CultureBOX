<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="ko">
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
      
      <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
         <!--
         CSS
         ============================================= -->
<link rel="stylesheet" href="<c:url value='/interior-master/css/linearicons.css'/>">
<link rel="stylesheet" href="<c:url value='/interior-master/css/font-awesome.min.css'/>">
<link rel="stylesheet" href="<c:url value='/interior-master/css/bootstrap.css'/>">
<link rel="stylesheet" href="<c:url value='/interior-master/css/magnific-popup.css'/>">
<link rel="stylesheet" href="<c:url value='/interior-master/css/nice-select.css'/>">                     
<link rel="stylesheet" href="<c:url value='/interior-master/css/animate.min.css'/>">
<link rel="stylesheet" href="<c:url value='/interior-master/css/owl.carousel.css'/>">
<link rel="stylesheet" href="<c:url value='/interior-master/css/main.css'/>">

<style>
.max-small {
    width: 350px; height: 400px;
}
</style>
<!-- 프로그래밍 언어: <input id='my-language' type='text'>
 -->
 </head>
<body>
           
           
          <section class="banner-area relative" id="home">   
            <div class="overlay overlay-bg"></div>
            <div class="container">            
               <div class="row d-flex align-items-center justify-content-center">
                  <div class="about-content col-lg-12">
                     <h1 class="text-white">
                        Admin Culture List
                     </h1>    
                     
                  </div>   
               </div>
            </div>
         </section> 
         <br><br>
         
            <div class="d7" style="text-align:center;">
               <form action="">
                  <select class="searchOption btn btn-default"  name="searchNum" id="searchNum">
                     <option value="0">공연명</option>
                     
                  </select>
                    <input type="text" name="isSearch" id="isSearch"  placeholder="검색어 입력">
                    <button type="submit" class="genric-btn primary small">검색</button>
               </form>
            </div>
         
         
         
           <!--      <div style="margin-left: 725px; text-align:center;">
                       <div style="text-align:center;">
                        
                        <form action="">
                           <select name="searchNum" id="searchNum">
                              <option value="0">공연명</option>
                           </select>
            
                              <input type="text" name="isSearch" id="isSearch" />
                              <span>
                              <button type="submit" class="genric-btn primary radius">검색</button>
                              </span>
                         </form> 

                                          
                     </div>   
                     
            </div>  -->
                  
               
               <div class="row" style="margin-left: 1300px;">
                <c:url var="viewURL" value="CultureJoinForm.cul">
                  </c:url> <a href="${viewURL}" class="genric-btn primary radius">등록</a>
               </div>
    
           
          <section class="gallery-area pb-120">
            <div class="container">
               <div class="row d-flex justify-content-center">
                  <div class="col-md-12 pb-40 header-text text-center">
                     <h1 class="pb-10"></h1>
                     <p>
                      
                     </p>
                  </div>
               </div>                     
               <div class="row">
               
                  <c:forEach items="${adminCultureList}" var="row" varStatus="stat">
                     <div class="col-lg-4">
                        <div class="single-gallery">
                           <div class="content">
                               <a href="#" target="_blank">
                                 <div class="content-overlay"></div>
                                    <img class='max-small' src="http://localhost:8080/culture/cultureimg/${row.CULTURE_SAVNAME}"  alt="">
                                 <div class="content-details fadeIn-bottom">
                                   <h4 class="content-title mx-auto">${row.CULTURE_NAME}<br><br>
                                    ${admincultureModel.CULTURE_START}<br>
                                    ~&nbsp; ${admincultureModel.CULTURE_END}
                                    <br><br>${row.CULTURE_LOCATION}
                                   </h4>
                                 
                                   <a href='http://localhost:8080/culture/admin/CultureDetail.cul?culture_idx=${row.CULTURE_IDX}' class="primary-btn text-uppercase mt-20">More Details</a>
                                 </div>
                               </a>
                           </div>
                        </div>
                     </div>
                  </c:forEach>                                    
               </div>
            </div>   
         </section>
               
               <!--  등록된 상품이 없을때 -->
            <c:if test="${fn:length(adminCultureList) le 0}">
               <tr><td colspan="9" style="text-align:center;">등록된 공연이 없습니다</td></tr>
            </c:if>
            
    
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