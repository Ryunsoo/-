<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${contextPath}/resources/css/include/head/menu_head.css">
<link rel="stylesheet" href="${contextPath}/resources/css/management/myAccountBook.css">
<link rel="stylesheet" href='${contextPath}/resources/css/management/main.css'>
<link rel="stylesheet" href="${contextPath}/resources/css/management/jquery-ui.min.css">
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
				<div class="scheduler" onclick="javascript:location.href='myAccountBook'">스케쥴러</div>
				<div class="my_statistics" onclick="javascript:location.href='myAccountList'">My 통계</div>
			</div>
			<div class="bell" id="go">
				<div class="hidden" id="popup">오늘은 월세를 지출하는 날 입니다!</div>
				<i class="fas fa-bell"></i>
				
			</div>
			
			<div class="calendar_wrap">
				<div class="calendar" id="calendar"></div>
				<div class="input_wrap">
					<div class="expenses">
						<div class="choice">지출을 선택하세요</div>
						<label class="personal"><input type="radio" id="personal" class="radio" name="choice" value="개인">개인지출</label>
						<label class=fixed><input type="radio" id="fixed" class="radio"  name="choice" value="고정">고정지출</label>
						<button class="confirm" onclick='choice()'>확인</button>
					</div>
					
					<form method="get" action="/management/personal_spend">
						<div class="personal_input_wrap" id="personal_hidden" style="display: none;">
							<div class="personal_title">
								개인 지출 입력
							</div>
								<select name='category' class="personal_category" required style="width: 240px; height: 45px; cursor: pointer;">
									<option selected disabled>항목을 선택하세요.</option>
									<option value='food'>식비</option>
									<option value='traffic'>교통비</option>
									<option value='medical'>의료</option>
									<option value='finance'>금융</option>
									<option value='shopping'>쇼핑</option>
									<option value='leisure'>여가</option>
									<option value='living'>생활</option>
									<option value='event'>경조사비</option>
									<option value='others'>기타</option>
								</select>
							<input type="text" class="personal_category" name='title' placeholder="제목을 입력하세요." autocomplete="off" required>
							<input type="text" class="personal_category" name='date' id="date1" placeholder="날짜를 입력하세요." autocomplete="off" required>
							<input type="number" class="personal_category" name='price' placeholder="금액을 입력하세요." autocomplete="off" min='0' required>
							<div class="personal_btn">
								<button class="personal_delete">삭제</button>
								<button class="personal_save">저장</button>
							</div>
						</div>
					</form>
					<form method="get" action="/management/fixed_spend">
						<div class="fixed_input_wrap" id="fixed_hidden" style="display: none;">
							<div class="fixed_title">
								고정 지출 입력
							</div>
							<input type="text" class="fixed_category" placeholder="&nbsp&nbsp제목을 입력하세요." autocomplete="off" required>
							<div class="category">
								<input type="text" class="input_date" placeholder="&nbsp&nbsp기간 입력" autocomplete="off"  required >
								<select class="input_date" style="width: 108px; height: 40px; cursor: pointer;">
									<option selected disabled>&nbsp&nbsp기간 단위</option>
									<option>&nbsp&nbsp일</option>
									<option>&nbsp&nbsp월</option>
									<option>&nbsp&nbsp년</option>
								</select>
							</div>
								
							
							<input type="text" class="fixed_category" id="date2" placeholder="&nbsp&nbsp시작날짜를 입력하세요." autocomplete="off" required>
							<input type="text" class="fixed_category" id="date3" placeholder="&nbsp&nbsp마감날짜를 입력하세요." autocomplete="off" required>
							<input type="text" class="fixed_category" placeholder="&nbsp&nbsp금액 입력하세요." required>
							<div class="fixed_btn">
								<button class="fixed_delete">삭제</button>
								<button class="fixed_save">저장</button>
							</div>
						</div>
					</form>
				</div>
					
			</div>
		</div>
		<footer style="height: 50px;"></footer>
	</div>
	<%@ include file="/WEB-INF/views/include/chat/chat.jsp" %>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/management/main.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/management/myAccountBook.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/include/chat/chat.js"></script>
</html>
