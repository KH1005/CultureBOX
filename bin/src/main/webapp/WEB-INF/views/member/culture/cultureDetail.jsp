<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String cp = request.getContextPath();
%>
<html>
<head>
<script src="../common/js/html5shiv.js"></script>
<meta name="viewport" content="width=device-width, maximum-scale=1, minimum-scale=1, user-scalable=no" />
<meta name="format-detection" content="telephone=no">
<link type="text/css" rel="stylesheet" href="css/reset.css" media="screen" />
<link type="text/css" rel="stylesheet" href="css/js-load.css" media="screen" />
<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="js/js-load.js"></script>
<script>
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
<div class="culture_grp">
	<div class="culture_pic">
		<img src="/project/upload/movie/${cultureModel.CULTURE_SAVNAME}"
			width="200" height="150" /> 
	</div>
	<div class="culture_txt">
		<p class="tit">${cultureModel.CULTURE_NAME}</p>

		<tr>
			<td><strong>공연장소</strong></td>
			<td>${cultureModel.CULTURE_LOCATION}</td>
		</tr>
		<br>

		<tr>
			<td><strong>기간</strong></td>
			<td><fmt:formatDate value="${cultureModel.CULTURE_START}"
					pattern="yyyy.MM.dd" /> ~ <fmt:formatDate
					value="${cultureModel.CULTURE_END}" pattern="yyyy.MM.dd" /></td>
		</tr>

		<div class="culture_btn">
			<span class="btn btnC_02 btnF_01 mr10"> <input type="button"
				value="예매하기"
				onclick="javascript:location.href='<%=cp%>/reserve/reserveMain.mt'" />
			</span>

			<c:if test="${session_member_grade == 1}">
				<a href="<%=cp%>/admin/movieUpdate.mt?movie_no=${list.movie_no}"
					class="btn btnC_01 btnF_04"> <span>수정</span>
				</a>
				<a
					href="javascript:del_check('movieDelete.mt?movie_no=${list.movie_no}');"
					class="btn btnC_01 btnF_04"> <span>삭제</span>
				</a>
			</c:if>

		</div>
	</div>
</div>
<h3 class="sub_tit">상세정보</h3>
<p class="summary">${cultureModel.CULTURE_CONTENT}</p>

<h3 class="sub_tit">구매 및 환불정보</h3>
취소일자에 따라서 아래와 같이 취소 수수료가 부과됩니다. 예매일 기준보다 관람일 기준이 우선 적용됩니다.
<br>
단, 예매 당일 밤 12시 이전 취소시에는 취소수수료가 없으며, 예매수수료도 환불됩니다.
<br>
<br>
My티켓 > 예매/취소내역에서 직접 취소 또는 고객센터(1544-1234)를 통해서 예매를 취소할 수 있습니다.


<h3 class="sub_tit">관람후기</h3>

<div class="inner">
	<!-- reply_grp -->
	<form class="commentForm" method="post" action="writeCultureComment.cul">
		<input type="hidden" name="item_no"
			value="${cultureModel.CULTURE_IDX}" />

	

				<div class="textarea_grp" style="width: 1000px;">
					<textarea name="COMMENT_CONTENT" style="margin: 10px; width: 849px; height: 55px;"></textarea>
				    <input type="submit" name="submit" type="submit" value="작성완료" class="form_select">
				</div>
		</form>

	  <c:choose>
		   <c:when test="${fn:length(cultureCommentList) > 0}">
             <c:forEach items="${cultureCommentList}" var="row"  varStatus="stat">
                    
                    <div id="contents">
                       <div id="js-load" class="main">
                          <div class="lists">
					
							<div class="lists__item js-load active" style="padding-bottom:0px;">
								<strong>${row.COMMENT_WRITER} </strong>님

								<fmt:formatDate value="${row.COMMENT_WRITEDATE}" pattern="yy.MM.dd"></fmt:formatDate>
				
						  <a href='http://localhost:8080/culture/concert/deleteCultureComment.cul?COMMENT_IDX=${row.COMMENT_IDX}&COMMENT_CULTUREIDX=${cultureModel.CULTURE_IDX}'
							class="btn btnC_01 btnP_02"> <span class="btn btnC_05 reply_btn">삭제</span>
						 </a>
						
						
				   
						<p style="padding-top:0px; padding-bottom:0px; margin-bottom:0px;">${row.COMMENT_CONTENT}</p>
                         </div>
                       </div>
					</div>
			     </div>
			  </c:forEach>
		   </c:when>
				<c:otherwise>
					<tr>
					<td colspan="4">등록된 댓글이 없습니다</td>
					</tr>
				</c:otherwise>
		</c:choose>
		

 <div id="js-btn-wrap" class="btn-wrap"> <a href="javascript:;" class="button">더보기</a> </div> 
    
<div class="btn_type_04">
	<a href="javascript:history.back()" class="btn btnC_03 btnF_02 mr10">
		<span>목록</span>
	</a>
</div>

</body>



</html>


