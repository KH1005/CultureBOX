<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>



<html>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="https://d1rb9b8eeq1zxg.cloudfront.net/assets/application-58b7280b4fb8cc36033835601ed413097a7f66ed87642bfc0ef535aa7f80ef74.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


<script src="http://code.jquery.com/jquery-2.1.1.js"></script>
<!-- <script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.2/moment-with-locales.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/js/bootstrap-datetimepicker.min.js"></script> -->
<title>SignUp</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" type="text/css"
	href="https://d1rb9b8eeq1zxg.cloudfront.net/assets/application-58b7280b4fb8cc36033835601ed413097a7f66ed87642bfc0ef535aa7f80ef74.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
	

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

<script type="text/javascript">
			$(function() {
				$("#alert-success").hide();
				$("#alert-danger").hide();
				$("input").keyup(function() {
					var MEMBER_PASSWORD = $("#MEMBER_PASSWORD").val();
					var MEMBER_PASSWORD2 = $("#MEMBER_PASSWORD2").val();
					if (MEMBER_PASSWORD != "" || MEMBER_PASSWORD2 != "") {
						if (MEMBER_PASSWORD == MEMBER_PASSWORD2) {
							$("#alert-success").show();
							$("#alert-danger").hide();
							$("#submit").removeAttr("disabled");
						} else {
							$("#alert-success").hide();
							$("#alert-danger").show();
							$("#submit").attr("disabled", "disabled");
						}
					}
				});
			});
		</script>
		
		<script type="text/javascript">
		
			
		
			//아이디 체크여부 확인 (아이디 중복일 경우 idck=0 , 중복이 아닐경우 idck= 1 )
			var idck = 0;
			$(function() {
				//idck 버튼을 클릭했을 때 
				$("#idck").click(function() {

					//userid 를 param.
					var userid = $("#MEMBER_ID").val();

					$.ajax({
						async : true,
						type : 'POST',
						data : JSON.stringify(userid),
						url : "idcheck.cul",
						dataType : "json",
						contentType : "application/json; charset=UTF-8",
						success : function(data) {
							if (data.count > 0) {

								alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
							
							} else  {
								
								
								alert("사용가능한 아이디입니다.");
					
								idck = 1
							

							}
						},
						error : function(error) {

							alert("error : " + error);
						}
					});
				});
			});
			


			
			

			function DosignUp() {

				var userid = $("#MEMBER_ID").val();
				var userpwd = $("#MEMBER_PASSWORD").val();
				var inputPwdCfm = $("#signUpUserPwdCfm").val();
				var username = $("#MEMBER_NAME").val();
				var email = $("#MEMBER_EMAIL").val();

				if (userid.length == 0) {
					alert("아이디를 입력해 주세요");
					$("#MEMBER_ID").focus();
					return false;
				}

				if (userpwd.length == 0) {
					alert("비밀번호를 입력해 주세요");
					$("#MEMBER_PASSWORD").focus();
					return false;
				}

				if (username.length == 0) {
					alert("이름을 입력해주세요");
					$("#MEMBER_NAME").focus();
					return false;
				}

				if (email.length == 0) {
					alert("이메일을 입력해주세요");
					$("#MEMBER_EMAIL").focus();
					return false;
				}

				if (confirm("회원가입을 하시겠습니까?")) {
					if (idck == 0) {
						alert('아이디 중복체크를 해주세요');
						return false;
						
					} else {
						alert("회원가입을 축하합니다");
						//$("#frm").submit();
						//$("#joinform").submit();
						return true;
					}
				}
			}
			
			
		</script>
</head>

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
		<img src="C:\Users\user\Desktop\culture\src\main\webapp\img\sky2.gif" alt="">
	</div>
	<div data-react-router-class="MyRoutes">

			<nav class="gnb gnb--sign_in">
				 <!-- <a class="" href="image/logo.png" data-reactid=".1dyxnvjby0w.0.0.0"></a> -->
				 
				<!-- <div class="gnb__right-navs">
					<a class="gnb__sign-up btn btn-default" href="http://localhost:8080/culture/admin/CultureListForm.cul">Sign Up</a>
				</div> -->
			</nav>
		</div>
		<form:form commandName="member" action="signUp.cul" method="post"
		name="joinform" id="joinform"  onsubmit="return DosignUp()" >
		<div class="app__page-mount">
			<div class="sign-in-page">
			 <div class="container " align="center">
     
				<div class="sign-in-page__centerer">
					<div class="sign-in-page__label">
					
				 <img src="C:\Users\user\Desktop\culture\src\main\webapp\img\logo333.png" alt="">
					
					<br>
			
					<h4 style="color: white;"></h4>

					</div>
						<div class="form-group">
		


		<input type="text" class="form-control"
				id="MEMBER_ID" name="MEMBER_ID" path="MEMBER_ID" placeholder="한글 및 특수문자 사용불가" />
				
		<input type="button" value="중복확인" id="idck" class="btn btn-info">


		</div>

		<div class="form-group">
		
			<input type="text" class="form-control" name="MEMBER_NAME" id="MEMBER_NAME"
				 placeholder="이름을 입력해 주세요" />
		</div>
		<div class="form-group">
		
			<input type="email" class="form-control" name="MEMBER_EMAIL" id="MEMBER_EMAIL"
				 placeholder="이메일 주소를 입력해주세요" />
				<!-- <input type="button" value="중복확인" id="eck"> -->
				
	
				
		</div>

		
		<input type="password" name="MEMBER_PASSWORD"  id="MEMBER_PASSWORD"
			 class="form-control" required  placeholder="비밀번호를 입력하세요" />
		<br>
		<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>

		<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지
			않습니다.</div>

		
		<input type="password" name="MEMBER_PASSWORD2" id="MEMBER_PASSWORD2"
			class="form-control" required placeholder="비밀번호를 다시 입력하세요"  />
		<br> 
		<br>
		
		
					
					<!-- 	<div class="sign-in-page__input-group">
							<label class="sign-input">
							<input type="text" value="" placeholder="ID" name="MEMBER_ID">
							</label><label class="sign-input"> <input type="password"
								value="" name="MEMBER_PASSWORD"  placeholder="Password" minlength="6"></label>
						</div> -->
					<!-- <input class="sign-in-page__submit sign-in-page__submit--invalid" 
							 value="로그인"> -->
							 <br>
							<button type="submit" class="btn btn-info"> SignUp </button>&nbsp;&nbsp;
							 
							<button type="button" class="btn btn-info"  onclick="location.href='loginForm.cul' ">Cancel</button> 
							
							
							</div>
							
					
							

				</div>
			</div>
		</div>
		</form:form>
	


</body>
</html> 









