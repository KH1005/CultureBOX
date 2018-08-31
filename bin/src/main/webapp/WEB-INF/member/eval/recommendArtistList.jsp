<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<link href="http://localhost:8080/culture/hover.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://localhost:8080/culture/js/jquery.js"></script>
<script type="text/javascript" src="http://localhost:8080/culture/js/jquery.raty.min.js"></script>
<script type="text/javascript" src="http://localhost:8080/culture/ajax/ajax.js"></script>
</head>
<body>

<h2>추천 리스트</h2>	<a href="http://localhost:8080/culture/eval/RecommendGenreList.cul?id=${id}">장르</a>&nbsp;&nbsp;&nbsp;
				|&nbsp;&nbsp;&nbsp;<a href="http://localhost:8080/culture/eval/RecommendArtistList.cul?id=${id }">아티스트</a>&nbsp;&nbsp;&nbsp;
				|&nbsp;&nbsp;&nbsp;<a href="http://localhost:8080/culture/eval/RecommendCountryList.cul?id=${id}">국가</a>
	<table  class="table" width="700" align="center" id="work" >
					<c:choose>
						<c:when test="${fn:length(artist) > 0}">
	                        <c:forEach items="${artist }" var="row" varStatus="stat">
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
                        <p>
                        	평가 데이터가 부족합니다 :( 별점을 더 찍어주세요 :D
                        </p>
                        </c:otherwise>
     				</c:choose>
               </table>

</body>
</html>









          
  
