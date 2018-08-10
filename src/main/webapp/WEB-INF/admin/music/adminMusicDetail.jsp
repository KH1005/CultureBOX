<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<html lang="ko">
<head>
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
               <td>${adminMusicDetail.MUSIC_INDEX}</td>
				<td>${adminMusicDetail.MUSIC_ALBUM}</td>
				<td>${adminMusicDetail.MUSIC_ARTIST}</td> 				
 				<td>${adminMusicDetail.MUSIC_GENRE}</td>
				<td>${adminMusicDetail.MUSIC_COUNTRY}</td>					
			</tr>			
			<tr>
			
			<td>
			<c:url var="viewURL" value="MusicListForm.box" >
   			 </c:url>
    		 <a href="${viewURL}">목록</a> 
     		</td>
     		 <td>
            <c:url var="viewURL" value="MusicDelete.box" >
               <c:param name="MUSIC_INDEX" value="${adminMusicDetail.MUSIC_INDEX}" />
            </c:url>
            <a href="${viewURL}">삭제</a> 
    	    </td>
   			</tr>
        </tbody>
    </table>
    <br/>
    </body>
    </html>
     