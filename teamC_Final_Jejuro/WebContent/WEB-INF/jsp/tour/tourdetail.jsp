<%@include file="../main/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 별점 함수  -->
<script>
	$(function() {
		$('.starRev span').click(function() {
			$(this).parent().children('span').removeClass('on');
			$(this).addClass('on').prevAll('span').addClass('on');
			return false;
		});
	});
</script>
<!-- 지도 지도 지도 -->


<style>
/*모달위치*/
.modal {
	text-align: center;
}

@media screen and (min-width: 768px) {
	.modal:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 80%;
	}
}

.modal-dialog {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
}

ul {
	list-style: none;
}

ul {
	list-style: none;
}
/* 별점 스타일 시작 */
.starR1 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat -52px 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR2 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR1.on {
	background-position: 0 0;
}

.starR2.on {
	background-position: -15px 0;
}
/* 별점 스타일 끝 */

/* 버튼 스타일 시작 */
.myButton {
	box-shadow: 3px 4px 0px 0px #899599;
	background: linear-gradient(to bottom, #ededed 5%, #bab1ba 100%);
	background-color: #ededed;
	border-radius: 10px;
	border: 1px solid #d6bcd6;
	display: inline-block;
	cursor: pointer;
	color: #696E74;
	font-family: Arial;
	font-size: 15px;
	padding: 4px 20px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #e1e2ed;
}

.myButton:hover {
	background: linear-gradient(to bottom, #bab1ba 5%, #ededed 100%);
	background-color: #bab1ba;
}

.myButton:active {
	position: relative;
	top: 1px;
}

/* 버튼 스타일 끝 */
</style>
<section class="section1">
	<div class="container clearfix">
		<br>
		<div class="content col-lg-12 col-md-12 col-sm-12 clearfix">

			<div class="col-lg-4 col-md-4 col-sm-4">
				<div class="portfolio_details">
					<div class="details_section">
						<h2>
							<a>관광지명</a>
						</h2>
						<h3>&nbsp;(관광지 종류)</h3>
						기본정보
						<hr>
						<ul>
							<li class="version"><span><a href="#">

										<div class="starRev">
											<span class="starR1 on">별1_왼쪽</span> <span class="starR2">별1_오른쪽</span>
											<span class="starR1">별2_왼쪽</span> <span class="starR2">별2_오른쪽</span>
											<span class="starR1">별3_왼쪽</span> <span class="starR2">별3_오른쪽</span>
											<span class="starR1">별4_왼쪽</span> <span class="starR2">별4_오른쪽</span>
											<span class="starR1">별5_왼쪽</span> <span class="starR2">별5_오른쪽</span>
										</div> <br>
								</a></span></li>
							<br>
							<li class="update">주소 : <span><a href="#"></a> <a
									href="#"></a></span></li>

							<li class="release">전화번호 : <span></span></li>
						</ul>

					</div>
				</div>
				<div class="" style="text-align: center;">
					<div class="">
						<br>
						<div style="margin-left: 10px; font-size: 0.5em;">
							<i class="fa fa-text1 fa-3x"> 조회수 <a> 999</a></i>
							&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-text2 fa-3x"> 좋아요 <a>
									999</a></i>
							<hr>
							<a class="fa fa-text3 fa-3x">찜하기</a>
						</div>
						<hr>
						<ul>

						</ul>

					</div>
				</div>
				<div></div>


				<!-- theme details -->
			</div>
			<div id="map" style="width: 60%; height: 400px;"></div>
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8b2b3fa7a88682f73a72b57b119c70c3&libraries=services"></script>
			<script>
				// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
				var infowindow = new kakao.maps.InfoWindow({
					zIndex : 1
				});

				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨
				};

				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption);

				// 장소 검색 객체를 생성합니다
				var ps = new kakao.maps.services.Places();

				// 키워드로 장소를 검색합니다
				ps.keywordSearch('제주특별자치도 서귀포시 성산읍 성산리 114', placesSearchCB);

				// 키워드 검색 완료 시 호출되는 콜백함수 입니다
				function placesSearchCB(data, status, pagination) {
					if (status === kakao.maps.services.Status.OK) {

						// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
						// LatLngBounds 객체에 좌표를 추가합니다
						var bounds = new kakao.maps.LatLngBounds();

						for (var i = 0; i < data.length; i++) {
							displayMarker(data[i]);
							bounds.extend(new kakao.maps.LatLng(data[i].y,
									data[i].x));
						}

						// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
						map.setBounds(bounds);
					}
				}

				// 지도에 마커를 표시하는 함수입니다
				function displayMarker(place) {

					// 마커를 생성하고 지도에 표시합니다
					var marker = new kakao.maps.Marker({
						map : map,
						position : new kakao.maps.LatLng(place.y, place.x)
					});

					// 마커에 클릭이벤트를 등록합니다
					kakao.maps.event
							.addListener(
									marker,
									'click',
									function() {
										// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
										infowindow
												.setContent('<div style="padding:5px;font-size:12px;">'
														+ place.place_name
														+ '</div>');
										infowindow.open(map, marker);
									});
				}
			</script>


			<br> <br>
			<div class="tabbable servicetab tabs-left">
				<ul class="nav nav-tabs"
					style="margin-left: 10px; border-bottom: 2px solid #ddd; width: 1020px;">
					<li class="active"><a href="services.html#webdesign"
						data-toggle="tab"><i class="fa fa-laptop"></i>여행지 상세정보</a></li>
					<li><a href="services#webdevelopment" data-toggle="tab"><i
							class="fa fa-cogs"></i>나의 리뷰</a></li>
					<li><a href="services#seoservices" data-toggle="tab" id="map1"><i
							class="fa fa-print"></i>활용방안</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="webdesign">
						<div class="row" style="padding-left: 100px">
							<br>
							<div class="col-lg-6">
								<p>성산 일출봉(城山 日出峰)은 서귀포시 성산읍에 있는 산이다. 커다란 사발 모양의 분화구가 특징으로,
									분화구 내부의 면적은 129,774m2이다. 높이는 182 m 이다. 성산 일출봉에서의 일출은 대한민국에서 가장
									아름다운 해돋이로 꼽히며 영주십경 중 하나이다. 일출봉 분화구와 주변 1 km 해역이 2000년 7월 18일
									대한민국의 천연기념물 제420호로 지정되었다. 또한 2007년 성산 일출봉 응회구의 1.688㎢가 세계자연유산으로
									등재되었다. 해저에서 화산쇄설물로 이루어진 퇴적암이 구성된 상태에서 용암이 분출하여 만들어졌다. 수중에서 폭발로
									이루어진 응회구로서 분석구보다 규모가 작으나 분화구가 크고 쇄설물 입자가 작다. 대략 10만년 전에 생겨났을
									것으로 예상되고 2만년 전 이후에 본섬과 연결되었을 것으로 추정된다. 한라산의 360여 개 기생 화산 중 유일하게
									해저에서 솟아오른 봉우리이다. 성산 일출봉은 원래는 독립된 화산체로서 사주가 형성되어 본섬과 연결된 육계도이다.

									성산 일출봉에서 섭지코지에 이르는 해안은 제주도 최대의 만입이다. 강한 연안류는 성산일출봉과 섭지코지 사이에 성산
									사빈과 사구를 발달시켰다.</p>

							</div>

							<div class="col-lg-6">
								<img class="img-responsive" src="resources/img/slider_01-1.png"
									alt=""> <br> <img class="img-responsive"
									src="resources/img/slider_01-1.png" alt="">

							</div>
						</div>
					</div>
					<div class="tab-pane" id="webdevelopment" style="width: 950px">
						<br>
						<div>
							<input data-toggle="modal" data-target="#myModal" type="button"
								id="" value="리뷰작성" style="float: right;" class="myButton">
						</div>
						<div class="row">
							<div id="comments_wrapper">
								<ul class="comment-list">
									<li>
										<div class="comment-content" style="height: 200px">
											<h4 class="comment-author">
												글제목 <small class="comment-meta"> <a>작성자날짜</a>
													<li class="version">
														<div class="starRev" style="float: right;">
															<span class="starR1 on">별1_왼쪽</span> <span class="starR2">별1_오른쪽</span>
															<span class="starR1">별2_왼쪽</span> <span class="starR2">별2_오른쪽</span>
															<span class="starR1">별3_왼쪽</span> <span class="starR2">별3_오른쪽</span>
															<span class="starR1">별4_왼쪽</span> <span class="starR2">별4_오른쪽</span>
															<span class="starR1">별5_왼쪽</span> <span class="starR2">별5_오른쪽</span>
														</div></small>
											</h4>
											<p>글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용</p>
											<span class="comment-reply"><a href="#"
												class="btn btn-danger">신고</a></span>
										</div>
										<div class="comment-content" style="height: 200px">
											<h4 class="comment-author">
												글제목 <small class="comment-meta"> <a>작성자 / 날짜</a>
													<li class="version">
														<div class="starRev" style="float: right;">
															<span class="starR1 on">별1_왼쪽</span> <span class="starR2">별1_오른쪽</span>
															<span class="starR1">별2_왼쪽</span> <span class="starR2">별2_오른쪽</span>
															<span class="starR1">별3_왼쪽</span> <span class="starR2">별3_오른쪽</span>
															<span class="starR1">별4_왼쪽</span> <span class="starR2">별4_오른쪽</span>
															<span class="starR1">별5_왼쪽</span> <span class="starR2">별5_오른쪽</span>
														</div></small>
											</h4>
											<p>글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용</p>
											<span class="comment-reply"><a href="#"
												class="btn btn-danger">신고</a></span>
										</div>
										<div class="comment-content" style="height: 200px">
											<h4 class="comment-author">
												글제목 <small class="comment-meta"> <a>작성자 / 날짜</a>
													<li class="version">
														<div class="starRev" style="float: right;">
															<span class="starR1 on">별1_왼쪽</span> <span class="starR2">별1_오른쪽</span>
															<span class="starR1">별2_왼쪽</span> <span class="starR2">별2_오른쪽</span>
															<span class="starR1">별3_왼쪽</span> <span class="starR2">별3_오른쪽</span>
															<span class="starR1">별4_왼쪽</span> <span class="starR2">별4_오른쪽</span>
															<span class="starR1">별5_왼쪽</span> <span class="starR2">별5_오른쪽</span>
														</div></small>
											</h4>
											<p>글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용</p>
											<span class="comment-reply"><a href="#"
												class="btn btn-danger">신고</a></span>
										</div>
									</li>

								</ul>
								<!-- End .comment-list -->

								<div class="clearfix"></div>


							</div>
							<!-- div comments -->

						</div>
					</div>



					<div class="tab-pane" id="seoservices">

						<!-- end col-lg 8 -->

						<div class="clearfix"></div>
						<div class="clearfix"></div>


					</div>
				</div>
			</div>
			<!-- owl-related -->
		</div>
		<!--  https://jsfiddle.net/zzznara/Ln8wpm67/?utm_source=website&utm_medium=embed&utm_campaign=Ln8wpm67 -->
		<!-- https://zzznara2.tistory.com/588 -->
		<!-- 기본 모달 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel"
							style="text-align: center;">리뷰작성</h4>
					</div>
					<div class="comments_form">
						<br>
						<form id="comments_form" action="" name="comments_form"
							class="row" method="post">
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								제목: <input type="text" name="name" id="name"
									class="form-control" placeholder="제목을 입력하세요."
									required="required">

								<ul>
									<li class="version">별점: <span><a href="#">

												<div class="starRev">
													<span class="starR1 on">별1_왼쪽</span> <span class="starR2">별1_오른쪽</span>
													<span class="starR1">별2_왼쪽</span> <span class="starR2">별2_오른쪽</span>
													<span class="starR1">별3_왼쪽</span> <span class="starR2">별3_오른쪽</span>
													<span class="starR1">별4_왼쪽</span> <span class="starR2">별4_오른쪽</span>
													<span class="starR1">별5_왼쪽</span> <span class="starR2">별5_오른쪽</span>
												</div>

										</a></span></li>
								</ul>
								<textarea class="form-control" name="comments" id="comments"
									rows="6" placeholder="내용을 입력하세요"></textarea>

							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary">등록</button>
					</div>
				</div>
			</div>
		</div>
		<!-- end content -->
	</div>
	<!-- end container -->
</section>
<!-- end section -->
<%@include file="../main/footer.jsp"%>