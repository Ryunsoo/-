<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${contextPath}/resources/css/include/head/menu_head.css">
<link rel="stylesheet" href="${contextPath}/resources/css/management/jquery-ui.min.css">
<link rel='stylesheet' href="${contextPath}/resources/css/include/chat/chat.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/jquery.js"></script>
</head>
<style>
.alertMessage {
	text-align: center;
	font-size: 20px;
	font-weight: bold;
}
</style>
<script type="text/javascript">
function showResult(msg){
	let modal = initModal('modal', 3);
	appendTitle(modal, '');
	setButton(modal, '닫기');
	setContent(modal, true, true);
	//addPiggyBackround(sendModal);
	modalBlock();
	
	let modalBody = $('<div class="alertMessage">'+msg+'</div><br>')
	.addClass('send_modal_content');
	
	$('.modal_content').append(modalBody);
	
	$('.modal_left_btn').click(function() {
		modalNone();
	})
}	
</script>
<body>
<div id='modal'></div>
<div id="bg" class="hidden"></div>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/include/head/menu-head.jsp"%>
		<link rel="stylesheet" href="${contextPath}/resources/css/management/myIcebox_cart.css">
		<div class="main">
			<div class="btn">
				<button class="icebox_btn" onclick="location.href='/management/myIcebox'">나의 냉장고</button>
				<button class="house_btn" onclick="location.href='/management/myAccountBook'">나의 가계부</button>
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
			
			<%@ include file="/WEB-INF/views/management/bell.jsp" %>
			<div class="main2">
					
				<div class="cart_icon">
					<i class="fas fa-shopping-cart"></i>
					<div class="cart_list">구매 리스트</div>
				</div>
				<div class="line"></div>
				<div class ="list_title">구매 예정 목록</div>
				<form name='sfrm' class="sfrm" method='post' action="/management/sendSMS">
				<div class="paper">
					<c:forEach items="${purchaseList}" var="pl">
						<div class="txt_wrap">
						<div class="txt">- ${pl.item}</div>
						<input type="hidden" name="item" value="${pl.item}">
						<div class="cancel" onclick="deleteItem(${pl.shoppingIdx})"><i class="fas fa-times-circle"></i></div>
					</div>
					</c:forEach>
				</div>
				
				<div class="input_wrap">
					<div class="flex" style="width:487.38px">
							<input type="text" class="input" id="item" placeholder="&nbsp&nbsp항목을 추가해주세요.">
							<i onclick="insertInputItem()" class="fas fa-plus-square"></i>
					</div>
					<div class="flex">
						<input type="number" class="tell" name="tell" placeholder="&nbsp&nbsp전화번호를 입력하세요" required>
						<input type="datetime-local" name="date" class="date" id="date" onchange="setMinValue()" placeholder="&nbsp&nbsp발송 날짜 " autocomplete="off" required>
						<button id="send_btn"><i id="send_icon" class="fas fa-envelope-square" style="margin-top: 2px; margin-right: 2px;"></i></button>
					</div>
				</div>
				</form>
				
				<div class ="list_title">최근 소진 목록</div>
				<form name='frm' method='post' action="/management/moveCheckedItem" onsubmit="return checkedItem();">
				<div class="paper">
					<c:forEach items="${exhaustList}" var="el">
						<div class="txt_wrap">
							<input type="checkbox" class="checkbox" name="checkedItemIdx" value="${el.shoppingIdx}"><div class="txt">${el.item}</div>
							<div class="cancel" onclick="deleteItem(${el.shoppingIdx})"><i class="fas fa-times-circle"></i></div>
						</div>
					</c:forEach>
					
				</div>
				<div class="input_wrap2">
					<button class="submitBtn">구매 예정 목록에 추가</button>
				</div>
				</form>
				<div class="back" onclick="location.href='/management/myIcebox'">
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
		
		

	<c:if test="${not empty message}">
		<script>showResult('${message}')</script>
	</c:if>
	</div>
	<%@ include file="/WEB-INF/views/include/chat/chat.jsp" %>
</body>
<script>
let dateElement = document.getElementById('date');
let plustime = new Date(new Date().getTime() - (new Date().getTimezoneOffset() * 60000));
let date = plustime.toISOString().slice(0, -8);
console.dir("plus3time.toISOString() : "+plustime.toISOString());
console.dir("date : " + date);
dateElement.value = date;
dateElement.setAttribute("min", date);
function setMinValue() {
    if(dateElement.value < date) {
        alert('현재 시간보다 이전의 날짜는 설정할 수 없습니다.');
        dateElement.value = date;
    }
}
</script>
<script type="text/javascript" src="${contextPath}/resources/js/management/myIcebox_cart.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/include/chat/chat.js"></script>
</html>
