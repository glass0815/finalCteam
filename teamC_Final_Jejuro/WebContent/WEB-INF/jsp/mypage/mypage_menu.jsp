<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<div class="col-lg-4 col-md-4 col-sm-4">
	<div class="item_image">
		<div id="myCarousel" class="carousel slide">
			<div class="carousel-inner">
				<div class="item active">
					<img src="resources/img/slides_01.jpg" alt="">
				</div>
				<!-- end item -->
				<div class="item">
					<img src="resources/img/slides_02.jpg" alt="">
				</div>
				<!-- end item -->
				<div class="item">
					<img src="resources/img/slides_03.jpg" alt="">
				</div>
				<!-- end item -->
			</div>
			<!-- carousel inner -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="icon-prev"></span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span class="icon-next"></span>
			</a>
		</div>
		<!-- end carousel -->
	</div>
	<!-- end item_image -->
</div>
<!-- end col-lg 8 -->

<div class="col-lg-8 col-md-8 col-sm-12 clearfix">
	<div class="portfolio_details">
		<div class="details_section">
			<div class="row">
				<div class="col-lg-10 col-md-10">
					<h2>
						TeamC<small>님의 제주여행</small>
					</h2>
				</div>
				<div class="col-lg-2 col-md-2" style="padding-top: 15px;">
					<a href="infoModify" style="color: orange; font-weight: bold;">정보수정</a>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<hr>

					<table>
						<tr>
							<td
								style="text-align: center; border-right: 1px solid #F5F5F5; width: 350px;">
								<ul>
									<li class="mypage">나의 여행일정: <span><a href="#">3</a></span></li>
									<li class="pickTourspot">찜한 관광지: <span><a href="#">5</a></span></li>
									<li class="pickhouse">찜한 숙소: <span><a href="#">2</a></span></li>

								</ul>
							</td>
							<td style="text-align: center; width: 350px;">
								<ul>
									<li class="">예약 숙소: <span><a href="#">1</a></span></li>
									<li class="myreview">나의 리뷰: <span><a href="#">3</a></span></li>
									<li class="">나의 문의: <span><a href="#">3</a></span></li>

								</ul>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<!-- details section -->
	</div>
	<!-- theme details -->
</div>
<!-- end col-lg 8 -->

<div class="content col-lg-12 col-md-12 col-sm-12 clearfix"
	style="background-color: #FF8C00; margin-top: 20px; padding: 0px;">
	<div class="col-lg-12 col-md-12 col-sm-12" style="text-align: center;">
		<div class="col-lg-2 col-md-2 col-sm-2 mypageMenu">
			<a href="mypage?uno=${sessionScope.uNo}">나의 여행</a>
		</div>
		<div class="col-lg-2 col-md-2 col-sm-2 mypageMenu">
			<a href="pickTourspot?uno=${sessionScope.uNo}">찜한 관광지</a>
		</div>
		<div class="col-lg-2 col-md-2 col-sm-2 mypageMenu">
			<a href="pickhouse?uno=${sessionScope.uNo}">찜한 숙소</a>
		</div>
		<div class="col-lg-2 col-md-2 col-sm-2 mypageMenu">
			<a href="reservationHouse?uno=${sessionScope.uNo}">예약 숙소</a>
		</div>
		<div class="col-lg-2 col-md-2 col-sm-2 mypageMenu">
			<a href="myReview?uno=${sessionScope.uNo}">나의 리뷰</a>
		</div>
		<div class="col-lg-2 col-md-2 col-sm-2 mypageMenu">
			<a href="myQuestion?uno=${sessionScope.uNo}">나의 문의</a>
		</div>
	</div>
</div>