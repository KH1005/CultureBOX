<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://technext.github.io/interior/css/main.css">
<style>
.banner-area {  
    background: url(file:///C:/spring/mavenApp/cultureBOX/src/main/webapp/cssimg/mainback7.jpg) center;
    background-size: cover;
}  
</style> 
<script src="${contextPath}/res/js/date/jquery-1.10.2.js"></script>

</head>
   
<body>  
<section class="banner-area relative" id="home">   
            <div class="overlay overlay-bg"></div>
            <div class="container">            
               <div class="row d-flex align-items-center justify-content-center">
                  <div class="about-content col-lg-12">
                     <br>   
                     <p class="text-white link-nav">        <span class="lnr lnr-arrow-right"></span></p><br><br>
                     <h2 class="text-white">
                        Culture List         
                     </h2> 
                  </div>   
               </div>
            </div>
         </section>
         
         
   <div class="cultureList">
   

      <table class="table" width="700" align="center" id="work">
         <c:forEach items="${adminCultureList}" var="row" varStatus="stat">



            <c:if test="${stat.index % 4 eq 0}">
               <tr></tr>
            </c:if>
            <td width="230" align="center"><a class="show"
               href='http://localhost:8080/culture/admin/CultureDetail.cul?culture_idx=${row.CULTURE_IDX}'><img
                  src="http://localhost:8080/culture/cultureimg/${row.CULTURE_SAVNAME }" width="200px"
                  height="280px"> </a>
               <div class="hide">
                  <a
                     href='http://localhost:8080/culture/admin/CultureDetail.cul?culture_idx=${row.CULTURE_IDX}'><p>&nbsp;&nbsp;${row.CULTURE_NAME}</p></a>
                  <fmt:parseDate value="${row.CULTURE_START}" var="dateFmt" pattern="yyyy-MM-dd"/>
                           <fmt:formatDate value="${dateFmt}" pattern="yyyy-MM-dd"/>~<fmt:parseDate value="${row.CULTURE_END}" var="dateFmt" pattern="yyyy-MM-dd"/>
                           <fmt:formatDate value="${dateFmt}" pattern="yyyy-MM-dd"/>
                  <fmt:parseDate value="${row.CULTURE_START}" pattern="yyyy-MM-dd" />~<fmt:parseDate value="${row.CULTURE_END}"  pattern="yyyy-MM-dd" />
                  <p>&nbsp;&nbsp;${row.CULTURE_LOCATION}</p>


               </div> </a> <br> <br> <br></td>
         </c:forEach>


         <c:url var="viewURL" value="CultureJoinForm.cul">
         </c:url>
         <a href="${viewURL}">등록</a>
         </td>



         <div class="row">
            <div style="text-align: center;">
               <div id="dataTables-example_filter" class="dataTables_filter">
                  <form action="">
                     <select class="form-control" name="searchNum" id="searchNum">
                        <option value="0">공연명</option>
                     </select> <input class="form-control" type="text" name="isSearch"
                        id="isSearch" /> <span>
                        <button type="submit" class="btn btn-default">검색</button>
                     </span>
                  </form>
               </div>
            </div>
         </div >


      </table>


      <!--  등록된 상품이 없을때 -->
      <c:if test="${fn:length(adminCultureList) le 0}">
   등록된 상품이 없습니다
</c:if>
   </div>
</body>
</html>