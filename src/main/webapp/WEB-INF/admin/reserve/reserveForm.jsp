<%@ page language="java" contentType="text/html;charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>좌석 선택</title>

<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/css/sample.css">

<style>
a:visited {
   color: inherit;
}
</style>

<script type="text/javascript">
 
/* var onSelectSeat = function(){
	   var seatSelectForm = document.getElementById("reserveForm");  
	   seatSelectForm.action ="seatList.cul?seat_date="${SEAT_DATE};
	   seatSelectForm.submit(); 
	   } */

function pageChange(){
	alert("function on");
	var page = document.getElementById("select_date");
	var Value = page.options[page.selectedIndex].value;
	
	window.location.href='http://localhost:8080/culture/reserve/reserveForm.cul?seat_date='+Value&culture_idx=${CULTURE_IDX}
}

/*  $(function() {
		
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
						var stList = obj.stList;
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
});	 
 */	
</script>
</head>
<body>
   <form id="reserveForm" method="post">
   <input type="hidden" name="seat_date" value="${SEAT_DATE}" />
   <input type="hidden" name="CULTURE_IDX" value="${CULTURE_IDX}" />
    
      <div class="wrap">
         <div class="topArea">
            <h4 style="color:white; margin-top:0px; padding-top: 20px">&nbsp;&nbsp;&nbsp;티켓 예매</h4>
          		<div class="culture_grp">
		<div class="culture_pic">
			<img src="/project/upload/movie/${ctDetail.CULTURE_SAVNAME}"
				width="150" height="300" /> 
		</div>
		<div class="culture_txt">
			<p class="tit">${ctDetail.CULTURE_NAME}</p>
    	      	<div class="culture_price">
    	      		<p class="tit">좌석 가격
    	      		<c:forEach var="priceList" items="${priceList}" varStatus="stat">
                     <c:set var="index_r" value="${stat.index mod 5}" />
                     <c:if test="${index_c == 0}">
                        <br>
                        <br>
                     </c:if>
                     <p class="tit">${priceList}</p>
                     </c:forEach>
    	      	</div>
    	      		
               <div class="transparentArea"></div>
         		
            </div>
         <div class="bodyZone">
            <div style="float: left; width: 637px; height: 637px;">
               <div class="culture_location" id="culture_location">공연 장소 : ${ctDetail.CULTURE_LOCATION }
               </div>
            </div>
               <div class="date">공연 날짜 선택
               		<select id="select_date" name="select_date" onchange="pageChange()">
               			 <option value="">공연 날짜 선택</option>
                         <option value="2018-11-13">2018-11-13</option>
                         <option value="2018-11-14">2018-11-14</option>
                         <option value="2018-11-15">2018-11-15</option>
                         <option value="2018-11-16">2018-11-16</option>
                         </select>
                        
               </div>
            <c:if test="${fn:length(stList) le 0}">	
								<div class="remainSeat" id="remainSeat">잔여석 : 날짜를 선택해 주세요
								</c:if>
							 <c:if test="${fn:length(stList) > 0}">		
								<div class="remainSeat" id="remainSeat">잔여석 : ${fn:length(stList)}
								</div></c:if>
								
					<!-- <div class="remainSeat" id="remainSeat">잔여석 : <p class="seatLength">날짜를 선택해 주세요</p> 
								 -->
								<div style="text-align:center;">
                  <button class="btn btn-danger" onclick="javascipt:location.href='http://localhost:8080/culture/reserve/seatList.cul?culture_idx=${ctDetail.CULTURE_IDX}'"> 좌석선택 </button>
                  </div>
               <table id="example1"
						class="table table-bordered table-responsive-xl table-hover display dataTable no-footer"
						style="margin-bottom: 100%;">
						<thead
							style="background: #ff5d48; color: #fff; text-align: center">
							<tr style="padding: 10px;">
							</tr>
						</thead>
						
					</table>
                     </tr>
                  </thead>
               </table> 
               </div>
            </div>
         </div>
      </div> 
   </form>
</body>
