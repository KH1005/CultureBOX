<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<title>LoginForm</title>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="https://d1rb9b8eeq1zxg.cloudfront.net/assets/application-58b7280b4fb8cc36033835601ed413097a7f66ed87642bfc0ef535aa7f80ef74.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	

<style>
#bg {
	position: fixed;
	top: -50%;
	left: -50%;
	width: 200%;
	height: 200%;
}

#bg img {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	margin: auto;
	min-width: 50%;
	min-height: 50%;
}


</style>
<body>
	<div id="bg">
		<img src="<c:url value='/interior-master/cultureimg/sky2.gif'/>" alt="">
	</div>
	<div data-react-router-class="MyRoutes">

		\	<nav class="gnb gnb--sign_in">
				 <!-- <a class="" href="image/logo.png" data-reactid=".1dyxnvjby0w.0.0.0"></a> -->
				 
				<!-- <div class="gnb__right-navs">
					<a class="gnb__sign-up btn btn-default" href="http://localhost:8080/culture/admin/CultureListForm.cul">Sign Up</a>
				</div> -->
			</nav>
		</div>
		<form action="login.cul" method="post" name="login">
		<div class="app__page-mount">
			<div class="sign-in-page">
			 <div class="container " align="center">
     
				<div class="sign-in-page__centerer">
					<div class="sign-in-page__label">
					
				  <img src="<c:url value='/interior-master/cultureimg/logo333.png'/>" alt="">
					
					<br>
			
					<h4 style="color: white;"></h4>

					</div>
						<div class="sign-in-page__input-group">
							<label class="sign-input">
							<input type="text" value="" placeholder="Id 혹은 비밀번호가 맞지 않습니다" name="MEMBER_ID" >
							</label><label class="sign-input"> <input type="password"
								value="" name="MEMBER_PASSWORD"  placeholder="" minlength="6"></label>
						</div>
					<!-- <input class="sign-in-page__submit sign-in-page__submit--invalid" 
							 value="로그인"> -->
							 <br>
							<button type="submit" class="btn btn-info"> Login </button>&nbsp;&nbsp;
							<button type="button" class="btn btn-info" onclick= "location.href='findIdForm.cul'"> Id, Pw find </button>&nbsp;&nbsp;
							 
							<button type="button" class="btn btn-info"  onclick="location.href='signUpForm.cul' ">Sign Up</button> 
							
							</div>
							
					
							</form>

				</div>
			</div>
		</div>
	</div>


</body>
</html>