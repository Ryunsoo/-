<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head/company-head.jsp" %>
<link rel="stylesheet" href="${contextPath}/resources/css/company/help-join.css">
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
				<div class='menu_title'>해협 참가 신청</div>
				<div class='content_wrapper'>
					<div class='content_left'>
						<div class='file_img'>
							<div class='file'></div>
							<div class='deco'></div>
						</div>
						<div class='upload'>
							<label class='upload_icon' for="input-file"><img src='../../../resources/image/upload-folder.png'><!-- <i class="fas fa-folder-plus"></i> --></label>
							<label class='upload_label' for="input-file">견적서 업로드</label>
						</div>
							<input type="file" id='input-file' accept="image/*,.pdf" onchange='setPreview(event);' style="visibility: hidden;">
					</div>
					<div class='content_right'>
						<div class='inp_title'>* 성 함</div>
						<input type="text" value='권구현'>
						<div class='inp_title'>* 연락처</div>
						<input type="tel" value='010-0000-0000'>
						<div class='inp_title'>* 원하는 시간</div>
						<input type="datetime-local" value='2021-11-02T10:30'>
						<div class='inp_title'>* 희망금액</div>
						<input type="text" value='50,000'>
					</div>
				</div>
				<div class='content_bottom'>
				<div class='inp_title'>* 요청사항</div>
				<textarea rows="10" cols="50">
전달드린 견적 확인하시고 궁금한 점 있으면 연락주세요!
신속, 정확하게! 해결해드리겠습니다.
날짜 / 시간은 조율 가능합니다~</textarea>
				<button>견적서 제출</button>
				</div>
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
<script type="text/javascript" src="${contextPath}/resources/js/common/file-upload-viewer.js"></script>
</html>