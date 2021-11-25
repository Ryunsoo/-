<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head/main-head.jsp" %>
<link rel="stylesheet" href="${contextPath}/resources/css/include/head/admin-head.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<div class='header'>
		<div class='logo' onclick="location.href = '/admin/join-request'"></div>
		<div class='header_right'>
			<div class='user_menu'>
				<div class='admin_mode'>관리자모드</div>
				<div class='logout'><a href='/member/logout'>LOGOUT</a></div>
			</div>
			<div class='main_menu'>
				<!-- current_page class 지정하면 css 바로 적용!! -->
				<div class='member_approval current_page'><a href='/admin/join-request'>회원승인</a></div>
				<div class='community'><a href='#'>커뮤니티</a></div>
			</div>
		</div>
	</div>
</body>
</html>