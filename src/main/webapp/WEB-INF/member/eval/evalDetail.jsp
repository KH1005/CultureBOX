<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script type="text/javascript" src="http://localhost:8080/culture/js/jquery.js"></script>
<script type="text/javascript" src="http://localhost:8080/culture/js/jquery.raty.min.js"></script>
<script type="text/javascript" src="http://localhost:8080/culture/ajax/ajax.js"></script>
<script type="text/javascript" src="https://unpkg.com/rmodal/dist/rmodal.js"></script>
<link href="http://localhost:8080/culture/rating.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://unpkg.com/bootstrap/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://unpkg.com/animate.css/animate.css" type="text/css" />
<link rel="stylesheet" href="https://unpkg.com/rmodal/dist/rmodal.css" type="text/css" />
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <style type="text/css">
      .modal .modal-dialog {
        width: 400px;
      }
    </style>

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

                , beforeClose: function(next) {		//save를 누르면 실행된다. 
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
            
            loadCommentList();
        }
        
        function loadCommentList(){
        	var idx = ${music.MUSIC_INDEX};
        	var param = "MUSIC_INDEX="+encodeURIComponent(idx);	//이 음악에대한 뮤직인덱스
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
        				
        				var listHtml =	"<h3>"+req[i].id+"</h3>"+"<p>"+req[i].content+"</p></li>";
						li.innerHTML = listHtml;
						
						$('#clist').append(li);
						
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
                		
                		//$('#comment').html(html);	//나의댓글창 바꿪
                		$('#commenttd').text(req.content);
                		$('#clist #'+req.id).html(listHtml);	//댓글리스트 바꾸기
        					
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
/*         					var html = "<div class='row'>"+
					        			    	"<div class='col-lg-12'>"
					        		        	"<a href='#' id='showModal' class='btn btn-success'>코멘트 남기기</a>"
					        		        "</div>"+
					        		    "</div>"
        					
        		    	$('#comment').html(html);
 */		        		    	
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
                		
                		var listHtml = "<li id='"+req.id+"'><h3>"+req.id+"</h3>"+
        									"<p>"+req.content+"</p></li>";
             				
             	    		$('#comment').html(html);
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

<script type="text/javascript"> 		

		$(function() {
						
		   $('div#cancel-custom').raty({	   	
				cancelHint: 'remove my rating!',
				cancelPlace: 'right',
				showCancel: true,
				onClick: function(score) {
					var params = "";
					var star = score;
					var idx = ${music.MUSIC_INDEX};
					var member = 'lsj';
					params = "MUSIC_INDEX="+encodeURIComponent(idx)+"&STAR_COUNT="+encodeURIComponent(star);
					$.ajax({
						url:"http://localhost:8080/culture/eval/MusicEval.cul?MEMBER_ID=${member.MEMBER_ID}",
						type:"POST",
						dataType:"json",
						data:params,
						success: function(req){
							var result = req.code;
							if(result == 'success'){
								var star = req.star;
								
								var fixedstar = $('#star_count').text(star);
								swal('저장되었습니다');
							}else{
								alert(':(')
							}
						},
						error: function(req){
							alert("에러발생:"+req.status);
						}
					})
				}
			});

		});
		
		  
		   
		var _gaq = _gaq || [];
		_gaq.push(['_setAccount', 'UA-17006803-1']);
		_gaq.push(['_trackPageview']);
		
		(function() {
			var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		})();
	</script>
</head>
<body>

	<h1>${music.MUSIC_ALBUM }</h1>
	<c:choose>
		<c:when test="${star == 0 }">
			<div id="cancel-custom"></div>
		</c:when>
		<c:otherwise>
			<c:forEach	var="i" begin="1" end="${star}" step="1">
				<img src="http://localhost:8080/culture/img/star-on.png">
			</c:forEach>
			<c:forEach var="i" begin="1" end="${5-star}" step="1">	
				<img alt="" src="http://localhost:8080/culture/img/star-off.png">
			</c:forEach>
			<a href="http://localhost:8080/culture/eval/DeleteEvaluation.cul?MEMBER_ID=${member.MEMBER_ID}&MUSIC_INDEX=${music.MUSIC_INDEX}">
			<img alt="" src="http://localhost:8080/culture/img/cancel-on.png"></a>
		</c:otherwise>
	</c:choose>
	
	<div id="star_count">${star }</div>
	
	<!-- 코멘트 버튼 -->
	
    <c:choose>
    	<c:when test="${mycomment != null}">
    		<table border="1">
    		<tr>
    			<td width="30" height="10" colspan="3" id='commenttd'>${mycomment.MCOMMENT_CONTENT }</td> 
    			<td><div class="row">
		    	<div class="col-lg-12">
		        	<a href="#" id="showModal" class="btn btn-success">수정</a>
		        </div>
		    </div></td> 
    			<td><button id="delete">삭제</button></td>
    		</tr>
    		</table>
    	</c:when>
    	<c:otherwise>
    		<div id="comment">
	    	<div class="row">
		    	<div class="col-lg-12">
		        	<a href="#" id="showModal" class="btn btn-success">코멘트 남기기</a>
		        </div>
		    </div>
		    </div>
    	</c:otherwise>
    </c:choose>
    
    
    
    
    
    
	<p>${music.MUSIC_ARTIST }</p>
	<p>${music.MUSIC_ALBUMINFO }</p>
	<p>${music.MUSIC_ARTISTINFO }</p>
	<c:choose>
		<c:when test="${fn:length(commentList) >0 }">
			<ul id="clist">
			<c:forEach items="${commentList }" var="row" varStatus="stat">
				<li>
					<h3>${row.MCOMMENT_WRITERID }</h3>
					<p>${row.MCOMMENT_CONTENT }</p>
				</li>
			</c:forEach>
			</ul>
		</c:when>
		<c:otherwise>
			<ul id="clist">
				
			</ul>
		</c:otherwise>
	</c:choose> 
	
	<!-- mycomment 가 존재하지 않아서 값이 안넘어오는것 같음 그러므로 댓글을 등록하자마자 댓글 ㄹ -->
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
                        <button class="btn btn-default" type="button" id="cancel" onclick="modal.close();">Cancel</button>
                        <c:choose>
                        	<c:when test="${mycomment != null }">
                        		<button class="btn btn-primary" type="button" id="modify" onclick="modal.close();">Modify</button>
                        	</c:when>
                        	<c:otherwise>
                        		<button class="btn btn-primary" type=button id="save" onclick="modal.close();">Save</button>
                        	</c:otherwise>
                        </c:choose>
                        <!-- <input type="submit" class="btn btn-default" onclick="modal.onClick();" value="Save"> -->
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    

</body>
</html>