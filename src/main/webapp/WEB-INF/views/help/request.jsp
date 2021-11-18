<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="../../../resources/css/include/head/menu_head.css" type="text/css" rel="stylesheet">
<link href="../../../resources/css/help/request.css" type="text/css" rel="stylesheet">
<link rel='stylesheet' href="../../../resources/css/include/chat/chat.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
</head>
<body>
<div class="wrap">
<%@ include file="/WEB-INF/views/include/head/menu-head.jsp" %>
		<div class="banner">
			<img src="../../../resources/image/${field}.PNG">
			<div class="banner_title">
				<p class="banner_name">${field}</p>
			</div>
		</div>

		<div class="title">해협 신청서</div>
		<form action="${contextPath}/help/uploadRequest" method="post" enctype="multipart/form-data">
		<div class="left_page">
			<div class='content_left'>
				<div class='file_img'>
					<div class='file'></div>
				</div>
				<div class='upload'>
					<label class='upload_icon' for="input-file"><img src='../../../resources/image/upload-folder.png'><!-- <i class="fas fa-folder-plus"></i> --></label>
					<label class='upload_label' for="input-file">견적서 업로드</label>
				</div>
					<input type="file" name="files" id='input-file' accept="image/*,.pdf" onchange='setPreview(event);' style="visibility: hidden;" multiple>
			</div>
			<div class="info">
				<img alt="info" src="../../../resources/image/heyeop_info.png">
			</div>
		</div>
		<div class="right_page">
			<div class="text-area">
				<div class="text-title">*성  함</div>
				<div class="text-input">
					<input type="text" name="reqName" placeholder="이름을 입력해주세요.">
				</div>
			</div>	
			<div class="text-area">
				<div class="text-title">*연락처</div>
				<div class="text-input">
					<input type="text" name="reqTell" placeholder="연락처를 입력해주세요.">
				</div>
			</div>	
			<div class="text-area">
				<div class="text-title">*주  소</div>
				<div class="text-input">
					<input type="text" name="reqAddress" placeholder="회원테이블에 등록된 주소 불러오기?">
				</div>
			</div>
			<div class="text-area">
				<div class="text-title">*방문시간</div>
				<div class="text-input">
					<input type="datetime-local" name="reqTime">
				</div>
			</div>
			<div class="text-area">
				<div class="text-title">*희망금액</div>
				<div class="text-input">
					<input type="text" name="reqPay" placeholder="희망금액을 입력해주세요.">
				</div>
			</div>
			<div class="text-area">
				<div class="text-title">*요청사항</div>
				<div class="text-input">
					<textarea style="resize: none;" name="reqContent" placeholder="요청사항을 입력해주세요."></textarea>
				</div>
			</div>
			<input type="hidden" name="field" value="${proFieldMap.proField.field}">
			<div class="submit">
				<button>신청서 제출</button>
			</div>
		</div>
		</form>
	</div>
	<%@ include file="/WEB-INF/views/include/chat/chat.jsp" %>
</body>
<script type="text/javascript" src="../../../resources/js/include/chat/chat.js"></script>
<script type="text/javascript" src="../../../resources/js/common/file-upload-viewer.js"></script>
</html>