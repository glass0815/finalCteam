<%@include file="../main/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<br> <br>
	<div class="container clearfix">
		<div class="content col-lg-12 col-md-12 col-sm-12 clearfix">

			<div class="clearfix"></div>

			<!-- start include menu -->
			<%@include file="mypage_menu.jsp"%>
			<!--end of include menu -->


			<div class="clear"></div>
			<div class="row">
				<div class="content col-lg-12 col-md-12 col-sm-12 clearfix">
					<h3 class="title">예약한 숙소(${rvList.size()})</h3>
					<c:forEach var="e" items="${rvList }">
						<div class="col-lg-3 col-md-3 col-sm-3">
							<div class="box">
								<div class="img_box"
									onclick="go_link(26960,'/europe/turkey/istanbul/hotel_aslan_istanbul.html');">
									<img
										src="${e. }"
										alt="" class="box_img"
										onerror="this.src='/res/img/common/no_img/hotel.png';">
								</div>
								<div class="box_inner">
									<div class="box_inner_top">
										<div class="price_txt">예약 가격</div>
										<div class="price">￦50,608</div>
									</div>
									<div class="box_inner_bottom">
										<img src="/res/map/marker/100_0.png" alt="" class="box_pin">
										<div class="bottom_title"
											onclick="go_link(26960,'/europe/turkey/istanbul/hotel_aslan_istanbul.html');">숙소이름
											- 방이름</div>
										<div class="inner_bottom">
											<div class="calendar_val">1박 2일</div>
											<div class="inner_bottom_line">&nbsp;</div>
											<div class="people_val">3명</div>
											<div class="clear"></div>
										</div>
										<div class="inner_bottom">
											<div class="tag">호텔</div>
										</div>

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
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
<script>
	$(function() {
		//메뉴 활성화.
		$('.mypageMenu').eq(3).attr('class',
				'col-lg-2 col-md-2 col-sm-2 mypageMenu active');
	});
</script>
<%@include file="../main/footer.jsp"%>