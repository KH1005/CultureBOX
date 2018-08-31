<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.css">
<meta charset="utf-8" />
<link rel="icon" type="image/png" href="assets/img/favicon.ico">
<link rel="apple-touch-icon" sizes="76x76"
   href="assets/img/apple-icon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />


<meta
   content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
   name='viewport' />
<meta name="viewport" content="width=device-width" />

<link
   href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
   type="text/css" rel="stylesheet" />
<link
   href="${pageContext.request.contextPath}/resources/css/paper-kit.css?v=2.0.1"
   type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/demo.css"
   rel="stylesheet" type="text/css" />

<!--     Fonts and icons     -->
<link
   href='http://fonts.googleapis.com/css?family=Montserrat:400,300,700'
   rel='stylesheet' type='text/css'>
<link
   href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
   rel="stylesheet">
<link
   href="${pageContext.request.contextPath}/resources/css/nucleo-icons.css"
   type="text/css" rel="stylesheet" />


<!-- <link rel="shortcut icon" href="resources/admin/images/favicon.ico"> -->
<link rel="shortcut icon" type="image/png"
   href="../resources/admin/images/favicon.ico">

<!-- Core JS Files -->
<script src="resources/js/jquery-3.2.1.js" type="text/javascript"></script>
<script src="resources/js/jquery-ui-1.12.1.custom.min.js"
   type="text/javascript"></script>
<script src="resources/js/popper.js" type="text/javascript"></script>
<script src="resources/js/bootstrap.min.js" type="text/javascript"></script>

<!-- Plugin for Share buttons -->
<script src="resources/js/jquery.sharrre.js"></script>

<!-- Plugin for Switches -->
<script src="resources/js/bootstrap-switch.min.js"></script>

<!--  Plugins for Slider -->
<script src="resources/js/nouislider.js"></script>

<!--  Plugins for DateTimePicker -->
<script src="resources/js/moment.min.js"></script>
<script src="resources/js/bootstrap-datetimepicker.min.js"></script>

<!--  Paper Kit Initialization and functons -->
<script src="resources/js/paper-kit.js?v=2.1.0"></script>
 
<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/admin/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/admin/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/admin/css/bootstrap-checkbox.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/admin/css/bootstrap-grid.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/admin/css/bootstrap-grid.min.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/admin/css/bootstrap-reboot.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/admin/css/bootstrap-reboot.min.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/admin/css/comming-soon.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/admin/css/login.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/admin/css/pricing-tables.css">

<!-- Font Awesome CSS -->
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/admin/font-awesome/css/font-awesome.min.css">

<!-- Custom CSS -->
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/admin/css/style.css">

<!-- BEGIN CSS for this page -->
<link rel="stylesheet" type="text/css"
   href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css" />
<!-- END CSS for this page -->

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
   
   if(seatArray[seatArray.length - 1] == "seat_O.png"){
      
      document.getElementById('seat'+i).src = "/culture/img/seat_select.png";
      
      idxAry.push(SEAT_IDX);
      priceAry.push(SEAT_PRICE);
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
       if(seatArray[seatArray.length - 1] == "seat_select.png"){
          delete_row(SEAT_NAME);
          idxAry.splice(idxAry.indexOf(SEAT_IDX), 1);
          priceAry.splice(priceAry.indexOf(SEAT_PRICE), 1);
          document.getElementById('seat'+i).src = "/culture/img/seat_O.png";
          
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
      } alert(tsidx);// SIDX 가 ,붙혀서 찍힌다.
        alert(sum);
   document.reservation.tsidx.value=tsidx;
   document.reservation.Total.value=Total;
   document.reservation.action='http://localhost:8080/culture/reserve/reservation.cul';
   document.reservation.submit();
   }
   
</script>
</head>

<body>
<form id="reservation" name="reservation" method="post" >
   
    <input type="hidden" name="tsidx" id="tsidx" value="" />
    <input type="hidden" name="seat_date" value="seat_date" />
   <input type="hidden" name="Total" id="Total" value="" />
   
   <input type="hidden" name="seat_name" id="seat" value="" />

<div class="seatList">
<h2></h2><div class="wrap">
         <div class="topArea">
         <div style="border: 0px solid gold; float: left; width: 40%;">
            <h4 style="color:white; margin-top:0px; padding-top: 20px">&nbsp;&nbsp;&nbsp;티켓 예매</h4>
                
      <div class="culture_pic">
         <img src="/project/upload/movie/${ctDetail.CULTURE_SAVNAME}"
            width="150" height="300" /> 
      </div>
      
      <div class="second">
         <p class="tit">${ctDetail.CULTURE_NAME}</p>
                <div class="culture_price">
                   <p class="tit">좌석 가격
                   <c:forEach var="priceList" items="${priceList}" varStatus="stat">
                     <c:set var="index_r" value="${stat.index mod 5}" />
                     <c:if test="${index_c == 0}">
                        <br>
                     </c:if>
                     <p class="tit">${priceList}</p>
                     </c:forEach>
                </div>
                <div class="culture_location" id="culture_location">공연 장소 : ${ctDetail.CULTURE_LOCATION }
                </div> 
            </div>
          </div>
         <div class="bodyZone">
            <div style="border: 1px solid gold; float: left; width: 40%;">
               <div class="date" style="float: left; width: 637px; height: 637px;">공연 날짜 선택
                     <select id="select_date" name="select_date" onchange="pageChange()">
                         <option value="">선택</option>
                         <option value="2018-11-13">2018-11-13</option>
                         <option value="2018-11-14">2018-11-14</option>
                         <option value="2018-11-15">2018-11-15</option>
                         <option value="2018-11-16">2018-11-16</option>
                         </select>
            <c:if test="${fn:length(avList) le 0}">   
                        <div class="remainSeat" id="remainSeat">잔여석 : 날짜를 선택해 주세요
                        </c:if>
                      <c:if test="${fn:length(avList) > 0}">      
                        <div class="remainSeat" id="remainSeat">잔여석 : ${fn:length(avList)}
                        </c:if>
                        </form>                     
               <!-- <div class="remainSeat" id="remainSeat">잔여석 : <p class="seatLength">날짜를 선택해 주세요</p> 
                         -->
               <div class="seatTable" align="center">
                  <c:forEach var="seatList" items="${seatList}" varStatus="stat">
                ${seatList.SEAT_IDX}
                     <c:set var="index_r" value="${stat.index mod 5}" />
                     <c:set var="index_c" value="${stat.index mod 10}" />
   
                     <c:if test="${(index_r == 0) && (index_c != 0)}">&nbsp;</c:if>
                     <c:if test="${index_c == 0}">
                        <br>
                        <br>
                     </c:if>

                     <c:if test="${seatList.SEAT_RESERVED == 'N'}">
                        <img src="/culture/img/seat_O.png" id="seat${stat.index}" onclick="imageChange(${stat.index}, '${seatList.SEAT_NAME}', src, '${seatList.SEAT_PRICE}', '${seatList.SEAT_IDX}');"
                           style="width: 12px; height: auto;" />
            
                     </c:if>
                     <c:if test="${seatList.SEAT_RESERVED == 'Y' }">
                        <img src="/culture/img/seat_X.png" id="seat${stat.index}"
                           style="width: 12px; height: auto;" />
                     </c:if>
                  </c:forEach>
                  &nbsp;
                </div></div></div></div></div>
                
                          <table id="example1"
                  class="table table-bordered table-responsive-xl table-hover display dataTable no-footer"
                  style="margin-bottom: 100%; width="20%">
                  <thead
                     style="background: #ff5d48; color: #fff; text-align: center">
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

                                             
                         <%--    <c:if test ="${stat.index % 5 eq 0}">
                              <tr></tr>
                           </c:if>
                           <td width="230" align="center">
                           <a class="show" href='http://localhost:8080/culture/admin/CultureDetail.cul'><img src="../webapp/img/seat_O.png" width="20px" height="20px">
                           </a>  --%>
               
                  
                  
 <%--                      
                            <c:if test= "${rev.SEAT_RESERVED == 'N' && stat.index % 10 eq 0} ">     
                     <td width="230" align="center">
                        <a class="show" href='http://localhost:8080/culture/admin/CultureDetail.cul'><img src="/src/main/webapp/img/seat_O.png" width="10px" height="10px">
                           </a></td></c:if>
                     <c:if test="${row.SEAT_RESERVED == 'Y'}">
                     </c:if> 
                            <c:if test ="${stat.index % 5 eq 0}">
                                <tr></tr>
                                </c:if>
                        <img src="/src/main/webapp/img/seat_X.png" id="seat${stat.index}"
                           style="width: 12px; height: auto;" />
  --%>
                        
         <div class="groundList">
                  </div>
            <div style="text-align: center;">
               <input type="button" onclick="payForm()" value="선택완료" />
            </div>
         </div>

</body>