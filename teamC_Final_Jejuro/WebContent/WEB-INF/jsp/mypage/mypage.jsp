<%@include file="../main/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
<link href="resources/css/plan.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
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
			//console.log($('#toDate').handleDtpicker('getDate'));
		});
		
		$('#button3').click(function test() {
			var start = $('#fromDate').datepicker('getDate');
			var end = $('#toDate').datepicker('getDate');
			var diff = new Date(end-start);
			var days = (diff/1000/60/60/24)+1;
				
			console.log("시작날짜 : " + start)
			console.log("종료날짜 : " + end)
			console.log("날짜 : " + diff)
			console.log("날짜 : " + days)
			//window.open('plan?num=' + days);
			if(start != null & end != null){
				location.href='plan?num=' + days;
			}else{
				location.href='404';
			}
		})
	});
</script>
<section class="section1">
<br><br>
	<div class="container clearfix">
		<div class="content col-lg-12 col-md-12 col-sm-12 clearfix">

			<div class="clearfix"></div>
			
			<!-- start include -->
			<%@include file="mypage_menu.jsp"%>
			<!--end of include -->
			
			<div class="clearfix"></div>
			<div class="divider"></div>

			<div class="tab-pane active" id="myTourPlan">
				<h3 class="title">
					나의 여행 일정(1) <small><a href="#" data-toggle="modal"
						data-target="#myModal" style="float: right;">[여행 일정 추가]</a></small>
				</h3>
				<div class="plan_inner">
					<a href="" class="box" target="_blank">
						<div class="plan_hidden_btn">상세일정 보기</div>
						<div class="plan_bg">
							<div class="plan_bg_inner">
								<span>2020-01-27</span><span
									style="margin-left: 10px; color: #b4b4b4;">2 DAYS</span><br>제주여행
							</div>
						</div>
						<div class="plan_img_box">
							<img
								src="http://img.earthtory.com/img/city_images/312/jeju_1425527554.jpg"
								alt="" class="plan_img">
						</div>
						<div class="plan_bg_inner2">
							<span>나홀로 여행</span>
							<div class="fr pn_list_view_icon" style="float: right;">4</div>
							<div class="clear"></div>
							<div class="pn_list_city"></div>
							<div class="clear"></div>
							<div>&nbsp;</div>
							<div class="pn_list_user">
								접속자id
								<div class="edit_btn" data-srl="303925" data-op="del">삭제</div>
								<div class="edit_line"></div>
								<div class="edit_btn" data-op="edit" data-srl="303925">수정</div>
								<div class="clear"></div>
							</div>
						</div>
					</a>

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
										style="text-align: center;">XXX님의 여행 일정</h4>
								</div>
								<div class="modal-body">
									<div class="modal-div">
										<form>
											<table>
												<tr>
													<td>제목&nbsp;&nbsp;<input type="text"
														placeholder="제목을 입력하세요." required="required"
														style="width: 300px"></td>
												</tr>
												<tr>
													<td>오늘 날짜 : <span id="today"></span> <br> <label
														for="fromDate">시작일&nbsp;</label> <input type="text"
														name="fromDate" id="fromDate">~ <label
														for="toDate">종료일&nbsp;</label> <input type="text"
														name="toDate" id="toDate"> <br>
													</td>
												</tr>
											</table>
											인원<select id="number" name="number" class="small"
												aria-required="true" aria-invalid="false"><option
													value="1">1명</option>
												<option value="2">2명</option>
												<option value="3">3명</option>
												<option value="4">4명</option>
												<option value="5">5명</option>
												<option value="6">6명</option>
												<option value="7">7명</option>
												<option value="8">8명</option>
												<option value="9">9명</option>
												<option value="10">10명</option></select>&nbsp;일행<select id="partner"
												name="partner" class="small" aria-required="true"
												aria-invalid="false"><option value="">선택</option>
												<option value="p1">부모</option>
												<option value="p2">아이</option>
												<option value="p3">친구</option>
												<option value="p4">커플</option>
												<option value="p5">혼자</option></select>&nbsp;여행테마 <select
												id="concept" name="concept" aria-required="true"
												aria-invalid="false"><option value="">여행
													구분을 선택하세요</option>
												<option value="c01">휴식과 치유 여행</option>
												<option value="c02">레저와 체험</option>
												<option value="c03">천천히 걷기</option>
												<option value="c04">식도락 여행</option>
												<option value="c05">제주의 문화유산</option>
												<option value="c06">전시와 행사</option>
												<option value="c07">쇼핑</option></select>
											<ul>
												<li class="radio_padding_box"><input type="radio"
													name="publishyn" id="public" value="y" aria-required="true"
													aria-invalid="false">공개&nbsp;&nbsp;<input
													type="radio" name="publishyn" id="private" value="n"
													aria-required="true" aria-invalid="false"> 비공개</li>
											</ul>
										</form>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" id="button2" class="btn btn-default"
										data-dismiss="modal">Close</button>
									<button type="button" id="button3" style="color: #696E7;"
										class="btn btn-primary">Save</button>
								</div>



							</div>
						</div>
					</div>
					<!-- end content -->
				</div>
				<!-- end container -->
</section>
<!-- end section -->
<script>
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

	$(function(){
		//메뉴 활성화.
		$('.mypageMenu').first().attr('class','col-lg-2 col-md-2 col-sm-2 mypageMenu active');
	});
	
</script>
<%@include file="../main/footer.jsp"%>










