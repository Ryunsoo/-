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
			<c:if test="${not empty linked}">
				<div class='switch_user'>
					<a href='/mypage/change'><span class='text'>개인회원으로 전환</span> <span class='icon'><i class="fas fa-sync-alt"></i></span></a>
				</div>
			</c:if>
			<div class='user_name'>${authentication.id}</div><div class='nim'>님</div>
			<c:choose>
				<c:when test="${authentication.grade eq 'BRONZE'}">
					<div class='medal' style="color: #cc9900"><i class="fas fa-medal"></i></div>
				</c:when>
				<c:when test="${authentication.grade eq 'SILVER'}">
					<div class='medal' style="color: silver"><i class="fas fa-medal"></i></div>
				</c:when>
				<c:when test="${authentication.grade eq 'GOLD'}">
					<div class='medal' style="color: gold"><i class="fas fa-medal"></i></div>
				</c:when>
				<c:when test="${authentication.grade eq 'DIA'}">
					<div class='medal' style="color: silver"><i class="fas fa-gem"></i></div>
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${requestScope['javax.servlet.forward.request_uri'] ne '/mypage/mypage-company'}">
					<div class='mypage' style="cursor:pointer" onclick="location.href = '/mypage/mypage-company'">마이페이지</div>
				</c:when>
				<c:otherwise>
					<div class='mypage' style="cursor:pointer" onclick="location.href = '/mypage/main'">메인페이지</div>
				</c:otherwise>
			</c:choose>
			<div class='logout' style="cursor:pointer"><a href='/member/logout'>LOGOUT</a></div>
		</div>
	</div>
</body>
</html>