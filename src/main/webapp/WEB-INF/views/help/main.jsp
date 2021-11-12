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
		<div class="category">
			<div class="category_name">수리 | 보수</div>
			<div class="category_margin"></div>
			<div class="category_element">
				<img src="../../../resources/image/수리보수-욕실.PNG">
				<div class="img_name">욕실</div>
			</div>
			<div class="category_element">
				<img src="../../../resources/image/수리보수-싱크대.PNG">
				<div class="img_name">싱크대</div>
			</div>
			<div class="category_element">
				<img src="../../../resources/image/수리보수-가전.PNG">
				<div class="img_name">가전</div>
			</div>
		</div>

		<div class="category">
			<div class="category_name">인테리어</div>
			<div class="category_margin"></div>
			<div class="category_element">
				<img src="../../../resources/image/인테리어-타일.PNG">
				<div class="img_name">타일</div>
			</div>
			<div class="category_element">
				<img src="../../../resources/image/인테리어-페인트.PNG">
				<div class="img_name">페인트</div>
			</div>
			<div class="category_element">
				<img src="../../../resources/image/인테리어-도배.PNG">
				<div class="img_name">도배</div>
			</div>
		</div>
		<div class="category">
			<div class="category_margin"></div>
			<div class="category_element">
				<img src="../../../resources/image/인테리어-용달.PNG">
				<div class="img_name">용달</div>
			</div>
			<div class="category_element">
				<img src="../../../resources/image/인테리어-가구조립.PNG">
				<div class="img_name">가구조립</div>
			</div>
		</div>

		<div class="category">
			<div class="category_name">보안 | 방충</div>
			<div class="category_margin"></div>
			<div class="category_element">
				<img src="../../../resources/image/보안-폐쇄회로.PNG">
				<div class="img_name">폐쇄회로</div>
			</div>
			<div class="category_element">
				<img src="../../../resources/image/보안-도어락.PNG">
				<div class="img_name">도어락</div>
			</div>
			<div class="category_element">
				<img src="../../../resources/image/보안-방충.PNG">
				<div class="img_name">방충</div>
			</div>
		</div>

		<div class="category">
			<div class="category_name">생활</div>
			<div class="category_margin"></div>
			<div class="category_element">
				<img src="../../../resources/image/생활-청소.PNG">
				<div class="img_name">청소</div>
			</div>
			<div class="category_element">
				<img src="../../../resources/image/생활-세탁.PNG">
				<div class="img_name">세탁</div>
			</div>
			<div class="category_element">
				<img src="../../../resources/image/생활-식품정기배송.PNG">
				<div class="img_name">식품 정기배송</div>
			</div>
		</div>

	</div>
	<%@ include file="/WEB-INF/views/include/chat/chat.jsp" %>
</body>
<script type="text/javascript" src="../../../resources/js/include/chat/chat.js"></script>
</html>