<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<script src="<c:url value='/js/common.js'/>"></script>
<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
<script src="../common/js/html5shiv.js"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta name="viewport"
   content="width=device-width, maximum-scale=1, minimum-scale=1, user-scalable=no" />
<meta name="format-detection" content="telephone=no">
<script src="js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="js/js-load.js"></script>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
   content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta charset="UTF-8" />

<!-- Site Title -->
<title>Interior</title>

<link
   href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
   rel="stylesheet">
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

<style type="text/css">

.js-load {
   display: none;
}

.js-load.active {
   display: block;
}

.is_comp.js-load:after {
   display: none;
}

.btn-wrap, .lists, .main {
   display: block;
}

.btn-wrap {
   text-align: left;
}

.table_goods_info th {
   background: #ffffff;
   color: #5e5e5e;
   border: 1px solid #e2e2e2;
   text-align: left;
   font-size: 10px;
   letter-spacing: -1px;
   letter-spacing: -1px;
   padding: 0 5px;
}

.table_goods_info td {
   background: #ffffff;
   border-collapse: collapse;
   border: 1px solid #e2e2e2;
   padding: 4px 10px 7px;
   font-size: 10px;
}

.com_Div {
   border: 1px solid #ccc;
   padding: 10px;
   margin-top: 10px;
}

#box1 {
   align: right;
}
</style>
<style type="text/css">
      .modal .modal-dialog {  
        width: 400px;
      }
      .click-callback i { margin:0 3px; font-size:16px !important; }
      .banner-area {
    background: url(<c:url value='/musicimg/${adminMusicModel.MUSIC_SAVNAME }'/>) center;
    background-size: cover;
}
</style>
<script type="text/javascript">
   $(window).on('load', function() {
      load('#js-load', '4');
      $("#js-btn-wrap .button").on("click", function() {
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
<script type="text/javascript">
function delchk(){   
    return confirm("삭제하시겠습니까?");

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
                     
                           <li>:${adminMusicModel.MUSIC_ALBUM}</li>
                           <li>:${adminMusicModel.MUSIC_ARTIST}</li>  
                           <li>:${adminMusicModel.MUSIC_GENRE}</li>
                           <li>:${adminMusicModel.MUSIC_COUNTRY}</li>  
                              <li><c:forEach var="row" items="${songList }" varStatus="stat">
                                  <div>${stat.count}.${row}</div>
                                 
                               </c:forEach>
                           </li> 
                        </ul>                     
                     </div>   
                          
                     <div class="social-links mt-30">  
                     <c:url var="viewURL" value="MusicListForm.cul" >
                              </c:url>
                        <a href="${viewURL}"><span class="lnr lnr-undo"></span></a>&nbsp;&nbsp;&nbsp;  
                        <c:url var="viewURL" value="MusicModifyForm.cul" >
                         <c:param name="MUSIC_INDEX" value="${adminMusicModel.MUSIC_INDEX}" />
                         </c:url> 
                        <a href="${viewURL}"><span class="lnr lnr-cog"></span></a>&nbsp;&nbsp;&nbsp;    
                         <c:url var="viewURL" value="MusicDelete.cul" >
               <c:param name="MUSIC_INDEX" value="${adminMusicModel.MUSIC_INDEX}" />
            </c:url>
                        <a href="${viewURL}" onclick="return delchk()"><span class="lnr lnr-trash"></span></a>   
               </div>  </div>  </div>
         <!-- End banner Area -->     
      
    <br/>
   
     <br/>
     
     
                     
               
     
  <p>
            <br> <br>
         <div>
            <h3>Comment</h3>
         </div>

        
			 <div style="overflow:auto;">
         <c:choose>
            <c:when test="${fn:length(musicCommentList) > 0}">
               <div id="contents"
                  style="height: 500px; width: 600px; margin-left: 0px border-left-width:10px">
                  
                  <div id="js-load" class="main">
                     <ul class="lists">
                        <c:forEach items="${musicCommentList}" var="row"
                           varStatus="stat">
                           <li class="lists__item js-load">



                              <div style="float: left; font-size: 12px;">
                                 <span style="display: inline-block;">${row.MCOMMENT_WRITER }님</span>
                                 <span style="display: inline-block; margin-right: 10px;">|
                                    <fmt:formatDate value="${row.MCOMMENT_WRITEDATE}" pattern="yy.MM.dd"></fmt:formatDate>
                                 </span>
                              </div>


                              <div id="com_Div" class="com_Div">
                                 <input type="hidden" value="${row.MCOMMENT_CONTENT}" id="com_CON" name="com_CON"> 
                                 <input type="hidden" value="${row.MCOMMENT_IDX}" id="com_NO" name="com_NO">  
                                    <a href='http://localhost:8080/culture/admin/deleteMusicComment.cul?MCOMMENT_IDX=${row.MCOMMENT_IDX}&MCOMMENT_MUSICIDX=${adminMusicModel.MUSIC_INDEX}'
                                    onclick="return delchk()"><font size=2 color=#00a8f0>삭제</font></a>
                                 
                                 <p>
                                    <font size=2><strong>${row.MCOMMENT_CONTENT}</strong></font>
                                 </p>
                              </div>


                           </li>

                        </c:forEach>

                     </ul>  

                     <div id="js-btn-wrap" class="btn-wrap">
                        <a href="javascript:;" class="button"><font color=#00a8f0>더보기</font></a>
                     </div>
                     <div class="btn_type_04"></div>
                  </div>
               </div>
			</div>
            </c:when>
            
            
            <c:otherwise>
               <br>
               <br>
               <tr>
                  <td colspan="4"><font size=2>등록된 댓글이 없습니다.</font></td>
               </tr>
            </c:otherwise>
         </c:choose>
         
      </div> 
   </section> 

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
     