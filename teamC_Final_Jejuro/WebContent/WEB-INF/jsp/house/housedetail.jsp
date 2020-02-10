<%@include file="../main/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 달력함수 -->
<script>
	$(function() {

		//오늘 날짜를 출력
		$("#today").text(new Date().toLocaleDateString());

		//datepicker 한국어로 사용하기 위한 언어설정
		$.datepicker.setDefaults($.datepicker.regional['ko']);

		// 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
		// 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가

		//시작일.
		$('#fromDate').datepicker({
			showOn : "both", // 달력을 표시할 타이밍 (both: focus or button)
			buttonImage : "resources/img/calendar.gif", // 버튼 이미지
			buttonImageOnly : true, // 버튼 이미지만 표시할지 여부
			buttonText : "날짜선택", // 버튼의 대체 텍스트
			dateFormat : "yy-mm-dd", // 날짜의 형식
			changeMonth : true, // 월을 이동하기 위한 선택상자 표시여부
			//minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
			onClose : function(selectedDate) {
				// 시작일(fromDate) datepicker가 닫힐때
				// 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
				$("#toDate").datepicker("option", "minDate", selectedDate);
			}
		});

		//종료일
		$('#toDate').datepicker({
			showOn : "both",
			buttonImage : "resources/img/calendar.gif",
			buttonImageOnly : true,
			buttonText : "날짜선택",
			dateFormat : "yy-mm-dd",
			changeMonth : true,
			//minDate: 0, // 오늘 이전 날짜 선택 불가
			onClose : function(selectedDate) {
				// 종료일(toDate) datepicker가 닫힐때
				// 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
				$("#fromDate").datepicker("option", "maxDate", selectedDate);
			}
		});
	});
</script>
<!-- 상세보기 버튼 클릭시 문구 사라지는 함수 -->
<script>
	$(function() {
		$('#detail').click(function() {
			$("#test1").hide();
		})
	})
</script>
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

<script>
	$(function() {
		$("#showbtn").click(function() {

			$("#displaydiv").show();
		});

	})
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
	border-radius: 15px;
	border: 1px solid #d6bcd6;
	display: inline-block;
	cursor: pointer;
	color: #3a8a9e;
	font-family: Arial;
	font-size: 17px;
	padding: 7px 25px;
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
<!--  스크롤 -->
<style>
#scroll {
	width: 100px;
	height: 150px;
}
</style>


<!-- end post-wrapper-top -->

<section class="section1">
	<div class="container clearfix">
		<div class="content col-lg-12 col-md-12 col-sm-12 clearfix">
			<div class="col-lg-4 col-md-4 col-sm-4">
				<div class="portfolio_details">
					<div class="details_section">
						<h2>
							<a>숙소명</a>
						</h2>
						<h3>&nbsp;(숙소 종류)</h3>
						숙소기본정보
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
				ps.keywordSearch('제주특별자치도 제주시 삼도2동 탑동로 66', placesSearchCB);

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
						data-toggle="tab"><i class="fa fa-laptop"></i>방정보</a></li>
					<li><a href="services#webdevelopment" data-toggle="tab"><i
							class="fa fa-cogs"></i>숙소 리뷰</a></li>
					<li><a href="services#seoservices" data-toggle="tab"><i
							class="fa fa-print"></i>활용방안</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane" id="seoservices">
						<h5 class="title">
							<i class="fa fa-laptop"></i>사진
						</h5>
						<div class="row"
							style="border: 1px solid grey; width: 100%; height: 600px;">


							<div class="col-lg-8 col-md-8 col-sm-12"
								style="border: 1px solid grey; width: 50%; height: 300px; float: left; box-sizing: border-box">
								<div class="item_image">
									<div id="myCarousel" class="carousel slide">
										<div class="carousel-inner">
											<div class="item active">
												<img src="resources/img/c1.jpg" alt=""
													style="width: 100%; height: 300px;">
											</div>
											<!-- end item -->
											<div class="item">
												<img src="resources/img/c2.jpg" alt=""
													style="width: 100%; height: 300px;">
											</div>
											<!-- end item -->
											<div class="item">
												<img src="resources/img/c3.jpg" alt=""
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
								style="border: 1px solid grey; width: 45%; float: right; box-sizing: border-box">

								<a>설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명명설명설명설명설명</a>

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
											<p> 글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용 </p> <span
												class="comment-reply"><a href="#"
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
											<p> 글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용 </p> <span
												class="comment-reply"><a href="#"
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
											<p> 글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용 </p> <span
												class="comment-reply"><a href="#"
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
						<br>
						<div style="width: 95%; height: 600px;">
							<div
								style=" width: 65%; height: 600px; float: left; box-sizing: border-box">
								<!-- 상세보기 버튼클릭시 없어져야하는 부분 -->
								<h1 id="test1" style="margin-left: 15%;">상세보기버튼을 눌러주세요</h1>

								<div
									style="display: none; width: 100%; height: 300px; text-align: center; margin-top: 40px;"
									id="displaydiv">
									<img src="resources/img/room.jpg"
										style="width: 300px; height: 200px">

									<table style="width: 100%; height: 100%;">
										<tr>
											<td>룸이름</td>
											<td>룸이름입니다.</td>
										</tr>
										<tr>
											<td>룸가격</td>
											<td>50000원</td>
										<tr>
											<td>남은방개수</td>
											<td>5개</td>
										</tr>
										<tr>
											<td>최대이용가능인원</td>
											<td>4명</td>
										</tr>
										<tr>
											<td>방정보</td>
											<td>ㅁㅇㅁㄴㅇ</td>
										</tr>
										<tr>
											<td><input data-toggle="modal" data-target="#myModal2"
												type="button" id="" value="결제" class="btn btn-warning"
												style="width: 75px; margin-left: 80%"></td>
										</tr>
									</table>
								</div>
							</div>
							<div
								style=" width: 35%; float: right; box-sizing: border-box">

								<div style="overflow-y: auto; width: 100%; height: 600px;">
									<ul>
									<c:forEach var="e" items="${rlist}">
										<li id="showbtn"><p>
												${e.rName} <img src="resources/img/room/${e.rImg }">
												<%-- <c:forEach var="i" begin="1" end="${cnt}"> --%>
												 <input data-toggle="modal" type="button" id="detail"
													value="방 상세보기" class="btn btn-warning"
													style="width: 100%; height: 20pt;">
													<%-- </c:forEach> --%>
											</p></li>
									</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- owl-related -->
		</div>
		<!-- end content -->
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
					<div class="comments_form1">
						<br>
						<form id="comments_form1" action="" name="comments_form1"
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
									rows="6" placeholder="내용을 입력하세요."></textarea>

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





		<!-- 모달2 -->
		<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">

			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel"
							style="text-align: center;">예약하기</h4>
					</div>
					<div class="comments_form">
						<br>
						<form id="comments_form" action="" name="comments_form"
							class="row" method="post">
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"
								style="position: relative; text-align: center;">
								오늘 날짜 : <span id="today"></span> <br> <br> <label
									for="fromDate">시작일&nbsp;</label> <input type="text"
									name="fromDate" id="fromDate">~ <label for="toDate">종료일&nbsp;</label>
								<input type="text" name="toDate" id="toDate"> <input
									type="number" min="1" max="10" step="1" name="number"
									id="number" class="form-control" placeholder="인원 수를 입력하세요."
									required="required"
									style="width: 200px; left: 0; right: 0; margin-left: auto; margin-right: auto;">
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						<a href="checkout"><button type="button"
								class="btn btn-primary">등록</button></a>
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