<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<!-- Mobile Specific Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="img/fav.png">
      <!-- Author Meta -->
<meta name="author" content="colorlib">
      <!-- Meta Description -->
<meta name="description" content="">
      <!-- Meta Keyword -->
<meta name="keywords" content="">
      <!-- meta character set -->
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>

<!-- google chart -->
<!--Load the AJAX API-->
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <!--pie chart-->
        <script type="text/javascript">
          google.charts.load("current", {packages:["corechart"]});
          google.charts.setOnLoadCallback(drawChart);
          function drawChart() {
            var data = google.visualization.arrayToDataTable([
              ['STAR', 'COUNT'],
              ['1',  ${oneStar}],
              ['2',  ${twoStar}],
              ['3', ${threeStar}],
              ['4', ${fourStar}],
              ['5', ${fiveStar}]
            ]);

          var options = {
            legend: 'none',
            pieSliceText: 'label',
            pieStartAngle: 100,
            colors:['#c6b069','#c6b069','#c6b069','#c6b069','#c6b069']
          };

            var chart = new google.visualization.PieChart(document.getElementById('piechart'));
            chart.draw(data, options);
          }
        </script>
        
        <!--line chart-->
        <script type="text/javascript">
          google.charts.load('current', {'packages':['corechart']});
          google.charts.setOnLoadCallback(drawChart);

          function drawChart() {
            var data = google.visualization.arrayToDataTable([
              ['STAR', 'COUNT'],
              ['1',  ${oneStar}],
              ['2',  ${twoStar}],
              ['3',  ${threeStar}],
              ['4',  ${fourStar}],
              ['5',  ${fiveStar}]
            ]);

            var options = {
              curveType: 'function',
              legend: { position: 'bottom' },
              colors:['#c6b069']
            };

            var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

            chart.draw(data, options);
          }
        </script>

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
<style>
   .verticalLine {
      border-left: thick solid #777;
      padding-left: 12px;
   }
</style>
<style type="text/css">
      .modal .modal-dialog {
        width: 400px;
      }
      .click-callback i { margin:0 3px; font-size:16px !important; }
      .banner-area {
    background: url(<c:url value='/musicimg/${music.MUSIC_SAVNAME }'/>) center;
    background-size: cover;
}
</style>

    
</head>
<body>

				<!-- start banner Area -->
			<section class="banner-area relative" id="home">	
				<div class="overlay overlay-bg"></div>
				<div class="container">				
					<div class="row d-flex align-items-center justify-content-center">
						<div class="about-content col-lg-12">
							<h1 class="text-white">
								${music.MUSIC_ALBUM }			
							</h1>	
						</div>	
					</div>
				</div>
			</section>
			<!-- End banner Area -->	


         <!-- Start project-details Area -->
         <section class="project-details-area section-gap">
            <div class="container">
               <div class="row align-items-center">
                  <div class="col-lg-6 project-details-left">
                     <img class="img-fluid" src="<c:url value='/musicimg/${music.MUSIC_SAVNAME }'/>" alt="" height="500" width="500">
                  </div>
                  <div class="col-lg-6 project-details-right">
                     <h3 class="pb-20">${music.MUSIC_ALBUM }</h3>
                     <p>
                        ${music.MUSIC_ALBUMINFO}
                     </p>
                     <div class="details-info d-flex flex-row">
                        <ul class="names">
                           <li>Rating    </li>
                           <li>Album    </li>
                           <li>Artist   </li>
                           <li>Genre</li>
                           <li>Country</li>
                           <li>Song </li>
                        </ul>
                        <ul class="desc">
                           <li>
                              <c:choose>
                                 <c:when test="${star == 0 }">
                                    <div class="click-callback"></div>
                                 </c:when>
                                 <c:otherwise>
                                    <div class="star">
                                       <c:forEach begin="1" end="${star }" step="1">
                                          <span class="fa fa-star checked"></span>
                                       </c:forEach>
                                       <c:forEach begin="1" end="${5-star }" step="1">
                                          <span class="fa fa-star"></span>
                                       </c:forEach>
                                       <a href="http://localhost:8080/culture/eval/DeleteEvaluation.cul?MEMBER_ID=${member.MEMBER_ID}&MUSIC_INDEX=${music.MUSIC_INDEX}">
                                       <span class="lnr lnr-undo"></span></a>
                                    </div>
                                    
                                 </c:otherwise>
                              </c:choose>
                           </li>
                           <li>:&nbsp; ${music.MUSIC_ALBUM }</li>
                           <li>:&nbsp; ${music.MUSIC_ARTIST }</li>
                           <li>:&nbsp; ${music.MUSIC_GENRE }</li>
                           <li>:&nbsp; ${music.MUSIC_COUNTRY }</li>
                           <li>
                              <c:forEach var="row" items="${songList }" varStatus="stat">
                                  <div>${stat.count}.${row}</div>
                                 
                               </c:forEach>
                           </li>
                        </ul>                     
                     </div>   
                     <div class="button-group-area mt-40">
                                <c:choose>
                         <c:when test="${mycomment != null}">
                         
                            <div class="single-testimonial item d-flex flex-row" id="comment">
                                    <div class="desc">
                                       <div class="row">
                                        <div class="col-lg-12">
                                            <a href="#" id="showModal"><span class="lnr lnr-pencil" style="font-size:25px;"></span></a>
                                            &nbsp;|&nbsp;&nbsp;
                                            <a href='#' id="delete"><span class="lnr lnr-trash" style="font-size:25px;"></span></a>
                                         </div>
                                  </div>
                                        <p id="commenttd">
                                            ${mycomment.MCOMMENT_CONTENT }
                                        </p>    
                                    </div>
                                </div>
                                
                                
                         </c:when>
                         <c:otherwise>
                            <div id="comment">
                               <div class="row">
                                  <div class="col-lg-12">
                                      <a href="#" id="showModal" class="genric-btn primary e-large">코멘트 남기기</a>
                                   </div>
                               </div>
                            </div>
                         </c:otherwise>
                      </c:choose>
                       </div>                                          
                  </div>
               </div>
            </div>   
         </section>
         
         <!--댓글 보여지는창-->
         <section class="testimonial-area pt-120">
              <div class="container">
                  <div class="row d-flex justify-content-center">
                      <div class="menu-content pb-70 col-lg-8">
                          <div class="title text-center">
                              <h1 class="mb-10">Comment</h1>
                              <p>다른회원의 의견을 확인해보세요.</p>
                          </div>
                      </div>
                  </div>
                  <div class="row">
                     <div class="active-testimonial-carusel" id="clist">
                         <c:choose>
                            <c:when test="${fn:length(commentList) >0 }">
                               <c:forEach items="${commentList }" var="row" varStatus="stat">
                                   <div class="single-testimonial item d-flex flex-row" id="c_${row.MCOMMENT_WRITERID}">
                                       <div class="thumb">
                                           <span class="lnr lnr-user" style="font-size: 25px;"></span>
                                       </div>
                                       <div class="desc">
                                           <p id="${row.MCOMMENT_WRITERID }">
                                               ${row.MCOMMENT_CONTENT }
                                           </p>
                                           <h4 mt-30>${row.MCOMMENT_WRITERID }</h4>
                                    <div class="star">
                                       <c:forEach begin="1" end="${row.STAR_COUNT }" step="1">
                                          <span class="fa fa-star checked"></span>
                                       </c:forEach>
                                       <c:forEach begin="1" end="${5-row.STAR_COUNT }" step="1">
                                          <span class="fa fa-star"></span>
                                       </c:forEach>
                                    </div>                                     
                                       </div>
                                   </div>
                                </c:forEach>
                             </c:when>
                             <c:otherwise>
                                
                             </c:otherwise>
                          </c:choose>
                                                 
                      </div>
                  </div>
              </div>
          </section>
          
          
          <!-- 그래프 -->
          <div class="whole-wrap">
            <div class="container">
               <div class="section-top-border">
                  <h3 class="mb-30">별점그래프&nbsp;&nbsp;&nbsp;평균<span class="fa fa-star checked">${mean}</span></h3>
                  <div class="row">
                     <div class="col-md-6">
                        <div id="piechart" style="width: 400px; height: 400px;"></div>
                     </div>
                     
                     <div class="col-md-6">
                        <div id="curve_chart" style="width: 500px; height: 500px"></div>
                     </div>
                     
                  </div>
               </div>
            </div>
         </div>
          
          
          <!-- 조그만 추천창 -->
          <section class="blog-area section-gap">
            <div class="container">
               <div class="row d-flex justify-content-center">
                  <div class="menu-content pb-60 col-lg-9">
                     <div class="title text-center">
                        <h1 class="mb-10">${row.MUSIC_GENRE } 장르 추천</h1>
                        <p>지금 보고계신 음악과 같은 장르의 음악을 확인해보세요.</p>
                     </div>
                  </div>
               </div>                     
               <div class="row">
                  <div class="active-blog-carusel">
                     <c:forEach var="row" items="${recGenre }" varStatus="stat">
                        <div class="single-blog-post item">
                           <div class="thumb">
                              <img class="img-fluid" src="<c:url value='/musicimg/${row.MUSIC_SAVNAME }'/>" alt="">
                           </div>
                           <div class="details">
                              <div class="tags">
                                 <ul>
                                    <li>
                                       <a href="#">${row.MUSIC_GENRE }</a>
                                    </li>
                                    <li>
                                       <a href="#">${row.MUSIC_ARTIST }</a>
                                    </li>
                                 </ul>
                              </div>
                              <!-- 디테일부분의 url을 넣어준다 -->
                              <a href="#"><h4 class="title">${row.MUSIC_ALBUM }</h4></a>
                              <p>
                                 ${row.MUSIC_ALBUMINFO }
                              </p>
                              <h6 class="date">${row.MUSIC_RELEASE }</h6>
                           </div>   
                        </div>
                     </c:forEach>
                  </div>
               </div>
            </div>   
         </section>
          
          
          
         <!-- 모달창 -->
         <div id="modal" class="modal">
              <div class="modal-dialog animated">
                  <div class="modal-content">
                      <form class="form-horizontal" name="addForm" id="addForm" method="post">
                         <input type="hidden" name="MCOMMENT_WRITER" value="${member.MEMBER_NAME }">
                         <input type="hidden" name="MCOMMENT_MUSICIDX" value="${music.MUSIC_INDEX}">
                         <input type="hidden" name="MCOMMENT_WRITERID" value="${member.MEMBER_ID }">
                         <c:choose>
                            <c:when test="${mycomment != null }">
                               <input type="hidden" name="MCOMMENT_IDX" value="${mycomment.MCOMMENT_IDX }">
                            </c:when>
                            <c:otherwise>
                            </c:otherwise>
                         </c:choose>
                          <div class="modal-header">
                              <strong>${music.MUSIC_ALBUM }</strong>
                          </div>
      
                          <div class="modal-body">
                              <div class="form-group">
                                  <div class="input-group col-xs-7">
                                      <textarea rows="15" cols="40" name="MCOMMENT_CONTENT" id="MCOMMENT_CONTENT" placeholder="이 음악에 대한 생각을 자유롭게 포현해주세요 ">${mycomment.MCOMMENT_CONTENT }</textarea>
                                  </div>
                              </div>
                          </div>
      
                          <div class="modal-footer">
                              <button class="genric-btn primary e-large" type="button" id="cancel" onclick="modal.close();">Cancel</button>
                              <c:choose>
                                 <c:when test="${mycomment != null }">
                                    <button class="genric-btn primary e-large" type="button" id="modify" onclick="modal.close();">Modify</button>
                                 </c:when>
                                 <c:otherwise>
                                    <button class="genric-btn primary e-large" type=button id="save" onclick="modal.close();">Save</button>
                                 </c:otherwise>
                              </c:choose>
                              <!-- <input type="submit" class="btn btn-default" onclick="modal.onClick();" value="Save"> -->
                          </div>
                      </form>
                  </div>
              </div>
          </div>
          
         
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
         
         <!-- rating ajax -->
         <script>
            $(".click-callback").stars({ 
                click: function(score) {
                    var params = "";
               var star = score;
               var idx = ${music.MUSIC_INDEX};
               var member = 'lsj';
               params = "MUSIC_INDEX="+encodeURIComponent(idx)+"&STAR_COUNT="+encodeURIComponent(별);
               $.ajax({
                  url:"http://localhost:8080/culture/eval/MusicEval.cul?MEMBER_ID=${member.MEMBER_ID}",
                  type:"POST",
                  dataType:"json",
                  data:params,
                  success: function(req){
                     var result = req.code;
                     if(result == 'success'){
                        var star = req.star;
                        
                        var fixedstar = $('#star_count').text(별);
                        swal('저장되었습니다');
                     }else{
                        alert(':(')
                     }
                  },
                  error: function(req){
                     alert("에러발생:"+req.status);
                  }
               })
               
               $('#comment').css('display','block');         
                        
                }
            });
        </script>
           
         
         <script type="text/javascript">
              window.onload = function() {
            var modal = new RModal(document.getElementById('modal'), {
               
                //content: 'Abracadabra'
                beforeOpen: function(next) {
                    console.log('beforeOpen');
                    next();
                }
                , afterOpen: function() {
                    console.log('opened');
                }

                , beforeClose: function(next) {      //save를 누르면 실행된다. 
                    console.log('beforeClose');
                    next();
                }
                , afterClose: function() {
                   console.log('closed');
                } 
                
                
                // , bodyClass: 'modal-open'
                // , dialogClass: 'modal-dialog'
                // , dialogOpenClass: 'animated fadeIn'
                // , dialogCloseClass: 'animated fadeOut'

                // , focus: true
                // , focusElements: ['input.form-control', 'textarea', 'button.btn-primary']

                // , escapeClose: true
            });
            
            //페이지 로드되면 코멘트 리스트 띄움
            
            document.addEventListener('keydown', function(ev) {
                modal.keydown(ev);
            }, false);

            document.getElementById('showModal').addEventListener("click", function(ev) {
                ev.preventDefault();
                modal.open();
            }, false);

            window.modal = modal;
            
            
           // loadCommentList();
        }
        
        function loadCommentList(){
           var idx = ${music.MUSIC_INDEX};
           var param = "MUSIC_INDEX="+encodeURIComponent(idx);   //이 음악에대한 뮤직인덱스
           $.ajax({
              url:"http://localhost:8080/culture/eval/CommentList.cul",
              type:"POST",
              dataType:"json",
              data:param,
              success:function(req){
                 
                 //제이슨 데이터 받아옴
                 for(var i=0;i<req.length;i++){
                    var li = document.createElement('li');
                    li.setAttribute('id', req[i].id);
                    var listHtml =   "<h3>"+req[i].id+"</h3>"+"<p>"+req[i].content+"</p></li>";
                  li.innerHTML = listHtml;
                  
                  var commentList = 
                     "<div class='single-testimonial item d-flex flex-row'>"+
                        "<div class='thumb'>"+
                           "<span class='lnr lnr-star' style='font-size: 25px;'></span>"+
                             "</div>"+
                             "<div class='desc'>"+
                                 "<p>"+
                                     req[i].content+
                                 "</p>"+
                                 "<h4 mt-30>"+req[i].id+"</h4>"+
                           "<div class='star'>"+
                              "<span class='fa fa-star checked'></span>"+
                              "<span class='fa fa-star checked'></span>"+
                              "<span class='fa fa-star checked'></span>"+
                              "<span class='fa fa-star checked'></span>"+
                              "<span class='fa fa-star'></span>"+                        
                           "</div>"+                                     
                             "</div>"+
                          "</div>"
                  
                  var list = 
                     "<div class='desc'>"+
                             "<div class='row'>"+
                               "<div class='col-lg-12'>"+
                                   "<a href='#' id='showModal'><span class='lnr lnr-pencil' style='font-size:25px;'></span></a>"+
                                   "<a id='delete'>&nbsp;|&nbsp;&nbsp;<span class='lnr lnr-trash' style='font-size:25px;'></span></a>"+
                                "</div>"+
                         "</div>"+
                              "<p>"+
                                  "${mycomment.MCOMMENT_CONTENT }"+
                              "</p>"+
                          "</div>"
                  
                  $('#clist').append(commentList);
                  
                  }
                 
              },
              error:function(req){
                 swal("error: "+req.status);
              }
           })
        };
        
        $(function(){
           
           $('#modify').click(function(){
              var param = $('#addForm').serialize();
              $.ajax({
                 url:"http://localhost:8080/culture/eval/CommentModify.cul",
                 type:"POST",
                 dataType:"json",
                 data:param,
                 success:function(req){
                    var result = req.code;
                    if(result == 'success'){
                       //수정했으니까 내가쓴 코멘트 바꿔주고, 리스트도 바꿔줌(리스트는 내가 쓴 댓글을 알아야하므로 태그 아이디이름으로 구분해준다.)
                       /* var html = 
                            "<table border='1' >"+
                          "<tr>"+
                         "<td width='30' height='10' colspan='3'>"+req.content+"</td>"+ 
                         "<td><div class='row'>"+
                         "<div class='col-lg-12'>"+
                             "<a href='#' id='showModal' class='btn btn-success'>수정</a>"+
                          "</div>"+
                      "</div></td>"+ 
                         "<td><button id='delete'>삭제</button></td>"+
                      "</tr>"+
                      "</table>" */
                      
                      
                      var listHtml = "<li id='"+req.id+"'><h3>"+req.id+"</h3>"+
                  "<p>"+req.content+"</p></li>";
                      
                      //$('#comment').html(html);   //나의댓글창 바꿪
                      $('#commenttd').text(req.content);
                      $('#'+req.id).text(req.content);   //댓글리스트 바꾸기
                       
                    }else{
                       swal(":(");
                    }
                    
                    
                 },
                 error:function(req){
                    swal('error: '+req.status);
                 }
              })
           })
           
           $('#delete').click(function(){
              //var commentidx = ${mycomment.MCOMMENT_IDX};
              //var param = "MCOMMENT_IDX="+encodeURIComponent(commentidx);
              $.ajax({
                 url:"http://localhost:8080/culture/eval/CommentDelete.cul?MCOMMENT_IDX=${mycomment.MCOMMENT_IDX}",
                 type:"POST",
                 dataType:"json",
                 success:function(req){
                    var result = req.code;
                    if(result == 'success'){
/*                        var html = "<div class='row'>"+
                                       "<div class='col-lg-12'>"
                                        "<a href='#' id='showModal' class='btn btn-success'>코멘트 남기기</a>"
                                     "</div>"+
                                 "</div>"
                       
                     $('#comment').html(html);
 */                           
                      //리스트에서 빼고 내 댓글을 코멘트로 바꾼다.
                      var html = 
                         "<div class='row'>"+
                            "<div class='col-lg-12'>"+
                                "<a href='#' id='showModal' class='genric-btn primary e-large'>코멘트 남기기</a>"+
                             "</div>"+
                         "</div>"
                         
                      $('#comment').html(html);
                     
                     $('#c_'+req.id).remove();
                     location.reload();
 
                    }else{
                       swal(":(");
                    }
                 },
                 error:function(req){
                    swal("error: "+req.status);
                 }
              }) 
           })
           
                      
           //코멘트 저장
           $('#save').click(function(){
               var param = $('#addForm').serialize();
               $.ajax({
                   url: "http://localhost:8080/culture/eval/CommentWrite.cul",
                   type:"POST",
                   dataType:"json",
                data:param,
                   success:function(req){
                      var result = req.code;
                      if(result == 'success'){
                         
                         //내가 쓴 코멘트에 추가한다.
                         var html = 
                            "<table border='1' >"+
                          "<tr>"+
                         "<td width='30' height='10' colspan='3' id='commenttd'>"+req.content+"</td>"+ 
                         "<td><div class='row'>"+
                         "<div class='col-lg-12'>"+
                             "<a href='#' id='showModal' class='btn btn-success'>수정</a>"+
                          "</div>"+
                      "</div></td>"+ 
                         "<td><button id='delete'>삭제</button></td>"+
                      "</tr>"+
                      "</table>"
                      
                      //전체 코멘트 리스트에 추가해준다.
                      var listHtml = "<li id='"+req.id+"'><h3>"+req.id+"</h3>"+
                                   "<p>"+req.content+"</p></li>";
                                 
                                   //내가 쓴 코멘트 바꿔준다.
                                   var myComment = 
                                      "<div class='desc'>"+
                                              "<div class='row'>"+
                                                "<div class='col-lg-12'>"+
                                                    "<a href='#' id='showModal'><span class='lnr lnr-pencil' style='font-size:25px;'></span></a>"+
                                                    "&nbsp;|&nbsp;&nbsp;"+
                                                    "<a  href='#' id='delete'><span class='lnr lnr-trash' style='font-size:25px;''></span></a>"+
                                                 "</div>"+
                                          "</div>"+
                                               "<p>"+
                                                   req.content+
                                               "</p>"+
                                           "</div>"               
                                                     
                         
                          $('#comment').html(myComment);
                          $('#clist').prepend(listHtml);
                         
                         location.reload();
                         
                      }else{
                         swal('ㅠㅜ');
                      }
                      
                   },
                   error: function(req){
                      swal("에러: "+req.status);
                   }
                   
                })
                
             });
           
           
        });
   </script>
         
</body>
</html>