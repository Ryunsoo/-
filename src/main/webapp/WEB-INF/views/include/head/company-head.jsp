<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head/main-head.jsp" %>
<link rel="stylesheet" href="${contextPath}/resources/css/include/head/company-head.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<div class='header'>
		<div class='logo' onclick="location.href = '/company/main'"></div>
		<div class='user_menu'>
			<div class='switch_user'>
				<a href='#'><span class='text'>개인회원으로 전환</span> <span class='icon'><i class="fas fa-sync-alt"></i></span></a>
			</div>
			<div class='user_name'>해협</div><div class='nim'>님</div><div class='medal'><i class="fas fa-medal"></i></div>
			<div class='mypage' style="cursor:pointer" onclick="location.href = '/mypage/mypage-company'">마이페이지</div>
			<div class='logout' style="cursor:pointer"><a href='#'>LOGOUT</a></div>
		</div>
	</div>
</body>
</html>