<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<!-- 구글차트 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['STAR', 'COUNT'],
          ['1',  ${oneStar}],
          ['2',  ${twoStar}],
          ['3',  ${threeStar}],
          ['4',  ${fourStar}],
          ['5',  ${fiveStar}]
          
        ]);

        var options = {
          title: '별점분포',
          hAxis: {title: '',  titleTextStyle: {color: '#333'}},
          vAxis: {minValue: 0, maxValue:30},
          colors:['#c6b069']
        };

        var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>

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
    background: url(<c:url value='/interior-master/cultureimg/myself.jpg'/>) center;
    background-size: cover;
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
								My Music Taste				
							</h1>	
							<p>나의 취향을 분석해보세요</p>
						</div>	
					</div>
				</div>
			</section>
			<!-- End banner Area -->					  
			
			<!-- Start post-content Area -->
			<section class="post-content-area single-post-area">
				<div class="container">
					<div class="row">
						<div class="col-lg-8 posts-list">
							<div class="single-post row">
								<div class="col-lg-12">
									<div class="feature-img">
										<div id="chart_div" style="width: 100%; height: 500px;"></div>
									</div>									
								</div>
								<div class="col-lg-3  col-md-3 meta-details">
									<ul class="tags">
										<li>별점 정보</li>
									</ul>
									<div class="user-details row">
										<p class="user-name col-lg-12 col-md-12 col-6"><span class="lnr lnr-star"></span> <a href="#">별점수&nbsp;:&nbsp;${evalCount }</a></p>
										<p class="date col-lg-12 col-md-12 col-6"><span class="lnr lnr-star"></span> <a href="#">많이 준 별점&nbsp;:&nbsp;${maxStar }</a></p>
										<p class="view col-lg-12 col-md-12 col-6"><span class="lnr lnr-star"></span> <a href="#">별점평균&nbsp;:&nbsp;${evalMean }</a></p>
									</div>
								</div>
								<div class="col-lg-3  col-md-3 meta-details">
									<ul class="tags">
										<li>선호 가수</li>
									</ul>
									<div class="user-details row">
										<c:forEach items="${top3artist }" var="row" varStatus="stat">
											<p class="user-name col-lg-12 col-md-12 col-6"> <span class="lnr lnr-user"></span> ${stat.index+1 }&nbsp;:&nbsp;${row}</p>
										</c:forEach>	
									</div>
								</div>
								<div class="col-lg-3  col-md-3 meta-details">
									<ul class="tags">
										<li>선호 장르</li>
									</ul>
									<div class="user-details row">
										<c:forEach items="${top3genre }" var="row" varStatus="stat">
										<p class="user-name col-lg-12 col-md-12 col-6"><span class="lnr lnr-diamond"></span> ${stat.index+1 }&nbsp;:&nbsp;${row}</p>
										</c:forEach>																				
									</div>
								</div>
								<div class="col-lg-3  col-md-3 meta-details">
									<ul class="tags">
										<li>선호 국가</li>
									</ul>
									<div class="user-details row">
										<c:forEach varStatus="stat" items="${top3country }" var="row">
											<p class="user-name col-lg-12 col-md-12 col-6"><span class="lnr lnr-earth"></span> ${stat.index+1 }&nbsp;:&nbsp;${row}</p>
										</c:forEach>
																														
									</div>
								</div>
							</div>
							
							
							
						</div>
						<div class="col-lg-4 sidebar-widgets">
							<div class="widget-wrap">
								
								<div class="single-sidebar-widget user-info-widget">
									<a href="#"><h4>${id }</h4></a>
									<p>
									<span class="lnr lnr-star"></span> &nbsp;${evalCount }
									</p>
									<ul class="social-links">
										<li><a href="#"><i class="fa fa-facebook"></i></a></li>
										<li><a href="#"><i class="fa fa-twitter"></i></a></li>
										<li><a href="#"><i class="fa fa-github"></i></a></li>
										<li><a href="#"><i class="fa fa-behance"></i></a></li>
									</ul>
									<p>
										${myType }
									</p>
								</div>
								
							</div>
						</div>
					</div>
				</div>	
			</section>
			<!-- End post-content Area -->

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



