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
	var seatArray = new Array();
	
	function imageChange(i, SEAT_NAME, src, SEAT_PRICE, SEAT_DATE){
	
	var seatArray = src.split("/");
	client = 1;
	
	if(seatArray[seatArray.length - 1] == "seat_O.png"){
		
		document.getElementById('seat'+i).src = "/culture/img/seat_select.png";
		cnt = countA(i);
		
		addRow(SEAT_NAME, SEAT_PRICE, SEAT_DATE);
	
	 	if(document.getElementById('seat').value != "")
			document.getElementById('seat').value = document.getElementById('seat').value+"/"+SEAT_NAME;
			else 
			document.getElementById('seat').value = SEAT_NAME;
		} 
	
	/* 	 if(seatArray[seatArray.length - 1] == "seat_select.png"){
		
		document.getElementById('seat'+i).src = "/culture/img/seat_O.png";
		cnt = countA(i);
		
		deleteRow(${SEAT_NAME}, ${SEAT_PRICE}, ${SEAT_DATE});
		}  
 */	
		 if(seatArray[seatArray.length - 1] == "seat_select.png"){
			 document.getElementById('seat'+i).src = "/culture/img/seat_O.png";
			 delete_row(SEAT_NAME, SEAT_PRICE, SEAT_DATE);
			 
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
	}
	

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


		function addRow(SEAT_NAME, SEAT_PRICE, SEAT_DATE) {
			   var my_tbody = document.getElementById('my-tbody'); 
			   var row = my_tbody.insertRow(my_tbody.rows.length); // 하단에 추가
			   var cell1 = row.insertCell(0);
			   var cell2 = row.insertCell(1);
			   var cell3 = row.insertCell(2);
			   
			   cell1.innerHTML = SEAT_NAME;
			   cell2.innerHTML = SEAT_PRICE;
			   cell3.innerHTML = SEAT_DATE;
			   
			   tbAry.push(SEAT_NAME, SEAT_PRICE, SEAT_DATE);
			}

			function delete_row(SEAT_NAME, SEAT_PRICE, SEAT_DATE) {
			  
			
		   	   var my_tbody = document.getElementById('my-tbody'); 
			   if (my_tbody.rows.length < 1) return;  
			   
			   
			   my_tbody.deleteRow(tbAry.indexOf(SEAT_DATE)+1);
			   alert("delete start");
			   tbAry.splice(tbAry.indexOf(SEAT_NAME), 1);
			   tbAry.splice(tbAry.indexOf(SEAT_PRICE), 1);
			   tbAry.splice(tbAry.indexOf(SEAT_DATE), 1);
			}

			function pageChange(){
				var page = document.getElementById("select_date");
				var Value = page.options[page.selectedIndex].value;
				
				window.location.href='http://localhost:8080/culture/reserve/seatList.cul?seat_date='+Value
			}
			
			window.onload = function() {	
				//initialize Calendar & visibilities
				buildCalendarM(thisToday.getFullYear(), thisToday.getMonth()+1, thisToday.getDate(), selDate);
				setTotalResultDiv("init", "");
			}
			
/* 		$(function() 
					
						$('date').Click(function() {
							var params = "";
							
							var id = 'kh10005';
							var seatCount = new seatCount();
							var idx = ${music.MUSIC_INDEX};
							
							params = "seatCount="+encodeURIComponent(idx)+"&STAR_COUNT="+encodeURIComponent(star)+"&MEMBER_ID="+encodeURIComponent(id);
							$.ajax({
								url:"http://localhost:8080/culture/reserve/seatList.cul",
								type:"POST",
								dataType:"json",
								data:params,
								success: function(req){
									var result = req.code;
									if(result == 'success'){
										var star = req.star;
										alert(star);
										$(function(star){
											$('div.star_count').text(star);
										});
									
									}else{
										alert(':(')
									}
								},
								error: function(req){
									alert("에러발생:"+req.status);
								}
							})
							//new ajax.xhr.Request("http://localhost:8080/culture/eval/MusicEval.box", params, insertStar, "POST");
							
						}
					});

				}); */ 
</script>
</head>

<body>
<form id="seatSelectForm" method="post" >
	<input type="hidden" name="SEAT_DATE" id="date" value="" />
	<input type="hidden" name="SEAT_NAME" id="seat" value="" /> 
	<input type="hidden" name="SEAT_PRICE" id="price" value="" />
<div class="seatList">
<h2></h2>


      <table  class="table" align="center" >
      
      					<tr>
                     <th scope="row">카테고리</th>
                     <td><select id="select_date" name="select_date" onchange="pageChange()">
                         <option value="2018-11-13">2018-11-13</option>
                         <option value="2018-11-14">2018-11-14</option>
                         <option value="2018-11-15">2018-11-15</option>
                         <option value="2018-11-16">2018-11-16</option>
                         </select>
                        <font color="red" ><form:errors path="movie_info" /></font>
                     </td>
                  </tr>
                   
						   	                     
                         <%--    <c:if test ="${stat.index % 5 eq 0}">
                              <tr></tr>
                           </c:if>
                           <td width="230" align="center">
                           <a class="show" href='http://localhost:8080/culture/admin/CultureDetail.cul'><img src="../webapp/img/seat_O.png" width="20px" height="20px">
                           </a>  --%>
						
						
						<div class="seatTable">
                  <c:forEach var="seatList" items="${seatList}" varStatus="stat">
                     <c:set var="index_r" value="${stat.index mod 5}" />
                     <c:set var="index_c" value="${stat.index mod 10}" />

                     <c:if test="${(index_r == 0) && (index_c != 0)}">&nbsp;</c:if>
                     <c:if test="${index_c == 0}">
                        <br>
                        <br>
                     </c:if>

                     <c:if test="${seatList.SEAT_RESERVED == 'N'}">
                        <img src="/culture/img/seat_O.png" id="seat${stat.index}" onclick="imageChange(${stat.index}, '${seatList.SEAT_NAME}', src, '${seatList.SEAT_PRICE}', '${seatList.SEAT_DATE}');"
                           style="width: 12px; height: auto;" />
            
                     </c:if>
                     <c:if test="${seatList.SEAT_RESERVED == 'Y' }">
                        <img src="/culture/img/seat_X.png" id="seat${stat.index}"
                           style="width: 12px; height: auto;" />
                     </c:if>
                  </c:forEach>
                  &nbsp;
               </div>
						
						
						
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
                         
                              
         
                         
                           <td width="230" align="center">
                           
                          <br> <br>
                              <br> </td>
                    
     
               </table>
     
<!--  등록된 공연이 없을때 -->
<c:if test="${fn:length(seatList) le 0}">
   날짜를 선택해 주세요
</c:if> 
			<div class="groundList">
				<div class="list">
					<table id="example1"
						class="table table-bordered table-responsive-xl table-hover display dataTable no-footer"
						style="margin-bottom: 100%;">
						<thead
							style="background: #ff5d48; color: #fff; text-align: center">
							<tr style="padding: 10px;">
								<th rowspan="1" colspan="1" style="width: 90px;">좌석 이름</th>
								<th rowspan="1" colspan="1" style="width: 90px;">좌석 가격</th>
								<th rowspan="1" colspan="1" style="width: 150px;">공연 날짜</th>
							</tr>
						</thead>
						<tbody id="my-tbody" style="text-align: center; font-size: 13px">
							<tr class="zoneList"> </tr>
						</tbody>
						<tr style="padding: 5px;">
								<th rowspan="1" colspan="1" style="width: 45px">합계</th>
							</tr>
					</table>
				</div>
				<div style="text-align: center;">
					<input type="button" class="btn btn-danger" onclick="javascript:history.go(-1)" value="이전단계" /> 
					<input type="button" class="btn btn-danger" onclick="onSelectSeat()" value="선택완료" />
				</div>
			</div>
		</div>
	</div>
</form>
</body>