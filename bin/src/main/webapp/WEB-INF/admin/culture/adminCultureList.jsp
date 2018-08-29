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
                        <c:forEach items ="${adminCultureList}" var = "row" varStatus="stat">
                           

                         
                           <c:if test ="${stat.index % 3 eq 0}">
                              <tr></tr>
                           </c:if>
                           <td width="230" align="center">
                           <a class="show" href='http://localhost:8080/culture/admin/CultureDetail.cul?culture_idx=${row.CULTURE_IDX}'><img src="http://localhost:8080/culture/A.jpg" width="150px" height="200px">
                           </a>
                            <div class="hide"><a href='http://localhost:8080/culture/admin/CultureDetail.cul?culture_idx=${row.CULTURE_IDX}'><p>&nbsp;&nbsp;${row.CULTURE_NAME}</p></a>
<%--                            <p><fmt:formatDate value="${row.CULTURE_START}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${row.CULTURE_END}" pattern="yyyy.MM.dd" /></p>
 --%>                           <p>&nbsp;&nbsp;${row.CULTURE_LOCATION}</p>
                           </div>
                             
                          
                                 
                                 
                           </a> <br> <br>
                              <br> </td>
                       </c:forEach>
                       
                       
                       <c:url var="viewURL" value="CultureJoinForm.cul">
						</c:url> <a href="${viewURL}">등록</a></td>
						
						<div class="row">
							<div style="text-align:center;">
								<div id="dataTables-example_filter" class="dataTables_filter">
									<form action="">
									<select class="form-control" name="searchNum" id="searchNum">
										<option value="0">공연명</option>
									</select>
										<input class="form-control" type="text" name="isSearch" id="isSearch"/>
										<span>
										<button type="submit" class="btn btn-default">검색</button>
										</span>
									</form>
								</div>							
							</div>
     
               </table>
      

<!--  등록된 상품이 없을때 -->
<c:if test="${fn:length(adminCultureList) le 0}">
   등록된 상품이 없습니다
</c:if> 
</div>
</body>
</html>