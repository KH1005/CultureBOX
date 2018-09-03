<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
	String cp = request.getContextPath();
%>
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



<form:form action="memberModify.cul" method="post"
	name="memberModifyForm" onsubmit="return check()">

	<table>

		<colgroup>
			<col style="width: 120px" />
			<col />
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">아이디</th>
				<td>${id} <input type="hidden" name="MEMBER_ID" id="MEMBER_ID" />
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
					value="${MEMBER_EMAIL}" path="MEMBER_EMAIL" id="MEMBER_EMAIL" /></td>
			</tr>
		</tbody>
	</table>



	<div class="zopim" __jx__id="___$_4 ___$_4"
		data-test-id="ChatWidgetWindow"
		style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; padding: 0px; border: 0px; background: transparent; overflow: hidden; position: fixed; z-index: 16000001; right: 10px; bottom: 0px; border-top-left-radius: 5px; border-top-right-radius: 5px; display: none; width: 350px; height: 450px; box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 3px 2px;">
		<iframe frameborder="0"
			style="background-color: transparent; vertical-align: text-bottom; position: relative; width: 100%; height: 100%; min-width: 100%; min-height: 100%; max-width: 100%; max-height: 100%; margin: 0px; overflow: hidden; display: block;"
			src="about:blank" data-test-id="ChatWidgetWindow-iframe"></iframe>
<!-- 	</div> -->

<!-- 	<div class="btn_type_04"> -->
		<a href="mypage.cul"> <span>취소</span>
		</a> <input type="submit" value="확인" />

	</div>
</form:form>
</div>
</div>