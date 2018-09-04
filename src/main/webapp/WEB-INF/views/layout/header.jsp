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
				          <li class="menu-has-children"><a href="">My</a>
				            <ul>
				              <li><a href="blog-home.html">My</a></li>
				              <li><a href="/culture/mypage/myEval.cul">Music</a></li>
				              <li><a href="blog-single.html">Reservation</a></li>
				              <li><a href="blog-single.html">Withdrawal</a></li>
				            </ul>
				          </li>
 
 </ul>
				      </nav><!-- #nav-menu-container -->		    		
			    	</div>
			    </div>

			  </header><!-- #header -->


<%-- <%@ include file="/WEB-INF/include/include-header.jspf" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<link href="http://localhost:8080/culture/hover.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://localhost:8080/culture/js/jquery.js"></script>
<script type="text/javascript" src="http://localhost:8080/culture/js/jquery.raty.min.js"></script>
<script type="text/javascript" src="http://localhost:8080/culture/ajax/ajax.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
이곳은 헤더 입니다~~!

<script>
  $( function() {
    var availableTags = function(){
  	  $.ajax({
		  url:"http://localhost:8080/culture/eval/MusicAlbumList.cul",
		  type:"POST",
		  dataType:"json",
		  success:function(req){
			  var test = new Array;
			  for(var i=0;i<req.length;i++){
				  var a = req[i].music;
				  test.push(a);
			  }
			  return test;
		  }
	  })
  };
  
    $( "#tags" ).autocomplete({
       source: function(request,response){
    	  $.ajax({
    		  url:"http://localhost:8080/culture/eval/MusicAlbumList.cul",
    		  type:"POST",
    		  dataType:"json",
    		  data:"value="+encodeURIComponent(request.term), 
    		  success:function(data){
    			  response($.map(data, function(item){
    				 return{
    					label:item,
    					value:item
    				}				   
    			  })
    			  );
    		  }
    	  });
      } 
      ,
      minLength:2
      
    });
    
  }); 
</script>
<form method="post">
	<div class="ui-widget" align="center">
	  	<input id="tags" type="text" name="issearch" placeholder="Search">
	</div>
	<a href="http://localhost:8080/culture/download/pdf.cul">티켓</a>
</form>
 --%>





















