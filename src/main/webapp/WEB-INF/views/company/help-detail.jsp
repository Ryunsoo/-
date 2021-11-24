<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head/company-head.jsp" %>
<link rel="stylesheet" href="${contextPath}/resources/css/company/help-detail.css">
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
				<div class='menu_title'>해협 조회</div>
				<div class='content_wrapper'>
					<div class='content_left'>
						<c:choose>
							<c:when test="${format eq 'pdf'}">
								<iframe class="help_img" src='/file/${detail.savePath}/${detail.reName}'></iframe>
							</c:when>
							<c:otherwise>
								<div class='help_img' style="background-image:url('/file/${detail.savePath}/${detail.reName}')"></div>
							</c:otherwise>
						</c:choose>
						<div class='inp_title'>* 요청사항</div>
						<textarea rows="10" cols="50" readonly>${detail.reqContent}</textarea>
					</div>
					<div class='content_right'>
						<div class='inp_title'>* 성 함</div>
						<input type="text" value='${detail.reqName}' readonly>
						<div class='inp_title'>* 연락처</div>
						<input type="tel" value='${detail.reqTell}' readonly>
						<div class='inp_title'>* 주 소</div>
						<input type="text" value='${detail.reqAddress}' readonly>
						<div class='inp_title'>* 원하는 시간</div>
						<input type="datetime-local" value='${detail.reqTime}' readonly>
						<div class='inp_title'>* 희망금액</div>
						<input type="text" value='${detail.price} 원' readonly>
					</div>
				</div>
				<div class='join_btn'><button onclick="location.href='/company/help-join?reqIdx=${detail.reqIdx}'">해협 참가하기</button></div>
			</div>
		</div>
	</div>
	
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
</body>
</html>