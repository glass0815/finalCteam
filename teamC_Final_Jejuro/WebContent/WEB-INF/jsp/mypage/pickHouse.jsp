<%@include file="../main/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<style>
#div1, #div2 {
	float: left;
	width: 100px;
	height: 80px;
	margin: 10px;
	padding: 10px;
	border: 1px solid black;
}

div.mypageMenu {
	padding-top: 10px;
	padding-bottom: 10px;
}

div.mypageMenu>a {
	color: white;
	font-size: 18px;
}

div.mypageMenu.active {
	font-size: 18px;
	background-color: white;
}

div.mypageMenu.active>a {
	font-size: 18px;
	color: #FF8C00;
}
</style>
<link href="resources/css/pickTourspot.css" rel="stylesheet">


<section class="section1">
	<br>
	<br>
	<div class="container clearfix">
		<div class="content col-lg-12 col-md-12 col-sm-12 clearfix">

			<div class="clearfix"></div>

			<!-- start include menu -->
			<%@include file="mypage_menu.jsp"%>
			<!--end of include menu -->
			
			<div class="clear"></div>
			<div class="row">
				<div class="content col-lg-12 col-md-12 col-sm-12 clearfix">
					<h3 class="title">ÂòÇÑ ¼÷¼Ò(${fn:length(hpList)})</h3>
					<c:forEach var="e" items="${hpList}">
					
						<div class="box">
							<%-- <div class="btn_del" onclick="pickHouse_click(${e.hNo})">
								<img src="./resources/img/house/${e.hTopImg}" alt="">
							</div> --%>
							<div class="img_box">
								<img
									src="./resources/img/house/${e.hTopImg}"
									alt="" class="box_img"
									onerror="this./resources/img/house/${e.hTopImg};">
							</div>
							<div class="box_inner">
								<div class="box_inner_top">
									<div class="price_txt">1¹Ú Æò±Õ</div>
									<div class="price">£Ü50,608</div>
								</div>
								<div class="box_inner_bottom">
									<img src="/res/map/marker/100_0.png" alt="" class="box_pin">
									<div class="bottom_title"><a href="housedetail?hNo=${e.hNo}">${e.hName}</a></div>
									<div class="inner_bottom">
										<%-- <img src="./resources/img/house/${e.hTopImg}" alt="" onclick="pickHouse_click(${e.hNo})"> --%>
										<!-- ÂòÇÏ±â °¹¼ö -->
										<div class="clip_cnt">${e.hpicks}°³</div>
										<div class="inner_bottom_line">&nbsp;</div>
										<!-- ÁÁ¾Æ¿ä °¹¼ö -->
										<div class="rate_val">${e.hlikes}°³</div>
										<div class="clear"></div>
									</div>
									<div class="inner_bottom">
										<div class="tag">${e.hType}</div>
									</div>
	
								</div>
							</div>
						</div>
					</c:forEach>
					
				</div>
				
			</div>
		</div>
		<!-- end content -->
	</div>
	<!-- end container -->
</section>
<!-- end section -->

<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
<script>
$(function(){
	//¸Þ´º È°¼ºÈ­.
	$('.mypageMenu').eq(2).attr('class','col-lg-2 col-md-2 col-sm-2 mypageMenu active');
});

	
</script>
<%@include file="../main/footer.jsp"%>