<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<meta charset="UTF-8">
<title>Insert title here</title>
      <title>CultureBox</title>
      <header id="header" class="">
           
              <div class="header-top">
                 <div class="container">
                 </div>
            </div>
             <c:if test="${id != 'admin1'}">
              <div class="container main-menu">
                <div class="row align-items-center justify-content-between d-flex">
                  <div id="logo" align="left">
                    <a href="index.html"><img src="<c:url value='/interior-master/cultureimg/logo333.png'/>" alt="" title=""></a>
                  </div>
                  <!-- 장르 리스트 url -->
                  <c:url value="/eval/RecommendGenreList.cul" var="genre" >
                     <c:param name="id" value="${id }"></c:param>
                  </c:url>
                  <!-- 아티스트 리스트 url -->
                  <c:url value="/eval/RecommendArtistList.cul" var="artist">
                     <c:param name="id" value="${id }"></c:param>
                  </c:url>
                  <!-- 국가 리스트 url -->
                  <c:url value="/eval/RecommendCountryList.cul" var="country">
                     <c:param name="id" value="${id }"></c:param>
                  </c:url>
                  <!-- 평가리스트 -->
                  <c:url value="/eval/EvalList.cul" var="eval">
                     <c:param name="id" value="${id }"></c:param>
                  </c:url>
                  <!-- 네비게이션 바 -->
                  <nav id="nav-menu-container">
                    <ul class="nav-menu sf-js-enabled sf-arrows" style="touch-action: pan-y;">
                      <li class="menu-active"><a href="index.html">Concert</a></li>
                       <li><a href="${eval }">Evaluation</a></li>
                      <li class="menu-has-children"><a href="${genre }">Music</a>
                        <ul>
                          <li><a href="${genre }">Genre</a></li>
                          <li><a href="${artist }">Artist</a></li>
                          <li><a href="${country }">Country</a></li>
                        </ul>
                      </li>
                      <li class="menu-has-children"><a href="">My</a>
                        <ul>
                          <li><a href="blog-home.html">My</a></li>
                          <li><a href="blog-single.html">Music</a></li>
                          <li><a href="blog-single.html">Reservation</a></li>
                          <li><a href="blog-single.html">Withdrawal</a></li>
                        </ul>
                      </li>
<%--                       <c:if test="${id != null}">
 --%>                     <a href="/culture/member/logout.cul"> <span>Logout</span>
                      
                      
                      
<%--                       </c:if>
 --%> 
 </ul>
                  </nav><!-- #nav-menu-container -->                
                </div>
             </div>
 				</c:if>
           </header><!-- #header -->





		<%-- 			<c:if test="${id =='admin1'}">
                     <a href="/culture/member/logout.cul"> <span>Logout</span> 
                      
                      
                      
                      </c:if>

 --%>

































