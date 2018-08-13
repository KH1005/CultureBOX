<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="/TorrentBox/resources/js/jquery-1.10.2.min.js"></script>
<script src="/TorrentBox/resources/js/jquery-ui.js"></script>

<script type="text/javascript" charset="utf-8" src="/TorrentBox/resources/js/jquery.leanModal.min.js"></script>

<script>
$(function(){
	 
  $('#loginform').submit(function(e){
    return true;
  });
	  
  $('#modaltrigger').leanModal({ top: 110, overlay: 0.45, closeButton: ".hidemodal" });
	  
  $('#movie_show_date').datepicker();

});
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title> 
</head>
<body>
<div class="admin_grp">
<!-- 	 <div class="admin_list">
		<ul>
			<li><a href="movieList.torrent">상영작</a></li>
			<li class="on"><a href="movieWrite.torrent">영화등록</a></li>
			<li><a href="timeTableList.torrent">시간표관리</a></li>
			<li><a href="noticeList.torrent">공지사항</a></li>
			<li><a href="memberList.torrent">회원정보</a></li>
		</ul>
	</div> -->
	<div class="admin_ct">
		<h3 class="sub_tit">노래 등록</h3>
		<form:form commandName="adminMusicModel" action="MusicJoin.cul" name="mform" enctype="multipart/form-data">
 		<input type="hidden" name="currentPage" value="${currentPage}" />
		<input type="hidden" name="movie_no" value="${movieView.movie_no}" />
			  <div class="tbl_type_01">
				<table>
					<colgroup>
						<col style="width:120px;" />
						<col />
					</colgroup>
					<tbody>
							<tr>
							<th scope="row">앨범 번호</th>
							 <td>
							 <input type="text" id="TITLE" name="TITLE" class="wdp_90" value="${adminMusicForm.MUSIC_INDEX}"></input>
 						<font color="red" ><form:errors path="MUSIC_ALBUM" /></font>  
							</td>
						</tr>   
						 <tr>
							<th scope="row">앨범 이름</th>
							 <td>
							 <input type="text" id="TITLE" name="TITLE" class="wdp_90" value="${adminMusicForm.MUSIC_ALBUM}"></input>
 						<font color="red" ><form:errors path="MUSIC_ALBUM" /></font>  
							</td>
						</tr>   
						 <tr>
							<th scope="row">아티스트이름</th>
							<td><input type="text" id="TITLE" name="TITLE" class="wdp_90" value="${adminMusicForm.MUSIC_ARTIST}"></input>
								<font color="red" ><form:errors path="movie_director" /></font>
							</td>
						</tr>
						<tr>
							<th scope="row">발매 날짜</th>
							<td><input type="text" id="TITLE" name="TITLE" class="wdp_90" value="${adminMusicForm.MUSIC_RELEASE}"></input>
								<font color="red" ><form:errors path="movie_actor" /></font>
							</td>
						</tr>
						<tr>
							<th scope="row">앨범 정보</th>
							<td><input type="textarea" style="width:400px; height:200px;"  id="TITLE" name="TITLE" class="wdp_90" value="${adminMusicForm.MUSIC_ALBUMINFO}"></input>
								<font color="red" ><form:errors path="movie_actor" /></font>
							</td>
						</tr>
						<tr>
							<th scope="row">아티스트 정보</th>
							<td><input type="textarea" style="width:400px; height:200px;" id="TITLE" name="TITLE" class="wdp_90" value="${adminMusicForm.MUSIC_ARTISINFO}"></input>
								<font color="red" ><form:errors path="movie_actor" /></font>
							</td>
						</tr>
						<tr>
							<th scope="row">수록곡</th>
							<td><input type="textarea" style="width:200px; height:400px;" id="TITLE" name="TITLE" class="wdp_90" value="${adminMusicForm.MUSIC_SONG}"></input>
								<font color="red" ><form:errors path="movie_actor" /></font>
							</td>
						</tr>
						<tr>
						
							<th scope="row">음악 장르</th>
							<td><select name="job">
   							 <option value="">장르선택</option>
   							 <option value="${adminMusicForm.MUSIC_GENRE}">발라드</option>
  							  <option value="${adminMusicForm.MUSIC_GENRE}">R&B</option>
  							  <option value="${adminMusicForm.MUSIC_GENRE}">POP</option>
  							  <option value="${adminMusicForm.MUSIC_GENRE}">힙합</option>
  							  <option value="${adminMusicForm.MUSIC_GENRE}">댄스</option>
  							  <option value="${adminMusicForm.MUSIC_GENRE}">ROCK</option>
  							  <option value="${adminMusicForm.MUSIC_GENRE}">트로트</option>
  							  <option value="${adminMusicForm.MUSIC_GENRE}">기타</option>
								</select>
								<font color="red" ><form:errors path="movie_info" /></font>
							</td>
						</tr>
						
						<tr>
						
							<th scope="row">국가</th>
							<td><select name="country">
   							 <option value="">국가선택</option>
   							 <option value="${adminMusicForm.MUSIC_COUNTRY}">한국</option>
  							  <option value="${adminMusicForm.MUSIC_COUNTRY}">미국</option>
  							  <option value="${adminMusicForm.MUSIC_COUNTRY}">일본</option>
  							  <option value="${adminMusicForm.MUSIC_COUNTRY}">중국</option>
  							  <option value="${adminMusicForm.MUSIC_COUNTRY}">대만</option>
  							  <option value="${adminMusicForm.MUSIC_COUNTRY}">기타</option>
								</select>
								<font color="red" ><form:errors path="movie_info" /></font>
							</td>
						</tr>
			
					<tr>
							<th scope="row">포스터</th>
							<td colspan=3>
								<input type="file" name="file" value="${adminMusicForm.MUSIC_SAVNAME}"/>
							</td>	
						</tr>
						
					</tbody>
				</table>
			</div>
			
			<td>
            <c:url var="viewURL" value="MusicListForm.cul" >
            </c:url>
            <a href="${viewURL}">목록</a> 
    	    </td>
    	    <%--  <td>
            <c:url var="viewURL" value="MusicJoin.cul" >
            </c:url>
            <a href="${viewURL}">작성완료</a> 
    	    </td> --%>
    	     
    	    
			<%-- <div class="btn_type_03">
				<a href="#none" class="btn btnC_03 btnP_04 mr10" onclick="javascript:location.href='movieList.torrent?currentPage=${currentPage.currentPage}'">
					<span>목록</span>
				</a> --%>
				<span class="btn btnC_04 btnP_04">
					<input type="submit" value="작성완료" />
				</span> 
			<!-- </div> -->
		</form:form>
		</tbody>
 	</div>
</div>
</body>
</html>