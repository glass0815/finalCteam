<%@include file="../main/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<style>
#div1, #div2 {
	float: left;
	width: 100px;
	height: 80px;
	margin: 10px;
	padding: 10px;
	border: 1px solid black;
}

.config_table .t_input {
	height: 29px;
	line-height: 29px;
	border: 1px solid #c8c8ca;
	width: 421px;
	padding-left: 15px;
}
</style>
<section class="post-wrapper-top">
	<div class="container">
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
			<ul class="breadcrumb">
				<li><a href="home">Home</a></li>
				<li>마이페이지</li>
			</ul>
			<h2>정보수정</h2>
		</div>
	</div>
</section>
<!-- end post-wrapper-top -->

<section class="section1">
	<div class="container clearfix">
		<div class="content col-lg-12 col-md-12 col-sm-12 clearfix">
			<div class="clearfix"></div>

			<div class="content col-lg-2 col-md-2 col-sm-2 clearfix"></div>
			<div class="content col-lg-8 col-md-8 col-sm-8">

				<div style="text-align: center;">
					<h2>회원 정보 수정</h2>
				</div>
				<div></div>
				<form action="" method="post" id="modifyForm">
				<input type="hidden" name="uNo" id="uNo" value="${detail.uNo }">
					<table class="config_table" style="width:100%;">
						<colgroup>
							<col width=250 />
							<col width=* />
						</colgroup>
						<tr>
							<td class="space">&nbsp;</td>
						</tr>
						<tr>
							<th>
								<!--이름-->이름
							</th>
							<td><input type="text" name="uName" class="t_input" id="uName"
								value="${detail.uName }" /></td>
						</tr>
						<tr>
							<td class="space">&nbsp;</td>
						</tr>
						<tr>
							<th>
								<!--이름-->아이디
							</th>
							<td><input type="text" name="uuId" id="uuId" class="t_input" value="${detail.uuId }"
								disabled /></td>
						</tr>
						<tr>
							<td class="space">&nbsp;</td>
						</tr>
						<tr>
							<th>
								<!--비밀번호-->비밀번호
							</th>
							<td><a href="#" data-toggle="modal"
						data-target="#pwdCheck" class="pw_reset"> <!--재설정-->비밀번호 재설정
							</a></td>
						</tr>
						<tr>
							<td class="space">&nbsp;</td>
						</tr>
						<tr>
							<th>
								<!--이메일 주소-->이메일 주소
							</th>
							<td><input type="text" name="uEmail" class="t_input"
								value="${detail.uEmail }"/></td>
						</tr>
						<tr>
							<td class="space">&nbsp;</td>
						</tr>
						<tr>
							<th>
								<!--성별-->성별
							</th>
							<td><input type="radio" value="M" name="uGender" id="ugender_m">&nbsp;남성
								&nbsp;&nbsp; <input type="radio" value="F" name="uGender" id="ugender_f">&nbsp;여성
								&nbsp;&nbsp;</td>
						</tr>
						<tr>
							<td class="space">&nbsp;</td>
						</tr>
						<tr>
							<th>
								<!--이메일 주소-->생년월일
							</th>
							<td><input type="text" name="uBirth" class="t_input"
								value="${detail.uBirth }"/></td>
						</tr>
						<tr>
							<td class="space">&nbsp;</td>
						</tr>
						<tr>
							<th>
								<!--이름-->전화번호
							</th>
							<td><input type="text" name="uPhone" class="t_input" id="uPhone"
								value="${detail.uPhone }" /></td>
						</tr>
						<tr>
							<td class="space">&nbsp;</td>
						</tr>
						<tr>
							<th>
								<!--이름-->이미지
							</th>
							<td>
								<img alt="" src="">
								<input type="file" name="uImg" id="uImg" value="teamC" />
							</td>
						</tr>
						<tr>
							<td class="space">&nbsp;</td>
						</tr>
						<tr>
							<th>
								<!--이름-->가입일
							</th>
							<td><input type="text" name="uDate" class="t_input" id="uDate"
								value="${detail.uDate }" disabled /></td>
						</tr>
						<tr>
							<td class="space">&nbsp;</td>
						</tr>
						<tr>
							<td class="space">&nbsp;</td>
						</tr>
						<tr>
						<td>
							<a href="user_delete?uno=${detail.uNo }">회원탈퇴</a>
						</td>							
						<td style="float: right;">
							<button type="submit" style="font-size: medium;" id="update">변경사항 저장</button>
						</td>
						</tr>
					</table>
				</form>
			</div>
			<div class="content col-lg-2 col-md-2 col-sm-2 clearfix"></div>

			<!-- 기본 모달 -->
					<div class="modal fade" id="pwdCheck" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content" style="width: 480px;">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">
										<span aria-hidden="true">×</span><span class="sr-only">Close</span>
									</button>
									<h3 class="modal-title" id="myModalLabel"
										style="text-align: center;">비밀번호 재설정</h3>
								</div>
								<div class="modal-body">
									<div class="modal-div">
										<form action="pwdUpdate" method="post" name="pwdUpdateForm" id="pwdUpdate">
										<input type="hidden" name="uNo" id="uNo" value="${detail.uNo }">
											<table style="margin-left: 80px;">
												<tr>
													<td>현재 비밀번호&nbsp;&nbsp; </td>
													<td><input type="password" name="old_pwd" id="old_pwd"></td>
												</tr>
												<tr>
													<td colspan="2"></td>
												</tr>
												<tr>
													<td>신규 비밀번호&nbsp;&nbsp; </td>
													<td><input type="password" name="new_pwd" id="new_pwd"></td>
												</tr>
												<tr>
													<td colspan="2"></td>
												</tr>
												<tr>
													<td>신규 비밀번호 확인&nbsp;&nbsp; </td>
													<td><input type="password" name="uPwd" id="pwd_vali"></td>
												</tr>
												<tr>
													<td colspan="2"></td>
												</tr>
											</table>
										</form>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" id="button2" class="btn btn-default"
										data-dismiss="modal">Close</button>
									<button type="button" id="pwdCheckBtn" style="color: #696E7;"
										class="btn btn-primary">Save</button>
								</div>



							</div>
						</div>
					</div>

		</div>
		<!-- end content -->
	</div>
	<!-- end container -->
</section>
<!-- end section -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script>
$(function(){
	
	//회원정보 성별 radioButton 초기값 설정.
	var ugender='${detail.uGender}';
	if(ugender=='M'){
		$('#ugender_m').attr("checked", true);
	}else{
		$('#ugender_f').attr("checked", true);
	}
	
	//회원정보 수정
	$('#modifyForm').attr('action','infoUpdate');
	$('#update').click(function(){
		console.log('sss');
		$('#modifyForm').attr('action','infoUpdate');
		$('#modifyForm').submit();
	});
	
	//비밀번호 체크 및 변경
	$('#pwdCheckBtn').click(function(){
		var old_pwd = $('#old_pwd').val();
		var new_pwd = $('#new_pwd').val();
		var pwd_vali = $('#pwd_vali').val();
		
		console.log(old_pwd);
		console.log(new_pwd);
		console.log(pwd_vali);
		console.log(${detail.uPwd});
		if(old_pwd == ''){
			alert('비밀번호는 필수정보입니다.');
		}else if(old_pwd!=${detail.uPwd}){
			alert('현재 비밀번호가 일치하지 않습니다.');
		}else if(new_pwd == ''){
			alert('신규 비밀번호를 입력해 주세요.');
		}else if(pwd_vali == ''){
			alert('신규 비밀번호 확인을 입력해 주세요.');
		}else if(new_pwd != pwd_vali){
			alert('신규비밀번호와 비밀번호 확인 문자가 일치하지 않습니다.');
		}else{
			$('#pwdUpdate').submit();
		}
	});
	
	
});
</script>
<%@include file="../main/footer.jsp"%>



