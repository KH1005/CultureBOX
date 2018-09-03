<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>

</head>
<body>


	<a href="#" class="active" id="login-form-link">비밀번호 입력후 탈퇴를 진행하세요</a>



	<script type="text/javascript">
		function memberDeleteChk() {
			if (document.memberDeleteform.MEMBER_PASSWORD.value == "") {
				alert("비밀번호를 입력하세요.");
				document.memberDeleteform.MEMBER_PASSWORD.focus();
				return false;
			}
			return true;
		}
	</script>

	<form:form commandName="member" action="memberDelete.cul" method="post"
		name="memberDeleteform" 	onsubmit="return memberDeleteChk()">

		<input type="password" name="MEMBER_PASSWORD"  path="MEMBER_PASSWORD"
			 placeholder="비밀번호를 입력해주세요" value="" />

		<br>
		<br>
		<br>


		<input type="submit" name="memberDeleteform" value="탈퇴">


		<a href="mypage.cul"> <span>취소</span>
		</a>



	</form:form>


	<script>
		$(function() {

			$('#login-form-link').click(function(e) {
				$("#login-form").delay(100).fadeIn(100);
				$("#register-form").fadeOut(100);
				$('#register-form-link').removeClass('active');
				$(this).addClass('active');
				e.preventDefault();
			});
			$('#register-form-link').click(function(e) {
				$("#register-form").delay(100).fadeIn(100);
				$("#login-form").fadeOut(100);
				$('#login-form-link').removeClass('active');
				$(this).addClass('active');
				e.preventDefault();
			});

		});
	</script>
	<br>


</body>
