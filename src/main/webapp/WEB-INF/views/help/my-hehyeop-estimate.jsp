<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="../../../resources/css/help/estimate.css" type="text/css" rel="stylesheet">
<meta charset="UTF-8">
</head>
<body>
	<div class="company_list">
		<table id="response_list">
			<tr>
				<th>업체명</th>
				<th>업체 주소</th>
				<th>신청일</th>
				<th>업체 선택</th>
			</tr>
		</table>
	</div>

	<div class="company_detail">
		<div class="detail_body">
			<div class="estilmate-text-area">
				<div class="estilmate-text-title">
					*연락처
					<div class="estilmate-text-input">
						<input type="text" id="resTell" readonly disabled="disabled">
					</div>
				</div>
			</div>
			<div class="estilmate-text-area">
				<div class="estilmate-text-title">
					*방문시간
					<div class="estilmate-text-input">
						<input type="text" id="resTime" readonly disabled="disabled">
					</div>
				</div>
			</div>
			<div class="estilmate-text-area">
				<div class="estilmate-text-title">
					*예상금액
					<div class="estilmate-text-input">
						<input type="text" id="resPay" readonly disabled="disabled">
					</div>
				</div>
			</div>
		</div>
		<div class="res-content-title">
					*업체 한마디
					<div class="res-content-input">
						<textarea id="resContent" readonly disabled="disabled" rows="10" cols="50"></textarea>
					</div>
		</div>
		<div class="photo_title">견적서</div>
		<div class="detail_photo">
			<!-- <img id="resPhoto"> -->
		</div>
	</div>
</body>
</html>