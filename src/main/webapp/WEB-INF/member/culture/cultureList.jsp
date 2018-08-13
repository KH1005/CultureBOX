<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>

<link href="http://localhost:8080/culture/hover.css" rel="stylesheet" type="text/css">
</head>

<body>
<div class="cultureList">
<h2>공연</h2>


       <table  class="table" width="700" align="center" id="work">
                        <c:forEach items ="${cultureList}" var = "row" varStatus="stat">
                           

                         
                           <c:if test ="${stat.index % 3 eq 0}">
                              <tr></tr>
                           </c:if>
                           <td width="230" align="center">
                           <a class="show" href='http://localhost:8080/culture/concert/CultureDetail.cul?culture_idx=${row.CULTURE_IDX}'><img src="http://localhost:8080/culture/A.jpg" width="150px" height="200px">
                           </a>
                            <div class="hide"><a href='http://localhost:8080/culture/concert/CultureDetail.cul?culture_idx=${row.CULTURE_IDX}'><p>&nbsp;&nbsp;${row.CULTURE_NAME}</p></a>
                           <p><fmt:formatDate value="${row.CULTURE_START}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${row.CULTURE_END}" pattern="yyyy.MM.dd" /></p>
                           <p>&nbsp;&nbsp;${row.CULTURE_LOCATION}</p>
                           </div>
                           
                          
                                 
                                 
                           </a> <br> <br>
                              <br> </td>
                       </c:forEach>
     
               </table>
      

<!--  등록된 공연이 없을때 -->
<c:if test="${fn:length(cultureList) le 0}">
   등록된 상품이 없습니다
</c:if> 
</div>
</body>
