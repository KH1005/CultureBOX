<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
<link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
<link rel="stylesheet" type="text/css"
   href="https://technext.github.io/interior/css/main.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
   <!-- jquery -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<style>
.banner-area {
   background:
      url(file:///C:/spring/mavenApp/cultureBOX/src/main/webapp/cssimg/mainback7.jpg)
      center;
   background-size: cover;
}

table {
   width: 50%;
   border-top: 1px solid #444444;
   border-collapse: collapse;
   width: 1100px;
   height: 500px;
}

th {
   font-size: 20px;
   font-weight: 500;
   height: 69px;
   text-align: center;
}

td {
   height: 50px;
   text-align: center;
}

.contact_input {
    display: inline-block;
    width: calc(13% - 10px);
    height: 42px;
    border: none;
    outline: none;
    border-bottom: solid 1px #cccccc;
    background: transparent;  
    -webkit-transition: all 200ms ease;
    -moz-transition: all 200ms ease;
    -ms-transition: all 200ms ease;
    -o-transition: all 200ms ease;
    transition: all 200ms ease;
}

button, input, optgroup, select, textarea {
    margin: 0;
    font-family: inherit;
    font-size: inherit;
    line-height: inherit;
}

button, input {
    overflow: visible;
}

</style>

</head>
<body>
   <section class="banner-area relative" id="home">
      <div class="overlay overlay-bg"></div>
      <div class="container">
         <div class="row d-flex align-items-center justify-content-center">
            <div class="about-content col-lg-12">
               <br>
               <p class="text-white link-nav">
               </p>
               <br> <br>
               <h2 class="text-white">My reservation</h2>
            </div>
         </div>
      </div>
   </section>

   <div class="progress-table">
      <table class="board_list" align="center">
         <div class="table-head">
         <tr style="color:#1e8ec0;">
            <td align="center">No</td>
            <td align="center">Date</td>
            <td align="center">ID</td>
            <td align="center">Concert</td>
            <td align="center">Location</td>
            <td align="center">Seat</td>
            <td align="center">Price</td>
            <td align="center">ticket</td>  
         </tr>
         </div>
         <tbody>
            <c:forEach var="reserveList"
               items="${reserveList}" varStatus="stat" var="row">
               <!--  컨트롤러에서 보내준 값과 일치시켜야한다(대소문자까지!) -->
               <tr>
               
                 <%--  <td>${adminReserveListForm.RESERVE_IDX}<!--   클릭을 하면 위 viewRRL 부분 매핑을 실행하기 위함 -->
                  </td> --%>
                  <td style="color: gray">${row.RESERVE_IDX}</td>
                  <td style="color: gray">${row.RESERVE_DATE}</td>
                  <td style="color: gray">${row.RESERVE_ID} </td>
                  <td style="color: gray">${row.CULTURE_NAME}</td>
                  <td style="color: gray">${row.CULTURE_LOCATION}</td>
                  <td style="color: gray">${row.SEAT_NAME}</td>
                  <td style="color: gray">${row.SEAT_PRICE}</td>
                  <td style="color: gray"></td>
           <!-- <td><input type="checkbox" name="chk${adminReserveListForm.RESERVE_IDX}" value="1" /></td> 이렇게 넣으면 chk1 chk2 로 됨 오개쩌네 그럼  -->

                 <%--  <td><input type="checkbox" name="chk[]"
                     value="${adminReserveListForm.RESERVE_IDX}"  id="confirm-checkbox" /></td> --%>
                  <!--이름에 인덱스 줄수있거든이름 name 에? ㅇㅇㅇ 예 시 -->
                  <div class="button-group-area mt-40">
                  <td><c:url var="viewURL" value="ReserveModify.cul">
                        <c:param name="RESERVE_IDX"
                           value="${row.RESERVE_IDX}" />
                     </c:url> <a href="${viewURL}"><input type="button" value="티켓 출력"
                        class="genric-btn success medium"></a></td> 


            <%--       <td><c:url var="viewURL" value="ReserveModifyBack.cul">
                        <c:param name="RESERVE_IDX"
                           value="${adminReserveListForm.RESERVE_IDX}" />
                     </c:url> <a href="${viewURL}"><input type="button" value="결제취소"
                        class="genric-btn success-border medium"></a></td> --%>


                <%--   <td><c:url var="viewURL" value="ReserveDelete.cul">
                        <c:param name="RESERVE_IDX"
                           value="${adminReserveListForm.RESERVE_IDX}" />
                     </c:url> <a href="${viewURL}" onclick="return delchk()" class="lnr lnr-trash">
                        </a>
                  </td> --%>
            </c:forEach>
            <!--  등록된 상품이 없을때 -->
               <c:if test="${fn:length(reserveList) le 0}">
                  <tr>
                     <td colspan="9" style="text-align: center;">예약 내역이 없습니다.</td>
                  </tr>
               </c:if> 
          
            
            </tr>
            <td></td>
            <td></td>
            <td></td>  
            <td></td>
            <td></td>
            <td></td>
            <td></td>
              
            <div class="button-group-area mt-10">
            
            <td><br><br><c:url var="viewURL" value="ReserveListForm.cul">
               </c:url> <a href="${viewURL}"><input type="button" value="목록" class="genric-btn default-border"></a></td>
               
               
            <td><br><br><input type="button" value="전체선택"
               onclick="checkboxSelectQue(1,'chk[]')" class="genric-btn default-border"/></td>
               
               
            <td><br><br><input type="button" value="결제확인" onclick="checkboxSelectPull('chk[]')" class="genric-btn default-border"/></td>
            
            
            <td><br><br><a href><input type="button" value="확인취소" onclick="checkboxSelectPush('chk[]')" class="genric-btn default-border"></td>
            </a>

            <td><br><br><a href><input type="button" value="전체삭제" onclick="checkboxSelectDel('chk[]')" class="genric-btn default-border"></a></td>

            </div>

            <tr>


               
         </tbody>

      </table>
   </div>

          
      <br>  
      <br>


  


   <div class="paging" align="center">${pagingHtml}
</body>
<br>
<br>
<br>
<br>
</html>