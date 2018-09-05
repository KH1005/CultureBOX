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
<style type="text/css">
.banner-area {
    background: url(<c:url value='/cultureimg/${cultureModel.CULTURE_SAVNAME }'/>) center;
    background-size: cover;
}
</style>

</head>

<body> 
   <!-- #header -->

	<!-- <header id="header" id="home">

		<div class="container main-menu">
			<div class="row align-items-center justify-content-between d-flex">
				<div id="logo">
					<a href="index.html"><img src="img/logo.png" alt="" title="" /></a>
				</div>

				
			</div>
		</div>
	</header> -->
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
						src="http://localhost:8080/culture/cultureimg/${cultureModel.CULTURE_SAVNAME }"
						width="300" height="400" alt="">
				</div>
				<div class="col-lg-6 project-details-right">
					<h3 class="pb-20">${cultureModel.CULTURE_NAME}</h3>
					<p></p>
					<div class="details-info d-flex flex-row">
						<ul class="names">
							<li>장소</li>
							<li>기간</li>
							<li>장르</li>
							<li>문의전화</li>
							<li>가격</li>
						</ul>
						<ul class="desc">
							<li>: ${cultureModel.CULTURE_LOCATION}</li>
							<li>:  ${cultureModel.CULTURE_START}&nbsp;~&nbsp;${cultureModel.CULTURE_END}
									
							</li>
							<li>: ${cultureModel.CULTURE_CATEGORY}</li>
							<li>: 070-1544-1545</li>
							<li style="margin-left: 29px;">
							   <c:forEach items="${start3}" var="start"  varStatus="stat">
						 	    ${start}<br>
						       </c:forEach>
						   
						    
						    
						    
							</li>
						</ul>
					</div>
					<div class="social-links mt-30">
						<a class="genric-btn primary radius"
							href="http://localhost:8080/culture/reserve/reservationForm.cul?culture_idx=${cultureModel.CULTURE_IDX}">예매하기</a>
						<a class="genric-btn primary radius"
							href="http://localhost:8080/culture/concert/CultureList.cul">목록</a>
					</div>
				</div>
				
				

				<div class="col-lg-12 project-desc mt-60">
					<p>
					<h3 class="sub_tit">상세정보</h3>

					<p class="summary">
						<font color="#848484">${cultureModel.CULTURE_CONTENT}</font>
					</p>
					<br> <br>
					<h3 class="sub_tit">상품관련정보</h3>
					<br>
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						class="table_goods_info" align="center">
						<colgroup>
							<col width="16%">
							<col width="38%">
							<col width="13%">
							<col width="33%">
						</colgroup>
						<tbody>
							<tr>
								<th class="border_none">주최/기획</th>
								<td>(주)KH정보교육원</td>
								<th>고객문의</th>
								<td>공연문의 02-1544-1545 / 예매문의 070-1544-1545</td>
							</tr>
							<tr>
								<th class="border_none">공연시간</th>
								<td>70분</td>
								<th>관람등급</th>
								<td>만 7세이상</td>
							</tr>
							<tr>
								<th>공연장소</th>
								<td>${cultureModel.CULTURE_LOCATION}</td>
							</tr>
							<tr>
								<th class="border_none">예매수수료</th>
								<td>장당 1,000원</td>
								<th>배송료</th>
								<td>현장수령 무료(배송불가)</td>
							</tr>
							<tr>
								<th class="border_none">유효기간/이용조건</th>
								<td colspan="3">예매한 공연 날짜, 회차에 한해 이용 가능</td>
							</tr>
							<tr>
								<th class="border_none">예매취소조건</th>
								<td colspan="3">

									<ul class="list_option">

										<li>취소일자에 따라서 아래와 같이 취소수수료가 부과됩니다. 예매일 기준보다 관람일 기준이 우선
											적용됩니다.<br>단, 예매 당일 밤 12시 이전 취소 시에는 취소수수료가 없으며, 예매수수료도
											환불됩니다.(취소기한 내에 한함)
										</li>

									</ul>

									<table width="100%" border="0" cellspacing="0" cellpadding="0"
										class="inner_table">
										<colgroup>
											<col width="50%">
											<col width="">
										</colgroup>

										<tbody>
											<tr>
												<th class="left">취소일</th>
												<th class="right">취소수수료</th>
											</tr>
											<tr>

												<td class="left">예매 후 7일 이내</td>
												<td class="right">없음</td>

											</tr>

											<tr>
												<td class="left">예매 후 8일~관람일 10일전까지</td>
												<td class="right">장당 4,000원(티켓금액의 10%한도)</td>
											</tr>

											<tr>
												<td class="left">관람일 9일전~7일전까지</td>
												<td class="right">티켓금액의 10%</td>
											</tr>

											<tr>
												<td class="left">관람일 6일전~3일전까지</td>
												<td class="right">티켓금액의 20%</td>
											</tr>

											<tr>
												<td class="left">관람일 2일전~1일전까지</td>
												<td class="right">티켓금액의 30%</td>
											</tr>

										</tbody>
									</table>

								</td>
							</tr>
							<tr>
								<th class="border_none">취소환불방법</th>
								<td colspan="3">
									<ul class="list_option">
										<li>My티켓 &gt; 예매/취소내역에서 직접 취소 또는 고객센터 (1544-1545)를 통해서
											예매를 취소할 수 있습니다.</li>
										<li>티켓을 출력한 이후에는 인터넷 취소가 안되며, 취소마감 시간 이전에 티켓이 cultureBox
											고객센터로 반송되어야 취소 가능합니다. 취소수수료는 도착일자 기준으로 부과되며, 배송료는 환불되지 않습니다.</li>
									</ul>

								</td>
							</tr>


						</tbody>
					</table>

				</div>
			</div>

			<p>
				<br> <br>
			<div>
				<h3>관람후기</h3>
			</div>

			<!-- <table> -->
		
			<div class="inner">
         
				<form class="commentForm" method="post"
					action="writeCultureComment.cul">
					<input type="hidden" name="item_no"
						value="${cultureModel.CULTURE_IDX}" />
	                   <c:if test="${id == null}">
                  				<input type="text" style="align:center; margin: 10px; width: 950px; height: 55px;" value="로그인 후에  댓글 작성이 가능합니다." readonly="readonly"/>
	      	 				</c:if>
	      	    	<c:if test="${id != null}">
					<div class="textarea_grp" style="width: 1000px;">
						<textarea name="COMMENT_CONTENT" rows="5"
							class="form-control search_box_input"
							placeholder="게시물 성격에 맞지 않거나 비방 댓글은 통보없이 삭제 됩니다."></textarea>

						<div style="text-align: right;">
							<input type="submit" value="댓글등록"
								class="genric-btn primary radius">
						</div>
					</div>
                   </c:if>
				</form>
	
			</div>

			<c:choose>
				<c:when test="${fn:length(cultureCommentList) > 0}">
					<div id="contents"
						style="height: 500px; width: 600px; margin-left: 0px border-left-width:10px">
						
						<div id="js-load" class="main">
							<ul class="lists">
								<c:forEach items="${cultureCommentList}" var="row"
									varStatus="stat">
									<li class="lists__item js-load">



										<div style="float: left; font-size: 12px;">
											<span style="display: inline-block;">${row.COMMENT_WRITERID}님</span>
											<span style="display: inline-block; margin-right: 10px;">|
												<fmt:formatDate value="${row.COMMENT_WRITEDATE}"
													pattern="yy.MM.dd"></fmt:formatDate>
											</span>
										</div>


										<div id="com_Div" class="com_Div">
											<input type="hidden" value="${row
											.COMMENT_CONTENT}" id="com_CON" name="com_CON"> 
											<input type="hidden" value="${row.COMMENT_IDX}" id="com_NO" name="com_NO"> 
											
											<c:if test="${id == row.COMMENT_WRITERID}">
												<a href='http://localhost:8080/culture/concert/deleteCultureComment.cul?COMMENT_IDX=${row.COMMENT_IDX}&COMMENT_CULTUREIDX=${cultureModel.CULTURE_IDX}'
												><font size=2 color="#c6b069">삭제</font></a>|
											    <a href="#this" name="commentUpdate"><font size=2 color="#c6b069">수정</font></a>
											</c:if>
											<div align="left">
											<p align="left">
												<font size=2><strong>${row.COMMENT_CONTENT}</strong></font>
											</p>
											</div>
										</div>


									</li>

								</c:forEach>

							</ul>

							 <div id="js-btn-wrap" class="btn-wrap">
								<a href="javascript:;" class="button"><font color="#c6b069">더보기</font></a>
							</div> 
							<div class="btn_type_04"></div>
						</div>
					</div>

				</c:when>
				<c:otherwise>
					<br>
					<br>
					<tr>
						<td colspan="4"><font size=2>등록된 후기가 없습니다</font></td>
					</tr>
				</c:otherwise>

			</c:choose>
		</div>
	</section>


	<%-- <%@ include file="/WEB-INF/include/include-body.jspf" %> --%>
	<form id="commonForm" name="commonForm"></form>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("a[name='commentUpdate']").on("click", function(e) {
				e.preventDefault();
				fn_commentModify($(this));
			})
		});

		function fn_commentModify(obj) {
			var con = obj.parent().parent().find("#com_Div").find("#com_CON")
					.val();
			var no = obj.parent().parent().find("#com_Div").find("#com_NO")
					.val();
			var str = "<form id='frm'><p align='right'><textarea rows='5' cols='100' name='COMMENT_CONTENT'>"
					+ con
					+ "</textarea><a href=''#this' name='com_Upd' class='btn'>등록</a></p><input type='hidden' name='COMMENT_IDX' value='"+no+"'></form><hr/>";
			var div = obj.parent().parent().find("#com_Div");

			div.empty();
			div.append(str);

			$("a[name=com_Upd]").on("click", function(e) {
				e.preventDefault();
				fn_updateComment($(this));
			})
		}

		function fn_updateComment(obj) {
			var culture_idx = "${cultureModel.CULTURE_IDX}";
			var comSubmit = new ComSubmit("frm");
			comSubmit.addParam("CULTURE_IDX",culture_idx);
			comSubmit
					.setUrl("<c:url value='/concert/modifyCultureComment.cul'/>");
			comSubmit.submit();
		}
	</script>


	<!-- End project-details Area -->

	<!-- Start brands Area -->
	

<script src="<c:url value='/interior-master/js/vendor/jquery-2.2.4.min.js'/>"></script>
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

	</body>
	
</html>