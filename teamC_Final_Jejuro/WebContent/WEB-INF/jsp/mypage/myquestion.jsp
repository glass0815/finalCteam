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
<link href="resources/css/question.css" rel="stylesheet">

<section class="section1">
<br><br>
	<div class="container clearfix">
		<div class="content col-lg-12 col-md-12 col-sm-12 clearfix">

			<div class="clearfix"></div>

			<!-- start include -->
			<%@include file="mypage_menu.jsp"%>
			<!--end of include -->
			
			<div class="content col-lg-12 col-md-12 col-sm-12 clearfix">
				<h3 class="title">���� ���� ����(1)</h3>
					<div class="box bbpress-forums">
						<div class="question-list">
							<!-- �Խ��� ���� ���� -->
					        <div id="bbpress-forums">
					          <ul class="bbp-forums">
								<li class="bbp-body question-click">
					              <ul class="forum type-forum status-publish hentry loop-item-0 odd bbp-forum-status-open bbp-forum-visibility-publish">
					                <li class="bbp-forum-info">
					                  <a class="bbp-forum-title reply_btn cursor" title="General">�ڽ����� ���ǵ帳�ϴ�.</a>
					                  <div class="bbp-forum-content">�ڽ��� ���ο���. �������ּ���.</div>
					                </li>
					                <li class="bbp-forum-freshness">
					                  <a title="�ۼ���">�ۼ��� : 2020.01.22</a>
					                </li>
					                <li class="bbp-forum-freshness">
					                	<a title="�亯�����">�亯 ����� : 2020.01.23</a>
					                </li>
					                <li class="bbp-forum-title cursor"> <a class="edit_btn" onclick="questionDel()">����</a> </li>
					              </ul>
					              <!-- end bbp forums -->
					            </li>
					            
					            <li class="bbp-body hide">
					              <ul class="forum type-forum status-publish hentry loop-item-0 odd bbp-forum-status-open bbp-forum-visibility-publish"
					              			style="background-color: #d8d8d8; color:black;">
					                <li class="bbp-forum-info">
					                  <div class="bbp-forum-content">Ȯ���߽��ϴ�. ���� �����մϴ�.</div>
					                </li>
					              </ul>
					              <!-- end bbp forums -->
					            </li>
					            
					           </ul>
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

<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
<script>
$(function(){
	//�޴� Ȱ��ȭ.
	$('.mypageMenu').eq(5).attr('class','col-lg-2 col-md-2 col-sm-2 mypageMenu active');
});

function questionDel(){
	if(confirm('�����Ͻðڽ��ϱ�? \n���ǳ��� ������ ������ �� �����ϴ�.')){
		console.log('���ǳ��� ����')
	}
}

</script>
<!-- ���ǻ��� ���ڵ�� -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script>

	$(function(){  
        var article = (".question-list .show");  
        $(".reply_btn").click(function() {  
            var myArticle =$(this).parents().parents().next("li");  
            if($(myArticle).hasClass('hide')) {  
                $(article).removeClass('show').addClass('hide');  
                $(myArticle).removeClass('hide').addClass('show');
                
            }  
            else {  
                $(myArticle).addClass('hide').removeClass('show');  
            }  
        });  
    });  

</script>
<%@include file="../main/footer.jsp"%>