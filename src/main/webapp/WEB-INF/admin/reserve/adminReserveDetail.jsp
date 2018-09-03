<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<html lang="ko">
<head>
</head>
<body>
    <table class="Reserve_Detail">
        
        <caption>게시글 상세보기</caption>
        <tbody>
         <tr>
                <th>예약번호</th>
                <th>공연날짜</th>
                <th>공연 종료날짜</th>
                <th>공연장 위치</th>
                <th>예약자아이디</th>
                <th>좌석 구역</th>
                <th>좌석번호</th>
                <th>공연명</th>
                <th>결제여부</th>
         </tr>		
		 <tr>
                <td>${adminReserveDetail.RESERVE_IDX}</td>
				<td>${adminReserveDetail.RESERVE_DATE}</td>
				<td>${adminReserveDetail.RESERVE_ID}</td>
<%-- 				<td>${adminReserveDetail.RESERVE_SIDX}</td>
 --%>				<td>${adminReserveDetail.RESERVE_CIDX}</td>
				<td>${adminReserveDetail.RESERVE_CONFIRM}</td>					
			</tr>			
			<tr>
			<td></td>
			<td></td>
			<td></td>
			<td>
			<c:url var="viewURL" value="ReserveListForm.cul" >
    </c:url>
     <a href="${viewURL}">목록</a> 
     </td>
      <%-- <c:forEach var="adminReserveDelete"  items="${adminReserveDelete}" varStatus="stat">
    <c:url var="viewURL" value="ReserveDelete.box" >
     <c:param name="RESERVE_IDX" value="${adminReserveDelete.RESERVE_IDX}" />
    </c:url> --%>
    <td>
    <c:url var="viewURL" value="ReserveDelete.cul" >
         <c:param name="RESERVE_IDX" value="${adminReserveDetail.RESERVE_IDX}" />
    </c:url>
     <a href="${viewURL}">삭제</a> 
     </td>
     <tr>
     
<%-- </c:forEach> --%>
        </tbody>
    </table>
    <br/>
    </body>
    </html>
     
     
   <%-- <%--  <a href="#none" class="btn btnC_03 btnP_04 mr10" onclick="location.href='noticeList.torrent?currentPage=${currentPage}'">
					<span>목록</span>
				</a>
    
    
     <c:url var="viewURL" value="ReserveListForm.box" >
    </c:url>
     <a href="${viewURL}">목록</a> 
     
      <c:forEach var="adminReserveDelete"  items="${adminReserveDelete}" varStatus="stat">
     <c:url var="viewURL" value="ReserveDelete.box" >
     <c:param name="RESERVE_IDX" value="${adminReserveDelete.RESERVE_IDX }" />
    </c:url>
     <a href="${viewURL}">삭제하기</a> 
    </c:forEach>
      </tbody>
    </table>
    <br/> --%>