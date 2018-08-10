<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<html lang="ko">
<head>
</head>
<body>
    <h2>음악 리스트</h2>
    <table class="board_list">
        <colgroup>
            <col width="10%"/>
            <col width="*"/>
            <col width="15%"/>
            <col width="20%"/>
        </colgroup>
        <thead>
            <tr>
                <th scope="col">번호</th>
                <th scope="col">앨범이름</th>
                <th scope="col">아티스트 이름</th>
                <th scope="col">음악장르</th>
                <th scope="col">국가</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="adminMusicListForm"  items="${adminMusicListForm}" varStatus="stat"> <!--  컨트롤러에서 보내준 값과 일치시켜야한다(대소문자까지!) -->
				<%-- <c:url var="viewURL" value="ReserveDetail.box" >
					<c:param name="RESERVE_IDX" value="${adminMusicListForm.MUSICIDX}" /> <!-- ReserveDetail.box 매핑컨트롤러에 해당 파라미터값을 보낸다 -->	
			    </c:url> --%>
				<tr class="music" role="row">
				<td class="title">
 
                
                <a href="${viewURL}">${adminMusicListForm.MUSIC_INDEX}</a>   <!--   클릭을 하면 위 viewRRL 부분 매핑을 실행하기 위함 -->
                </td>
				<td>${adminMusicListForm.MUSIC_ALBUM}</td>
				<td>${adminMusicListForm.MUSIC_ARTIST}</td>
				<td>${adminMusicListForm.MUSIC_GENRE}</td>
				<td>${adminMusicListForm.MUSIC_COUNTRY}</td>						
			</tr>						
			</c:forEach>
			<!--  등록된 상품이 없을때 -->
				<c:if test="${fn:length(adminMusicListForm) le 0}">
					<tr><td colspan="9" style="text-align:center;">등록된 상품이 없습니다</td></tr>
				</c:if> 
															
        </tbody>
    </table>
 
</body>
</html>