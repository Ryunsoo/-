<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head/admin-head.jsp" %>
<link rel="stylesheet" href="${contextPath}/resources/css/admin/approval-second.css">
</head>
<body>
	<div class='main'>
		<div class='menu_title'>승인페이지</div>
		<div class='edit_field'><button>수정</button></div>
		<div class='content'>
			<div class='content_left'>
				<div class='reduce'><i class="fas fa-times-circle"></i></div>
				<div class='file'></div>
				<div class='expand'><i class="fas fa-search-plus"></i></div>
			</div>
			<div class='content_right'>
				<div class='input'>
					<div class='inp_title'>* 전문분야</div>
						<div class='check_box'>
							<div class='field_cate'><label>수리 | 보수</label></div>
							<div class='field'>
								<label><input type='checkbox' name='field' value='bath'>욕실</label>
								<label><input type='checkbox' name='field' value='sink'>싱크대</label>
								<label><input type='checkbox' name='field' value='appliance'>가전</label>
							</div>
							<div class='field_cate'><label>인테리어</label></div>
							<div class='field'>
								<label><input type='checkbox' name='field' value='tile'>타일</label>
								<label><input type='checkbox' name='field' value='paint'>페인트</label>
								<label><input type='checkbox' name='field' value='paper'>도배</label>
								<label><input type='checkbox' name='field' value='moving'>용달</label>
								<label><input type='checkbox' name='field' value='assemble'>가구조립</label>
							</div>
							<div class='field_cate'><label>보안 | 방충</label></div>
							<div class='field'>
								<label><input type='checkbox' name='field' value='cctv'>폐쇄회로</label>
								<label><input type='checkbox' name='field' value='lock'>도어락</label>
								<label><input type='checkbox' name='field' value='screen'>방충</label>
							</div>
							<div class='field_cate'><label>생활</label></div>
							<div class='field'>
								<label><input type='checkbox' name='field' value='cleaning'>청소</label>
								<label><input type='checkbox' name='field' value='washing'>세탁</label>
								<label><input type='checkbox' name='field' value='food'>식품 정기배송</label>
							</div>
						</div>
				</div>
			</div>
			<div class='prev_btn'><button>&lt 이전</button></div>
			<div class='decision_btn'><button>거절</button><button>승인</button></div>
		</div>
	</div>
</body>
<script type="text/javascript" src="${contextPath}/resources/js/admin/file-expand-viewer.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/admin/approval-second.js"></script>
</html>