<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="../../../resources/css/help/detail.css" type="text/css"	rel="stylesheet">
<meta charset="UTF-8">
</head>
<body>
	<div class="left_page">
		<div class="req_img">
			<img src="../../../resources/image/신청서-세면대.PNG">
		</div>
		<div class="reg_img2">
			<img src="../../../resources/image/신청서-세면대.PNG">
		</div>
		<div class="reg_img3">
			<img src="../../../resources/image/신청서-세면대.PNG">
		</div>
	</div>
	<div class="right_page">
		<div class="detail-text-area">
			<div class="detail-text-title">*성 함</div>
			<div class="detail-text-input">
				<input type="text" disabled="disabled" value="${helpRequest.reqName}">
			</div>
		</div>
		<div class="detail-text-area">
			<div class="detail-text-title">*연락처</div>
			<div class="detail-text-input">
				<input type="text" disabled="disabled" value="${helpRequest.reqTell}">
			</div>
		</div>
		<div class="detail-text-area">
			<div class="detail-text-title">*주 소</div>
			<div class="detail-text-input">
				<input type="text" disabled="disabled" value="${helpRequest.reqAddress}">
			</div>
		</div>
		<div class="detail-text-area">
			<div class="detail-text-title">*방문시간</div>
			<div class="detail-text-input">
				<input type="text" disabled="disabled"
					value="${helpRequest.reqTime}">
			</div>
		</div>
		<div class="detail-text-area">
			<div class="detail-text-title">*희망금액</div>
			<div class="detail-text-input">
				<input type="text" disabled="disabled" value="${helpRequest.reqPay}">
			</div>
		</div>
		<div class="detail-text-area">
			<div class="detail-text-title">*요청사항</div>
			<div class="detail-text-input">
				<textarea style="resize: none;" disabled="disabled" value="${helpRequest.reqContent}"></textarea>
			</div>
		</div>
	</div>

</body>
</html>