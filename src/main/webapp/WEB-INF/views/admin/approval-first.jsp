<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head/admin-head.jsp" %>
<link rel="stylesheet" href="${contextPath}/resources/css/admin/approval-first.css">
</head>
<body>
	<div class='main'>
		<div class='menu_title'>승인페이지</div>
		<div class='content'>
			<div class='content_left'>
				<div class='reduce'><i class="fas fa-times-circle"></i></div>
				<div class='file'></div>
				<div class='expand'><i class="fas fa-search-plus"></i></div>
			</div>
			<div class='content_right'>
				<div class='input'>
					<div class='inp_title'>* 아이디</div>
					<input type="text" value='Sync123' readonly>
					<div class='inp_title'>* 대표자명</div>
					<input type="text" value='권구현' readonly>
					<div class='inp_title'>* 업체명</div>
					<input type="text" value='싱크싱크' readonly>
					<div class='inp_title'>* 사업장 주소</div>
					<div>
						<input class='address' type="text" value='서울시 강남구 테헤란로 12번길 7' readonly>
						<input class='post_num' type="text" value='12345' readonly>
						<input class='address detail_add' type="text" value='**빌딩 5층' readonly>
					</div>
					<div class='inp_title'>* 전화번호</div>
					<input type="tel" value='010-0000-0000' readonly>
				</div>
			</div>
			<div class='next_btn'><button>다음 ></button></div>
		</div>
	</div>
</body>
<script type="text/javascript" src="${contextPath}/resources/js/admin/file-expand-viewer.js"></script>
</html>