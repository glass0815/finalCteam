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

div.mypageMenu{
	padding-top: 10px;
    padding-bottom: 10px;
}

div.mypageMenu>a{
	color: white;
	font-size: 18px;
	
}
div.mypageMenu.active{
	font-size: 18px;
	background-color: white;
	
}
div.mypageMenu.active>a{
	font-size: 18px;
	color: #FF8C00;
	
}
</style>
<link href="resources/css/pickTourspot.css" rel="stylesheet">


<section class="section1">
<br><br>
	<div class="container clearfix">
		<div class="content col-lg-12 col-md-12 col-sm-12 clearfix">

			<div class="clearfix"></div>

			<!-- start include menu -->
			<%@include file="mypage_menu.jsp"%>
			<!--end of include menu -->
			
			
			<div class="content col-lg-12 col-md-12 col-sm-12 clearfix">
				<h3 class="title">찜한 관광지(1)</h3>
				<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
					<div class="box">
						<div class="clear">&nbsp;</div>
						<div class="img_box"
							onclick="window.open('/ko/city/istanbul_202/attraction/blue-mosque-sultan-ahmet-camii_3868');"
							style="cursor: pointer; margin-top: 1px;">
							<img
								src="http://img.earthtory.com/img/place_img/202/3868_0_et.jpg"
								alt="" class="box_img"
								onerror="this.src='/res/img/common/no_img/sight.png';">
						</div>
						<div class="box_inner">
							<div class="box_inner_bottom">
								<img src="/res/map/marker/301_0.png" alt="" class="box_pin">
								<div class="bottom_title"
									onclick="window.open('/ko/city/istanbul_202/attraction/blue-mosque-sultan-ahmet-camii_3868');">블루
									모스크(술탄아흐메트 모스...</div>
								<div class="inner_bottom">
									<div class="clip_cnt">683</div>
									<div class="inner_bottom_line">&nbsp;</div>
									<div class="rate_val">9.0</div>
									<a href="undefined" target="_blank" class="btn_map"
										style="display: none">지도</a>
									<div class="clear"></div>
								</div>
								<div class="inner_bottom">
									<div class="tag">랜드마크</div>
									<div class="tag">절/신사/사원</div>
									<div class="clear">&nbsp;</div>
								</div>
							</div>
						</div>
					</div>
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
	//메뉴 활성화.
	$('.mypageMenu').eq(1).attr('class','col-lg-2 col-md-2 col-sm-2 mypageMenu active');
});

	function allowDrop(ev) {
		ev.preventDefault();
	}

	function drag(ev) {
		ev.dataTransfer.setData("text", ev.target.id);
	}

	function drop(ev) {
		ev.preventDefault();
		var data = ev.dataTransfer.getData("text");
		ev.target.appendChild(document.getElementById(data));
	}

</script>
<%@include file="../main/footer.jsp"%>