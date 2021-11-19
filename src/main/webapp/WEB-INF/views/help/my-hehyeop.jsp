<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="../../../resources/css/include/head/menu_head.css" type="text/css" rel="stylesheet">
<link href="../../../resources/css/help/my.css" type="text/css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel='stylesheet' href="../../../resources/css/include/chat/chat.css">
<meta charset="UTF-8">
</head>
<body>
	<div id='modal'></div>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/include/head/menu-head.jsp" %>
		<div class="page_name">MY해협</div>
		<div class="my_info">
			<div class="my_name">${authentication.name} <a>님</a></div>
			<div class="left_info">
				<div class="tell">
					<div class="info_title">연락처</div><div class="info_body">${authentication.tell}</div>
				</div>
				<div class="info_line"></div>
				<div class="address">
					<div class="info_title">주소</div><div class="info_body">${authentication.address}</div>
				</div>
			</div>
			<div class="right_info">
				<div class="email">
					<div class="info_title">이메일</div><div class="info_body">${authentication.email}</div>
				</div>
				<div class="info_line"></div>
				<div class="region">
					<div class="info_title">지역</div><div class="info_body">${authentication.oldAddress}</div>
				</div>
			</div>		
		</div>
		
		<div class="req_list">
			<table>
				<tr>
					<th>말머리</th>
					<th>지역</th>
					<th>신청일</th>
					<th>받은 견적</th>
					<th>서비스업체</th>
					<th>결제방식</th>
					<th></th>
				</tr>
				<c:forEach items='${helpList}' var='help'>
					<tr>
						<td>${help.field}</td>
						<td>${help.area}</td>
						<td>${help.regDate}</td>
						<td>${help.estimateCnt}</td>
						<td>${help.company}</td>
						<td>${help.payMeans}</td>
						<td>
							<c:choose>
								<c:when test="${help.state == 1}">
									<button class="list_btn" id="cancel_help">삭제</button>
									<button class="list_btn" id="refresh">끌올</button>
								</c:when>
								<c:when test="${help.state == 2}">
									<button class="list_btn" id="">완료</button>
									<button class="list_btn" id="">취소</button>
								</c:when>
								<c:when test="${help.state == 3}">
									완료 대기 중
								</c:when>
								<c:when test="${help.state == 4}">
									<button class="list_btn" onclick="createReviewModal()">후기</button>
								</c:when>
								<c:when test="${help.state == 5}">
									★ ${help.score}
								</c:when>
								<c:when test="${help.state == 6}">
									취소 대기 중
								</c:when>
								<c:otherwise>
									진행 취소
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</table>	
		</div>

		<div class="breakdown">
			<button class="bk_btn" onclick="detail()">상세내역</button>
			<button class="bk_btn" onclick="estimate()">견적내역</button>
			<div class="bk_body">
			<%@ include file="/WEB-INF/views/help/my-hehyeop-detail.jsp" %>
			<%@ include file="/WEB-INF/views/help/my-hehyeop-estimate.jsp" %>
			</div>
		</div>


	</div>

<%@ include file="/WEB-INF/views/include/chat/chat.jsp" %>
</body>
<script type="text/javascript" src="../../../resources/js/help/star_modal.js"></script>
<script type="text/javascript" src="../../../resources/js/include/chat/chat.js"></script>
</html>