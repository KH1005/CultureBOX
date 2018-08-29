<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<link href="http://localhost:8080/culture/hover.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://localhost:8080/culture/js/jquery.js"></script>
<script type="text/javascript" src="http://localhost:8080/culture/js/jquery.raty.min.js"></script>
<script type="text/javascript" src="http://localhost:8080/culture/ajax/ajax.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
이곳은 헤더 입니다~~!

<script>
  $( function() {
    var availableTags = function(){
  	  $.ajax({
		  url:"http://localhost:8080/culture/eval/MusicAlbumList.cul",
		  type:"POST",
		  dataType:"json",
		  success:function(req){
			  var test = new Array;
			  for(var i=0;i<req.length;i++){
				  var a = req[i].music;
				  test.push(a);
			  }
			  return test;
		  }
	  })
  };
  
    $( "#tags" ).autocomplete({
       source: function(request,response){
    	  $.ajax({
    		  url:"http://localhost:8080/culture/eval/MusicAlbumList.cul",
    		  type:"POST",
    		  dataType:"json",
    		  data:"value="+encodeURIComponent(request.term), 
    		  success:function(data){
    			  response($.map(data, function(item){
    				 return{
    					label:item,
    					value:item
    				}				   
    			  })
    			  );
    		  }
    	  });
      } 
      ,
      minLength:2
      
    });
    
  }); 
</script>
<form method="post">
	<div class="ui-widget" align="center">
	  	<input id="tags" type="text" name="issearch" placeholder="Search">
	</div>
	<a href="http://localhost:8080/culture/download/pdf.cul">티켓</a>
</form>























