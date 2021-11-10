<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${contextPath}/resources/css/include/head/menu_head.css">
<link rel="stylesheet" href="${contextPath}/resources/css/management/myIcebox_cart.css">
<link rel="stylesheet" href="${contextPath}/resources/css/management/jquery-ui.min.css">
<meta charset="UTF-8">
<title>myIcebox_cart</title>
</head>
<body>
<div id='modal'></div>
<div id="bg" class="hidden"></div>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/include/head/menu-head.jsp"%>
		<div class="main">
			<div class="btn">
				<button class="icebox_btn" onclick="javascript:location.href='myIcebox'">나의 냉장고</button>
				<button class="house_btn" onclick="javascript:location.href='myAccountBook'">나의 가계부</button>
			</div>

			<div class="icebox">
				<img src="../../../resources/image/icebox.png">
			</div>

			<div class="postIt">
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
			<div class="main2">
					
				<div class="cart_icon">
					<i class="fas fa-shopping-cart"></i>
					<div class="cart_list">구매 리스트</div>
				</div>
				<div class="line"></div>
				<div class ="list_title">구매 예정 목록</div>
				<div class="paper">
					<div class="txt_wrap">
						<div class="txt">- 삼겹살</div>
						<div class="cancel"><i class="fas fa-times-circle"></i></div>
					</div>
					<div class="txt_wrap">
						<div class="txt">- 삼겹살</div>
						<div class="cancel"><i class="fas fa-times-circle"></i></div>
					</div>
					<div class="txt_wrap">
						<div class="txt">- 삼겹살</div>
						<div class="cancel"><i class="fas fa-times-circle"></i></div>
					</div>
					<div class="txt_wrap">
						<div class="txt">- 삼겹살</div>
						<div class="cancel"><i class="fas fa-times-circle"></i></div>
					</div>
					<div class="txt_wrap">
						<div class="txt">- 삼겹살</div>
						<div class="cancel"><i class="fas fa-times-circle"></i></div>
					</div>
					<div class="txt_wrap">
						<div class="txt">- 삼겹살</div>
						<div class="cancel"><i class="fas fa-times-circle"></i></div>
					</div>
					<div class="txt_wrap">
						<div class="txt">- 삼겹살</div>
						<div class="cancel"><i class="fas fa-times-circle"></i></div>
					</div>
					<div class="txt_wrap">
						<div class="txt">- 삼겹살</div>
						<div class="cancel"><i class="fas fa-times-circle"></i></div>
					</div>
					
				</div>
			
				<div class="input_wrap">
					<div class="flex">
						<input type="text" class="input" id="item" placeholder="&nbsp&nbsp항목을 추가해주세요." required>
						<i class="fas fa-plus-square"></i>
					</div>
					<div class="flex">
						<input type="text" class="tell" placeholder="&nbsp&nbsp전화번호를 입력하세요">
						<input type="text" class="date" id="date1" placeholder="&nbsp&nbsp발송 날짜 " autocomplete="off">
						
						<select class="time">
							<option selected disabled>&nbsp&nbsp발송 시간</option>
							<option>&nbsp&nbsp10:00</option>
							<option>&nbsp&nbsp11:00</option>
							<option>&nbsp&nbsp12:00</option>
						</select>
						<div class="down"><i class="fas fa-angle-down"></i></div>
						<i class="fas fa-envelope-square" style="margin-top: 2px; margin-right: 2px;"></i>
					</div>
				</div>
				
				
				<div class ="list_title">최근 소진 목록</div>
				<div class="paper">
					<div class="txt_wrap">
						<input type="checkbox" class="checkbox"><div class="txt">삼겹살</div>
						<div class="cancel"><i class="fas fa-times-circle"></i></div>
					</div>
					<div class="txt_wrap">
						<input type="checkbox" class="checkbox"><div class="txt">삼겹살</div>
						<div class="cancel"><i class="fas fa-times-circle"></i></div>
					</div>
					<div class="txt_wrap">
						<input type="checkbox" class="checkbox"><div class="txt">삼겹살</div>
						<div class="cancel"><i class="fas fa-times-circle"></i></div>
					</div>
					<div class="txt_wrap">
						<input type="checkbox" class="checkbox"><div class="txt">삼겹살</div>
						<div class="cancel"><i class="fas fa-times-circle"></i></div>
					</div>
					<div class="txt_wrap">
						<input type="checkbox" class="checkbox"><div class="txt">삼겹살</div>
						<div class="cancel"><i class="fas fa-times-circle"></i></div>
					</div>
					<div class="txt_wrap">
						<input type="checkbox" class="checkbox"><div class="txt">삼겹살</div>
						<div class="cancel"><i class="fas fa-times-circle"></i></div>
					</div>
				</div>
				<div class="input_wrap2">
					<button class="submit">구매 예정 목록에 추가</button>
				</div>
				<div class="back" onclick="javascript:location.href='myIcebox_note'">
					<i class="fas fa-reply"></i>
				</div>
				
				
			</div>
			<div class="tape2"></div>
			
			
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
</body>
<script type="text/javascript" src="${contextPath}/resources/js/management/myIcebox_cart.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/jquery.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</html>
