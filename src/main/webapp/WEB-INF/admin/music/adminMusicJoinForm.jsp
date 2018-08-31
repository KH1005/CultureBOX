<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>
.banner-area {
   background:
      url(file:///C:/spring/mavenApp/cultureBOX/src/main/webapp/cssimg/mainback7.jpg)  
      center;
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

</style>




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

         if(album.value == "") {
            alert("앨범이름을 입력해주세요.");
            return false;
         }    
         
         else if(artist.value == "") {
            alert("아티스트 이름을 입력해주세요.");
            return false;
         }
         
         else if(release.value == "") {
             alert("발매날짜를 입력해주세요.");
             return false;
          }
   /*       
         else if(release.value != "yy-mm-dd") {
             alert("발매날짜를 확인해주세요.");
             return false;
          } */
         
        
         else if(albuminfo.value == "") {
            alert("앨범정보를 입력해주세요.");
            return false;         
         } 
         
         else if(artistinfo.value == "") {
             alert("아티스트정보를 입력해주세요.");
             return false;         
          } 
         
         else if(song.value == "") {
             alert("수록곡을 입력해주세요.");
             return false;         
          } 
         
         else if(genre.value == "") {
             alert("장르를 선택해주세요.");
             return false;         
          } 
         
         else if(country.value == "") {
             alert("국가를 선택해주세요.");
             return false;         
          } 
         
         
         
         
         
         
         return true;
      }
   </SCRIPT>
   
   
   
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
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
               <h2 class="text-white">Music Join</h2>
            </div>
         </div>
      </div>
   </section>


<div class="progress-table">
      <table class="board_list" align="center">
         <div class="table-head">
   <form action="/culture/admin/MusicJoin.cul" name="mform" enctype="multipart/form-data" method="POST" onsubmit="return validation()">

         <tbody>   
            <tr><br><br>
               <th scope="row">앨범 이름</th>
               <td><input type="text" id="TITLE" name="MUSIC_ALBUM"
                  class="background-white form-control border-color-primary"></input></td> 
            </tr>
            <tr>
               <th scope="row">아티스트이름</th>
               <td><input type="text" id="TITLE" name="MUSIC_ARTIST"
                  class="background-white form-control border-color-primary"></input></td>
            </tr>
            <tr>
               <th scope="row">발매 날짜</th>
               <td><input type="text" id="TITLE" name="MUSIC_RELEASE"
                  class="background-white form-control border-color-primary"></input> <span class="ibk"><font color="red">예)
                        2016-05-27</font></span></td>
            </tr>
            <tr>
               <th scope="row">앨범 정보</th>
               <td><input type="text" style="width: 400px; height: 200px;"
                  id="TITLE" name="MUSIC_ALBUMINFO" class="background-white form-control border-color-primary"></input></td>
            </tr>
            <tr>
               <th scope="row">아티스트 정보</th>
               <td><input type="text"
                  style="width: 400px; height: 200px;" id="TITLE"
                  name="MUSIC_ARTISTINFO" class="background-white form-control border-color-primary"></input></td>
            </tr>
            <tr>
               <th scope="row">수록곡</th>  
               <td><input type="text"  
                  style="width: 400px; height: 200px;" id="TITLE" name="MUSIC_SONG"
                  class="background-white form-control border-color-primary"></input> <font color="red">예)
                     애국가1절/애국가2절/애국가3절</font></td>
            </tr>
            


               <th scope="row">음악 장르</th>
               <td><select name="MUSIC_GENRE">
                     <option value="">장르선택</option>
                     <option value="발라드">발라드</option>
                     <option value="R&B">R&B</option>
                     <option value="POP">POP</option>
                     <option value="힙합">힙합</option>
                     <option value="댄스">댄스</option>
                     <option value="ROCK">ROCK</option>
                     <option value="트로트">트로트</option>
                     <option value="기타">기타</option>
               </select></td>
            </tr>

            <tr>

               <th scope="row">국가</th>
               <td><select name="MUSIC_COUNTRY">
                     <option value="">국가선택</option>
                     <option value="한국">한국</option>
                     <option value="미국">미국</option>
                     <option value="일본">일본</option>
                     <option value="중국">중국</option>
                     <option value="대만">대만</option>
                     <option value="기타">기타</option>
               </select></td>
            </tr>

            <tr>
               <th scope="row">포스터</th>
               <td colspan=3><input type="file" name="file"
                  value="MUSIC_SAVNAME" /></td>
            </tr>

         </tbody>
         </table></div>
   
  
<div class="" style="text-align:center;"  >
      <c:url var="viewURL" value="MusicListForm.cul">
         </c:url> <a href="${viewURL}">목록</a>
         <input type="submit" value="작성완료" />
   </div>
   </form>
   
   </tbody>
  
  
<br>  
<br>
</body>
</html>