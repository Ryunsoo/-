<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${contextPath}/resources/css/include/head/menu_head.css">
<link rel="stylesheet" href="${contextPath}/resources/css/management/myIcebox.css">
<link rel='stylesheet' href="${contextPath}/resources/css/include/chat/chat.css">
</head>
<body>
<div id="bg" class="hidden"></div>
	<div class="wrap">
	<%@ include file="/WEB-INF/views/include/head/menu-head.jsp"%>
		<div class="main">
			<div class="btn">
				<button class="icebox_btn" onclick="javascript:location.href='myIcebox'">
					나의 냉장고
				</button>
				<button class="house_btn" onclick="javascript:location.href='myAccountBook'">
					나의 가계부
				</button>
			</div>
			
			<div class="icebox">
				<img src="../../../resources/image/icebox.png">
			</div>
				
			<div class="postIt" onclick="javascript:location.href='myIcebox_note'">
				<div class="click">CLICK!</div>
			</div>
			<div class="tape"></div>
			<div class="bell" id="go">
				<c:if test="${bellCnt > 0}"><div class="bell_cnt">${bellCnt}</div></c:if>
				<i class="fas fa-bell"></i>
			</div>
			
			<div class="cart" onclick="javascript:location.href='myIcebox_cart'">
			<i class="fas fa-shopping-cart"></i>
			</div>
			
			<%@ include file="/WEB-INF/views/management/bell.jsp" %>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/include/chat/chat.jsp" %>
</body>
<script type="text/javascript" src="${contextPath}/resources/js/management/myIcebox.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/include/chat/chat.js"></script>
</html>
