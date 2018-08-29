<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<% String cp = request.getContextPath(); %>
<script type="text/javascript">
	
	function check(){
		var f = document.memberModifyForm;
		
		if(f.MEMBER_PASSWORD.value == ""){
			alert("비밀번호를 입력하세요");
			f.passwd.focus();
			return false;
		
		
		}else if(f.MEMBER_PASSWORD.value != f.MEMBER_PASSWORD2.value){
			alert("비밀번호가 일치하지 않습니다");
			f.MEMBER_PASSWORD.value = "";
			f.MEMBER_PASSWORD2.value = "";
			f.MEMBER_PASSWORD.focus();
			return false;
		}else if(f.MEMBER_EMAIL.value == ""){
			alert("이메일을 제대로 입력해주세요");
			f.MEMBER_EMAIL.focus();
			return false;
		}
		
		return true;
	} 
</script>


	
		<form:form action="memberModify.cul" method="post" name="memberModifyForm" onsubmit="return check()">
			
				<table>
					
					<colgroup>
						<col style="width:120px" />
						<col />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">아이디</th>
							<td>
								${id}
								<input type="hidden" name="MEMBER_ID" id="MEMBER_ID" />
							</td>
						</tr>
						<tr>
							<th scope="row">비밀번호</th>
							<td>
								<input type="password" class="txt w200" id="MEMBER_PASSWORD" name="MEMBER_PASSWORD"   />
								<span class="bk pt_red"></span>
							</td>
						</tr>
						<tr>
							<th scope="row">비밀번호 확인</th>
							<td><input type="password" class="txt w200" id="MEMBER_PASSWORD2"  name="MEMBER_PASSWORD2"   /></td>
						</tr>
						<tr>
							<th scope="row">이름</th>
							<td>
								${name}
								<input type="hidden" class="txt w200" name="MEMBER_NAME" id="MEMBER_NAME" />
							</td>
						</tr>
						
						
						<tr>
							<th scope="row">이메일</th>
							<td><input type="text" class="txt w200" name="MEMBER_EMAIL" value="${MEMBER_EMAIL}" path="MEMBER_EMAIL"
							
							id="MEMBER_EMAIL"
							
							 /></td>
						</tr>
					</tbody>
				</table>
			

			
				

			<div class="btn_type_04">
				<a href="mypage.cul" >
					<span>취소</span>
				</a>
				
					<input type="submit" value="확인" />
				
			</div>
		</form:form>
	</div>
</div>