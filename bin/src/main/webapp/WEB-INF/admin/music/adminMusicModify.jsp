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

<SCRIPT type="text/javascript">
      function validation() {
      
    	var frm = document.forms["mform"];
    	
  	    var album = frm.elements["MUSIC_ALBUM"];
  	    var artist = frm.elements["MUSIC_ARTIST"];
  	    var release = frm.elements["MUSIC_RELEASE"];
  	    var albuminfo = frm.elements["MUSIC_ALBUMINFO"];
  	    var artistinfo = frm.elements["MUSIC_ARTISTINFO"];
  	    var song = frm.elements["MUSIC_SONG"];
  	    var genre = frm.elements["MUSIC_GENRE"];
  	    var country = frm.elements["MUSIC_COUNTRY"];

         if(album.value == "") {
            alert("앨범이름을 입력해주세요.");
            return false;
         } 	
         
         else if(artist.value == "") {
            alert("아티스트 이름을 입력해주세요.");
            return false;
         }
         
         else if(release.value == "") {
             alert("발매날짜를 입력해주세요.");
             return false;
          }
   /*       
         else if(release.value != "yy-mm-dd") {
             alert("발매날짜를 확인해주세요.");
             return false;
          } */
         
        
         else if(albuminfo.value == "") {
            alert("앨범정보를 입력해주세요.");
            return false;         
         } 
         
         else if(artistinfo.value == "") {
             alert("아티스트정보를 입력해주세요.");
             return false;         
          } 
         
         else if(song.value == "") {
             alert("수록곡을 입력해주세요.");
             return false;         
          } 
         
         else if(genre.value == "") {
             alert("장르를 선택해주세요.");
             return false;         
          } 
         
         else if(country.value == "") {
             alert("국가를 선택해주세요.");
             return false;         
          } 
         
         
         
         
         
         
         return true;
      }
   </SCRIPT>

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
		 <form:form commandName="adminMusicModel" action="/culture/admin/MusicModify.cul" name="mform" enctype="multipart/form-data" method="POST" onsubmit="return validation()">
 		<input type="hidden" name="MUSIC_INDEX" value="${adminMusicModify.MUSIC_INDEX}" />
<%-- 		<input type="hidden" name="movie_no" value="${movieView.movie_no}" />
 --%>			  <div class="tbl_type_01">
				<table>
					<colgroup>
						<col style="width:120px;" />
						<col />
					</colgroup>
					 <tbody>
							<%--  <tr>
							<th scope="row">앨범 번호</th>
							 <td>
							 <input type="text" id="TITLE" name="" class="wdp_90" value="${adminMusicModify.MUSIC_INDEX}"></input>
							</td>
						</tr>     --%>
						 <tr>
							<th scope="row">앨범 이름</th>
							 <td>
							 <input type="text" id="TITLE" name="MUSIC_ALBUM" value="${adminMusicModify.MUSIC_ALBUM}" class="wdp_90"></input>
							</td>
						</tr>   
						 <tr>
							<th scope="row">아티스트이름</th>
							<td><input type="text" id="TITLE" name="MUSIC_ARTIST" value="${adminMusicModify.MUSIC_ARTIST}" class="wdp_90"></input>
							</td>
						</tr>
						<tr>
							<th scope="row">발매 날짜</th>
							<td><input type="text" id="TITLE" name="MUSIC_RELEASE" value="${adminMusicModify.MUSIC_RELEASE}" class="wdp_90"></input>
							</td>
						</tr>
						<tr>
							<th scope="row">앨범 정보</th>
							<td><input type="text" style="width:400px; height:200px;"  id="TITLE" value="${adminMusicModify.MUSIC_ALBUMINFO}" name="MUSIC_ALBUMINFO" class="wdp_90"></input>
							</td>
						</tr>
						<tr>
							<th scope="row">아티스트 정보</th>
							<td><input type="textarea" style="width:400px; height:200px;" id="TITLE" value="${adminMusicModify.MUSIC_ARTISTINFO}" name="MUSIC_ARTISTINFO" class="wdp_90"></input>
							</td>
						</tr>
						<tr>
							<th scope="row">수록곡</th>
							<td><input type="textarea" style="width:200px; height:400px;" id="TITLE" value="${adminMusicModify.MUSIC_SONG}" name="MUSIC_SONG" class="wdp_90"></input>
							</td>
						</tr>
						<tr>
						
						
							 <th scope="row">음악 장르</th>
							<td><select name="MUSIC_GENRE">
   							 <option value="">장르선택</option>
   							 <option value="발라드">발라드</option>
  							  <option value="R&B">R&B</option>
  							  <option value="POP">POP</option>
  							  <option value="힙합">힙합</option>
  							  <option value="댄스">댄스</option>
  							  <option value="ROCK">ROCK</option>
  							  <option value="트로트">트로트</option>
  							  <option value="기타">기타</option>
								</select>
							</td>
						</tr>
						
						<tr>
						
							 <th scope="row">국가</th>
							<td><select name="MUSIC_COUNTRY">
   							 <option value="">국가선택</option>
   							 <option value="한국">한국</option>
  							  <option value="미국">미국</option>
  							  <option value="일본">일본</option>
  							  <option value="중국">중국</option>
  							  <option value="대만">대만</option>
  							  <option value="기타">기타</option>
								</select>
							</td>
						</tr>
						
							<tr>
							<th scope="row">포스터</th>
							<td colspan=3>
								<input type="file" name="file" value="MUSIC_SAVNAME"/> 
							</td>	
						</tr>
						
					</tbody> 
				</table>
			</div>
			<tr>
			<td>
            <c:url var="viewURL" value="MusicListForm.cul" >
            </c:url>
            <a href="${viewURL}">목록</a> 
    	    </td>
				
				<span class="btn btnC_04 btnP_04">
					<input type="submit" value="수정" />
				</span> 
			
		</form:form> 
		
		</tbody>
 	</div>
</div>
</body>
</html>
