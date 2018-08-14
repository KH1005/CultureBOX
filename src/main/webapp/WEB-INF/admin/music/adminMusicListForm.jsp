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
	<table  class="table" width="700" align="center" id="work" >
       
       
        
            <c:forEach var="adminMusicListForm"  items="${adminMusicListForm}" varStatus="stat"> <!--  컨트롤러에서 보내준 값과 일치시켜야한다(대소문자까지!) -->
				<c:url var="viewURL" value="MusicDetail.cul" >
					<c:param name="MUSIC_INDEX" value="${adminMusicListForm.MUSIC_INDEX}" /> <!-- ReserveDetail.box 매핑컨트롤러에 해당 파라미터값을 보낸다 -->	
			    </c:url>
				 <c:if test="${stat.index %4 eq 0 }">
                              <tr></tr>
                           </c:if>
				 <td width="100px" height="150px" align="center" class="music">
                 
                <a href="${viewURL}"><img src="http://localhost:8080/culture/a.jpg" width="150px" height="200px"/></a>    <!--   클릭을 하면 위 viewRRL 부분 매핑을 실행하기 위함 -->
                </td>
									
										
									
			</c:forEach>
			<!--  등록된 상품이 없을때 -->
				<c:if test="${fn:length(adminMusicListForm) le 0}">
					<tr><td colspan="9" style="text-align:center;">등록된 상품이 없습니다</td></tr>
				</c:if> 
		 	 <td>
            <c:url var="viewURL" value="MusicJoinForm.cul" >
            </c:url>
            <a href="${viewURL}">등록</a> 
    	    </td>				 
								
															
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