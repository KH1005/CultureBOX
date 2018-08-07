<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String cp = request.getContextPath(); %>

<div class="cultureList">
			<h3 class="sub_tit">공연</h3>
			<ul>
				<c:forEach var="list" items="${list }" varStatus="stat">
				<c:url var="viewURL" value="/culture/concert/cultureDetail.box">
					<c:param name="culture_idx" value="${list.culture_idx}" />
				<%-- 	<c:param name="currentPage" value="${currentPage }" /> --%>
				</c:url>
				<li><a href="${viewURL}" class="list"> 
				<img src="/project/upload/movie/${list.culture_savname}" alt="공연 포스터" /> 
				<span class="detail">상세보기</span>
						<div class="explan">
							<p>
								<strong></strong> : ${list.culture_name}
							</p>
							<p>
								<strong></strong> : <fmt:formatDate value="${culture_start}" pattern="yyyy.MM.dd"></fmt:formatDate>
								~ <fmt:formatDate value="${culture_end}" pattern="yyyy.MM.dd"></fmt:formatDate>
							</p>
						</div>
				</a> 
				<span class="btn btnC_02 btnF_01"> 
				<input type="button" value="예매하기" onclick="javascript:location.href='<%=cp%>/reserve/ReserveForm.box'"/>
				</span></li>
			</c:forEach>
			</ul>
		</div><!-- // movie_list -->

		<c:if test="${session_member_grade == 1}">
			<div class="btn_type_05">
				<a href="<%=cp%>/admin/movieWrite.mt" class="btn btnC_03 btnP_04">
						<span>글쓰기</span>
				</a>
			</div>
		</c:if>

		<!-- paging -->
		<%-- <div class="paging">
			${pagingHtml}
		</div> --%>
		<!-- // paging -->