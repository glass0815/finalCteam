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
.hide { display: none; }
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
				<h3 class="title">내가 남긴 리뷰(${fn:length(trList) + fn:length(hrList)})</h3>
					<div>
						<select id="tourhouseoption">
							<option value="tour" selected="selected">관광지</option>
							<option value="house">숙소</option>
						</select>
					</div>
					<div id="tour_reviewList" class="">
						<div>관광지 입니다.</div>
						<c:forEach var="e" items="${trList}">
							<div class="box">
								<div class="col-md-3">
									<img
										src="./resources/img/tourspot/${e.tTopImg}"
										alt="" class="spot_img"
										onerror="this./resources/img/tourspot/${e.tTopImg};">
									<%-- <a href="tourdetail?tNo=${e.tNo}">${e.tName}</a> --%>
								</div>
								<br>
								<div class="date">${e.trDate}</div>
								<div> 
									<div class="spot_name">
										<div><a href="tourdetail?tNo=${e.tNo}" style="color: #696E74;">${e.trContent}</a></div>
										<br><br>
									</div>
									
								</div>
								
								<div class="review_bottom">
									<div><img src="./resources/img/mypage_icon/1.0.PNG" style="height: 36px;">${e.trPoint} 점</div>
									<a id="deletemyreview" class="edit_btn" href="deleteMyTourReview?trno=${e.trNo }">삭제</a>&nbsp;
									<div class="clear"></div>
								</div>
							</div>
							
						</c:forEach>
						
					</div>
					
					<div id="house_reviewList" class="hide">
						<div>숙소입니다.</div>
						<c:forEach var="e" items="${hrList}">
							<div class="box">
								<div class="col-md-3">
									<img
										src="./resources/img/tourspot/${e.hTopImg}"
										alt="" class="spot_img"
										onerror="this./resources/img/tourspot/${e.hTopImg};">
									<%-- <a href="tourdetail?tNo=${e.tNo}">${e.tName}</a> --%>
								</div>
								<br>
								<div class="date">${e.hrDate}</div>
								<div> 
									<div class="spot_name">
										<div><a href="tourdetail?tNo=${e.hNo}" style="color: #696E74;">${e.hrContent}</a></div>
										<br><br>
									</div>
									
								</div>
								
								<div class="review_bottom">
									<div><img src="./resources/img/mypage_icon/1.0.PNG" style="height: 36px;">${e.hrPoint} 점</div>
									<a id="deletemyreview" class="edit_btn" href="deleteMyHouseReview?hrNo=${e.hrNo }">삭제</a>&nbsp;
									<div class="clear"></div>
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
	//메뉴 활성화.
	$('.mypageMenu').eq(4).attr('class','col-lg-2 col-md-2 col-sm-2 mypageMenu active');
});

$('#deletemyreview').on('click',function(){
	if(confirm('이 리뷰를 삭제하시겠습니까? \n리뷰 삭제시 복구할 수 없습니다.')){
		console.log('리뷰 삭제')
	}
});

	$('#tourhouseoption').on('change',function() {
		var state = $('#tourhouseoption option:selected').val();
		if ( state == 'tour' ) {
			$('#house_reviewList').addClass('hide');
			$('#tour_reviewList').removeClass('hide');
		} else {
			$('#tour_reviewList').addClass('hide');
			$('#house_reviewList').removeClass('hide');
		}
	});

</script>
<%@include file="../main/footer.jsp"%>