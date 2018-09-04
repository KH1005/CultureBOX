<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
         <link rel="stylesheet" href="http://localhost:8080/culture/interior-master/css/linearicons.css">
         <link rel="stylesheet" href="http://localhost:8080/culture/interior-master/css/font-awesome.min.css">
<!--          <link rel="stylesheet" href="http://localhost:8080/culture/interior-master/css/bootstrap.css">
 -->      <link rel="stylesheet" href="http://localhost:8080/culture/interior-master/css/magnific-popup.css">
         <link rel="stylesheet" href="http://localhost:8080/culture/interior-master/css/nice-select.css">                     
         <link rel="stylesheet" href="http://localhost:8080/culture/interior-master/css/animate.min.css">
         <link rel="stylesheet" href="http://localhost:8080/culture/interior-master/css/owl.carousel.css">
         <link rel="stylesheet" href="http://localhost:8080/culture/interior-master/css/main.css">
   
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>

.contact-form {
    text-align: center;
 
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

}
.banner-area {
    background: url(file:///C:/spring/mavenApp/cultureBOX/src/main/webapp/cssimg/mainback7.jpg) center;  
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
               <h2 class="text-white">Culture Join</h2>
            </div>
         </div>
      </div>
   </section><br>  

   <div class="progress-table" align="center">
      <table class="board_list" align="center">
         <div class="table-head">
         <form:form commandName="cultureModel" action="/culture/admin/CultureJoin.cul" name="mform" enctype="multipart/form-data" method="POST">

                     <tr>
                        <th scope="row">공연명</th>
                        <td><input type="text" id="TITLE" name="CULTURE_NAME"
                           class="background-white form-control border-color-primary"></input> </td>
                     </tr>

                     <tr>

                        <th scope="row">카테고리</th>
                        <td><div class="default-select" id="default-select" "="">
                        <select name="CULTURE_CATEGORY" class="nice-select">
                              <option value="">선택</option>
                              <option value="콘서트">콘서트</option>
                              <option value="연극">연극</option>
                              <option value="뮤지컬">뮤지컬</option>

                        </select></div></td>


                     <tr>   
                        <th scope="row">위치</th>
                        <td><input type="text" id="TITLE" name="CULTURE_LOCATION"
                           class="background-white form-control border-color-primary"></input> </td>
                     </tr>
                     <tr>
                        <th scope="row">시작날짜</th>
                        <td><input type="text" id="TITLE" name="CULTURE_START"
                           class="background-white form-control border-color-primary"></input></td>
                     </tr>
                     <tr>   
                        <th scope="row">종료날짜</th>
                        <td><input type="text" id="TITLE" name="CULTURE_END"
                           class="background-white form-control border-color-primary"></input> </td>
                     </tr>


                     <tr>
                     <th scope="row">좌석 구역</th>
                     <td><input type="text" id="TITLE" name="CULTURE_AREA" class="background-white form-control border-color-primary" ></input>
                     </td>
                  </tr>
                  
                  <tr>
                     <th scope="row">좌석 가격</th>
                     <td><input type="text" id="TITLE" name="CULTURE_PRICE" class="background-white form-control border-color-primary" ></input>
                     </td>
                  </tr>


                  <tr>
                     <th scope="row">상세내용</th>
                     <td><input type="text" style="width:350px; height:400px;" id="TITLE" name="CULTURE_CONTENT" class="background-white form-control border-color-primary" ></input>
                     </td>
                  </tr>
                  
                 
         
               <tr>
                     <th scope="row">포스터</th>
                     <td colspan=3>
                        <input type="file" name="file" value="CULTURE_SAVNAME"/>
                     </td>   
                  </tr>
                  
               </tbody>
            </table>
         </div>
     
        <div class="button-group-area mt-40" style="text-align:center;"  > 
            <c:url var="viewURL" value="CultureListForm.cul" >
            </c:url>
            <a href="${viewURL}" class="genric-btn info-border radius">목록</a> 
  
               <input type="submit" class="genric-btn info radius" value="작성완료" />
            </table>    
         <!-- </div> -->
      </form:form>
    </div>
</div>
<br>
<br>
</body>
   <script src="http://localhost:8080/culture/interior-master/js/vendor/jquery-2.2.4.min.js"></script>
         <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
         <script src="http://localhost:8080/culture/interior-master/js/vendor/bootstrap.min.js"></script>         
         <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
           <script src="http://localhost:8080/culture/interior-master/js/easing.min.js"></script>         
         <script src="http://localhost:8080/culture/interior-master/js/hoverIntent.js"></script>
          <script src="http://localhost:8080/culture/interior-master/js/superfish.min.js"></script>   
          <script src="http://localhost:8080/culture/interior-master/js/jquery.ajaxchimp.min.js"></script>
         <script src="http://localhost:8080/culture/interior-master/js/jquery.magnific-popup.min.js"></script>   
         <script src="http://localhost:8080/culture/interior-master/js/owl.carousel.min.js"></script>                  
         <script src="http://localhost:8080/culture/interior-master/js/jquery.nice-select.min.js"></script>                     
         <script src="http://localhost:8080/culture/interior-master/js/mail-script.js"></script>   
         <script src="http://localhost:8080/culture/interior-master/js/main.js"></script>    
</html>