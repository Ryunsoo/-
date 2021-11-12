<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head/company-head.jsp" %>
<link rel="stylesheet" href="${contextPath}/resources/css/company/help-detail.css">
<link rel='stylesheet' href="../../../resources/css/chat/chat.css">
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
						<div class='help_img'></div>
						<div class='inp_title'>* 요청사항</div>
						<textarea rows="10" cols="50" readonly>
물이 안빠져요. 고쳐주세요ㅠ
날짜, 시간 조정 가능합니다!! 연락주세요!
						</textarea>
					</div>
					<div class='content_right'>
						<div class='inp_title'>* 성 함</div>
						<input type="text" value='권구현' readonly>
						<div class='inp_title'>* 연락처</div>
						<input type="tel" value='010-0000-0000' readonly>
						<div class='inp_title'>* 주 소</div>
						<input type="text" value='서울시 강남구 역삼동' readonly>
						<div class='inp_title'>* 원하는 시간</div>
						<input type="datetime-local" value='2021-11-02T10:30' readonly>
						<div class='inp_title'>* 희망금액</div>
						<input type="text" value='50,000' readonly>
					</div>
				</div>
				<div class='join_btn'><button>해협 참가하기</button></div>
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
	<script type="text/javascript" src="../../../resources/js/chat/chat2.js"></script>
</body>
</html>