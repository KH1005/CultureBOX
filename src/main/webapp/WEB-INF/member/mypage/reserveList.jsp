<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
<link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
<link rel="stylesheet" type="text/css"
   href="https://technext.github.io/interior/css/main.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
   <!-- jquery -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>

<script type="text/javascript">
function delchk(){
    return confirm("예매를 취소하시겠습니까?");
    
    
}
</script>
<!-- using icon -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<script src="<c:url value='/interior-master/js/vendor/jquery-2.2.4.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/jquery-stars-master/dist/stars.min.js'/>"></script>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.css'/>" />
<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
<!--CSS	============================================= -->
<link rel="stylesheet" href="<c:url value='/interior-master/css/linearicons.css'/>">
<link rel="stylesheet" href="<c:url value='/interior-master/css/font-awesome.min.css'/>">
<link rel="stylesheet" href="<c:url value='/interior-master/css/bootstrap.css'/>">
<link rel="stylesheet" href="<c:url value='/interior-master/css/magnific-popup.css'/>">
<link rel="stylesheet" href="<c:url value='/interior-master/css/nice-select.css'/>">							
<link rel="stylesheet" href="<c:url value='/interior-master/css/animate.min.css'/>">
<link rel="stylesheet" href="<c:url value='/interior-master/css/owl.carousel.css'/>">
<link rel="stylesheet" href="<c:url value='/interior-master/css/main.css'/>">
			

<link href="<c:url value='/rating.css'/>" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://unpkg.com/animate.css/animate.css" type="text/css" />
<link rel="stylesheet" href="https://unpkg.com/rmodal/dist/rmodal.css" type="text/css" />
<style type="text/css">
.banner-area {
    background: url(<c:url value='/interior-master/cultureimg/myself.jpg'/>) center;
    background-size: cover;
}
</style>
<body>
   <section class="banner-area relative" id="home">
      <div class="overlay overlay-bg"></div>
      <div class="container">
         <div class="row d-flex align-items-center justify-content-center">
            <div class="about-content col-lg-12">
               <br>
               <p class="text-white link-nav">
               </p>
               <br> <br>
               <h2 class="text-white">My reservation</h2>
            </div>
         </div>
      </div>
   </section>

   <div class="progress-table">
      <table class="board_list" align="center">
         <div class="table-head">
         <tr style="color:#1e8ec0;">
            <td align="center">No</td>
            <td align="center">Date</td>
            <td align="center">ID</td>
            <td align="center">Concert</td>
            <td align="center">Location</td>
            <td align="center">Seat</td>
            <td align="center">Price</td>
            <td align="center">ticket</td>
            <td align="center">cancel</td>    
         </tr>
         </div>
         <tbody>
            <c:forEach var="memberOrderList"
               items="${memberOrderList}" varStatus="stat" >
               <!--  컨트롤러에서 보내준 값과 일치시켜야한다(대소문자까지!) -->
               <tr>
                  <td style="color: gray">${memberOrderList.RESERVE_IDX}</td>
                  <td style="color: gray">${memberOrderList.RESERVE_DATE}</td>
                  <td style="color: gray">${memberOrderList.RESERVE_ID} </td>
                  <td style="color: gray">${memberOrderList.CULTURE_NAME}</td>
                  <td style="color: gray">${memberOrderList.CULTURE_LOCATION}</td>
                  <td style="color: gray">${memberOrderList.SEAT_NAME}</td>
                  <td style="color: gray">${memberOrderList.SEAT_PRICE}</td>
                  <td style="color: gray">
                 <!--  <a href="" class="genric-btn success medium"> -->
                 <c:url var="viewURL" value="/download/pdf.cul">
                   <c:param name="id" value="${memberOrderList.RESERVE_ID}" />
                   <c:param name="cidx" value="${memberOrderList.CULTURE_IDX}"/>
                 </c:url>
                    <a href="${viewURL}" class="genric-btn success medium">티켓출력</a>
                  </td> 
                  <td style="color: gray"><c:url var="viewURL" value="reserveCancel.cul">
                        <c:param name="RESERVE_IDX"
                           value="${memberOrderList.RESERVE_IDX}" />
                     </c:url> <a href="${viewURL}" onclick="return delchk()" class="lnr lnr-trash">
                        </a>
                  </td>
         
            </c:forEach>
            <!--  등록된 상품이 없을때 -->
               <c:if test="${fn:length(memberOrderList) le 0}">
                  <tr>
                     <td colspan="9" style="text-align: center;">예약 내역이 없습니다.</td>
                  </tr>
               </c:if> 
          
            
            </tr>
          
               
         </tbody>

      </table>
   </div>

          
   <div class="paging" align="center">${pagingHtml}
   			<!-- sweet alert -->
			<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		    
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
			
			<!-- rating star -->
		    <%-- <script type="text/javascript" src="<c:url value='/js/jquery.js'/>"></script>
			<script type="text/javascript" src="<c:url value='/js/jquery.raty.min.js'/>"></script> --%>
			
			
			<script type="text/javascript" src="https://unpkg.com/rmodal/dist/rmodal.js"></script>
</body>
<br>
<br>
<br>
<br>
</html>