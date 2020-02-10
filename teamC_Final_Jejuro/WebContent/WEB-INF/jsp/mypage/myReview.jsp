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
<link href="resources/css/my_review.css" rel="stylesheet">

<section class="section1">
<br><br>
	<div class="container clearfix">
		<div class="content col-lg-12 col-md-12 col-sm-12 clearfix">

			<div class="clearfix"></div>

			<!-- start include -->
			<%@include file="mypage_menu.jsp"%>
			<!--end of include -->
			
			<div class="content col-lg-12 col-md-12 col-sm-12 clearfix">
				<h3 class="title">내가 남긴 리뷰(1)</h3>
					<div class="box">
						<div class="col-md-3">
							<img src="http://img.earthtory.com/img/place_img/58/3549_0_et.jpg"
							alt="" class="spot_img">
						</div>
						<div class="review_i_right col-md-9">
							<div class="spot_name">
								도톤보리
								<div class="date">2020.01.22</div>
								<div class="clear"></div>
							</div>
							<div class="rate_val" style="background: url(./resources/img/mypage_icon/1.0.PNG) no-repeat; height: 36px;"></div>
							<div class="review_txt">좋았습니다</div>
							<div class="review_bottom">
								<span class="review_like"
									onclick="reviewReport()"
									data-srl="5857">
									신고 (<span>0</span>)
								</span>
								&nbsp;<span class="edit_btn" onclick="reviewDelete()" >삭제</span>&nbsp;
								<span class="edit_btn" onclick="reviewUpdate()" >수정</span>
								
								
							</div>
						</div>
						<div class="clear"></div>
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
	$('.mypageMenu').eq(4).attr('class','col-lg-2 col-md-2 col-sm-2 mypageMenu active');
});

function reviewDelete(){
	if(confirm('삭제하시겠습니까? \n리뷰 삭제시 복구할 수 없습니다.')){
		console.log('리뷰 삭제')
	}
}

function reviewUpdate(){
	if(confirm('수정하시겠습니까? \n수정 페이지로 이동합니다.')){
		console.log('리뷰 수정')
	}
}

function reviewReport(){
	if(confirm('신고하시겠습니까?')){
		console.log('이 리뷰 신고')
	}
}
</script>
<%@include file="../main/footer.jsp"%>