<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${contextPath}/resources/css/include/head/menu_head.css">
<link rel="stylesheet" href="${contextPath}/resources/css/management/myIcebox_note.css">
<link rel='stylesheet' href="${contextPath}/resources/css/include/chat/chat.css">
</head>
<body>
<div id="bg" class="hidden"></div>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/include/head/menu-head.jsp"%>
		<div class="main">
			<div class="btn">
				<button class="icebox_btn" onclick="javascript:location.href='myIcebox'">나의 냉장고</button>
				<button class="house_btn" onclick="javascript:location.href='myIcebox5.html'">나의 가계부</button>
			</div>

			<div class="icebox">
				<img src="../../../resources/image/icebox.png">
			</div>

			<div class="postIt">
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
			<div class="main2">
				<div class="line_btn">
					<div class="nAndi_btn">
						<c:choose>
							<c:when test="${category == 1}"> 
								<button class="off_btn" id="nomal_btn" onclick="IceBoxCategory(0)">냉장</button>
								<button class="on_btn" id="ice_btn" onclick="IceBoxCategory(1)">냉동</button>	
							</c:when>
							<c:otherwise>
								<button class="on_btn" id="nomal_btn" onclick="IceBoxCategory(0)">냉장</button>
								<button class="off_btn" id="ice_btn" onclick="IceBoxCategory(1)">냉동</button>
							</c:otherwise>
						</c:choose> 
					</div>
					<div class="line"></div>
				</div>
				<div class="bell3">
					<i class="fas fa-bell"></i>
					<c:choose>
						<c:when test="${category == 1}"><div class="icebox_bell">냉동고 알림이</div></c:when>
						<c:otherwise><div class="icebox_bell">냉장고 알림이</div></c:otherwise>
					</c:choose>
				</div>
				
				<div class="fast_title">
					<div class ="hurry_eat">빨리 먹어!!</div>
					<i class="fas fa-exclamation-triangle"></i>
				</div>
				<div class="paper">
					<c:forEach items="${iceboxList}" var="ice">
						<c:if test="${ice.resDay <= 3}">
						<div class="txt_wrap">
							<div class="reg_date">${ice.exDate}</div>
							<div class="txt">${ice.item}</div>
							<div class="day">(${ice.resDay}일)</div>
							<c:if test="${ice.resDay < 0}"><div class="day_end"><i class="fas fa-exclamation-triangle"></i>유통기한이 지났습니다.</div></c:if>
						</div>
						</c:if>	
					</c:forEach>
		
				</div>
				
				<div class="fast_title">
					<div class ="hurry_eat">꺼내 먹어!!</div>
				</div>
				<div class="paper">
					<c:forEach items="${iceboxList}" var="ice">
						<c:if test="${ice.resDay > 3}">
						<div class="txt_wrap">
							<div class="reg_date">${ice.exDate}</div>
							<div class="txt">${ice.item}</div>
							<div class="day">(${ice.resDay}일)</div>
						</div>
						</c:if>	
					</c:forEach>	
				</div>
				
				<div class="pen"  onclick="location.href='myIcebox_modify?category=' + ${category}">
					<i class="fas fa-pencil-alt"></i>
					<div class="modify">수정</div>
				</div>
				
				
			</div>
			<div class="tape2"></div>
			
			<%@ include file="/WEB-INF/views/management/bell.jsp" %>
			
		</div>
		
		


	</div>
	<%@ include file="/WEB-INF/views/include/chat/chat.jsp" %>
</body>
<script type="text/javascript" src="${contextPath}/resources/js/management/myIcebox_note.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/include/chat/chat.js"></script>
</html>
