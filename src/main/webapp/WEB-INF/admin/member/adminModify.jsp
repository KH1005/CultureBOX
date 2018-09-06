
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
<!-- using icon -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<script src="<c:url value='/interior-master/js/vendor/jquery-2.2.4.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/jquery-stars-master/dist/stars.min.js'/>"></script>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.css'/>" />
<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
<!--CSS   ============================================= -->
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
<script type="text/javascript">
function delchk(){
    return confirm("삭제하시겠습니까?");

}
</script>
<style>
   .banner-area {  
    background: url(file:///C:/spring/mavenApp/cultureBOX/src/main/webapp/cssimg/mainback7.jpg) center; 
    background-size: cover;
} 
  
.contact-form {
    text-align: center;
    margin-top: 40px;
}
input[type="text"], input[type="email"], input[type="password"], input[type="number"], input[type="date"], input[type="url"], input[type="tel"], textarea {
    height: 40px;
    width: 100%;
    border: none;
    background: #F4F4F4;
    border-bottom: 2px solid #EEE;
    color: #354052;
    padding: 0px 10px;
    opacity: 0.5;
    -webkit-transition: 0.2s border-color, 0.2s opacity;
    transition: 0.2s border-color, 0.2s opacity;
}
/* .col-6 {
    -ms-flex: 0 0 50%;
    flex: 0 0 50%;
    max-width: 50%;
}
.border-color-primary {
    border-color: #0a2d63!important;
}
.background-white {
    background-color: #fff!important;
}
.form-control {
    padding: .8rem;
    font-size: .75019rem;
    line-height: 1.5;
    border-color: #e1e1e1;
    -webkit-box-shadow: none;
    box-shadow: none;
    border-radius: 3px;
    background-color: #fafafa;
    -webkit-transition: all .2s ease-in-out;
    -o-transition: all .2s ease-in-out;
    transition: all .2s ease-in-out;
    height: auto;
} */

</style>
</head>
<body>

<section class="banner-area relative" id="home">   
            <div class="overlay overlay-bg"></div>
            <div class="container">            
               <div class="row d-flex align-items-center justify-content-center">
                  <div class="about-content col-lg-12">
                     <br>   
                     <p class="text-white link-nav">        <span class="lnr lnr-arrow-right"></span></p><br><br>
                     <h2 class="text-white">
                        Member Modify         
                     </h2> 
                  </div>   
               </div>
            </div>
         </section>
   <br><br><br>  
   
   <table class="board_view" align="center" width="20%" >      
   
      <tbody>
<div class="col-md-8 col-md-offset-2">
      <form action="MemberModify.cul" method="get" class="contact-form">
         <tr>   
            <th>ID</th>  
            <td colspan="3"><input type="text" id="MEMBER_ID"
               name="MEMBER_ID" class="background-white form-control border-color-primary" value="${member.MEMBER_ID}" /></td>
         </tr>
         <tr>   
            <th>Password</th>
            <td colspan="3"><input type="text" id="MEMBER_PASSWORD"
               name="MEMBER_PASSWORD" class="background-white form-control border-color-primary"
               value="${member.MEMBER_PASSWORD}" /></td>
         </tr>
         <tr>  
            <th>Name</th>
            <td colspan="3"><input type="text" id="MEMBER_NAME"
               name="MEMBER_NAME" class="background-white form-control border-color-primary" value="${member.MEMBER_NAME}" />
            </td>
         </tr>
         <tr>
            <th>Email</th>
            <td colspan="3"><input type="text" id="MEMBER_EMAIL"
               name="MEMBER_EMAIL" class="background-white form-control border-color-primary" value="${member.MEMBER_EMAIL}" />
            </td>
         </tr>  
            </table>  
             <div class="button-group-area mt-40">
         <table align="center"><br> 
         <tr>
            <td><c:url var="viewURL" value="AdminMemberList.cul">
               </c:url> <a href="${viewURL}"class="genric-btn info circle">목록</a> 
                 
               <c:url var="viewURL1" value="MemberModify.cul"></c:url>
                  <input type="submit" value="수정" class="genric-btn info circle">
                    
               <c:url var="viewURL" value="MemberDelete.cul">
                  <c:param name="MEMBER_ID" value="${member.MEMBER_ID}" />   
               </c:url> <a href="${viewURL}" onclick="return delchk()" class="genric-btn info circle" >삭제</a>    
            </td>
         </tr>
      
      </tbody>  
       
   </table><br><br><br>  
</div>
</form>
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
</html>