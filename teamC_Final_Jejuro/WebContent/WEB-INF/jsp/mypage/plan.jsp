<%@include file="../main/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<style type="text/css">
<!--
�������� style -->#myinfo {
	font-size: 15px;
	font-weight: bond;
	color: black;
}

#plan2 {
	margin-left: 20px;
	margin-bottom: 5px;
	width: 40px;
	height: 40px;
}

<!--
icon ũ�� -->#plan {
	width: 35px;
	height: 35px;
}

<!--
ul�� . �Ⱥ��̱� -->ul {
	list-style: none;
}

<!--
����ǥ style -->.tg {
	border-collapse: collapse;
	border-spacing: 0;
}

.tg td {
	font-family: Arial, sans-serif;
	font-size: 14px;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #eee;
}

.tg th {
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #eee;
}

.tg .tg-jiqj {
	font-weight: bold;
	font-size: 16px;
	background-color: black;
	color: white;
	border-color: #eee;
	text-align: center;
	vertical-align: top
}

.tg .tg-ruqc {
	font-weight: bold;
	font-size: 18px;
	background-color: black;
	color: white;
	border-color: #eee;
	text-align: center;
	vertical-align: top
}

.tg .tg-6888 {
	font-size: 18px;
	background-color: #FFF5EE;
	color: #000000;
	border-color: #eee;
	text-align: center;
	vertical-align: top
}

.tg .tg-ii8n {
	font-size: 16px;
	background-color: #FFF5EE;
	border-color: #eee;
	text-align: center;
	vertical-align: top
}

.backlayer{ 
	border-radius: 5px; 
	margin-top: 10px; 

	border-color: #949698;
	background-color: #ffe7ca;
	overflow-y: auto;
}

.modallayer{
	border-radius: 5px;
}

.imgsize1{
	width: 80%;
}


.atag{
	color: #696E74;
	font-size: medium;
}

.input_text{
	padding: 4px 10px;
    border-radius: 3px;
    border: solid 1px #949698;
}

.tab { 
	white-space: pre; 
}

.input_select{
	padding: 4px 10px;
    border-radius: 3px;
    border: solid 1px #949698;
}

.data_list{
	 padding-left: 1em; 
	 padding-right: 1em;
}

.overflow{
	overflow: hidden;
}
</style>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
<!-- w3.css modal -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- drag and drop �Լ� -->
<script>
	function drag(event) { //dragstart
		event.dataTransfer.setData("text", event.target.id);
		event.dataTransfer.effectAllowed = "copy";
		scroll: true, clone = event.target.cloneNode(true);
		cloneId = event.target.getAttribute("text");
		clone.className += ' ' + 'text';
		console.log(event.dataTransfer.effectAllowed)

	}

	function allowDrop(event) { // dragover
		event.dataTransfer.dropEffect = "copy";
		console.log(event.dataTransfer.dropEffect)
		event.preventDefault();
	}

	function drop(event) { //drop
		var i = 0;
		event.dataTransfer.dropEffect = "copy";
		event.preventDefault();
		//���õ� ��� ����(�ڽĿ�ұ���)�ؼ� drop ������ drop���ٰž� 
		var data = event.dataTransfer.getData("text");
		var clone = document.getElementById(data).cloneNode(true);

		//�Ű��� �ִ� �� �ű�� ���� draggable="false"
		//�״�� xǥ ������ �ǳ� ��..
		clone.setAttribute("draggable", "false");
		clone.setAttribute("id", "drag" + i);
		i++;
		event.target.closest(".tg-ii8n").append(clone);
		console.log(event.dataTransfer.dropEffect)
	}
	//�������� ������ ��ҿ� �̺�Ʈ �����ϱ�
	$(document).on("click", ".close", function() {

		if (confirm("�����Ͻðڽ��ϱ�?")) {
			//closest() : �����ͷ� ������ ���� ��� �� ���� ������ �ϳ� ��ȯ����
			console.log("this name : " + $(this).parents("a").value)
			console.log("this name : " + $(this).closest("a").value)
			console.log("this name : " + $(this).parents("a").value)
			console.log("this name : " + $(this).closest("a").value)
			console.log("this name : " + this.value)
			$(this).closest("a").fadeOut(100);
		} else {
			// ��� ��ư Ŭ�� �� ����
		}

	});
</script>

<div>
	<!-- ���� ū div ����-->
	<div class="modal-body"
		style="width: 1650px; height: 1500px; margin-left: 10%;">
		<!-- drag and drop ��ü div ����-->
		<div style="width: 710px; height: 1470px; float: left;">
			<!-- ��������, ���� div ���� -->
			<div style="width: 350px; float: left;">
				<!-- �������� ���� -->
				<h3>
					<img alt="" id="plan" style="width: 12%"
						src="resources/img/plan_icon/icons8-popular-man-50.png"><a>��������</a>
				</h3>
				<div class="backlayer"
					style="width: 300px; height: 270px;">
					<br>
					<div class="tab-content">
						<div class="tab-pane active" id="div1" ondrop="drop(event)"
							ondragover="allowDrop(event)">
							<ul style="list-style:none;">
								<li>
									<div>
										<img alt="" id="plan2"
											src="resources/img/plan_icon/icons8-title.png"><span
											id="myinfo">����&nbsp;&nbsp; </span><span>${plist.mTitle}</span>
									</div>
								</li>
								<li>
									<div>
										<img alt="" id="plan2"
											src="resources/img/plan_icon/icons8-planner-64.png"><span
											id="myinfo">������&nbsp;&nbsp; </span><span>${plist.startDate}</span>
									</div>
								</li>
								<li>
									<div>
										<img alt="" id="plan2"
											src="resources/img/plan_icon/icons8-planner-64.png"><span
											id="myinfo">������&nbsp;&nbsp; </span><span>${plist.endDate}</span>
									</div>
								</li>
								<li>
									<div>
										<img alt="" id="plan2"
											src="resources/img/plan_icon/icons8-people-50.png"><span
											id="myinfo">�ο���&nbsp;&nbsp; </span>${plist.mPeople}��
									</div>
								</li>
								<li>
									<div>
										<img alt="" id="plan2"
											src="resources/img/plan_icon/icons8-multicultural-people-50.png"><span
											id="myinfo">����&nbsp;&nbsp; </span><span>${plist.mWith}</span>
									</div>
								</li>
								<%-- <li>
									<div>
										<img alt="" id="plan2"
											src="resources/img/plan_icon/icons8-title-50.png"><span
											id="myinfo">�����׸�&nbsp;&nbsp; </span><span>${plist.mTheme}</span>
									</div>
								</li> --%>
							</ul>
						</div>
					</div>
				</div>
				<!-- �������� ��-->
				<!-- ���������Ѽ��� ���� -->
				<h3>
					<img alt="" id="plan" style="width: 12%"
						src="resources/img/plan_icon/icons8-reception-50.png"><a>���������Ѽ���</a>
				</h3>
				<div class="backlayer"
					style="width: 300px; height: 230px;">

					<div class="tabbable">
						<div class="tab-content data_list">
							<div class="tab-pane active" id="recent">
								<ul class="recent_posts">
									<br>
									<c:forEach var="e" items="${rlist}">
									<li><a href="#" draggable="true" ondragstart="drag(event)"
										id="drag1">${e.hName}<span class="close">&times;</span></a><img
											src="resources/img/recent_post_01.png" alt="" id="plan" />
									<p>${e.hAddr1}${e.rName }</p>
									<a class="readmore">�����ο��� : ${e.rPeople }</a></li>
									<hr>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- ���������Ѽ��� �� -->
				<!-- �������Ѽ��� ���� -->
				<h3>
					<img alt="" id="plan" style="width: 12%"
						src="resources/img/plan_icon/icons8-house-80.png"><a>�������Ѽ���</a>
				</h3>
				<div class="backlayer"
					style="width: 300px; height: 300px;">

					<div class="tabbable">
						<br>
						<div class="tab-content data_list">
							<div class="tab-pane active" id="recent2">
								<ul class="recent_posts">
								<c:forEach var="e" items="${hplist }">
									<li><a href="#" draggable="true" ondragstart="drag(event)"
										id="drag30"> ${e.hName }<span class="close">&times;</span></a>
										<img src="resources/img/house/${e.hTopImg}" alt="" id="plan" style="height: 60px"/>
										<p class="readmore">${e.hType }</p></li>
									<hr>
								</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- �������Ѽ��� �� -->
				
				<!-- ���� ����� �� -->
			</div>

			<!-- ��������, ���� div ��-->

			<!-- �˻�, ������ div ���� -->
			<div style="width: 350px; float: left; margin-top: 9%;">
				<!-- ���� ����� ���� -->
				<button class="backlayer w3-button imgsize1" onclick="document.getElementById('account').style.display='block'" 
					style="width: 150px; height: 150px; background-color: #e0e0e0; margin-bottom: auto;">
					<div class="tabbable">
						<div class="w3-container"> 
							<img alt="" id="plan" src="resources/img/plan_icon/icons8-money-80.png" style="width: 60px;">
								<h3>�����</h3>
						</div>
					</div>
				</button>
				<!-- ���� ���� -->
				<button class="backlayer w3-button imgsize1" onclick="document.getElementById('transport').style.display='block'"			
					style="width: 150px; height: 150px; background-color: #e0e0e0; margin-bottom: auto;"">
					<div class="tabbable">
						<div class="w3-container"> 
							<img alt="" id="plan"
									src="resources/img/plan_icon/icons8-transportation-50.png">
							<h3>����</h3> 
						</div>
					</div>
				</button>
				<!-- �˻� ���� -->
				<button class="backlayer w3-button imgsize1" onclick="document.getElementById('integrated_search').style.display='block'"			
					style="width: 300px; height: 110px; margin-top: 5px; background-color: #e0e0e0;">
					<div class="tabbable">
						<div class="w3-container">  
							<h3 style="margin:5px 0;">
								<img alt="" id="plan"
									src="resources/img/plan_icon/icons8-search-64.png">
								���հ˻�
							</h3> 
						</div>
					</div>
				</button>
				
				<!-- ���� ��� ���� -->
				<div id="transport" class="w3-modal" style="padding-top:10%;">
				<form action="add_money" method="post">
					<div class="w3-modal-content modallayer"
						style="width: 20%; height: 35%;">
						<header class="w3-container">
							<span
								onclick="document.getElementById('transport').style.display='none'"
								class="w3-button w3-display-topright">&times;</span>
							<h2>����</h2>
						</header>
						<div class="w3-container">
							<input type="hidden" name="mNo" value="">
							<table>
								<tr>
									<td colspan="3"><h5>�����</h5><input class="input_text" type="text" id="" name="startSpot"></td>
								
									<td colspan="3"><h5>������</h5><input class="input_text" type="text" id="" name="endSpot"></td>
								</tr>
								<tr>
									<td colspan="7"><h5>�������</h5>
										<input type="radio" id="car" name="car" value="�ڵ���"><a class="atag">�ڵ���</a><span class="tab">&#9;</span>
									
										<input type="radio" id="bus" name="bus" value="����"><a class="atag">����</a><span class="tab">&#9;&#9;</span>
									
										<input type="radio" id="subway" name="subway" value="����ö"><a class="atag">����ö</a><span class="tab">&#9;&#9;</span>
									
										<input type="radio" id="train" name="train" value="����"><a class="atag">����</a><span class="tab">&#9;&#9;</span>
									</td>
								</tr>
								<tr>
									<td colspan="4">
										<input type="radio" id="boat" name="boat" value="��"><a class="atag">��</a><span class="tab">&#9;&#9;</span>
									
										<input type="radio" id="airplane" name="airplane" value="�����"><a class="atag">�����</a><span class="tab">&#9;</span>
								
										<input type="radio" id="walk" name="walk" value="����"><a class="atag">����</a><span class="tab">&#9;</span>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<h5>��� ��¥</h5>
										<select id="number" name="number" class="small input_select"
												aria-required="true" aria-invalid="false">
												<option value="1">1����</option>
												<option value="2">2����</option>
												<option value="3">3����</option>
												<option value="4">4����</option>
												<option value="5">5����</option>
												<option value="6">6����</option>
												<option value="7">7����</option>
												<option value="8">8����</option>
												<option value="9">9����</option>
												<option value="10">10����</option>
										</select>
									</td>
									<td colspan="4"><h5>��� �ð�</h5><input class="input_text" type="text" id="" name="tsTime"></td>
								</tr>
								<tr>
									<td colspan="6"><h5>�޸�</h5><textarea class="input_text" name="tsContent" rows="3" cols="45"></textarea>
								</tr>
								
							</table>
						</div>
						<footer class="w3-container">
							<input type="submit" value="���" class="btn btn-primary"
								style="float: right; background-color: black; margin-bottom: 1em;" />
						</footer>
						
					</div>
					</form>
				</div>
				<!-- ���� ��� �� -->
				
				<!-- ���డ��� ��� ���� -->
				<div id="account" class="w3-modal" style="padding-top:10%;">
				<form action="add_money" method="post">
					<div class="w3-modal-content modallayer"
						style="width: 18%; height: 60%;">
						<header class="w3-container">
							<span
								onclick="document.getElementById('account').style.display='none'"
								class="w3-button w3-display-topright">&times;</span>
							<h2>�����</h2>
						</header>
						<div class="w3-container">
							<table>
								<tr>
									<td><img alt="" id="plan2"
										src="resources/img/plan_icon/icons8-airplane-take-off-50.png"><b>�װ���</b><span class="tab">&#9;</span></td>
									<td><input type="text" class="input_text" id="" name="airplane"></td>
								</tr>
								<tr>
									<td><img alt="" id="plan2"
										src="resources/img/plan_icon/icons8-transportation-50.png"><b>����</b><span class="tab">&#9;</span></td>
									<td><input type="text" class="input_text" id="" name="transportaion"></td>
								</tr>
								<tr>
									<td><img alt="" id="plan2"
										src="resources/img/plan_icon/icons8-hotel-50.png"><b>���ҿ���</b><span class="tab">&#9;</span></td>
									<td><input type="text" class="input_text" id="" name="reser"></td>
								</tr>
								<tr>
									<td><img alt="" id="plan2"
										src="resources/img/plan_icon/icons8-street-food-50.png"><b>����</b><span class="tab">&#9;</span></td>
									<td><input type="text" class="input_text" id="" name="food"></td>
								</tr>
								<tr>
									<td><img alt="" id="plan2"
										src="resources/img/plan_icon/icons8-ticket-64.png"><b>�����</b><span class="tab">&#9;</span></td>
									<td><input type="text" class="input_text" id="" name="tiket"></td>
								</tr>
								<tr>
									<td><img alt="" id="plan2"
										src="resources/img/plan_icon/icons8-inscription-50.png"><b>��Ÿ</b><span class="tab">&#9;</span></td>
									<td><input type="text" class="input_text" id="" name="etc"></td>
								</tr>
							</table>
						</div>
						<footer class="w3-container" style="padding-bottom: 1em;">
							<input type="submit" value="���" class="btn btn-primary"
								style="float: right; background-color: black; margin-top: 2px;"  />
						</footer>
						
					</div>
					</form>
				</div>
				<!-- ���డ��� ��� �� -->
				
				<!-- ���հ˻� ��� ���� -->
				<div id="integrated_search" class="w3-modal" style="padding-top:10%;">
				<form action="add_money" method="post">
					<div class="w3-modal-content modallayer"
						style="width: 18%; height: 60%;">
						<header class="w3-container">
							<span
								onclick="document.getElementById('integrated_search').style.display='none'"
								class="w3-button w3-display-topright">&times;</span>
							<h2>���� �˻�</h2>
						</header>
						<div class="w3-container">
							<div class="plan_info_box nleft">
								<div class="info_select">
									<b>�˻�</b><input type="text" class="input_text" placeholder="�˻�� �Է��ϼ���."
										style="width: 80%; margin-left: 20px;" id="total_budget_amount">
								</div>
								<br>
							</div>
							<div class="tab-content data_list">
							<div class="tab-pane active" id="div1" ondrop="drop(event)"
								ondragover="allowDrop(event)">
								<ul class="recent_posts">
									<li>
										<a href="#" id="drag5"> �����̸�</a>
										<img src="resources/img/recent_post_01.png" alt="" id="plan" />
										<input type="submit" value="���ϱ�" class="btn btn-primary"
											style="float: right; background-color: black; margin-top: 2em;" />
									</li>
									<hr>
									<li>
										<a href="#" id="drag6"> �������̸�</a>
										<img src="resources/img/recent_post_02.png" alt="" id="plan" />
										<input type="submit" value="���ϱ�" class="btn btn-warning"
											style="float: right; background-color: black; margin-top: 2em;" />
									</li>
									<hr>
								</ul>
							</div>
						</div>
						</div>
						<footer class="w3-container" style="padding-bottom: 1em;">
							<input type="submit" value="���" class="btn btn-primary"
								style="float: right; background-color: black; margin-top: 2px;"  />
						</footer>
						
					</div>
					</form>
				</div>
				<!-- ���հ˻� ��� �� -->
				
				<!-- �������Ѱ����� ���� -->
				<h3>
					<img alt="" id="plan" style="width: 42px;"
						src="resources/img/plan_icon/icons8-camper-80.png"><a>�������Ѱ�����</a>
				</h3>
				<div class="backlayer"
					style="width: 300px; height: 500px; overflow-y: scroll;">

					<div class="tabbable">
						<br>
						<div class="tab-content data_list">
							<div class="tab-pane active" id="recent2">
								<ul class="recent_posts">
									<c:forEach var="e" items="${ tplist}">
									<li><a href="#" draggable="true" ondragstart="drag(event)"
										id="drag7"> ${ e.tName}<span class="close">&times;</span></a><img
										src="resources/img/tourspot/${e.tTopImg }" alt="" id="plan" style="height: 60px"/>
										<p class="readmore">${e.tType }</p></li>
									<hr>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- �������Ѱ����� ��-->
			</div>
			<!-- �˻�, ������ div ��-->
		</div>
		<!-- drag and drop ��ü div ��-->

		<!-- ����, ����ǥ div ���� -->
		<div style="width: 780px; height: 1480px; float: left;">
			<!-- ����API -->
			<h3>
				<img alt="" id="plan" style="width: 42px;"
					src="resources/img/plan_icon/icons8-map-marker-64.png"><a>����</a>
			</h3>
			<div id="map"
				style="width: 700px; height: 325px; background-color: skyblue; margin-top: 10px;">
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8b2b3fa7a88682f73a72b57b119c70c3"></script>
				<script>
					var mapContainer = document.getElementById('map'), // ������ ǥ���� div  
					mapOption = {
						center : new kakao.maps.LatLng(33.380965, 126.536057), // ������ �߽���ǥ
						level : 10
					// ������ Ȯ�� ����
					};

					var map = new kakao.maps.Map(mapContainer, mapOption); // ������ �����մϴ�

					// ��Ŀ�� ǥ���� ��ġ�� title ��ü �迭�Դϴ� 
					var positions = [ {
						title : '�쵵',
						latlng : new kakao.maps.LatLng(33.501140, 126.951368)
					}, {
						title : '���ֱ�������',
						latlng : new kakao.maps.LatLng(33.507080, 126.492860)
					}, {
						title : '�Թ�',
						latlng : new kakao.maps.LatLng(33.450879, 126.569940)
					}, {
						title : '�ٸ�����',
						latlng : new kakao.maps.LatLng(33.451393, 126.570738)
					} ];

					// ��Ŀ �̹����� �̹��� �ּ��Դϴ�
					var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

					for (var i = 0; i < positions.length; i++) {

						// ��Ŀ �̹����� �̹��� ũ�� �Դϴ�
						var imageSize = new kakao.maps.Size(24, 35);

						// ��Ŀ �̹����� �����մϴ�    
						var markerImage = new kakao.maps.MarkerImage(imageSrc,
								imageSize);

						// ��Ŀ�� �����մϴ�
						var marker = new kakao.maps.Marker({
							map : map, // ��Ŀ�� ǥ���� ����
							position : positions[i].latlng, // ��Ŀ�� ǥ���� ��ġ
							title : positions[i].title, // ��Ŀ�� Ÿ��Ʋ, ��Ŀ�� ���콺�� �ø��� Ÿ��Ʋ�� ǥ�õ˴ϴ�
							image : markerImage
						// ��Ŀ �̹��� 
						});
					}
				</script>

			</div>
			<!-- ����API -->
			<!-- ����ǥ ���� -->
			<h3>
				<img alt="" id="plan" style="width: 42px;" 
					src="resources/img/plan_icon/icons8-schedule-50.png"><a>����ǥ</a>
			</h3>
			<%-- <div style="width: 750px; height: 940px; margin-top: 10px;">
				<%
					int num1 = Integer.parseInt(request.getParameter("num"));
				%>
				<table class="tg" border="1" 
					style="table-layout: fixed; width: 750px; height: 910px; border: 1px solid; border-radius: 5px; ">
					<tr>
						<th class="tg-ruqc" style="width: 130px">�ð�</th>
						<%
							for (int i = 1; i < num1 + 1; i++) {
						%>
						<th class="tg-jiqj"><%=i%>����</th>
						<%
							}
						%>
					</tr>
					<!-- �� ����� -->
					<%
						for (int j = 5; j <= 23; j++) {
					%>
					<tr>
						<td class="tg-6888"><%=j%>:00</td>
						<%
							for (int i = 0; i < num1; i++) {
						%>
						<td class="tg-ii8n" id="div2" ondrop="drop(event)"
							ondragover="allowDrop(event)"></td>
						<%
							}
						%>
					</tr>
					<%
						}
					%>
				</table>
			</div>
			<!-- ����ǥ ���� --> --%>
			
			<div style="width: 700px; height: 940px; margin-top: 10px;">
				<table class='tg overflow' border="1" style='margin: auto; table-layout: fixed; width: 700px; height: 900px; border: 1px solid; '>
					<thead>
						<tr>
							<th class="tg-ruqc" style="width: 130px">�ð�</th>
							<c:forEach var="i" begin="1" end="${day + 1}" step="1">
								<th class="tg-jiqj">${i}����</th>
							</c:forEach>
					</thead>
					<tbody>
						<!-- �� ��� -->
						<c:forEach begin="5" end="23" step="1" var="i">
							<tr>
								<td class="tg-6888">${i}:00</td>
								<c:forEach begin="0" end="${day }" step="1">
									<td class='tg-ii8n' id="div2" ondrop="drop(event)"
										ondragover="allowDrop(event)"></td>
								</c:forEach>
							</tr>
						</c:forEach>
						
					</tbody>
				</table>
			
			</div>
			
		</div>
		<!-- ����, ����ǥ div �� -->
	</div>
	<!-- ���� ū div ��-->
	<div style="text-align: center;">
		<input class="button large" type="button" value="���" style="width: 10%;"> 
		<span class="tab">&#9;</span>
		<input class="button large" type="button" value="����" style="width: 10%;">
		<div style="margin-bottom: 2em;"></div>
	</div>
</div>

<!-- ��ư Ŭ���� �÷�����Ʈ�� �÷��� �߰��Ǵ� ��ũ��Ʈ -->
<!-- <script type="text/javascript">
    init.push(function () {
        
        $(".mCol-add").click(function() {
            var trlength = $('.idcMap > tbody > tr').length;
            for(var i=0; i<trlength; i++) {
                var t = $('.idcMap > tbody > tr').eq(i);
                t.append('<td class="bordered" style="width: 100px;"></td>')
            }
        });
        $(".mCol-del").click(function() {
            var trlength = $('.idcMap > tbody > tr').length;
            for(var i=0; i<trlength; i++) {
                var t = $('.idcMap > tbody > tr').eq(i);
                t.children().last().remove();
            }
        });
    })
</script> -->

<!-- end section -->
<%@include file="../main/footer.jsp"%>