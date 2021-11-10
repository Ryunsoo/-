<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${contextPath}/resources/css/include/head/menu_head.css">
<link rel="stylesheet" href="${contextPath}/resources/css/management/myIcebox_modify.css">
<link rel="stylesheet" href="${contextPath}/resources/css/management/jquery-ui.min.css">
<meta charset="UTF-8">
<title>myIcebox_modify</title>
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
				<div class="line_btn">
					<div class="nAndi_btn">
						<button class="nomal_btn">냉장</button>
						<button class="ice_btn">냉동</button>
					</div>
					<div class="line"></div>
				</div>
				<div class="bell3">
					<i class="fas fa-bell"></i>
					<div class="icebox_bell">냉장고 알림이</div>
				</div>
				
				<div class="fast_title">
					<div class ="hurry_eat">빨리 먹어!!</div>
					<i class="fas fa-exclamation-triangle"></i>
				</div>
				<div class="paper">
					<div class="txt_wrap">
						<del class="reg_date">2021/11/02</del>
						<del class="txt">삼겹살</del>
						<del class="day">(3일)</del>
						<div class="day_end"><i class="fas fa-exclamation-triangle"></i>유통기한이 지났습니다.</div>
						<div class="cancel"><i class="fas fa-times-circle"></i></div>
					</div>
					<div class="txt_wrap">
						<div class="reg_date">2021/11/02</div>
						<div class="txt">삼겹살</div>
						<div class="day">(3일)</div>
						<div class="cancel"><i class="fas fa-times-circle"></i></div>
					</div>
					<div class="txt_wrap">
						<div class="reg_date">2021/11/02</div>
						<div class="txt">삼겹살</div>
						<div class="day">(3일)</div>
						<div class="cancel"><i class="fas fa-times-circle"></i></div>
					</div>
					<div class="txt_wrap">
						<div class="reg_date">2021/11/02</div>
						<div class="txt">삼겹살</div>
						<div class="day">(3일)</div>
						<div class="cancel"><i class="fas fa-times-circle"></i></div>
					</div>
					<div class="txt_wrap">
						<div class="reg_date">2021/11/02</div>
						<div class="txt">삼겹살</div>
						<div class="day">(3일)</div>
						<div class="cancel"><i class="fas fa-times-circle"></i></div>
					</div>
					<div class="txt_wrap">
						<div class="reg_date">2021/11/02</div>
						<div class="txt">삼겹살</div>
						<div class="day">(3일)</div>
						<div class="cancel"><i class="fas fa-times-circle"></i></div>
					</div>
					<div class="txt_wrap">
						<div class="reg_date">2021/11/02</div>
						<div class="txt">삼겹살</div>
						<div class="day">(3일)</div>
						<div class="cancel"><i class="fas fa-times-circle"></i></div>
					</div>
				</div>
				<div class="input_wrap">
					<input type="text" class="input" id="item" placeholder="&nbsp&nbsp내용을 입력해주세요." required>
					<input type="text" class="date" id="date1" placeholder="&nbsp&nbsp유통기한  ▼" autocomplete="off">
					<i class="fas fa-plus-square"></i>
				</div>
				<div class="fast_title">
					<div class ="hurry_eat">꺼내 먹어!!</div>
				</div>
				<div class="paper">
					<div class="txt_wrap">
						<div class="reg_date">2021/11/02</div>
						<div class="txt">삼겹살</div>
						<div class="day">(3일)</div>
						<div class="cancel"><i class="fas fa-times-circle"></i></div>
					</div>
					<div class="txt_wrap">
						<div class="reg_date">2021/11/02</div>
						<div class="txt">삼겹살</div>
						<div class="day">(3일)</div>
						<div class="cancel"><i class="fas fa-times-circle"></i></div>
					</div>
					<div class="txt_wrap">
						<div class="reg_date">2021/11/02</div>
						<div class="txt">삼겹살</div>
						<div class="day">(3일)</div>
						<div class="cancel"><i class="fas fa-times-circle"></i></div>
					</div>
					<div class="txt_wrap">
						<div class="reg_date">2021/11/02</div>
						<div class="txt">삼겹살</div>
						<div class="day">(3일)</div>
						<div class="cancel"><i class="fas fa-times-circle"></i></div>
					</div>
					<div class="txt_wrap">
						<div class="reg_date">2021/11/02</div>
						<div class="txt">삼겹살</div>
						<div class="day">(3일)</div>
						<div class="cancel"><i class="fas fa-times-circle"></i></div>
					</div>
					<div class="txt_wrap">
						<div class="reg_date">2021/11/02</div>
						<div class="txt">삼겹살</div>
						<div class="day">(3일)</div>
						<div class="cancel"><i class="fas fa-times-circle"></i></div>
					</div>
				</div>
				<div class="input_wrap">
					<input type="text" class="input" id="item" placeholder="&nbsp&nbsp내용을 입력해주세요." required>
					<input type="text" class="date" id="date2" placeholder="&nbsp&nbsp유통기한  ▼" autocomplete="off">
					<i class="fas fa-plus-square"></i>
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
<script type="text/javascript" src="${contextPath}/resources/js/management/myIcebox_modify.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/jquery.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</html>
