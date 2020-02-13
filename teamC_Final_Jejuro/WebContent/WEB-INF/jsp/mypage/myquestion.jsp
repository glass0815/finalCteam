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
				<h3 class="title">나의 문의 내역(${fn:length(qList)})</h3>
					<div class="box bbpress-forums">
					<c:forEach var="e" items="${qList }">
						<div class="question-list">
							<!-- 게시판 영역 시작 -->
					        <div id="bbpress-forums">
					          <ul class="bbp-forums">
								<li class="bbp-body question-click">
					              <ul class="forum type-forum status-publish hentry loop-item-0 odd bbp-forum-status-open bbp-forum-visibility-publish">
					                <li class="bbp-forum-info">
					                  <a class="bbp-forum-title reply_btn cursor" title="General">${e.utitle }</a>
					                </li>
					                <li class="bbp-forum-freshness">
					                  <a title="작성일">작성일 : ${e.qdate}</a>
					                </li>
					                <li class="bbp-forum-freshness">
					                		<!-- 이메일 전송 버튼을 누를 때 js를 사용해서 글씨 변경!!!!!!!!!!!!! -->
					                	<a title="답변여부">답변 여부 : 완료</a>
					                	
					                </li>
					                <li class="bbp-forums cursor"> 
					                	<a id="deletemyquestion" class="edit_btn" href="deleteMyQuestion?qnum=${e.qnum }">삭제</a> 
					                </li>
					              </ul>
					              <!-- end bbp forums -->
					            </li>
					            
					            <li class="bbp-body hide">
					              <ul class="forum type-forum status-publish hentry loop-item-0 odd bbp-forum-status-open bbp-forum-visibility-publish"
					              			style="background-color: #d8d8d8; color:black;">
					                <li class="bbp-forum-info">
					                  <div class="bbp-forum-content">&nbsp;&nbsp;&nbsp;&nbsp;${e.qcontent }</div>
					                </li>
					              </ul>
					              <!-- end bbp forums -->
					            </li>
					            
					           </ul>
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
	$('.mypageMenu').eq(5).attr('class','col-lg-2 col-md-2 col-sm-2 mypageMenu active');
});

$('#deletemyquestion').on('click',function(){
	if(confirm('삭제하시겠습니까? \n문의내역 삭제시 복구할 수 없습니다.')){
		console.log('문의내역 삭제')
	}
});
</script>
<!-- 문의사항 아코디언 -->
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