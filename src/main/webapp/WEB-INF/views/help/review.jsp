<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="../../../resources/css/include/head/menu_head.css" type="text/css" rel="stylesheet">
<link href="../../../resources/css/help/review.css" type="text/css" rel="stylesheet">
<link rel='stylesheet' href="../../../resources/css/include/chat/chat.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrap">
<%@ include file="/WEB-INF/views/include/head/menu-head.jsp" %>
		<div class="page_name">리뷰해협</div>

		<div class="toggle_area">
			<input type="checkbox" id="toggle" class="toggle"> <label
				for="toggle" class="toggle_btn"> <span class="toggle_switch"></span>
			</label>
		</div>
		<div class="toggle_name">우리 동네만</div>

		<div class="review_list">
			<table>
				<tr>
					<th>
						<select class="filter" name="nation">
							<option value="normal" selected disabled>말머리</option>
							<option value="all">전체</option>	
							<option value="bath">욕실</option>
							<option value="ch">싱크대</option>
							<option value="jp">가전</option>
							<option value="fr">타일</option>
							<option value="fr">페인트</option>
							<option value="fr">도배</option>
							<option value="fr">용달</option>
							<option value="fr">가구조립</option>
							<option value="fr">폐쇄회로</option>
							<option value="fr">도어락</option>
							<option value="fr">방충</option>
							<option value="fr">청소</option>
							<option value="fr">세탁</option>
							<option value="fr">식품정기배송</option>
						</select>
					</th>
					<th>지역</th>
					<th>업체명</th>
					<th>만족도</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
				<c:forEach var="reviewList" items="${reviewList}">
					<tr>
					<td>${reviewList.field}</td>
					<td>${reviewList.oldAddress}</td>
					<td>${reviewList.company}</td>
					<td>★ ${reviewList.score}</td>
					<td>${reviewList.nickname}</td>
					<td>${reviewList.reviewDate}</td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<div class="search">
			<input type="text" class="search_bar" placeholder="검색어를 입력하세요." >
			<input type="image" class="search_icon" src="../../../resources/image/search.png">
		</div>


	</div>
	<%@ include file="/WEB-INF/views/include/chat/chat.jsp" %>
</body>
<script type="text/javascript" src="../../../resources/js/include/chat/chat.js"></script>
</html>