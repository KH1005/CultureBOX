<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html lang="ko">
<head>
<script src="${contextPath}/res/js/date/jquery-1.10.2.js"></script>
</head>
<body>
	<h2>Member List</h2>
	<table class="board_list">
		<colgroup>
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
			<col width="25%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">아이디</th>
				<th scope="col">패스워드</th>
				<th scope="col">이름</th>
				<th scope="col">이메일</th>
				<th scope="col">회원관리</th>

			</tr>
		</thead>
		<tbody>
			<c:forEach items="${adminMemberList}" var="adminMemberList"
				varStatus="stat">
				<%-- <c:url var="viewURL" value="${MemberModifyForm.box }"/>
			<c:param name="id" value="${MemberModifyForm.MEMBERD_ID }" /> --%>
				<!--  컨트롤러에서 보내준 값과 일치시켜야한다(대소문자까지!) -->
				<tr class="member">
					<td>${adminMemberList.MEMBER_ID}</td>
					<td>${adminMemberList.MEMBER_PASSWORD}</td>
					<td>${adminMemberList.MEMBER_NAME}</td>
					<td>${adminMemberList.MEMBER_EMAIL}</td>
					<td><c:url var="viewURL" value="MemberModifyForm.cul">
							<c:param name="MEMBER_ID" value="${adminMemberList.MEMBER_ID}" />
						</c:url> <a href="${viewURL}">click:)</a></td>



				</tr>
				
			</c:forEach>
			
					<div class="paging">${pagingHtml}</div>
					
					<div class="row">
							<div style="text-align:center;">
								<div id="dataTables-example_filter" class="dataTables_filter">
									<form action="">
									<select class="form-control" name="searchNum" id="searchNum">
										<option value="0">전체</option>
									</select>
										<input class="form-control" type="text" name="isSearch" id="isSearch"/>
										<span>
										<button type="submit" class="btn btn-default">검색</button>
										</span>
									</form>
								</div>							
							</div>
							
					</div>
				
					
		</tbody>
	</table>
</body>

<%-- <td><button type="button"
							onclick="location.href='MemberModify.box?MEMBER_ID=${MEMBER_ID }'">수정</button></td>
					<td align="left"><button type="button"
							onclick="location.href='MemberDelete.box?MEMBER_ID=${MEMBER_ID }'">삭제</button></td> --%>