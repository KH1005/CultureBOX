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
					new ajax.xhr.Request("http://localhost:8080/culture/eval/MusicEval.box", params, insertStar, "POST");
					
				}
			});

		});
		
		function insertStar(req){
			if(req.readyState == 4){
				if(req.status == 200){
					if(req.responseText == 'success'){
						alert(':D')
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
	<p>${music.MUSIC_ARTIST }</p>
	<p>${music.MUSIC_ALBUMINFO }</p>
	<p>${music.MUSIC_ARTISTINFO }</p>
	
	

</body>
</html>