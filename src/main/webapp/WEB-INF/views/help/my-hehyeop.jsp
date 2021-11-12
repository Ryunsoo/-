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
			<div class="my_name">이호준 <a>님</a>(DIA)</div>
			<div class="left_info">
				<div class="tell">
					<div class="info_title">연락처</div><div class="info_body">01099991111</div>
					<div class="info_btn"><button>수정</button></div>
				</div>
				<div class="info_line"></div>
				<div class="address">
					<div class="info_title">주소</div><div class="info_body">서울시 강남구 KH정보교육원</div>
					<div class="info_btn"><button>수정</button></div>
				</div>
			</div>
			<div class="right_info">
				<div class="email">
					<div class="info_title">이메일</div><div class="info_body">pclass@kh.com</div>
					<div class="info_btn"><button>수정</button></div>
				</div>
				<div class="info_line"></div>
				<div class="region">
					<div class="info_title">지역</div><div class="info_body">서울 강남</div>
					<div class="info_btn"><button>수정</button></div>
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
				<tr>
					<td>[수리 | 보수] 가전</td>
					<td>서울 강남</td>
					<td>2021/10/16</td>
					<td>2</td>
					<td></td>
					<td>캐시</td>
					<td>
					<button class="list_btn">취소</button>
					<button class="list_btn">완료</button>
					</td>
				</tr>
				<tr>
					<td>[수리 | 보수] 싱크대</td>
					<td>서울 강남</td>
					<td>2021/10/14</td>
					<td>5</td>
					<td>싱크내게맡겨</td>
					<td>캐시</td>
					<td><button class="list_btn" onclick="createReviewModal()">후기</button></td>
				</tr>
				<tr>
					<td>[인테리어] 가구조립</td>
					<td>서울 강남</td>
					<td>2021/10/09</td>
					<td>4</td>
					<td></td>
					<td>만나서</td>
					<td><button class="list_btn" onclick="createReviewModal()">후기</button></td>
				</tr>
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