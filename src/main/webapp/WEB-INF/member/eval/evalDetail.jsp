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
<link href="http://localhost:8080/culture/rating.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://unpkg.com/bootstrap/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://unpkg.com/animate.css/animate.css" type="text/css" />
<link rel="stylesheet" href="https://unpkg.com/rmodal/dist/rmodal.css" type="text/css" />
<script type="text/javascript" src="https://unpkg.com/rmodal/dist/rmodal.js"></script>
<style type="text/css">
	.js-load {
	    display: none;
	}
	.js-load.active {
	    display: block;
	}
	.is_comp.js-load:after {
	    display: none;
	}
	.btn-wrap, .lists, .main {
	    display: block;
	}
	.main {
	    max-width: 640px;
	    margin: 0 auto;
	}
	.lists {
	    margin-bottom: 4rem;
	}
	.lists__item {
	    padding: 20px;
	    background: #FFF;
	}
	.lists__item:nth-child(2n) {
	    background: #FFF;
	    color: #000;
	}
	.btn-wrap {
	    text-align: left;
	}
	  tr .bbb{
        text-align: right;
        }
</style>
<script type="text/javascript">
$(window).on('load', function () {
    load('#js-load', '4');
    $("#js-btn-wrap .button").on("click", function () {
        load('#js-load', '4', '#js-btn-wrap');
    })
});
 
function load(id, cnt, btn) {
    var girls_list = id + " .js-load:not(.active)";
    var girls_length = $(girls_list).length;
    var girls_total_cnt;
    if (cnt < girls_length) {
        girls_total_cnt = cnt;
    } else {
        girls_total_cnt = girls_length;
        $('.button').hide()
    }
    $(girls_list + ":lt(" + girls_total_cnt + ")").addClass("active");
}
</script>


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
			
            
            
            document.addEventListener('keydown', function(ev) {
                modal.keydown(ev);
            }, false);

            document.getElementById('showModal').addEventListener("click", function(ev) {
                ev.preventDefault();
                modal.open();
            }, false);

            window.modal = modal;
        }
   </script>

<script type="text/javascript"> 		

		$(function() {

		   $('div#cancel-custom').raty({	   	
				cancelHint: 'remove my rating!',
				cancelPlace: 'right',
				showCancel: true,
				onClick: function(score) {
					var params = "";
					
					var id = 'kh10005';
					var star = score;
					var idx = ${music.MUSIC_INDEX};
					
					params = "MUSIC_INDEX="+encodeURIComponent(idx)+"&STAR_COUNT="+encodeURIComponent(star)+"&MEMBER_ID="+encodeURIComponent(id);
					$.ajax({
						url:"http://localhost:8080/culture/eval/MusicEval.cul",
						type:"POST",
						dataType:"json",
						data:params,
						success: function(req){
							var result = req.code;
							if(result == 'success'){
								var star = req.star;
								alert(star);
								$(function(star){
									$('div.star_count').text(star);
								});
								
							}else{
								alert(':(')
							}
						},
						error: function(req){
							alert("에러발생:"+req.status);
						}
					})
					//new ajax.xhr.Request("http://localhost:8080/culture/eval/MusicEval.box", params, insertStar, "POST");
					
				}
			});

		});
		//<div id="star_count">star</div>
						function mekeView(star){
							var starDiv = document.createElement('div');
							starDiv.setAttribute('id', 'star_count');
							var html = star;
							
							starDiv.innerHTML = html;
							return starDiv;
						}
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
	<div id="cancel-custom"></div>
	<div id="star_count">${star }</div>
	<!-- 코멘트 버튼 -->
	
    <c:choose>
    	<c:when test="${mycomment != null}">
    		<table border="1">
    		<tr>
    			<td>${mycomment.MCOMMENT_CONTENT }</td>
    		</tr>
    		</table>
    	</c:when>
    	<c:otherwise>
	    	<div class="row">
		    	<div class="col-lg-12">
		        	<a href="#" id="showModal" class="btn btn-success">코멘트 남기기</a>
		        </div>
		    </div>
    	</c:otherwise>
    </c:choose>
    
	<p>${music.MUSIC_ARTIST }</p>
	<p>${music.MUSIC_ALBUMINFO }</p>
	<p>${music.MUSIC_ARTISTINFO }</p>
	<hr>
	 <c:choose>
		   <c:when test="${fn:length(commentList) > 0}">
		   <div id="contents" style="height:546px; width:600px; margin-left:0px border-left-width:10px">
			<div id="js-load" class="main">
			 <ul class="lists">
            <c:forEach items="${commentList}" var="row"  varStatus="stat" >
             	<li class="lists__item js-load">
             		<strong>${row.MCOMMENT_WRITER }</strong>님 
             		<fmt:formatDate value="${row.MCOMMENT_WRITEDATE}" pattern="yy.MM.dd"></fmt:formatDate>
             		 <a href='http://localhost:8080/culture/concert/deleteCultureComment.cul?COMMENT_IDX=${row.MCOMMENT_IDX}&COMMENT_CULTUREIDX=${cultureModel.CULTURE_IDX}'
							class="btn btnC_01 btnP_02"> <span class="btn btnC_05 reply_btn">삭제</span>
					</a>
					<p>${row.MCOMMENT_CONTENT}</p>
             	</li>
			     
			</c:forEach> 
			 </ul>
			 	<div id="js-btn-wrap" class="btn-wrap"><a href="javascript:;" class="button">더보기</a></div>
			 	<div class="btn_type_04">
		       </div>
			 	</div>
			   </div>
		   </c:when>
				<c:otherwise>
					<tr>
					<td colspan="4">등록된 댓글이 없습니다</td>
					</tr>
				</c:otherwise>
	       
	</c:choose>
	
	
	<!-- 모달창 -->
	<div id="modal" class="modal">
        <div class="modal-dialog animated">
            <div class="modal-content">
                <form class="form-horizontal" name="addForm" id="addForm" method="post" action="/culture/eval/CommentWrite.cul">
                	<input type="hidden" name="MCOMMENT_WRITER" value="${member.MEMBER_NAME }">
                	<input type="hidden" name="MCOMMENT_MUSICIDX" value="${music.MUSIC_INDEX}">
                	<input type="hidden" name="MCOMMENT_WRITERID" value="${member.MEMBER_ID }">
                    <div class="modal-header">
                        <strong>${music.MUSIC_ALBUM }</strong>
                    </div>

                    <div class="modal-body">
                        <div class="form-group">
                            <div class="input-group col-xs-7">
                                <textarea rows="15" cols="40" name="MCOMMENT_CONTENT" id="MCOMMENT_CONTENT" placeholder="이 음악에 대한 생각을 자유롭게 포현해주세요 "></textarea>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button class="btn btn-default" type="button" onclick="modal.close();">Cancel</button>
                        <button class="btn btn-primary" type="submit" onclick="modal.close();">Save</button>
                        <!-- <input type="submit" class="btn btn-default" onclick="modal.onClick();" value="Save"> -->
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    

</body>
</html>