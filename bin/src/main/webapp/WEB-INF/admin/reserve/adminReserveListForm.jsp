<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<html lang="ko">
<head>
</head>
<body>
    <h2>회원 예약 확인</h2>
    <table class="board_list">
        <colgroup>
            <col width="10%"/>
            <col width="*"/>
            <col width="15%"/>
            <col width="20%"/>
        </colgroup>
        <thead>
            <tr>
                <th scope="col">예약번호</th>
                <th scope="col">공연날짜</th>
                <th scope="col">예약자아이디</th>
                <th scope="col">공연명</th>
                <th scope="col">결제여부</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="adminReserveListForm"  items="${adminReserveListForm}" varStatus="stat"> <!--  컨트롤러에서 보내준 값과 일치시켜야한다(대소문자까지!) -->
				<c:url var="viewURL" value="ReserveDetail.cul" >
					<c:param name="RESERVE_IDX" value="${adminReserveListForm.RESERVE_IDX}" /> <!-- ReserveDetail.box 매핑컨트롤러에 해당 파라미터값을 보낸다 -->	
			    </c:url>
				<tr class="reserve" role="row">
				<td class="title">
               
                <a href="${viewURL}">${adminReserveListForm.RESERVE_IDX}</a>    <!--   클릭을 하면 위 viewRRL 부분 매핑을 실행하기 위함 -->
                </td>
				<td>${adminReserveListForm.RESERVE_DATE}</td>
				<td>${adminReserveListForm.RESERVE_ID}</td>
				<td>${adminReserveListForm.RESERVE_CIDX}</td>
				<td>${adminReserveListForm.RESERVE_CONFIRM}</td>						
			</tr>						
			</c:forEach>
			
			<!--  등록된 상품이 없을때 -->
				<c:if test="${fn:length(adminReserveListForm) le 0}">
					<tr><td colspan="9" style="text-align:center;">등록된 상품이 없습니다</td></tr>
				</c:if> 
															
        </tbody>
    </table>
    
    
   <!--   <script type="text/javascript">  
     $(document).ready(function(){
            $("a[name='title']").on("click", function(e){ //제목 
                e.preventDefault();
                fn_openBoardDetail($(this));
            });
     });
         
      
        function fn_openBoardDetail(obj){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/ReserveDetail.box' />");
            comSubmit.addParam("RESERVE_ID", obj.parent().find("#RESERVE_ID").val());
            comSubmit.submit();
        } 
      
    </script>     -->
 
</body>
</html>