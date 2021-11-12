<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${contextPath}/resources/css/include/head/menu_head.css">
<link rel="stylesheet" href="${contextPath}/resources/css/management/myIcebox.css">
<link rel='stylesheet' href="${contextPath}/resources/css/chat/chat.css">
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
				<div class="bell_cnt">3</div>
				<i class="fas fa-bell"></i>
			</div>
			
			<div class="cart" onclick="javascript:location.href='myIcebox_cart'">
				<div class="cart_cnt">3</div>
			<i class="fas fa-shopping-cart"></i>
			</div>
			
			<div class="hidden" id="popup">
				<div class="bell_title_wrap">
					<div class="bell_title">
						<div>알림</div>
						<div class="no_read">(읽지않음</div>
						<div class="cnt">9</div>
						<div class="total_cnt">/15)</div>
					</div>
					<div class="bell_cancel" id="exit"><i class="fas fa-times-circle"></i></div>
				</div>
				
				<div class="bell_txt_wrap">
					<div class="bell_txt">- 삼겹살의 유통기한이 <div style="color:rgb(192, 57, 43); ">&nbsp3일</div>&nbsp남았습니다.</div>
				</div>
				<div class="bell_txt_wrap">
					<div class="bell_txt">- 삼겹살의 유통기한이 <div style="color:rgb(192, 57, 43); ">&nbsp3일</div>&nbsp남았습니다.</div>
				</div>
				<div class="bell_txt_wrap">
					<div class="bell_txt">- 삼겹살의 유통기한이 <div style="color:rgb(192, 57, 43); ">&nbsp3일</div>&nbsp남았습니다.</div>
				</div>
				<div class="bell_txt_wrap">
					<div class="bell_txt">- 삼겹살의 유통기한이 <div style="color:rgb(192, 57, 43); ">&nbsp3일</div>&nbsp남았습니다.</div>
				</div>
				<div class="bell_txt_wrap">
					<div class="bell_txt">- 삼겹살의 유통기한이 <div style="color:rgb(192, 57, 43); ">&nbsp3일</div>&nbsp남았습니다.</div>
				</div>
				<div class="bell_txt_wrap">
					<div class="bell_txt">- 삼겹살의 유통기한이 <div style="color:rgb(192, 57, 43); ">&nbsp3일</div>&nbsp남았습니다.</div>
				</div>
				<div class="bell_txt_wrap">
					<div class="bell_txt">- 삼겹살의 유통기한이 <div style="color:rgb(192, 57, 43); ">&nbsp3일</div>&nbsp남았습니다.</div>
				</div>
				<div class="bell_txt_wrap">
					<div class="bell_txt">- 삼겹살의 유통기한이 <div style="color:rgb(192, 57, 43); ">&nbsp3일</div>&nbsp남았습니다.</div>
				</div>
				<div class="bell_txt_wrap">
					<div class="bell_txt">- 삼겹살의 유통기한이 <div style="color:rgb(192, 57, 43); ">&nbsp3일</div>&nbsp남았습니다.</div>
				</div>
				<div class="bell_txt_wrap">
					<div class="bell_txt">- 삼겹살의 유통기한이 <div style="color:rgb(192, 57, 43); ">&nbsp3일</div>&nbsp남았습니다.</div>
				</div>
				<div class="bell_txt_wrap">
					<div class="bell_txt">- 삼겹살의 유통기한이 <div style="color:rgb(192, 57, 43); ">&nbsp3일</div>&nbsp남았습니다.</div>
				</div>
				<div class="bell_txt_wrap">
					<div class="bell_txt">- 삼겹살의 유통기한이 <div style="color:rgb(192, 57, 43); ">&nbsp3일</div>&nbsp남았습니다.</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/include/chat/chat.jsp" %>
</body>
<script type="text/javascript" src="${contextPath}/resources/js/management/myIcebox.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/chat/chat.js"></script>
</html>
