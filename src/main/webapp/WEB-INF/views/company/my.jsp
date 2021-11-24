<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head/company-head.jsp" %>
<link rel="stylesheet" href="${contextPath}/resources/css/company/all-help.css">
<link rel='stylesheet' href="../../../resources/css/include/chat/chat.css">
</head>
<body>
<%@ include file="/WEB-INF/views/include/chat/chat2.jsp" %>
	<div class='main'>
	
		<!-- 사이트 메뉴(조회해협 & MY 해협) -->
		<!-- <aside> -->
		<div class='aside'>
			<button class="help_list">조회 해협</button>
			<button class="my_help">MY 해협</button>
		</div>
		<!-- </aside> -->
		<div class='section'>
			<div class='wrapper'>
				<div class='select_wrapper'>
					<div class='sub_menu'>
						<!-- 현재 선택된 메뉴에 selected class를 추가해주면 자동으로 css 바뀝니다!! -->
						
						<c:if test="${empty param.state || param.state eq 0}">
							<div><button id="await" class="selected" onclick="moveTab(0)">대기내역</button></div>
							<div><button id="going" onclick="moveTab(1)">진행내역</button></div>
							<div><button id="cancel" onclick="moveTab(3)">취소내역</button></div>
							<div><button id="complete" onclick="moveTab(2)">완료내역</button></div>
						</c:if>
						<c:if test="${param.state eq 1}">
							<div><button id="await" onclick="moveTab(0)">대기내역</button></div>
							<div><button id="going" class="selected" onclick="moveTab(1)">진행내역</button></div>
							<div><button id="cancel" onclick="moveTab(3)">취소내역</button></div>
							<div><button id="complete" onclick="moveTab(2)">완료내역</button></div>
						</c:if>
						<c:if test="${param.state eq 2}">
							<div><button id="await" onclick="moveTab(0)">대기내역</button></div>
							<div><button id="going" onclick="moveTab(1)">진행내역</button></div>
							<div><button id="cancel" onclick="moveTab(3)">취소내역</button></div>
							<div><button id="complete" class="selected" onclick="moveTab(2)">완료내역</button></div>
						</c:if>
						<c:if test="${param.state eq 3}">
							<div><button id="await" onclick="moveTab(0)">대기내역</button></div>
							<div><button id="going" onclick="moveTab(1)">진행내역</button></div>
							<div><button id="cancel" class="selected" onclick="moveTab(3)">취소내역</button></div>
							<div><button id="complete" onclick="moveTab(2)">완료내역</button></div>
						</c:if>
						
					</div>
				</div>
				
				<div class='wrap_list'>
					<div class='list'>
						<table>
							<thead>
								<tr>
									<th>신청 분야</th>
									<th>지역</th>
									<th>방문날짜</th>
									<th>처리구분</th>
									<th>신청자명</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="requestList" items="${requestList}">
									<tr>
										<td>${requestList.field}</td>
										<td>${requestList.oldAddress}</td>
										<td>${requestList.reqTime}</td>
										<td>${status}</td>
										<td>${requestList.reqName}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class='page'>
						<i class="fas fa-caret-left"></i>
						<div><span>1</span><span>2</span><span>3</span><span>4</span><span>5</span></div>
						<i class="fas fa-caret-right"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class='back'></div>
	<!-- 자취해협 정보 footer -->
	<!-- <footer> -->
	<div class='footer'>
		<div class='footer_logo'><img src="../../../resources/image/logo-icon.png" class='logo-icon'></div>
		
		<div class='footer_text'>
			<div class='footer_title'><pre>project  자취해협  |  team  help!</pre></div>
			
			<div class='footer_content'>
			<pre>Gwon Gu Hyun   |   kwon41147406@gmail.com
Kim Hyun Soo   |   oooklyt@naver.com
Hwang Ryun Soo   |   babyfox225@gmail.com
Lee Kyung Min   |   alssgo70051@naver.com</pre>
			<pre>Lee Joo Hyun   |   carinae4717@gmail.com
Lee Ho Jun   |   lhj132824@naver.com
Ko Hyuck Joon   |   akhj123akhj@naver.com
Choi Min Seok   |   dktlfem3333@gmail.com</pre>
			</div>
		</div>
	</div>
	<!-- </footer> -->
	<script type="text/javascript" src="../../../resources/js/include/chat/chat2.js"></script>
	<script type="text/javascript" src="../../../resources/js/company/my.js"></script>
</body>
</html>