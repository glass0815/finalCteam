<%@include file="../main/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<style>
 input.img-button {
        background: url( "resources/img/kakaopay.jpg" ) no-repeat;
        border: none;
        margin-left:25%;
        width: 344px;
        height: 144px;
        cursor: pointer;
      }
</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(function() {
	$('#kakao').click(function () {
		console.log("kakao")
		var url = "https://developers.kakao.com/payment/index#%EC%B9%B4%EC%B9%B4%EC%98%A4%ED%8E%98%EC%9D%B4";
		var name = "test";
		var option =  "width = 500, height = 500, top = 100, left = 200, location = no";
		window.open(url,name,option);
	});
	  
});
</script>
<section class="post-wrapper-top">
	<div class="container">
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
			<ul class="breadcrumb">
				<li><a href="home">Home</a></li>
				<li>Checkout</li>
			</ul>
			<h2>결제하기</h2>
		</div>
	</div>
</section>
<!-- end post-wrapper-top -->

<section class="section1">
	<div class="container clearfix" style="margin-left: 30%">
		<div class="content col-lg-8 col-md-8 col-sm-8 col-xs-12 clearfix">

			<table class="table table-striped checkout" data-effect="fade">
				<thead>
					<tr>
						<th>룸 정보</th>
						<th>룸 가격</th>
						<th>인원수</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><img width="50" src="resources/img/recent_post_01.png"
							alt=""> <a href="#">룸 이름</a></td>
						<td>$18.00</td>
						<td><input id="verify" class="form-control quantity"
							type="text" value="1" name=""></td>
						<td><a class="remove" href="#" title="Remove this item"></a></td>
					</tr>
				</tbody>
			</table>
			<div class="clearfix"></div>

			<div class="clearfix"></div>

			<div class="well text-right">
				<strong>TOTAL: $18.00</strong>
			</div>

			<div class="clearfix"></div>



			<div class="clearfix"></div>
			<div class="divider"></div>

			<h5 class="title">PERSONAL INFORMATION</h5>

			<form id="personalinfo" action="" name="personalinfo" method="post">
				<label for="email">Email Address <span class="required">*</span></label>
				<input type="text" name="name" id="email" class="form-control"
					placeholder="example@yoursite.com"> <label for="fname">First
					Name <span class="required">*</span>
				</label> <input type="text" name="fname" id="fname" class="form-control"
					placeholder="John"> <label for="lname">Last Name </label> <input
					type="text" name="lname" id="lname" class="form-control"
					placeholder="DOE">
			</form>

			<div class="clearfix"></div>
			<div class="divider"></div>

			<h5 class="title">CART DETAILS</h5>

			<form id="cartinfo" action="" name="cartinfo" method="post">
				<label for="cardnumber">Card Number <span class="required">*</span></label>
				<input type="text" name="cardnumber" id="cardnumber"
					class="form-control" placeholder="Your card number"> <label
					for="cvc">CVC <span class="required">*</span></label> <input
					type="text" name="cvc" id="cvc" class="form-control"
					placeholder="Security code"> <label for="ncard">Name
					on the Card <span class="required">*</span>
				</label> <input type="text" name="ncard" id="ncard" class="form-control"
					placeholder="Name on the card"> <label for="ncard">Expiration
					(MM/YY) <span class="required">*</span>
				</label>

				<div class="clearfix"></div>

				<select class="form-control"
					style="width: 75px; float: left; margin-right: 10px;">
					<option>01</option>
					<option>02</option>
					<option>03</option>
					<option>04</option>
					<option>05</option>
					<option>06</option>
					<option>07</option>
					<option>08</option>
					<option>09</option>
					<option>10</option>
					<option>11</option>
					<option>12</option>
				</select> <select class="form-control" style="width: 75px; float: left">
					<option>14</option>
					<option>15</option>
					<option>16</option>
					<option>17</option>
					<option>18</option>
					<option>19</option>
				</select>
			</form>
			<div class="payments">
				<br> <br> <br>
				<p>
					<img alt="" src="resources/img/payments.png">
				</p>

				<label class="checkbox-inline"> <input id="inlineCheckbox1"
					type="checkbox" value="option1"> <strong>PAYPAL</strong>
				</label> <label class="checkbox-inline"> <input id="inlineCheckbox2"
					type="checkbox" value="option2"> <strong>CREDIT
						CARD</strong>
				</label>
			</div>
			
			
			<div class="clearfix"></div>
			<div class="divider"></div>
			
			<h5 class="title">카카오 결제</h5>
			<input type="button" id="kakao" class="img-button">
			
			<div class="clearfix"></div>
			<div class="divider"></div>
			<button class="button large btn-block">일반 결제</button>
		</div>
		<!-- end content -->
	</div>
	<!-- end container -->
</section>
<!-- end section -->
<%@include file="../main/footer.jsp"%>