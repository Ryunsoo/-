<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="../../../resources/css/include/head/menu_head.css" type="text/css" rel="stylesheet">
<link href="../../../resources/css/help/request.css" type="text/css" rel="stylesheet">
<link rel='stylesheet' href="../../../resources/css/chat/chat.css">
<meta charset="UTF-8">
</head>
<body>
<div class="wrap">
<%@ include file="/WEB-INF/views/include/head/menu-head.jsp" %>
		<div class="banner">
			<img src="../../../resources/image/수리보수-욕실.PNG">
			<div class="banner_title">
				<p class="banner_name">욕실</p>
			</div>
		</div>

		<div class="title">해협 신청서</div>

		<div class="left_page">
			<div class="req_img"><img src="../../../resources/image/신청서-세면대.PNG"></div>
			<div class="upload_img">
				<div class="upload_icon">
					<input type="image" src="../../../resources/image/upload-folder.png">
				</div>
				<div class="upload_input"><input type="text" placeholder="사진 업로드"></div>
			</div>
			<div class="info">
				<img alt="info" src="../../../resources/image/heyeop_info.png">
			</div>
		</div>

		<div class="right_page">
			<div class="text-area">
				<div class="text-title">*성  함</div>
				<div class="text-input">
					<input type="text" placeholder="이름을 입력해주세요.">
				</div>
			</div>	
			<div class="text-area">
				<div class="text-title">*연락처</div>
				<div class="text-input">
					<input type="text" placeholder="연락처를 입력해주세요.">
				</div>
			</div>	
			<div class="text-area">
				<div class="text-title">*주  소</div>
				<div class="text-input">
					<input type="text" placeholder="회원테이블에 등록된 주소 불러오기?">
				</div>
			</div>
			<div class="text-area">
				<div class="text-title">*방문시간</div>
				<div class="text-input">
					<input type="datetime-local" >
				</div>
			</div>
			<div class="text-area">
				<div class="text-title">*희망금액</div>
				<div class="text-input">
					<input type="text" placeholder="희망금액을 입력해주세요.">
				</div>
			</div>
			<div class="text-area">
				<div class="text-title">*요청사항</div>
				<div class="text-input">
					<textarea style="resize: none;" placeholder="요청사항을 입력해주세요."></textarea>
				</div>
			</div>
			
			<div class="submit">
				<button>신청서 제출</button>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/include/chat/chat.jsp" %>
</body>
<script type="text/javascript" src="../../../resources/js/chat/chat.js"></script>
</html>