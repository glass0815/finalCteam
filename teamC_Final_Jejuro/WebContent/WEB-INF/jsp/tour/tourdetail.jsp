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
<!-- 로그인 체크 후 찜하기 및 좋아요 -->
<script>
	function loginCheck(uuid) {
		if (uuid == '') {
			if (confirm("로그인이 필요합니다. 로그인페이지로 이동하시겠습니까?") == true) {
				location.href = "loginForm"
			} else {
				return;
			}
		}
	}
</script>
<script>
	function pick(tNo, val) {
		var data = {
			"tNo" : tNo,
			"val" : val
		}
		$.ajax({
			type : "GET",
			data : data,
			url : "tourlikepick",
			success : function(data) {
				if (data == 1) {
					alert("이미 찜했습니다.", data);
				} else {
					alert("찜하기 성공", data)
				}
			}
		})
	}
	function like(tNo, val) {
		var data = {
			"tNo" : tNo,
			"val" : val
		}
		$.ajax({
			type : "GET",
			data : data,
			url : "tourlikepick",
			success : function(data) {
				if (data == 1) {
					alert("좋아요가 이미 되있습니다.", data);
					location = 'tourdetail?tNo=' + tNo
				} else {
					alert("좋아요 성공", data)
					location = 'tourdetail?tNo=' + tNo
				}
			}
		})
	}
</script>


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
							<a>${tvo.tName }</a>
						</h2>
						<br>
						<h3>
							&nbsp;&nbsp;관광지 유형 :<span>&nbsp;${tvo.tType}</span>
						</h3>
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
							<li class="update">주소 : <span>${tvo.tAddr1 }</span></li>

							<li class="release">전화번호 : <span>${tvo.tTel}</span></li>
						</ul>

					</div>
				</div>
				<div class="" style="text-align: center;">
					<div class="">
						<br>
						<div style="margin-left: 10px; font-size: 0.5em;">
							<i class="fa fa-text1 fa-3x"> 조회수 <a> ${tvo.tHit}</a></i>
							&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-text2 fa-3x"> 좋아요 <a
								href="javascript:like(${tvo.tNo},1);"
								onclick="return loginCheck('${sessionScope.uuId}')">${tvo.tlikes}</a></i>
							<hr>
							<a class="fa fa-text3 fa-3x"
								href="javascript:pick(${tvo.tNo},2);"
								onclick="return loginCheck('${sessionScope.uuId}')">찜하기</a>
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
				ps.keywordSearch('${tvo.tAddr1}', placesSearchCB);

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


			<br> <br> <br> <br>
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
					<div class="tab-pane " id="webdevelopment">
						<div class="row" style="padding-left: 100px">
							<br>
							<div class="col-lg-6">
								<c:forTokens var="e" items="${tvo.tInfo}" delims="/">
									<p>${e}</p>
								</c:forTokens>
							</div>

							<div class="col-lg-6">
								<img class="img-responsive"
									src="resources/img/tourspot/${tvo.tImg1 }" alt=""> <br>
								<img class="img-responsive"
									src="resources/img/tourspot/${tvo.tImg2 }" alt=""> <br>
								<img class="img-responsive"
									src="resources/img/tourspot/${tvo.tImg3 }" alt=""> <br>
								<img class="img-responsive"
									src="resources/img/tourspot/${tvo.tImg4 }" alt="">

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

						<div class="tab-pane active" id="webdesign">
							<h5 class="title">
								<i class="fa fa-laptop"></i>사진
							</h5>
							<div class="row"
								style=" width: 100%; height: 600px;">


								<div class="col-lg-8 col-md-8 col-sm-12"
									style=" width: 50%; height: 300px; float: left; box-sizing: border-box">
									<div class="item_image">
										<div id="myCarousel" class="carousel slide">
											<div class="carousel-inner">
												<div class="item active">
													<img src="resources/img/tourspot/${tvo.tImg1 }" alt=""
														style="width: 100%; height: 300px;">
												</div>
												<!-- end item -->
												<div class="item">
													<img src="resources/img/tourspot/${tvo.tImg2 }" alt=""
														style="width: 100%; height: 300px;">
												</div>
												<!-- end item -->
												<div class="item">
													<img src="resources/img/tourspot/${tvo.tImg3 }" alt=""
														style="width: 100%; height: 300px;">
												</div>
												<div class="item">
													<img src="resources/img/tourspot/${tvo.tImg4 }" alt=""
														style="width: 100%; height: 300px;">
												</div>
												<!-- end item -->
											</div>
											<!-- carousel inner -->
											<a class="left carousel-control" href="#myCarousel"
												data-slide="prev"> <span class="icon-prev"></span>
											</a> <a class="right carousel-control" href="#myCarousel"
												data-slide="next"> <span class="icon-next"></span>
											</a>
										</div>
										<!-- end carousel -->
									</div>
									<!-- end item_image -->
								</div>
								<div
									style=" width: 45%; float: right; box-sizing: border-box">

									<%-- <c:forTokens var="e" items="${tvo.tInfo}" delims="&">
										<p>${e}</p>
										<c:forTokens items="${e}" delims="/" var="f">
											<a>${f }</a>
										</c:forTokens>
									</c:forTokens> --%>

								</div>
							</div>
						</div>
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