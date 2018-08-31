<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<html lang="ko">



<head>
<script src="../common/js/html5shiv.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="js/js-load.js"></script>
<script type="text/javascript">
$(window).on('load', function () {
    load('#js-load', '4');
    $("#js-btn-wrap .button").on("click", function () {
        load('#js-load', '4', '#js-btn-wrap');
    })
});
 
function load(id, cnt, btn) {
    var girls_list = id + " .js-load:not(.active)";
    var girls_length = $(girls_list).length;
    var girls_total_cnt;
    if (cnt < girls_length) {
        girls_total_cnt = cnt;
    } else {
        girls_total_cnt = girls_length;
        $('.button').hide()
    }
    $(girls_list + ":lt(" + girls_total_cnt + ")").addClass("active");
}
</script>
</head>
<body>
    <table class="Reserve_Detail">
        
        <caption>게시글 상세보기</caption>
        <tbody>
         <tr>
                <th>앨범번호</th>
                <th>앨범</th>
                <th>아티스트</th>
                <th>음악 장르</th>
                <th>국가</th>   
         </tr>		
		 <tr>
		 		<td colspan=3 height=600 style="padding: 0px !important;">
				<img src="http://localhost:8080/culture/musicimg/${adminMusicModel.MUSIC_SAVNAME}" width="150px" height="200px"/>				</td>
               <td>${adminMusicModel.MUSIC_INDEX}</td>
				<td>${adminMusicModel.MUSIC_ALBUM}</td>
				<td>${adminMusicModel.MUSIC_ARTIST}</td> 				
 				<td>${adminMusicModel.MUSIC_GENRE}</td>
				<td>${adminMusicModel.MUSIC_COUNTRY}</td>					
			</tr>			
			<tr>
			
			<td>
			<c:url var="viewURL" value="MusicListForm.cul" >
   			 </c:url>
    		 <a href="${viewURL}">목록</a> 
     		</td>
     			<td>
			<c:url var="viewURL" value="MusicModifyForm.cul" >
 				 <c:param name="MUSIC_INDEX" value="${adminMusicModel.MUSIC_INDEX}" />
    			 </c:url> 
<%--     		 <a href="http://localhost:8080/culture/admin/MusicModifyForm.cul?MUSIC_INDEX=${adminMusicDetail.MUSIC_INDEX}">수정</a> 
 --%>     		            <a href="${viewURL}">수정</a></td> 
     		
     		 <td>
            <c:url var="viewURL" value="MusicDelete.cul" >
               <c:param name="MUSIC_INDEX" value="${adminMusicModel.MUSIC_INDEX}" />
            </c:url>
            <a href="${viewURL}">삭제</a> 
    	    </td>
    	    <td>
   			</tr>
        </tbody>
    </table>
    <br/>
    
     <c:choose>
		   <c:when test="${fn:length(musicCommentList) > 0}">
		   <div id="contents" style="height:546px; width:600px; margin-left:0px border-left-width:10px">
			<div id="js-load" class="main">
			 <ul class="lists">
            <c:forEach items="${musicCommentList}" var="row"  varStatus="stat" >
             	<li class="lists__item js-load">
             		<strong>${row.MCOMMENT_WRITER }</strong>님 
             		<fmt:formatDate value="${row.MCOMMENT_WRITEDATE}" pattern="yy.MM.dd"></fmt:formatDate>
             		 <a href='http://localhost:8080/culture/admin/deleteMusicComment.cul?MCOMMENT_IDX=${row.MCOMMENT_IDX}&MCOMMENT_MUSICIDX=${adminMusicDetail.MUSIC_INDEX}'
							class="btn btnC_01 btnP_02"> <span class="btn btnC_05 reply_btn">삭제</span>
					</a>
					<p>${row.MCOMMENT_CONTENT}</p>
             	</li>
			     
			</c:forEach> 
			 </ul>
			 	<div id="js-btn-wrap" class="btn-wrap"><a href="javascript:;" class="button">더보기</a></div>
			 	<div class="btn_type_04">
	             <!-- <a href="javascript:history.back()" class="btn btnC_03 btnF_02 mr10">
		       <span>목록</span></a> -->
		       </div>
	             <!--  <a href="javascript:history.back()" class="btn btnC_03 btnF_02 mr10">
		       <span>목록</span></a> -->
               
			 	</div>
			   </div>
			   
		   </c:when>
				<c:otherwise>
					<tr>
					<td colspan="4">등록된 댓글이 없습니다</td>
					</tr>
				</c:otherwise>
	       
	</c:choose>
	
	
	
	
	
    
    
    
    
    
    </body>
    </html>
     