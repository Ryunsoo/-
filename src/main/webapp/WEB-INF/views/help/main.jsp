<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="../../../resources/css/include/head/menu_head.css" type="text/css" rel="stylesheet">
<link href="../../../resources/css/help/main.css" type="text/css" rel="stylesheet">
<link rel='stylesheet' href="../../../resources/css/include/chat/chat.css">
<meta charset="UTF-8">
</head>
<body>
<div class="wrap">
<%@ include file="/WEB-INF/views/include/head/menu-head.jsp" %>
		<!-- body -->
			<c:forEach var="category" items="${proFieldMap.category}">
				<div class="category">
				<div class="category_name">${category.fieldCategory}</div>
				<c:forEach var="proField" items="${proFieldMap.proField}">
					<c:if test="${category.fieldCategory == proField.fieldCategory}">
						<div class="category_element">
							<img src="../../../resources/image/${proField.field}.PNG" onclick="location.href='/help/request?field=${proField.field}'">
							<div class="img_name">${proField.field}</div>
						</div>
					</c:if>
				</c:forEach>
				</div>
			</c:forEach>
	</div>
	<%@ include file="/WEB-INF/views/include/chat/chat.jsp" %>
</body>
<script type="text/javascript" src="../../../resources/js/include/chat/chat.js"></script>
</html>