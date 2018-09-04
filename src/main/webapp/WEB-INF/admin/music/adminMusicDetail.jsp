<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
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
<style>
   .verticalLine {
      border-left: thick solid #777;
      padding-left: 12px;
   }
</style>
<style type="text/css">
      .modal .modal-dialog {  
        width: 400px;
      }
      .click-callback i { margin:0 3px; font-size:16px !important; }
      .banner-area {
    background: url(<c:url value='/musicimg/${music.MUSIC_SAVNAME }'/>) center;
    background-size: cover;
}
</style>
<script type="text/javascript">
function delchk(){
    return confirm("삭제하시겠습니까?");

}
</script>
<script>
function delchk(){
    return confirm("삭제하시겠습니까?");

}
</script>
<script type="text/javascript">
$(window).on('load', function () {
    load('#js-load', '4');
    $("#js-btn-wrap .button").on("click", function () {
        load('#js-load', '4', '#js-btn-wrap');
    })
});
 
function load(id, cnt, btn) {
    var girls_list = id + " .js-load:not(.active)";
    var girls_length = $(girls_list).length;
    var girls_total_cnt;
    if (cnt < girls_length) {
        girls_total_cnt = cnt;
    } else {
        girls_total_cnt = girls_length;
        $('.button').hide()
    }
    $(girls_list + ":lt(" + girls_total_cnt + ")").addClass("active");
}
</script>
</head>  
<body>

   <!-- start banner Area -->
   <section class="banner-area relative" id="home">
      <div class="overlay overlay-bg"></div>
      <div class="container">
         <div class="row d-flex align-items-center justify-content-center">
            <div class="about-content col-lg-12">
               <br>
               <p class="text-white link-nav"></p>
               <br> <br>   
               <h2 class="text-white">${adminMusicModel.MUSIC_ALBUM }</h2>
            </div>  
         </div>
      </div>
   </section>
   
   
   
   <section class="project-details-area section-gap">
            <div class="container">
               <div class="row align-items-center">
                  <div class="col-lg-6 project-details-left">
                     <img class="img-fluid" src="<c:url value='/musicimg/${adminMusicModel.MUSIC_SAVNAME}'/>" alt="" height="500" width="500">
                  </div>
                  <div class="col-lg-6 project-details-right">
                     <h3 class="pb-20">${adminMusicModel.MUSIC_ALBUM }</h3>
                     <p>
                        ${adminMusicModel.MUSIC_ALBUMINFO}
                     </p>   
                     <div class="details-info d-flex flex-row">
                        <ul class="names">
                           <li>Album    </li>
                           <li>Artist   </li>
                           <li>Genre    </li>
                           <li>Country  </li>
                           <li>Song </li>
                        </ul>
                        <ul class="desc">
                     
                           <li>: ${adminMusicModel.MUSIC_ALBUM}</li>
                           <li>: ${adminMusicModel.MUSIC_ARTIST}</li>  
                           <li>: ${adminMusicModel.MUSIC_GENRE}</li>
                           <li>: ${adminMusicModel.MUSIC_COUNTRY}</li>  
                           <li>:
                              <c:forEach var="row" items="${songList }" varStatus="stat">
                                  <div>${stat.count}.${row}</div>
                                 
                               </c:forEach>
                           </li>
                        </ul>                     
                     </div>   </div></div></div>
                          
                     <div class="social-links mt-30">  
                     <c:url var="viewURL" value="MusicListForm.cul" >
                              </c:url>
                        <a href="${viewURL}">목록</a>
                        <c:url var="viewURL" value="MusicModifyForm.cul" >
                         <c:param name="MUSIC_INDEX" value="${adminMusicModel.MUSIC_INDEX}" />
                         </c:url> 
                        <a href="${viewURL}">수정</a>  
                         <c:url var="viewURL" value="MusicDelete.cul" >
               <c:param name="MUSIC_INDEX" value="${adminMusicModel.MUSIC_INDEX}" />
            </c:url>
                        <a href="${viewURL}" onclick="return delchk()">삭제</a>   
               
         <!-- End banner Area -->   
      
    <br/>
    
    
     <br/>
     
     
    <div class="">
     <c:choose>
         <c:when test="${fn:length(musicCommentList) > 0}">
         <div id="contents" style="height:546px; width:600px; margin-left:0px border-left-width:10px">
         <div id="js-load" class="main">
          <ul class="lists">
            <c:forEach items="${musicCommentList}" var="row"  varStatus="stat" >
                <li class="lists__item js-load">
                   <strong>${row.MCOMMENT_WRITER }</strong>님 
                   <fmt:formatDate value="${row.MCOMMENT_WRITEDATE}" pattern="yy.MM.dd"></fmt:formatDate>
                    <a href='http://localhost:8080/culture/admin/deleteMusicComment.cul?MCOMMENT_IDX=${row.MCOMMENT_IDX}&MCOMMENT_MUSICIDX=${adminMusicModel.MUSIC_INDEX}'
                     class="btn btnC_01 btnP_02" onclick="return delchk()"> <span class="btn btnC_05 reply_btn">삭제</span>
               </a>
               <p>${row.MCOMMENT_CONTENT}</p>
                </li>
              
         </c:forEach> 
          </ul></div></div>
          
          
          
          
          
             <div id="js-btn-wrap" class="btn-wrap"><a href="javascript:;" class="button">더보기</a></div>
             <div class="btn_type_04">
                <!-- <a href="javascript:history.back()" class="btn btnC_03 btnF_02 mr10">
             <span>목록</span></a> -->
                <!--  <a href="javascript:history.back()" class="btn btnC_03 btnF_02 mr10">
             <span>목록</span></a> -->
               </div>
         </c:when>
            <c:otherwise>
               <tr>
               <td colspan="4">등록된 댓글이 없습니다</td>
               </tr>
            </c:otherwise>
          
   </c:choose>
   
   

    
 
   	
    </div></div></section> 
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
     