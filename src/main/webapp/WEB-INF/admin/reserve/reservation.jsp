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
<link type="text/css" rel="stylesheet" href="css/reset.css"
   media="screen" />
<link type="text/css" rel="stylesheet" href="css/js-load.css"
   media="screen" />
<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
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
<link rel="stylesheet" type="text/css"
   href="http://localhost:8080/culture/interior-master/css/linearicons.css">
<link rel="stylesheet" type="text/css"
   href="http://localhost:8080/culture/interior-master/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
   href="http://localhost:8080/culture/interior-master/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
   href="http://localhost:8080/culture/interior-master/css/magnific-popup.css">
<link rel="stylesheet" type="text/css"
   href="http://localhost:8080/culture/interior-master/css/nice-select.css">
<link rel="stylesheet" type="text/css"
   href="http://localhost:8080/culture/interior-master/css/animate.min.css">
<link rel="stylesheet" type="text/css"
   href="http://localhost:8080/culture/interior-master/css/owl.carousel.css">
<link rel="stylesheet" type="text/css"
   href="http://localhost:8080/culture/interior-master/css/main.css">
   
   <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  

<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
 <script type="text/javascript">

   var client = 0;
   var sum = 0;
   var state = 0;
   var cnt = 0;
   var tsidx = "";
   var seat_date = "";
   var tbAry = new Array();
   var seatArray = new Array();
   var idxAry = new Array();
   var priceAry = new Array();
     
   function imageChange(i, SEAT_NAME, src, SEAT_PRICE, SEAT_IDX){
   
   var seatArray = src.split("/");
   client = 1;
   
   if(seatArray[seatArray.length - 1] == "smile.png"){
      
      document.getElementById('seat'+i).src = "/culture/img/select.png";
      
      idxAry.push(SEAT_IDX);
      priceAry.push(SEAT_PRICE);
      alert(priceAry);
      cnt = countA(i);
      
      addRow(SEAT_NAME, SEAT_PRICE);

        if(document.getElementById('seat').value != "")
         document.getElementById('seat').value = document.getElementById('seat').value+"/"+SEAT_NAME;
         else 
         document.getElementById('seat').value = SEAT_NAME; 
      }  
    
   /*     if(seatArray[seatArray.length - 1] == "seat_select.png"){
      
      document.getElementById('seat'+i).src = "/culture/img/seat_O.png";
      cnt = countA(i);
      
      deleteRow(${SEAT_NAME}, ${SEAT_PRICE}, ${SEAT_DATE});
      }  
 */   
       if(seatArray[seatArray.length - 1] == "select.png"){
          delete_row(SEAT_NAME);
          idxAry.splice(idxAry.indexOf(SEAT_IDX), 1);
          priceAry.splice(priceAry.indexOf(SEAT_PRICE), 1);
          document.getElementById('seat'+i).src = "/culture/img/smile.png";
          
          cnt = countB(i);
             // 문자열 제거 
             var seatString = document.getElementById("seat").value; 
             seatString = seatString.split(SEAT_NAME).join('');
             seatString = seatString.split("//").join("/");
             
                         
             // 처음 선택한 좌석을 취소했을 때(예외인 경우라 따로 처리)
             if(seatString.charAt(0)=="/") 
                {
                seatString = seatString.slice(1);
                }
             
             document.getElementById('seat').value = seatString;  
      }
          
         for(i=0; i<priceAry.length; i++){
            state += parseInt(priceAry[i]);
            sum = state;
      }
               state = 0;
            
         document.getElementById("sum").innerHTML = sum;
       }
   /* 
   function idxBox(idxAry){
      var box = idxAry;
      $("#idxAry").val(box);
      console.log($("#idxAry").val());      
      } 
   function sendIdx(box, url){
      form.sidx.value = box;
      form.method = "POST";
       form.action = 
       form.submit();
   } */
   
   function countA(i){
         
       if(i>=0)
          cnt++; 
         return cnt;
   }

   function countB(i){ 
      if(i>=0)
         cnt--;
       return cnt; 
   }

      function addRow(SEAT_NAME, SEAT_PRICE) {
            var my_tbody = document.getElementById('my-tbody'); 
            var row = my_tbody.insertRow(my_tbody.rows.length); // 하단에 추가
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            
            cell1.innerHTML = SEAT_NAME;
            cell2.innerHTML = SEAT_PRICE;
          
            tbAry.push(SEAT_NAME, SEAT_PRICE);
         }
    
         function delete_row(SEAT_NAME) {
           
               var my_tbody = document.getElementById('my-tbody'); 
              if (my_tbody.rows.length < 1) return; 
            
            my_tbody.deleteRow(tbAry.indexOf(SEAT_NAME)+1);
           tbAry.splice(tbAry.indexOf(SEAT_NAME), 1);
         }
      
         /* function cal(){
            var Total = sum;
            alert(Total);
             for(k=0; k<idxAry.length; k++){
                tsidx = tsidx + idxAry[k]+',';
             } 
         } */
         
          
            
         
          function pageChange(){
            var page = document.getElementById("select_date");
            seat_date = page.options[page.selectedIndex].value;
            
            window.location.href='http://localhost:8080/culture/reserve/reservationForm.cul?seat_date='+seat_date+'&culture_idx='+${ctDetail.CULTURE_IDX}
         }  
         
         
       /* $(function() {
      
         $("#seat_date").change(function() {
         var params = "";
         var page = document.getElementById("select_date");
         var seat_date = page.options[page.selectedIndex].value;
         
         params = "seat_date="seat_date;
         $.ajax(
            url:"http://localhost:8080/culture/reserve/reserveForm.cul",
            type:"POST",
            dataType:"json",
            data:params,
            success: function(obj){
                  var stList = obj.seatList;
                  if(stList == null){
                     alert("null");
                  }else
                     $(function(stList){
                        $(seatLength).text(Object.keys(stList).length)
                     });
                  },
            
            error: function(obj){
               alert("에러발생:");
         //new ajax.xhr.Request("http://localhost:8080/culture/eval/MusicEval.box", params, insertStar, "POST");
         
         }
      });
   });
});  */
function payForm(){
   
    var Total = sum;
      
      for(k=0; k<idxAry.length; k++){
         tsidx = tsidx + idxAry[k]+',';
      } alert(tsidx);
        alert(sum);
   document.reservation.tsidx.value=tsidx;
   document.reservation.Total.value=Total;
   document.reservation.action='http://localhost:8080/culture/reserve/reservation.cul';
   document.reservation.submit();
   }
   
$('#datepicker').datepicker({
    	inline: true,
    	showOtherMonths: true,
    	showMonthAfterYear: true,
    	monthNames: [ '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12' ],
    	dayNamesMin: ['일', '월', '화', '수', '목', '금', '토']	
	});
</script>

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

.ui-datepicker {
  width: 216px;
  height: auto;
  margin: 5px auto 0;
  font: 9pt Arial, sans-serif;
  -webkit-box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, .5);
  -moz-box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, .5);
  box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, .5);
}

.ui-datepicker a {
  text-decoration: none;
}

.ui-datepicker table {
  width: 100%;
}

.ui-datepicker-title {
  text-align: center;
}

.ui-datepicker-prev {
  float: left;
  background-position: center -30px;
}
.ui-datepicker-next {
  float: right;
  background-position: center 0px;
}

.ui-datepicker thead {
  background-color: #f7f7f7;
  background-image: -moz-linear-gradient(top,  #f7f7f7 0%, #f1f1f1 100%);
  background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#f7f7f7), color-stop(100%,#f1f1f1));
  background-image: -webkit-linear-gradient(top,  #f7f7f7 0%,#f1f1f1 100%);
  background-image: -o-linear-gradient(top,  #f7f7f7 0%,#f1f1f1 100%);
  background-image: -ms-linear-gradient(top,  #f7f7f7 0%,#f1f1f1 100%);
  background-image: linear-gradient(top,  #f7f7f7 0%,#f1f1f1 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f7f7f7', endColorstr='#f1f1f1',GradientType=0 );
  border-bottom: 1px solid #bbb;
}

.ui-datepicker th {
  text-transform: uppercase;
  font-size: 6pt;
  padding: 5px 0;
  color: #666666;
  text-shadow: 1px 0px 0px #fff;
  filter: dropshadow(color=#fff, offx=1, offy=0);
}
</style>
</head>
<body>

<form id="reservation" name="reservation" method="post" >
   
    <input type="hidden" name="tsidx" id="tsidx" value="" />
    <input type="hidden" name="seat_date" value="seat_date" />
   <input type="hidden" name="Total" id="Total" value="" />
   
   <input type="hidden" name="seat_name" id="seat" value="" />

   <header id="header" id="home">

      <div class="container main-menu">
         <div class="row align-items-center justify-content-between d-flex">
            <div id="logo">
               <a href="index.html"><img src="img/logo.png" alt="" title="" /></a>
            </div>

            <!-- #nav-menu-container -->
         </div>
      </div>
   </header>
   <!-- #header -->

   <!-- start banner Area -->
   <section class="banner-area relative" id="home">
      <div class="overlay overlay-bg"></div>
      <div class="container">
         <div class="row d-flex align-items-center justify-content-center">
            <div class="about-content col-lg-12">
               <h1 class="text-white">Culture Details</h1>
            </div>
         </div>
      </div>
   </section>
   <!-- End banner Area -->

   <!-- Start project-details Area -->
   <section class="project-details-area section-gap">
      <div class="container">
         <div class="row align-items-center">
            <div class="col-lg-6 project-details-left">
               <img class="img-fluid"
                  src="http://localhost:8080/culture/cultureimg/${cultureModel.CULTURE_SAVNAME}"
                  width="400" height="450" alt="">
            </div>
            <div class="col-lg-6 project-details-right">
               <h3 class="pb-20">${cultureModel.CULTURE_NAME}</h3>
               <p></p>
               <div class="details-info d-flex flex-row">
                
                   
                    
                    
                  
        
    		<div id="datepicker"></div>               
                     날짜선택 :<select id="select_date" name="select_date" onchange="pageChange()">
                         <option value="">선택</option>
                         <option value="2018-11-13">2018-11-13</option>
                         <option value="2018-11-14">2018-11-14</option>
                         <option value="2018-11-15">2018-11-15</option>
                         <option value="2018-11-16">2018-11-16</option>
                         </select>
                     </li>
                    
                   
                  </ul>
               </div>
              <%--  <div class="social-links mt-30">
                  <a class="genric-btn primary radius"
                     href="http://localhost:8080/culture/reserve/seatList.cul?culture_idx=${cultureModel.CULTURE_IDX}">예매하기</a>
                  <a class="genric-btn primary radius"
                     href="http://localhost:8080/culture/concert/CultureList.cul">목록</a>
               </div> --%>
            </div>

         <div class="row align-items-center">
            <div class="col-lg-6 project-details-left" style="padding-left: 319px;">
               <p>
               <h3 class="sub_tit">좌석가격</h3>
               
               <p class="summary">
                  <font color="#848484">
                   <c:forEach var="priceList" items="${priceList}" varStatus="stat">
                     <c:set var="index_r" value="${stat.index mod 5}" />
                     <c:if test="${index_c == 0}">
                        <br>
                     </c:if>
                     <p class="tit">${priceList}</p>
                     </c:forEach>
                  
                  </font>
               </p>
               <p><h5>장소: ${ctDetail.CULTURE_LOCATION}</h5>
              </div>
        
              <div class="col-lg-6 project-details-right" style="padding-right: -28px; padding-left: 0px; width:965px; height: 193px;">
               <h3 class="sub_tit">좌석 배치도</h3>
          <br>
               <font color="#848484">잔여석 : 
             <c:if test="${fn:length(avList) le 0}"> 날짜를 선택해 주세요</c:if>
                 <c:if test="${fn:length(avList) > 0}">${fn:length(avList)}</c:if></p>
                 
                 
                 <c:forEach var="seatList" items="${seatList}" varStatus="stat">
       
                     <c:set var="index_r" value="${stat.index mod 5}" />
                     <c:set var="index_c" value="${stat.index mod 10}" />
   
                     <c:if test="${(index_r == 0) && (index_c != 0)}">&nbsp;</c:if>
                     <c:if test="${index_c == 0}">
                        <br>
                        <br>
                     </c:if>

                     <c:if test="${seatList.SEAT_RESERVED == 'N'}">
                        <img src="/culture/img/smile.png" id="seat${stat.index}" onclick="imageChange(${stat.index}, '${seatList.SEAT_NAME}', src, '${seatList.SEAT_PRICE}', '${seatList.SEAT_IDX}');"
                           style="width: 20px; height: auto;" />
            
                     </c:if>
                     <c:if test="${seatList.SEAT_RESERVED == 'Y' }">
                        <img src="/culture/img/sad.png" id="seat${stat.index}"
                           style="width: 20px; height: auto;" />
                     </c:if>
                  </c:forEach>
                   <div class="social-links mt-30">
                  <a class="genric-btn primary radius"
                     onclick="payForm()">예매하기</a>
                  <a class="genric-btn primary radius"
                     href="http://localhost:8080/culture/concert/CultureList.cul">목록</a>
               </div>
                   <table align="right" style="margin-bottom: 100%; width="20%">
                  <thead
                     style="background: #ff5d48; color: #fff; text-align: right">
                     <tr style="padding: 10px;">
                     
                        <th rowspan="1" colspan="1" style="width: 90px;">좌석 이름</th>
                        <th rowspan="1" colspan="1" style="width: 90px;">좌석 금액</th>
                     </tr>
                  </thead>
                  <tbody id="my-tbody" style="text-align: center; font-size: 13px">
                     <tr class="zoneList"> </tr>
                  </tbody>
                  <tr>
                  <th>총 금액</th>
                           <td><span id="sum" name="sum">0</span>원</td>
                     </tr>
               </table>
               </div>
             
            </div>
         </div>

         <p>
            <br> <br>
         <div>
            <h3></h3>
         </div>
  

         <!-- <table> -->

      <!-- </div> -->
   </section>

   <!-- End project-details Area -->

   <!-- Start brands Area -->
   <section class="brands-area pb-60 pt-60">
      <div class="container no-padding">
         <div class="brand-wrap">
            <div
               class="row align-items-center active-brand-carusel justify-content-start no-gutters">
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
                  <p>If you own an Iphone, you’ve probably already worked out
                     how much fun it is to use it to watch movies-it has that.</p>
                  <p class="footer-text">
                     <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                     Copyright &copy;
                     <script>
                        document.write(new Date().getFullYear());
                     </script>
                     All rights reserved | This template is made with <i
                        class="fa fa-heart-o" aria-hidden="true"></i> by <a
                        href="https://colorlib.com" target="_blank">Colorlib</a> and
                     distributed by <a href="https://themewagon.com/" target="_blank">ThemeWagon</a>
                     <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                  </p>
               </div>
            </div>
            <div class="col-lg-5  col-md-6 col-sm-6">
               <div class="single-footer-widget">
                  <h6>Newsletter</h6>
                  <p>Stay update with our latest</p>
                  <div class="" id="mc_embed_signup">
                     <form target="_blank" novalidate="true"
                        action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
                        method="get" class="form-inline">
                        <input class="form-control" name="EMAIL"
                           placeholder="Email Address" onfocus="this.placeholder = ''"
                           onblur="this.placeholder = 'Email Address'" required=""
                           type="email">
                        <button class="click-btn btn btn-default">
                           <i class="lnr lnr-arrow-right" aria-hidden="true"></i>
                        </button>
                        <div style="position: absolute; left: -5000px;">
                           <input name="b_36c4fd991d266f23781ded980_aefe40901a"
                              tabindex="-1" value="" type="text">
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
                     <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
                        class="fa fa-twitter"></i></a> <a href="#"><i
                        class="fa fa-dribbble"></i></a> <a href="#"><i
                        class="fa fa-behance"></i></a>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </footer>
   <!-- End footer Area -->

   <script src="js/vendor/jquery-2.2.4.min.js"></script>
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
      integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
      crossorigin="anonymous"></script>
   <script src="js/vendor/bootstrap.min.js"></script>
   <script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
   <script src="js/easing.min.js"></script>
   <script src="js/hoverIntent.js"></script>
   <script src="js/superfish.min.js"></script>
   <script src="js/jquery.ajaxchimp.min.js"></script>
   <script src="js/jquery.magnific-popup.min.js"></script>
   <script src="js/owl.carousel.min.js"></script>
   <script src="js/jquery.nice-select.min.js"></script>
   <script src="js/mail-script.js"></script>
   <script src="js/main.js"></script>
   </form>
</body>
</html>