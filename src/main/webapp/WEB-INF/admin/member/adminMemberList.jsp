<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>

<script src="${contextPath}/res/js/date/jquery-1.10.2.js"></script>
<!-- Mobile Specific Meta -->
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
<style>


.banner-area {
   background:
      url(file:///C:/spring/mavenApp/cultureBOX/src/main/webapp/cssimg/mainback7.jpg)
      center;
   background-size: cover;
}

.contact_input {
   display: inline-block;
   width: calc(13% - 10px);
   height: 42px;
   border: none;
   outline: none;
   border-bottom: solid 1px #cccccc;
   background: transparent;
   -webkit-transition: all 200ms ease;
   -moz-transition: all 200ms ease;
   -ms-transition: all 200ms ease;
   -o-transition: all 200ms ease;
   transition: all 200ms ease;
}

button, input, optgroup, select, textarea {
   margin: 0;
   font-family: inherit;
   font-size: inherit;
   line-height: inherit;
}

button, input {
   overflow: visible;
}
</style>
</head>
<body>

   <section class="banner-area relative" id="home">
      <div class="overlay overlay-bg"></div>
      <div class="container">
         <div class="row d-flex align-items-center justify-content-center">
            <div class="about-content col-lg-12">
               <br>
               <p class="text-white link-nav"></p>
               <br> <br>
               <h2 class="text-white">Member List</h2>
            </div>
         </div>
      </div>
   </section>

   <!--    <section class="banner-area relative" id="home">
            <div class="overlay overlay-bg"></div>
            <div class="container">
               <div class="row fullscreen d-flex justify-content-center align-items-center" style="height: 708px;">
                  <div class="banner-content col-lg-9 col-md-12 justify-content-center ">
                     
                  
                     <a href="#" class="primary-btn header-btn text-uppercase mt-10">Get Started</a>
                  </div>                                 
               </div>
            </div>
         </section> -->

   <br>
   <br>
<table class="board_view" align="center" width="70%" > 
               <tr>
                  <td align="center" style="color: #1e8ec0;">ID</td>
                  <td align="center" style="color: #1e8ec0;">Password</td>
                  <td align="center" style="color: #1e8ec0;">Name</td>
                  <td align="center" style="color:#1e8ec0;">Email</td>
                  <td align="center" style="color: #1e8ec0;">Setting</td>

               </tr>
         <tbody>
            <c:forEach items="${adminMemberList}" var="adminMemberList"
               varStatus="stat">
               <%-- <c:url var="viewURL" value="${MemberModifyForm.box }"/>
         <c:param name="id" value="${MemberModifyForm.MEMBERD_ID }" /> --%>
               <!--  컨트롤러에서 보내준 값과 일치시켜야한다(대소문자까지!) -->
               <tr class="member" align="center">
                  <td style="color: gray">${adminMemberList.MEMBER_ID}</td>
                  <td style="color: gray">${adminMemberList.MEMBER_PASSWORD}</td>
                  <td style="color: gray">${adminMemberList.MEMBER_NAME}</td>
                  <td style="color: gray">${adminMemberList.MEMBER_EMAIL}</td>
                  <td style="color: gray"><c:url var="viewURL"
                        value="MemberModifyForm.cul">
                        <c:param name="MEMBER_ID" value="${adminMemberList.MEMBER_ID}" />
                     </c:url> <a class="lnr lnr-cog" href="${viewURL}"></a></td>



               </tr>

            </c:forEach>



         </tbody>

      </table>
   </div>
   <br>
   <br>

<div class="d7" style="text-align:center;">
               <form action="">
                  <select class="searchOption btn btn-default"  name="searchNum" id="searchNum">
                     <option value="0">전체</option>
                     
                  </select>
                    <input type="text" name="isSearch" id="isSearch"  placeholder="검색어 입력" class="contact_input contact_input_name">
                    <button type="submit" class="genric-btn info-border circle">검색</button>
               </form>
            </div>

   <br>
   <br>

   <div class="paging" style="text-align: center;">${pagingHtml}</div>

</body>
<br>
<br>
<br>
<br>
<br>

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

</html>
