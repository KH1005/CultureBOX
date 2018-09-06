<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<html lang="ko">
<head>
<!-- Mobile Specific Meta -->
<!-- using icon -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<script src="<c:url value='/interior-master/js/vendor/jquery-2.2.4.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/jquery-stars-master/dist/stars.min.js'/>"></script>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.css'/>" />
<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
<!--CSS   ============================================= -->
<link rel="stylesheet" href="<c:url value='/interior-master/css/linearicons.css'/>">
<link rel="stylesheet" href="<c:url value='/interior-master/css/font-awesome.min.css'/>">
<link rel="stylesheet" href="<c:url value='/interior-master/css/bootstrap.css'/>">
<link rel="stylesheet" href="<c:url value='/interior-master/css/magnific-popup.css'/>">
<link rel="stylesheet" href="<c:url value='/interior-master/css/nice-select.css'/>">                     
<link rel="stylesheet" href="<c:url value='/interior-master/css/animate.min.css'/>">
<link rel="stylesheet" href="<c:url value='/interior-master/css/owl.carousel.css'/>">
<link rel="stylesheet" href="<c:url value='/interior-master/css/main.css'/>">
         

<link href="<c:url value='/rating.css'/>" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://unpkg.com/animate.css/animate.css" type="text/css" />
<link rel="stylesheet" href="https://unpkg.com/rmodal/dist/rmodal.css" type="text/css" />
  

<script type="text/javascript">
   /* function return_validation(){
    var Del = confirm("정말 삭제하시겠습니까??")
    if(Del == true)
    { 
    alert("삭제 되었습니다.")
    return false;
    } else  
    return true;

    } */
   function delchk(searchVal, viewURL, searchNum) {
      return confirm("삭제하시겠습니까?");
   }

   function checkboxSelectQue(n, obj) {
      var i;
      var chk = document.getElementsByName(obj);
      var value = "";
      var tot = chk.length;
      for (i = 0; i < tot; i++) {
         if (n == 1)
            chk[i].checked = true; //전체선택
         if (n == 2)
            chk[i].checked = false; //전체취소
         if (n == 3)
            chk[i].checked = !chk[i].checked; //반전
         value = value + chk[i].value+'/';
      }
    
   }
   
   
   function checkboxSelectPull(obj) {
         var i;
         var chk = document.getElementsByName(obj);
         var value = "";
         var tot = chk.length;
         var checked = 0;
         
         for (i = 0; i < tot; i++) {
            if (chk[i].checked == true)
            value = value + chk[i].value+'/';
         
         }
       
         
         $.ajax({
            url:"http://localhost:8080/culture/admin/ReserveModifyAll.cul",
            data: "value="+encodeURIComponent(value),
            type:"post",
            success:function(req){
               var result = req.code;
               alert(result);
               location.reload();
            },error:function(){
               alert('fail');
            }
         })
      }
   
   
   function checkboxSelectPush(obj) {
         var i;
         var chk = document.getElementsByName(obj);
         var value = "";
         var tot = chk.length;
         var checked = 0;
         
         for (i = 0; i < tot; i++) {
            if (chk[i].checked == true)
            value = value + chk[i].value+'/';
         
         }
         
         
         $.ajax({ 
            url:"http://localhost:8080/culture/admin/ReserveModifyBackAll.cul",
            data: "value="+encodeURIComponent(value),
            type:"post",
            success:function(req){
               var result = req.code;
               alert(result);
               location.reload();
            },error:function(){
               alert('fail');
               location.reload();
            }
         })
      }
   
   function checkboxSelectDel(obj) {
         var i;
         var chk = document.getElementsByName(obj);
         var value = "";
         var tot = chk.length;
         var checked = 0;
         
         for (i = 0; i < tot; i++) {
            if (chk[i].checked == true)
            value = value + chk[i].value+'/';
         
         }
         alert(value);
         
         $.ajax({
            url:"http://localhost:8080/culture/admin/AdminReserveDeleteAll.cul",
            data: "value="+encodeURIComponent(value),
            type:"post",
            success:function(req){
               var result = req.code;
               alert(result);
               location.reload();
            },error:function(){
               alert('fail');
            }
         })
      }
   
   
   
   
</script>


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
               <h2 class="text-white">회원 예약 목록</h2>
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
            <td align="center">Y/N</td>
            <td align="center">Check</td>
            <td align="center">Admin</td>  
            <td align="center">Admin</td>
            <td align="center">Setting</td>
         </tr>
         </div>
         <tbody>
            <c:forEach var="adminReserveListForm"
               items="${adminReserveListForm}" varStatus="stat">
               <!--  컨트롤러에서 보내준 값과 일치시켜야한다(대소문자까지!) -->
               <tr>
               
                  <td>${adminReserveListForm.RESERVE_IDX}<!--   클릭을 하면 위 viewRRL 부분 매핑을 실행하기 위함 -->
                  </td>
                  <td style="color: gray">${adminReserveListForm.RESERVE_DATE}</td>
                  <td style="color: gray">${adminReserveListForm.RESERVE_ID}</td>
                  <td style="color: gray">${adminReserveListForm.CULTURE_NAME}</td>
                  <td style="color: gray">${adminReserveListForm.CULTURE_LOCATION}</td>
                  <td style="color: gray">${adminReserveListForm.SEAT_NAME}</td>
                  <td style="color: gray">${adminReserveListForm.SEAT_PRICE}</td>
                  <td style="color: gray">${adminReserveListForm.RESERVE_CONFIRM}</td>
           <!-- <td><input type="checkbox" name="chk${adminReserveListForm.RESERVE_IDX}" value="1" /></td> 이렇게 넣으면 chk1 chk2 로 됨 오개쩌네 그럼  -->

                  <td><input type="checkbox" name="chk[]"
                     value="${adminReserveListForm.RESERVE_IDX}"  id="confirm-checkbox" /></td>
                  <!--이름에 인덱스 줄수있거든이름 name 에? ㅇㅇㅇ 예 시 -->
                  <div class="button-group-area mt-40">
                  <td><c:url var="viewURL" value="ReserveModify.cul">
                        <c:param name="RESERVE_IDX"
                           value="${adminReserveListForm.RESERVE_IDX}" />
                     </c:url> <a href="${viewURL}"><input type="button" value="결제확인"
                        class="genric-btn success medium"></a></td>


                  <td><c:url var="viewURL" value="ReserveModifyBack.cul">
                        <c:param name="RESERVE_IDX"
                           value="${adminReserveListForm.RESERVE_IDX}" />
                     </c:url> <a href="${viewURL}"><input type="button" value="결제취소"
                        class="genric-btn success-border medium"></a></td>


                  <td><c:url var="viewURL" value="ReserveDelete.cul">
                        <c:param name="RESERVE_IDX"
                           value="${adminReserveListForm.RESERVE_IDX}" />
                     </c:url> <a href="${viewURL}" onclick="return delchk()" class="lnr lnr-trash">
                        </a>
                  </td>
            </c:forEach>
            <!--  등록된 상품이 없을때 -->
               <c:if test="${fn:length(adminReserveListForm) le 0}">
                  <tr>
                     <td colspan="9" style="text-align: center;">등록된 상품이 없습니다</td>
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

            <div class="d7" style="text-align:center;">
         <form action="">
            <select class="searchOption btn btn-default" name="searchNum" id="searchNum" >
               <option value="0">아이디</option>
               <option value="1">공연명</option>
               <option value="2">공연장위치</option>
                </select>
                <input class="contact_input contact_input_name" type="text" name="isSearch" id="isSearch" /><span>
               <button type="submit" class="genric-btn info-border circle">검색</button>
            </span>
      
      </form>  
      </div>    
      <br>  
      <br>


  

    
   <div class="paging" align="center">${pagingHtml}
</body>

 <!-- sweet alert -->
         <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
          
          
         <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
         <script src="<c:url value='/interior-master/js/vendor/bootstrap.min.js'/>"></script>         
         <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
           <script src="<c:url value='/interior-master/js/easing.min.js'/>"></script>         
         <script src="<c:url value='/interior-master/js/hoverIntent.js'/>"></script>
         <script src="<c:url value='/interior-master/js/superfish.min.js'/>"></script>   
         <script src="<c:url value='/interior-master/js/jquery.ajaxchimp.min.js'/>"></script>
         <script src="<c:url value='/interior-master/js/jquery.magnific-popup.min.js'/>"></script>   
         <script src="<c:url value='/interior-master/js/owl.carousel.min.js'/>"></script>                  
         <script src="<c:url value='/interior-master/js/jquery.nice-select.min.js'/>"></script>                     
         <script src="<c:url value='/interior-master/js/mail-script.js'/>"></script>   
         <script src="<c:url value='/interior-master/js/main.js'/>"></script>   
         
         <!-- rating star -->
          <%-- <script type="text/javascript" src="<c:url value='/js/jquery.js'/>"></script>
         <script type="text/javascript" src="<c:url value='/js/jquery.raty.min.js'/>"></script> --%>
         
         
         <script type="text/javascript" src="https://unpkg.com/rmodal/dist/rmodal.js"></script>

</body>
</html>