<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<!-- Mobile Specific Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="icon" type="image/png" href="">
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
<!--CSS	============================================= -->
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
<style type="text/css">
.banner-area {
    background: url(<c:url value='/interior-master/cultureimg/mainback7.jpg'/>) center;
    background-size: cover;
}

.max-small {
    width: 350px; height: 400px;
}
</style>
</head>
<body>
<!-- start banner Area -->
			<section class="banner-area relative" id="home">	
				<div class="overlay overlay-bg"></div>
				<div class="container">				
					<div class="row d-flex align-items-center justify-content-center">
						<div class="about-content col-lg-12">
							<h1 class="text-white">
								Evaluation				
							</h1>	
							<p>다양한 음악들을 평가해보세요</p>
						</div>	
					</div>
				</div>
			</section>
			<!-- End banner Area -->

			<!-- Start gallery Area -->
			<section class="gallery-area pb-120">
				<div class="container">
					<div class="row d-flex justify-content-center">
						<div class="col-md-12 pb-40 header-text text-center">
							<h1 class="pb-10">Our Recent Works may impress you</h1>
							<p>
								Who are in extremely love with eco friendly system.
							</p>
						</div>
					</div>							
					<div class="row">
						<c:choose>

							<c:when test="${fn:length(musicList) > 0 }">
								<c:forEach items="${musicList }" var="row" varStatus="stat">
									<div class="col-lg-4">
										<div class="single-gallery">
											<div class="content">
											    <a href="#" target="_blank">
											      <div class="content-overlay"></div>
											  		 <img class='max-small' src="<c:url value='/musicimg/${row.MUSIC_SAVNAME }'/>" alt="">
											      <div class="content-details fadeIn-bottom">
											        <h4 class="content-title mx-auto">${row.MUSIC_ALBUM }</h4>
											        <a href="http://localhost:8080/culture/eval/EvalDetail.cul?MUSIC_INDEX=${row.MUSIC_INDEX }&MEMBER_ID=${id}" class="primary-btn text-uppercase mt-20">More Details</a>
											      </div>
											    </a>
											</div>
										</div>
									</div>	
								</c:forEach>
							</c:when>
							<c:otherwise>
								<div class="row d-flex justify-content-center">
									<div class="col-md-12 pb-40 header-text text-center">
										<h1 class="pb-10">평가할게 없어요...ㅠㅠ</h1>
										<p>
											데이터에 있는 음악들을 모두 평가하셨습니다~ 음악만 듣고 사셨나봐요 
										</p>
									</div>
								</div>
							</c:otherwise>
						</c:choose>												
					</div>
				</div>	
			</section>
			<!-- End gallery Area -->
               
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
   
<!-- 
	리스트, 커서 올리면 정보보이기 

 -->












          
  
