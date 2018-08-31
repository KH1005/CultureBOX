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
<!--     <div class="admin_list">
      <ul>
         <li><a href="movieList.torrent">상영작</a></li>
         <li class="on"><a href="movieWrite.torrent">영화등록</a></li>
         <li><a href="timeTableList.torrent">시간표관리</a></li>
         <li><a href="noticeList.torrent">공지사항</a></li>
         <li><a href="memberList.torrent">회원정보</a></li>
      </ul>
   </div> -->
   <div class="admin_ct">
      <h3 class="sub_tit">공연 등록</h3>
      <form:form commandName="cultureModel" action="/culture/admin/CultureJoin.cul" name="mform" enctype="multipart/form-data" method="POST">
       <%-- <input type="hidden" name="currentPage" value="${currentPage}" />
      <input type="hidden" name="movie_no" value="${movieView.movie_no}" /> --%>
           <div class="tbl_type_01">
            <table>
               <colgroup>
                  <col style="width:120px;" />
                  <col />
               </colgroup>
               <tbody>
                      <%--  <tr>
                     <th scope="row">앨범 번호</th>
                      <td>
                      <input type="text" id="TITLE" name="" class="wdp_90" value="${adminCultureJoinForm.CULTURE_IDX}"></input>
                   <font color="red" ><form:errors path="CULTURE_NAME" /></font>  
                     </td>
                  </tr>  --%>   
                   <tr>
                     <th scope="row">공연명</th>
                      <td>
                      <input type="text" id="TITLE" name="CULTURE_NAME" class="wdp_90" ></input>
                   <font color="red" ><form:errors path="CULTURE_NAME" /></font>  
                     </td>
                  </tr>   
                  
                    <tr>
                  
                     <th scope="row">카테고리</th>
                     <td><select name="CULTURE_CATEGORY">
                         <option value="">선택</option>
                         <option value="콘서트">콘서트</option>
                         <option value="연극">연극</option>
                         <option value="뮤지컬">뮤지컬</option>
                        
                        </select>
                        <font color="red" ><form:errors path="movie_info" /></font>
                     </td>
                  </tr>
                  
                  
                   <tr>
                     <th scope="row">위치</th>
                     <td><input type="text" id="TITLE" name="CULTURE_LOCATION" class="wdp_90" ></input>
                        <font color="red" ><form:errors path="movie_director" /></font>
                     </td>
                  </tr>
                  <tr>
                     <th scope="row">시작날짜</th>
                     <td><input type="text" id="TITLE" name="CULTURE_START" class="wdp_90" ></input>
                        <font color="red" ><form:errors path="movie_actor" /></font>
                     </td>
                  </tr>
                  <tr>
                     <th scope="row">종료날짜</th>
                     <td><input type="text" id="TITLE" name="CULTURE_END" class="wdp_90" ></input>
                        <font color="red" ><form:errors path="movie_actor" /></font>
                     </td>
                  </tr>
                	
                	<tr>
                     <th scope="row">좌석 구역</th>
                     <td><input type="text" id="TITLE" name="CULTURE_AREA" class="wdp_90" ></input>
                        <font color="red" ><form:errors path="movie_actor" /></font>
                     </td>
                  </tr>
                  
                  <tr>
                     <th scope="row">좌석 가격</th>
                     <td><input type="text" id="TITLE" name="CULTURE_PRICE" class="wdp_90" ></input>
                        <font color="red" ><form:errors path="movie_actor" /></font>
                     </td>
                  </tr>

                  <tr>
                     <th scope="row">상세내용</th>
                     <td><input type="textarea" style="width:200px; height:400px;" id="TITLE" name="CULTURE_CONTENT" class="wdp_90" ></input>
                        <font color="red" ><form:errors path="movie_actor" /></font>
                     </td>
                  </tr>
                
                  
                 
         
               <tr>
                     <th scope="row">포스터</th>
                     <td colspan=3>
                        <input type="file" name="file" value="CULTURE_SAVNAME"/>
                     </td>   
                  </tr>
                  
               </tbody>
            </table>
         </div>
         
         <td>
            <c:url var="viewURL" value="CultureListForm.cul" >
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
