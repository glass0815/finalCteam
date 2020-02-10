<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Search bar animation</title>
  <link href='https://fonts.googleapis.com/css?family=Roboto:400,500' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

  <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Palanquin:400,100,200,300'>

      <link rel="stylesheet" href="resources/search/css/style.css">

  
</head>

<body>
  	<form id="content">
  	<input type="text" name="input" class="input">
  	<button type="reset" class="search"></button>
  	<div>
  	<ul class="searchText" id="searchText" style="display: none;color: white; float: left:40%;">
  	<li><a href="">사진관</a></li>
  	<li><a href="">길잡이</a></li>
  	<li><a href="">지도</a></li>
  	<li><a href="">관광코스</a></li>
  	<li><a href="">관광객</a></li>
  	<li><a href="">호출</a></li>
  	<li><a href="">호텔</a></li>
  	<li><a href="">일출</a></li>
  	<li><a href="">펜션</a></li>
  	</ul>
	</div>
  	
	</form>
  	<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src='http://milanmilosev.com/external/codepen/js/copyright.js'></script>

    <script src="resources/search/js/index.js"></script>
</body>
</html>