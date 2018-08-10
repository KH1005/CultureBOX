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
						url:"http://localhost:8080/culture/eval/MusicEval.box",
						type:"POST",
						dataType:"json",
						data:params,
						success: function(req){
							var result = eval("("+req.responseText+")");
							if(result.code == 'success'){
								var star = result.star;
								var div = document.getElementById('star_count');
								var newDiv = makeView(star);
								var oldDiv =document.getElementById('star_count');
								div.replaceChild(newDiv, oldDiv);
								
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
		function makeView(star){
			var starDiv = document.createElement('div');
			starDiv.setAttribute('id', 'star_count');
			var html = star;
			
			starDiv.innerHTML = html;
			return starDiv;
			
		}
		function insertStar(req){
			alert('here1');
			if(req.readyState == 4){
				alert('here2');
				if(req.status == 200){
					var result = eval("("+req.responseText+")");
					if(result.code == 'success'){
						var star = result.star;
						var div = document.getElementById('star_count');
						var newDiv = makeView(star);
						var oldDiv =document.getElementById('star_count');
						div.replaceChild(newDiv, oldDiv);
						
					}else{
						alert(':(')
					}
					
				}else{
					alert("에러발생:"+req.status);
				}	
			}	
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
	<p>${music.MUSIC_ARTIST }</p>
	<p>${music.MUSIC_ALBUMINFO }</p>
	<p>${music.MUSIC_ARTISTINFO }</p>
	
	

</body>
</html>