<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script type="text/javascript" src="<c:url value='/jquery-stars-master/dist/stars.min.js'/>"></script>

<!-- <link href="http://localhost:8080/culture/hover.css" rel="stylesheet" type="text/css"> -->
<link href="<c:url value='/hover.css'/>" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://localhost:8080/culture/js/jquery.js"></script>
<script type="text/javascript" src="http://localhost:8080/culture/js/jquery.raty.min.js"></script>
<script type="text/javascript" src="http://localhost:8080/culture/ajax/ajax.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<body>

<h2>음악 리스트</h2>
	<table  class="table" width="700" align="center" id="work" >
						<c:choose>
							<c:when test="${fn:length(musicList) > 0}">
		                        <c:forEach items="${musicList }" var="row" varStatus="stat">
		                           <!-- <s:url id="viewURL" action="MemberGoodsList">
		                              <s:param name="goods_number">
		                                 <s:property value="goods_number" />
		                              </s:param>
		                           </s:url> -->
			
		                           <c:if test="${stat.index %4 eq 0 }">
		                              <tr></tr>
		                           </c:if>
		                           <td width="100px" height="150px" align="center" class="music">
		                           <a class="show" href='http://localhost:8080/culture/eval/EvalDetail.cul?music_index=${row.MUSIC_INDEX }'><img src="http://localhost:8080/culture/a.jpg" width="150px" height="200px"/></a>
		                           <a href="http://localhost:8080/culture/eval/EvalDetail.cul?MUSIC_INDEX=${row.MUSIC_INDEX }&MEMBER_ID=${id}"><div class="hide"><p>${row.MUSIC_ALBUM}</p>
		                           <input type="text" id="MUSIC_INDEX" name="MUSIC_INDEX" value="${row.MUSIC_INDEX}">
		                           </div> </a>
		                        	</td>
		                        	
		                        </c:forEach>
	                        </c:when>
	                        <c:otherwise>
	                        	<p>평가할게 없어요... ㅠ</p>
	                        </c:otherwise>
                        </c:choose>
     
               </table>

	 

</body>
</html>
   
<!-- 
	리스트, 커서 올리면 정보보이기 

 -->












          
  
