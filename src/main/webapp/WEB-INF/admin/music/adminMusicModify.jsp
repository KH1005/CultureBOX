<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<SCRIPT type="text/javascript">
   function validation() {

      var frm = document.forms["mform"];

      var album = frm.elements["MUSIC_ALBUM"];
      var artist = frm.elements["MUSIC_ARTIST"];
      var release = frm.elements["MUSIC_RELEASE"];
      var albuminfo = frm.elements["MUSIC_ALBUMINFO"];
      var artistinfo = frm.elements["MUSIC_ARTISTINFO"];
      var song = frm.elements["MUSIC_SONG"];
      var genre = frm.elements["MUSIC_GENRE"];
      var country = frm.elements["MUSIC_COUNTRY"];

      if (album.value == "") {
         alert("앨범이름을 입력해주세요.");
         return false;
      }

      else if (artist.value == "") {
         alert("아티스트 이름을 입력해주세요.");
         return false;
      }

      else if (release.value == "") {
         alert("발매날짜를 입력해주세요.");
         return false;
      }
      /*       
            else if(release.value != "yy-mm-dd") {
                alert("발매날짜를 확인해주세요.");
                return false;
             } */

      else if (albuminfo.value == "") {
         alert("앨범정보를 입력해주세요.");
         return false;
      }

      else if (artistinfo.value == "") {
         alert("아티스트정보를 입력해주세요.");
         return false;
      }

      else if (song.value == "") {
         alert("수록곡을 입력해주세요.");
         return false;
      }

      else if (genre.value == "") {
         alert("장르를 선택해주세요.");
         return false;
      }

      else if (country.value == "") {
         alert("국가를 선택해주세요.");
         return false;
      }

      return true;
   }
</SCRIPT>
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



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.contact-form {
   text-align: center;
}

input[type="text"], input[type="email"], input[type="password"], input[type="number"],
   input[type="date"], input[type="url"], input[type="tel"], textarea {
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
   background:
      url(file:///C:/spring/mavenApp/cultureBOX/src/main/webapp/cssimg/mainback7.jpg)
      center;
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
            <p class="text-white link-nav"></p>
            <br> <br>
            <h2 class="text-white">Music Modify</h2>
         </div>
      </div>
   </div>
   </section>
   <br>


<table class="board_view" align="center" width="20%" > 
            <form:form commandName="adminMusicModel" action="/culture/admin/MusicModify.cul" name="mform" enctype="multipart/form-data" method="POST" onsubmit="return validation()">
               <input type="hidden" name="MUSIC_INDEX" value="${adminMusicModify.MUSIC_INDEX}" />

               <tr>
                  <th scope="row">앨범 이름</th>
                  <td><input type="text" id="TITLE" name="MUSIC_ALBUM"
                     value="${adminMusicModify.MUSIC_ALBUM}"
                     class="background-white form-control border-color-primary"></input>
                  </td>
               </tr>
               <tr>
                  <th scope="row">아티스트이름</th>
                  <td><input type="text" id="TITLE" name="MUSIC_ARTIST"
                     value="${adminMusicModify.MUSIC_ARTIST}"
                     class="background-white form-control border-color-primary"></input>
                  </td>
               </tr>
               <tr>
                  <th scope="row">발매 날짜</th>
                  <td><input type="text" id="TITLE" name="MUSIC_RELEASE"
                     value="${adminMusicModify.MUSIC_RELEASE}"
                     class="background-white form-control border-color-primary"></input>
                  </td>
               </tr>
               <tr>
                  <th scope="row">앨범 정보</th>
                  <td><input type="text" style="width: 400px; height: 200px;"
                     id="TITLE" value="${adminMusicModify.MUSIC_ALBUMINFO}"
                     name="MUSIC_ALBUMINFO"
                     class="background-white form-control border-color-primary"></input>
                  </td>
               </tr>
               <tr>
                  <th scope="row">아티스트 정보</th>
                  <td><input type="text" style="width: 400px; height: 200px;"
                     id="TITLE" value="${adminMusicModify.MUSIC_ARTISTINFO}"
                     name="MUSIC_ARTISTINFO"
                     class="background-white form-control border-color-primary"></input>
                  </td>
               </tr>
               <tr>
                  <th scope="row">수록곡</th>
                  <td><input type="text" style="width: 400px; height: 200px;"
                     id="TITLE" value="${adminMusicModify.MUSIC_SONG}"
                     name="MUSIC_SONG"
                     class="background-white form-control border-color-primary"></input>
                  </td>
               </tr>
               <tr>
               <tr>


                  <th scope="row">음악 장르</th>
               <td> <div class="default-select" id="default-select" "="">
               <select name="MUSIC_GENRE"class="nice-select">   
                     <option value="">장르선택</option>   
                     <option value="발라드">발라드</option>
                     <option value="R&B">R&B</option>
                     <option value="POP">POP</option>
                     <option value="힙합">힙합</option>
                     <option value="댄스">댄스</option>
                     <option value="ROCK">ROCK</option>
                     <option value="트로트">트로트</option>
                     <option value="기타">기타</option>
               </select></div></td>
            </tr>
               

               <tr>

                  <th scope="row">국가</th>
                  <td><div class="default-select" id="default-select""="">
                        <select name="MUSIC_COUNTRY" class="nice-select">
                           <option value="">국가선택</option>
                           <option value="한국">한국</option>
                           <option value="미국">미국</option>
                           <option value="일본">일본</option>
                           <option value="중국">중국</option>
                           <option value="대만">대만</option>
                           <option value="기타">기타</option>
                        </select>
                     </div></td>
               </tr>



               <tr>
                  <th scope="row">포스터</th>
                  <td colspan=3><input type="file" name="file"
                     value="MUSIC_SAVNAME" /></td>
               </tr>

               </tbody>
      </table>
   </div>
   <div class="button-group-area mt-40" style="text-align:center;"  >  
      <td><c:url var="viewURL" value="MusicListForm.cul">
         </c:url> <a href="${viewURL}" class="genric-btn info-border radius">목록</a></td>

       <input type="submit" value="수정"  class="genric-btn info radius"/>
      
      </div>

      </form:form>
   
   </tr>
   <br><br>   
</body>

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