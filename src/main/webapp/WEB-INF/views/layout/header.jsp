<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="shortcut icon" href="http://localhost:8080/culture/interior-master/img/fav.png">
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
                      <li class="menu-active"><a href="/culture/concert/CultureList.cul">Concert</a></li>
                       <li><a href="${eval }">Evaluation</a></li>
                      <li class="menu-has-children"><a href="${genre }">Music</a>
                        <ul>
                          <li><a href="${genre }">Genre</a></li>
                          <li><a href="${artist }">Artist</a></li>
                          <li><a href="${country }">Country</a></li>
                        </ul>
                      </li>
                      <li class="menu-has-children"><a href="/culture/mypage/mypage.cul">My</a>
                        <ul>
                          <li><a href="/culture/mypage/myMusicTaste.cul">My Music Taste</a></li>
                          <li><a href="/culture/mypage/myEval.cul">My Music</a></li>
                          <li><a href="">Reservation</a></li>
                          <li><a href="/culture/mypage/memberdeleteForm.cul">Withdrawal</a></li>
                        </ul>
                      </li>
                    <a href="/culture/member/logout.cul"> <span>Logout</span></a>
 					</ul>
                  </nav>                
                </div>
             </div>
 				</c:if>
 				
 				
 				
 				
 				<c:if test="${id == 'admin1'}">
              <div class="container main-menu">
                <div class="row align-items-center justify-content-between d-flex">
                  <div id="logo" align="left">
                    <a href="index.html"><img src="<c:url value='/interior-master/cultureimg/logo333.png'/>" alt="" title=""></a>
                  </div>
                  <!-- 평가리스트 -->
                  <c:url value="/admin/MusicListForm.cul" var="music">
                     <c:param name="id" value="${id }"></c:param>
                  </c:url>
                  <!-- 평가리스트 -->
                  <c:url value="/admin/ReserveListForm.cul" var="reserve">
                     <c:param name="id" value="${id }"></c:param>
                  </c:url>
                  <!-- 네비게이션 바 -->
                  <nav id="nav-menu-container">
                    <ul class="nav-menu sf-js-enabled sf-arrows" style="touch-action: pan-y;">
                      <li class="menu-active"><a href="/culture/admin/CultureListForm.cul">Concert</a></li>
                      <li class="menu-has-children"><a href="${music }">Music</a></li>
                      <li class="menu-has-children"><a href="${reserve }">Reservation</a>
                      </li>
                    <a href="/culture/member/logout.cul"> <span>Logout</span></a>
 					</ul>
                  </nav>                
                </div>
             </div>
 				</c:if>
				
           </header>
