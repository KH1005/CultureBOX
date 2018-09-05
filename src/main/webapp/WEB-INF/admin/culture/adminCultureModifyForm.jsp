<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="/TorrentBox/resources/js/jquery-1.10.2.min.js"></script>
<script src="/TorrentBox/resources/js/jquery-ui.js"></script>

<script type="text/javascript" charset="utf-8"
	src="/TorrentBox/resources/js/jquery.leanModal.min.js"></script>

<script>
	$(function() {

		$('#loginform').submit(function(e) {
			return true;
		});

		$('#modaltrigger').leanModal({
			top : 110,
			overlay : 0.45,
			closeButton : ".hidemodal"
		});

		$('#movie_show_date').datepicker();

	});
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="admin_grp">

		<div class="admin_ct">
			<h3 class="sub_tit">공연 수정</h3>
			<form:form commandName="cultureModel"
				action="/culture/admin/CultureModify.cul" name="mform"
				enctype="multipart/form-data" method="POST">
				
				<form action="MemberModify.cul" method="get">

				<div class="tbl_type_01">
					<table>
						<colgroup>
							<col style="width: 120px;" />
							<col />
						</colgroup>
						<tbody>

							<tr>
								<input type="hidden" name="CULTURE_IDX" value="${culture.CULTURE_IDX }">
							
								<th scope="row">공연명</th>
								<td><input type="text" id="CULTURE_NAME"
									name="CULTURE_NAME" class="wdp_90"
									value="${culture.CULTURE_NAME }"></td>
							</tr>

							<tr>

								<th scope="row">카테고리</th>
								<td><select name="CULTURE_CATEGORY" id="CULTURE_CATEGORY"
									value="${culture.CULTURE_CATEGORY }">
										<option value="">선택</option>
										<option value="콘서트">콘서트</option>
										<option value="연극">연극</option>
										<option value="뮤지컬">뮤지컬</option>
								</select></td>
							</tr>


							<tr>
								<th scope="row">위치</th>
								<td><input type="text" id="CULTURE_LOCATION"
									name="CULTURE_LOCATION" class="wdp_90"
									value="${culture.CULTURE_LOCATION}"></input> </td>
							</tr>
							
							
							<tr>
								<th scope="row">시작날짜</th>
								<td><input type="text" id="CULTURE_START"
									name="CULTURE_START" class="wdp_90" value="${culture.CULTURE_START } "></input></td>
							</tr>
							
							
							<tr>
								<th scope="row">종료날짜</th>
								<td><input type="text" id="CULTURE_END" name="CULTURE_END" class="wdp_90" value="${culture.CULTURE_END }"></input>
								</td>
							</tr>


							<tr>
								<th scope="row">상세내용</th>
								<td><input type="textarea"
									style="width: 200px; height: 400px;" id="CULTURE_CONTENT"
									name="CULTURE_CONTENT" class="wdp_90"
									value="${culture.CULTURE_CONTENT }"></td>
							</tr>




							<tr>
								<th scope="row">포스터</th>
								<td colspan=3><input type="file" name="CULTURE_SAVNAME"
									id="CULTURE_SAVNAME" value="${culture.CULTURE_SAVNAME }" /></td>
							</tr>

						</tbody>
					</table>
				</div>

				<td><c:url var="viewURL" value="CultureListForm.cul">
					</c:url> <a href="${viewURL}">목록</a></td>

				<c:url var="viewURL1" value="CultureModify.cul"></c:url>
						<input type="submit" value="수정">
						</form>
			</form:form>
			
			</tbody>
		</div>

	</div>
</body>
</html>
