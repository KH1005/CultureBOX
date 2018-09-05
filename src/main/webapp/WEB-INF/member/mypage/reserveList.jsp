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
   height: 10px;
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

<script type="text/javascript">
function delchk(){
    return confirm("예매를 취소하시겠습니까?");
    
    
}
</script>
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
            <td align="center">cancel</td>    
         </tr>
         </div>
         <tbody>
            <c:forEach var="memberOrderList"
               items="${memberOrderList}" varStatus="stat" >
               <!--  컨트롤러에서 보내준 값과 일치시켜야한다(대소문자까지!) -->
               <tr>
                  <td style="color: gray">${memberOrderList.RESERVE_IDX}</td>
                  <td style="color: gray">${memberOrderList.RESERVE_DATE}</td>
                  <td style="color: gray">${memberOrderList.RESERVE_ID} </td>
                  <td style="color: gray">${memberOrderList.CULTURE_NAME}</td>
                  <td style="color: gray">${memberOrderList.CULTURE_LOCATION}</td>
                  <td style="color: gray">${memberOrderList.SEAT_NAME}</td>
                  <td style="color: gray">${memberOrderList.SEAT_PRICE}</td>
                  <td style="color: gray">
                 <!--  <a href="" class="genric-btn success medium"> -->
                 <c:url var="viewURL" value="/download/pdf.cul">
                   <c:param name="id" value="${memberOrderList.RESERVE_ID}" />
                   <c:param name="cidx" value="${memberOrderList.CULTURE_IDX}"/>
                 </c:url>
                    <a href="${viewURL}" class="genric-btn success medium">티켓출력</a>
                  </td> 
                  <td style="color: gray"><c:url var="viewURL" value="reserveCancel.cul">
                        <c:param name="RESERVE_IDX"
                           value="${memberOrderList.RESERVE_IDX}" />
                     </c:url> <a href="${viewURL}" onclick="return delchk()" class="lnr lnr-trash">
                        </a>
                  </td>
         
            </c:forEach>
            <!--  등록된 상품이 없을때 -->
               <c:if test="${fn:length(memberOrderList) le 0}">
                  <tr>
                     <td colspan="9" style="text-align: center;">예약 내역이 없습니다.</td>
                  </tr>
               </c:if> 
          
            
            </tr>
          
               
         </tbody>

      </table>
   </div>

          
   <div class="paging" align="center">${pagingHtml}
</body>
<br>
<br>
<br>
<br>
</html>