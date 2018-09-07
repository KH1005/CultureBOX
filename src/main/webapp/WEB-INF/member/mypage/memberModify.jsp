<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
	String cp = request.getContextPath();
%>

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

<script type="text/javascript">
	function check() {
		var f = document.memberModifyForm;

		if (f.MEMBER_PASSWORD.value == "") {
			alert("비밀번호를 입력하세요");
			f.passwd.focus();
			return false;

		} else if (f.MEMBER_PASSWORD.value != f.MEMBER_PASSWORD2.value) {
			alert("비밀번호가 일치하지 않습니다");
			f.MEMBER_PASSWORD.value = "";
			f.MEMBER_PASSWORD2.value = "";
			f.MEMBER_PASSWORD.focus();
			return false;
		} else if (f.MEMBER_EMAIL.value == "") {
			alert("이메일을 제대로 입력해주세요");
			f.MEMBER_EMAIL.focus();
			return false;
		}

		return true;
	}
</script>
<!-- start banner Area -->
			<section class="banner-area relative" id="home">	
				<div class="overlay overlay-bg"></div>
				<div class="container">				
					<div class="row d-flex align-items-center justify-content-center">
						<div class="about-content col-lg-12">
							<h1 class="text-white">
								My Information				
							</h1>	
							<p>나의 정보를 볼수있어요</p>
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

<body>

<form:form action="memberModify.cul" method="post"
	name="memberModifyForm" onsubmit="return check()">
	
										<div class="single-gallery">
	<table>

		<colgroup>
			<col style="width: 120px" />
			<col />
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">아이디</th>
				<td>${id }<input type="hidden" value="${id}" name="MEMBER_ID" id="MEMBER_ID" />
				</td>
			</tr>
			<tr>
				<th scope="row">비밀번호</th>
				<td><input type="password" class="txt w200"
					id="MEMBER_PASSWORD" name="MEMBER_PASSWORD" /> <span
					class="bk pt_red"></span></td>
			</tr>
			<tr>
				<th scope="row">비밀번호 확인</th>
				<td><input type="password" class="txt w200"
					id="MEMBER_PASSWORD2" name="MEMBER_PASSWORD2" /></td>
			</tr>
			<tr>
				<th scope="row">이름</th>
				<td>${name} <input type="hidden" class="txt w200"
					name="MEMBER_NAME" id="MEMBER_NAME" />
				</td>
			</tr>


			<tr>
				<th scope="row">이메일</th>
				<td><input type="text" class="txt w200" name="MEMBER_EMAIL"
					    placeholder= "${email}" id="MEMBER_EMAIL" /></td>
			</tr> 
		</tbody>
	</table>



<!-- 	<div class="zopim" __jx__id="___$_4 ___$_4"
		data-test-id="ChatWidgetWindow"
		style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; padding: 0px; border: 0px; background: transparent; overflow: hidden; position: fixed; z-index: 16000001; right: 10px; bottom: 0px; border-top-left-radius: 5px; border-top-right-radius: 5px; display: none; width: 350px; height: 450px; box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 3px 2px;">
		<iframe frameborder="0"
			style="background-color: transparent; vertical-align: text-bottom; position: relative; width: 100%; height: 100%; min-width: 100%; min-height: 100%; max-width: 100%; max-height: 100%; margin: 0px; overflow: hidden; display: block;"
			src="about:blank" data-test-id="ChatWidgetWindow-iframe"></iframe> -->
<!-- 	</div> -->

<!-- 	<div class="btn_type_04"> -->
<br/><br/>
		<a href="/culture/eval/EvalList.cul" class="genric-btn primary e-large"> <span>취소</span>
		</a> <input type="submit" value="확인" class="genric-btn primary e-large" />
<!-- </div> -->
</div>

</form:form>


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
			<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
</body>
</html>
