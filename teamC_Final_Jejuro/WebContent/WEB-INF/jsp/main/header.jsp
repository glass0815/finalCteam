<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<title>제주로 올레</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- 프로젝트 로고 -->
<link href="resources/img/logo.png" rel="icon">

<link href="resources/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Ruda:400,900,700"
	rel="stylesheet">

<!-- Bootstrap CSS File -->
<link href="resources/lib/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Libraries CSS Files -->
<link href="resources/lib/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="resources/lib/prettyphoto/css/prettyphoto.css"
	rel="stylesheet">
<link href="resources/lib/hover/hoverex-all.css" rel="stylesheet">
<link href="resources/lib/jetmenu/jetmenu.css" rel="stylesheet">
<link href="resources/lib/owl-carousel/owl-carousel.css"
	rel="stylesheet">
<!-- Main Stylesheet File -->
<link href="resources/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/colors/blue.css">
<link href="resources/css/bbpress.css" rel="stylesheet">

<!-- 추가 CSS 시작 -->

<!-- 달력 -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<!-- 추가 CSS 끝 -->
</head>
<body>
	<!-- 최상단 bar 시작 -->
	<div class="topbar clearfix">
		<div class="container">
			<div class="col-lg-12 text-right">
				<div class="social_buttons">
					<!-- 로그인 회원가입 -->
					<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
					<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
					<c:choose>
						<c:when test="${sessionScope.uuId == null }">
							<a href="loginForm" style="float: left; width: 60px">로그인 |</a>&nbsp;&nbsp;
							<a href="registerForm" style="float: left; width: 60px">회원가입</a>
						</c:when>
						<c:otherwise>
							<a href="logout" style="float: left; width: 60px">로그아웃 </a>
							<a href="" style="float: left; width: 150px">|${sessionScope.uName}
								님 환영합니다.</a>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${sessionScope.uuId == null }">

						</c:when>
						<c:otherwise>

						</c:otherwise>
					</c:choose>

					<!-- 검색 -->
					<a href="search" data-toggle="tooltip" data-placement="bottom"
						title="검색"><i class="fa fa-rss"></i></a> <a
						href="https://ko-kr.facebook.com/" data-toggle="tooltip"
						data-placement="bottom" title="Facebook"><i
						class="fa fa-facebook"></i></a> <a href="https://twitter.com/?lang=ko"
						data-toggle="tooltip" data-placement="bottom" title="Twitter"><i
						class="fa fa-twitter"></i></a> <a href="https://www.google.com/"
						data-toggle="tooltip" data-placement="bottom" title="Google+"><i
						class="fa fa-google-plus"></i></a>
					<!-- 언어변환 -->
					<a href="lang" data-toggle="tooltip" data-placement="bottom"
						title="언어 "><i class="fa fa-dribbble"></i></a>
				</div>
			</div>
		</div>
		<!-- end container -->
	</div>
	<!-- 최상단 bar 끝 -->
	<!-- 메뉴창 시작 -->
	<header class="header">
		<div class="container">
			<div class="site-header clearfix">
				<div class="col-lg-3 col-md-3 col-sm-12 title-area">
					<div class="site-title" id="title">
						<a href="home" title="">
							<h4>
								<img alt=""
									src="resources/img/plan_icon/icons8-south-korea-map-50.png">제주로<span>올레</span>
							</h4>
						</a>
					</div>
				</div>
				<!-- title area -->
				<div class="col-lg-9 col-md-12 col-sm-12">
					<div id="nav" class="right">
						<div class="container clearfix">
							<ul id="jetmenu" class="jetmenu blue">
								<li class="active"><a href="home">홈</a></li>
								<li><a href="tourList">관광지</a> <!-- 대분류 -->
									<ul class="dropdown">
										<li><a href="tourList">종합</a></li>
										<!-- 소분류  -->
										<li><a href="tourList">자연</a></li>
										<li><a href="tourList">문화</a></li>
										<li><a href="tourList">테마</a></li>
										<li><a href="tourList">올레</a></li>
									</ul></li>
								<li><a href="house">숙박</a>
									<ul class="dropdown">
										<li><a href="house">종합</a></li>
										<li><a href="house">호텔</a></li>
										<li><a href="house">호스텔</a></li>
										<li><a href="house">콘도</a></li>
									</ul></li>
								<li><a href="notice">공지사항</a>
									<ul class="dropdown">
										<li><a href="faq">자주묻는질문</a></li>
										<li><a href="notice">공지사항</a></li>
										<li><a href="contact">문의사항</a></li>
									</ul></li>
								<li><a href="404">제주이야기</a>
									<ul class="dropdown">
										<li><a href="jejustory">제주이야기</a></li>
										<li><a href="blog">블로그</a></li>
										<li><a href="etc">기타등등</a></li>
									</ul></li>
								<li><a href="404">빅데이터</a>
									<ul class="dropdown">
										<li><a href="chart">차트</a></li>
										<li><a href="bigdata">추천</a></li>
										<li><a href="weather">날씨</a></li>
									</ul></li>
								<c:choose>
									<c:when test="${sessionScope.uuId != null }">
										<li><a href="mypage?uno=${sessionScope.uNo}">마이페이지</a>
											<ul class="dropdown">
												<li><a href="mypage?uno=${sessionScope.uNo}">나의 여행</a></li>
												<li><a href="pickTourspot?uno=${sessionScope.uNo}">pick 관광지</a></li>
												<li><a href="pickhouse?uno=${sessionScope.uNo}">pick 숙소</a></li>
												<li><a href="reservationHouse?uno=${sessionScope.uNo}">예약 숙소</a></li>
												<li><a href="myreview?uno=${sessionScope.uNo}">나의 리뷰</a></li>
												<li><a href="infoModify?uno=${sessionScope.uNo}">정보 수정</a></li>
											</ul></li>
									</c:when>
									<c:otherwise>
										<li><a href="loginForm">마이페이지</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
					</div>
					<!-- nav -->
				</div>
				<!-- title area -->
			</div>
			<!-- site header -->
		</div>
		<!-- end container -->
	</header>
	<!-- 메뉴 창 끝 -->