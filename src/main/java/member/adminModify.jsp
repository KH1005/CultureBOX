<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
</head>
<body>
	
	<table class="board_view">
		<colgroup>
			<col width="15%" />
			<col width="35%" />
			<col width="15%" />
			<col width="35%" />
		</colgroup>
		<caption>회원 수정</caption>
		<tbody>

		<form action="MemberModify.cul" method="get">
			<tr>
				<th scope="row">아이디</th>
				<td colspan="3"><input type="text" id="MEMBER_ID"
					name="MEMBER_ID" class="wdp_90" value="${member.MEMBER_ID}" /></td>
			</tr>
			<tr>
				<th scope="row">패스워드</th>
				<td colspan="3"><input type="text" id="MEMBER_PASSWORD"
					name="MEMBER_PASSWORD" class="wdp_90"
					value="${member.MEMBER_PASSWORD}" /></td>
			</tr>
			<tr>
				<th scope="row">이름</th>
				<td colspan="3"><input type="text" id="MEMBER_NAME"
					name="MEMBER_NAME" class="wdp_90" value="${member.MEMBER_NAME}" />
				</td>
			</tr>
			<tr>
				<th scope="row">Email</th>
				<td colspan="3"><input type="text" id="MEMBER_EMAIL"
					name="MEMBER_EMAIL" class="wdp_90" value="${member.MEMBER_EMAIL}" />
				</td>
			</tr>
				
					
				
			
			<tr>
				<td><c:url var="viewURL" value="AdminMemberList.cul">
					</c:url> <a href="${viewURL}">목록</a> 
					
					<c:url var="viewURL1" value="MemberModify.cul"></c:url>
						<input type="submit" value="수정">
						
					<c:url var="viewURL" value="MemberDelete.cul">
						<c:param name="MEMBER_ID" value="${member.MEMBER_ID}" />
					</c:url> <a href="${viewURL}">삭제</a>
				</td>
			</tr>
		</tbody>
	</table>

</form>
	</form>
</body>
</html>