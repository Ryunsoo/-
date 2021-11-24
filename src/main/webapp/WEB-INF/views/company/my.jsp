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
									<tr onclick="viewDetail()">
										<td>${requestList.field}</td>
										<td>${requestList.oldAddress}</td>
										<td>${requestList.reqTime}</td>
										<td>
										<c:choose>
											<c:when test="${requestList.status == 0}">
												요청 대기 중
											</c:when>										
											<c:when test="${requestList.status == 1}">
												<button class="list_btn_green" id="completeBtn" onclick="completeService(${requestList.reqIdx})">완료</button>
                           						<button class="list_btn_red" id="cancelBtn" onclick="cancelService(${requestList.reqIdx})">취소</button>
											</c:when>
											<c:when test="${requestList.status == 2}">
												완료 대기 중
											</c:when>
											<c:when test="${requestList.status == 3}">
												완료됨
											</c:when>
											<c:when test="${requestList.status == 4}">
												취소 대기 중
											</c:when>
											<c:otherwise>
												취소됨
											</c:otherwise>
										</c:choose>
										</td>
										<td>${requestList.reqName}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="page">
						<div class="pg_wrap" style="display: block; text-align: center;">		
							<c:if test="${paging.startPage != 1 }">
								<a class="pg_start" href="/company/my?nowPage=1&cntPerPage=${paging.cntPerPage}&state=${state}">&lt;&lt;</a>
								<a class="pg_prev" href="/company/my?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&state=${state}">&lt;</a>
							</c:if>
							<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
								<c:choose>
									<c:when test="${p == paging.nowPage }">
										<a class="pg_current">${p }</a>
									</c:when>
									<c:when test="${p != paging.nowPage }">
										<a class="pg_page" href="/company/my?nowPage=${p }&cntPerPage=${paging.cntPerPage}&state=${state}">${p }</a>
									</c:when>
								</c:choose>
							</c:forEach>
							<c:if test="${paging.endPage != paging.lastPage}">
								<a class="pg_next" href="/company/my?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&state=${state}">&gt;</a>
								<a class="pg_end" href="/company/my?nowPage=${paging.lastPage}&cntPerPage=${paging.cntPerPage}&state=${state}">&gt;&gt;</a>
							</c:if>
						</div>
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