<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:if test="${deleteCheck == 1 }">

<article class="container">

                </div>
            </div>


 
      <h1><strong>탈퇴가 완료되었습니다.</strong></h1>
            <h1>돌아오실시겠죠?</h1>
             
             
             <br>
              <div id="buttonmain">
      <a href="loginForm.cul">
         <h1>메인으로</h1>
      </a>
   </div>
</div>
    </div> 
    

   

   
      <a href=".." class="btn btnC_04 btnF_02">
         <span>메인으로</span>
      </a>


</c:if>

<c:if test="${deleteCheck == -1 }">



                </div>
            </div>


 
      <h1><strong>${name}</strong> 님 </h1>
            <h1><strong>password가</strong>가 <strong>틀렸습니다</strong>.</h1>
             <h1>다시 작성해주세요</h1>
             
             
             <br>
              <div id="buttonmain">
      <a href="delete.cul">
         <h1>메인으로</h1>
      </a>
   </div>

    
     
    
</c:if>


<script type="text/javascript">

   function back() {
      history.back();
   }
   
</script>