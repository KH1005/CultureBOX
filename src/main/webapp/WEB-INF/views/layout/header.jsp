<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!DOCTYPE html>


<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://technext.github.io/interior/css/main.css">

<%@ include file="/WEB-INF/include/include-header.jspf" %>

<style>
  .banner-area {
    background: url(file:///C:\Spring\App\workspace\cultureBOX\src\main\webapp\WEB-INF\cssimg\mainback7.jpg) center;
    background-size: cover;
} 

</style>   

		<title>CultureBox</title>
		<header id="header" class="">
			  
		  		<div class="header-top">
		  			<div class="container">
		  			</div>
				</div>
			    <div class="container main-menu">
			    	<div class="row align-items-center justify-content-between d-flex">
				      <div id="logo" align="left">
				        <a href="index.html"><img src="file:///C:\Spring\App\workspace\cultureBOX\src\main\webapp\WEB-INF\cssimg\logo333.png" alt="" title=""></a>
				      </div>
				      <nav id="nav-menu-container">
				        <ul class="nav-menu sf-js-enabled sf-arrows" style="touch-action: pan-y;">
				          <li class="menu-active"><a href="index.html">Home</a></li>
				          <li><a href="about.html">Music</a></li>
				          <li class="menu-has-children"><a href="http://localhost:8080/culture/concert/CultureList.cul" class="sf-with-ul">Performance</a>
				            <ul style="display: none;">
				              <li><a href="/culture/concert/CultureCategoryList.cul?culture_category=콘서트">concert</a></li>
				              <li><a href="/culture/concert/CultureCategoryList.cul?culture_category=연극">play</a></li>
				              <li><a href="/culture/concert/CultureCategoryList.cul?culture_category=뮤지컬">musical</a></li>
				             
				            </ul>
				          </li>
				          <li><a href="projects.html">My</a></li>


                            
				        
 
 </ul>
				      </nav><!-- #nav-menu-container -->		    		
			    	</div>
			    </div>

			  </header><!-- #header -->

<%-- <%@ include file="/WEB-INF/include/include-header.jspf" %>
>>>>>>> 9d9c398a7afbaeacb96d7da774b36e102fff906b
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<link href="http://localhost:8080/culture/hover.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://localhost:8080/culture/js/jquery.js"></script>
<script type="text/javascript" src="http://localhost:8080/culture/js/jquery.raty.min.js"></script>
<script type="text/javascript" src="http://localhost:8080/culture/ajax/ajax.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
  .banner-area {
    background: url(file:///C:\\Users\\dustn\\Documents\\CultureBOX\\src\\main\\webapp\\cssimg\\mainback7.jpg) center;
    background-size: cover;
    
} 

</style> 

<!-- <script>
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
</script> -->
<title>CultureBox</title>
		<header id="header" class="">
			  
		  		<div class="header-top">
		  			<div class="container">
		  			</div>
				</div>
			    <div class="container main-menu">
			    	<div class="row align-items-center justify-content-between d-flex">
				      <div id="logo" align="left">
				        <a href="index.html"><img src="file:///C:/Users/dustn/Documents/CultureBOX/src/main/webapp/cssimg/logo333.png" alt="" title=""></a>
				        
				      </div>
				      <nav id="nav-menu-container">
				        <ul class="nav-menu">
				          <li class="menu-active"><a href="index.html">Home</a></li>
				          <li><a href="about.html">Music</a></li>
				          <li class="="menu-has-children"><a href="/culture/concert/CultureList.cul">Concert</a>
				            <ul>
				              <li><a href="/culture/concert/CultureCategoryList.cul?culture_category=콘서트">콘서트</a></li>
				              <li><a href="/culture/concert/CultureCategoryList.cul?culture_category=연극">연극</a></li>
				                <li><a href="/culture/concert/CultureCategoryList.cul?culture_category=뮤지컬">뮤지컬</a></li>
				            </ul>
				           </li>
				          <li><a href="projects.html">My</a></li>


                            
				        
 
 </ul>
				      </nav><!-- #nav-menu-container -->		    		
			    	</div>
			    </div>

			  </header><!-- #header -->
<form method="post">
	<div class="ui-widget" align="center">
	  	<input id="tags" type="text" name="issearch" placeholder="Search">
	</div>
	<a href="http://localhost:8080/culture/download/pdf.cul">티켓</a>
</form>
 --%>





















