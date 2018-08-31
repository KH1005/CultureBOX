<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="ko">
<head>
 <link rel="stylesheet" type="text/css" href="https://technext.github.io/interior/css/main.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- <link rel="stylesheet" type="text/css" href="http://themewagon.com/wp-content/themes/wagoncore/css/demo.css">
 -->
 <link rel="stylesheet" href="https://technext.github.io/interior/css/bootstrap.css">
 <link rel="stylesheet" href="https://technext.github.io/interior/css/main.css">
<style>
   .banner-area {  
    background: url(file:///C:/Spring/App/workspace/cultureBOX/src/main/webapp/WEB-INF/cssimg/mainback7.jpg) center; 
    background-size: cover;
} 

   		/* table {
    		width: 100%;
    		border-top: 1px solid #444444;
    		border-collapse: collapse;    
   			  width: 1400px;
    		 height: 500px;
      		 }
 
 
 
 		th	{
            font-size: 20px;
            font-weight: 500;
            height: 69px;
            text-align: center;
        }
         
        td{
            height: 50px;
            text-align: center;
        }   */
</style>


<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script>
$(function() {
	var languages = [
		"도은", "도은노래", "방탄소년단","BASIC", "C",
		"C++", "블랙핑크", "EXO", "ColdFusion", "Erlang",
		"Fortran", "여자친구", "Haskell", "Java", "JavaScript",
		"Lisp", "Perl", "걸스데이", "Python", "Ruby",
		"Scala", "김지훈"
	];

	$( "#isSearch" ).autocomplete({
		source: languages
	});
});
</script>

<!-- 프로그래밍 언어: <input id='my-language' type='text'>
 --></head>
<body>
<section class="banner-area relative" id="home">   
            <div class="overlay overlay-bg"></div>
            <div class="container">            
               <div class="row d-flex align-items-center justify-content-center">
                  <div class="about-content col-lg-12">
                     <br>   
                     <p class="text-white link-nav">        <span class="lnr lnr-arrow-right"></span></p><br><br>
                     <h2 class="text-white">
                         	관리자 음악 관리         
                     </h2> 
                  </div>   
               </div>
            </div>
         </section>
    <h2>음악 리스트</h2>
    <table>
    	<tr> 
		 	 <td align="right">
            <c:url var="viewURL" value="MusicJoinForm.cul" >
            </c:url>
            <a href="${viewURL}"><input type="button"  value="등록"></a> 
    	    </td>
    	    </tr>	
    </table>
    
	<table  class="table" >
       
    
        <%-- 
            <c:forEach var="adminMusicListForm"  items="${adminMusicListForm}" varStatus="stat"> <!--  컨트롤러에서 보내준 값과 일치시켜야한다(대소문자까지!) -->
				 <c:url var="viewURL" value="MusicDetail.cul" >
					<c:param name="MUSIC_INDEX" value="${adminMusicListForm.MUSIC_INDEX}" /> <!-- ReserveDetail.box 매핑컨트롤러에 해당 파라미터값을 보낸다 -->	
			    </c:url> 
				  <c:if test="${stat.index %4 eq 0 }">
                              <tr></tr>
                           </c:if> 
				  <td width="100px" height="150px" align="center" class="music">
                <a href="${viewURL}"><img src="http://localhost:8080/culture/musicimg/${adminMusicListForm.MUSIC_SAVNAME}" width="150px" height="200px"/></a>    <!--   클릭을 하면 위 viewRRL 부분 매핑을 실행하기 위함 -->
                </td> 
                </c:forEach>
                 --%>
                 
                 
                 
                 
                
                
           <%--      <div class="col-lg-4">
							<div class="single-gallery">
								<div class="content">
								    <a href="#" target="_blank">
								      <div class="content-overlay"></div>
                 <c:forEach var="adminMusicListForm"  items="${adminMusicListForm}" varStatus="stat"> <!--  컨트롤러에서 보내준 값과 일치시켜야한다(대소문자까지!) -->
				 <c:url var="viewURL" value="MusicDetail.cul" >
					<c:param name="MUSIC_INDEX" value="${adminMusicListForm.MUSIC_INDEX}" /> <!-- ReserveDetail.box 매핑컨트롤러에 해당 파라미터값을 보낸다 -->	
			    </c:url> 
				  <c:if test="${stat.index %4 eq 0 }">
                              <tr></tr>
                           </c:if> 
				  <td width="100px" height="150px" align="center" class="music">
                <img class="content-image img-fluid d-block mx-auto"  src="http://localhost:8080/culture/musicimg/${adminMusicListForm.MUSIC_SAVNAME}" width="150px" height="200px"/>   <!--   클릭을 하면 위 viewRRL 부분 매핑을 실행하기 위함 -->
               </a><div class="content-details fadeIn-bottom"><a href="#" target="_blank">
								        <h3 class="content-title mx-auto">${adminMusicListForm.MUSIC_ALBUM}</h3>
								        </a><a href="${viewURL}" class="primary-btn text-uppercase mt-20">More Details</a>
								      </div>
								      	</div>
							</div>
						</div>
                </td>
						
		
			</c:forEach> --%>
			
			 <c:forEach var="adminMusicListForm"  items="${adminMusicListForm}" varStatus="stat"> <!--  컨트롤러에서 보내준 값과 일치시켜야한다(대소문자까지!) -->
							<c:url var="viewURL" value="MusicDetail.cul" >
					<c:param name="MUSIC_INDEX" value="${adminMusicListForm.MUSIC_INDEX}" /> <!-- ReserveDetail.box 매핑컨트롤러에 해당 파라미터값을 보낸다 -->	
							</c:url> 
							<c:if test="${stat.index %4 eq 0 }">
                              <tr></tr>
                           </c:if>
						
						<div class="single-gallery">
								<div class="content">
								    <a href="#" target="_blank">
								      <div class="content-overlay"></div>
								  		 <img class="content-image img-fluid d-block mx-auto" src="http://localhost:8080/culture/musicimg/${adminMusicListForm.MUSIC_SAVNAME}" alt="">
								      </a><div class="content-details fadeIn-bottom"><a href="#" target="_blank">
								        <h3 class="content-title mx-auto">${adminMusicListForm.MUSIC_ALBUM}</h3>
								        </a><a href="${viewURL}" class="primary-btn text-uppercase mt-20">More Details</a>
								      </div>
								    
								</div>
							</div>
						</div>
						
						</c:forEach>
			
			
			
			
			
			
			
			
			
			
			
			<!--  등록된 상품이 없을때 -->
				<c:if test="${fn:length(adminMusicListForm) le 0}">
					<tr><td colspan="9" style="text-align:center;">등록된 상품이 없습니다</td></tr>
				</c:if>
						 
								
								<tr>
								            <div class="row">
                     <div style="text-align:center;">
                        <div id="dataTables-example_filter" class="">
                           <form action="">
                           <select class="" name="searchNum" id="searchNum">
                              <option value="0">앨범</option>
                              <option value="1">노래</option>
                              <option value="2">아티스트</option>
                              
                           </select>
                              <input class="" type="text" name="isSearch" id="isSearch"/>
                              <span>
                              <button type="submit" class="">검색</button>
                              </span>
                           </form>
                           </tr>
                        </div>                     
                     </div>
								
								
								
															
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