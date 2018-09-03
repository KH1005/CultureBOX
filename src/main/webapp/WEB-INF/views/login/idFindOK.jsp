<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<div class="tac">
	<h3 class="sub_tit">아이디 찾기</h3>
	<p class="fz15">${member.MEMBER_NAME}님의 아이디는 <strong>${member.MEMBER_ID}</strong>이고, 비밀번호는<Strong>${member.MEMBER_PASSWORD}</Strong>입니다.</p>
	<div class="btn_type_04">
		<a href="loginForm.cul" class="btnnC_03 btnF_02 mr10">
			<span>메인으로</span>
		</a>
	</div>
</div> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>

<!DOCTYPE html>


<html>
<title>Login</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="https://d1rb9b8eeq1zxg.cloudfront.net/assets/application-58b7280b4fb8cc36033835601ed413097a7f66ed87642bfc0ef535aa7f80ef74.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	
<script type="text/javascript">
	function memberFindChk(){
		
		var mem = eval("document.memberFindForm");
		
		if(mem.name.value=="") {
	        alert('이름을 입력하세요');
	        mem.name.focus();
	        return false;
	    }

	    if(mem.email.value=="") {
	        alert('이메일을 입력해 주세요.');
	        mem.email.focus();
	        return false;
	    }
		return true;
	}
</script>

<script type="text/javascript">
	window.onload = function(){
		var chk = ${memberFindChk}
		//alert(chk);
		if(chk == -1){
			alert('이름과 이메일이 일치하지 않습니다.');
			history.back();
		}
		if(chk == 0){
			alert('이름과 이메일이 일치하지 않습니다.');
			history.back();
		}
		if(chk == 1){
			alert('${member.MEMBER_NAME}님의 아이디는 ${member.MEMBER_ID} 이고, 비밀번호는 ${member.MEMBER_PASSWORD}입니다');
				
			
		}
	}
</script>


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

		\	<nav class="gnb gnb--sign_in">
				 <!-- <a class="" href="image/logo.png" data-reactid=".1dyxnvjby0w.0.0.0"></a> -->
				 
				<!-- <div class="gnb__right-navs">
					<a class="gnb__sign-up btn btn-default" href="http://localhost:8080/culture/admin/CultureListForm.cul">Sign Up</a>
				</div> -->
			</nav>
		</div>
		
		<div class="app__page-mount">
			<div class="sign-in-page">
			 <div class="container " align="center">
     
				<div class="sign-in-page__centerer">
					<div class="sign-in-page__label">
					
				 <img src="C:\Users\user\Desktop\culture\src\main\webapp\img\logo333.png" alt="">
					
					<br>
			
					<h4 style="color: white;"></h4>

			
						
		<form action="findId.cul" method="post" name="memberFindForm" onsubmit="return memberFindChk()" >
			<fieldset>
					<h4 style="color: white;">id, pw 찾기</h4>
				
					<table>
						
						<colgroup>
							<col style="width:120px;" />
							<col />
						</colgroup>
						<tbody>
					
							<tr>
							<th scope="row"><h4 style="color: white;">이름</h4></th>
								<td><label class="sign-input"><input type="text" class="txt w220" name="MEMBER_NAME">
								</label>
								</td>
							</tr>
							
							<tr>
								<th scope="row"><h4 style="color: white;">이메일</h4></th>
								<td><label class="sign-input"><input type="text" class="txt w220" name="MEMBER_EMAIL" /></label></td>
							</tr>
	
						</tbody>
					</table>
				
		
					<button type="button" class="btn btn-info"  onclick="location.href='loginForm.cul' ">Cancel</button>
					
					
						<button type="submit" class="btn btn-info"> Find! </button>
				</fieldset>
				</form>	
			</div>
			
		
	</div>
</div>
					<!-- <input class="sign-in-page__submit sign-in-page__submit--invalid" 
							 value="로그인"> -->
							 <br>
							
							
							
							</div>
							
					
						

				</div>
			</div>
	
	


</body>
</html>
