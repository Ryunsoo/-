<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${contextPath}/resources/css/include/head/menu_head.css">
<link rel="stylesheet" href="${contextPath}/resources/css/management/myAccountList.css">
<link rel='stylesheet' href="${contextPath}/resources/css/include/chat/chat.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.1/jquery.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/themes/base/jquery-ui.css">
</head>
<body>
	<div id="bg" class="hidden"></div>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/include/head/menu-head.jsp"%>
		<div class="main">
			<div class="btn">
				<button class="icebox_btn"
					onclick="javascript:location.href='myIcebox'">나의 냉장고
				</button>
				<button class="house_btn" onclick="javascript:location.href='myAccountBook'">나의 가계부</button>
				<div class="scheduler" onclick="javascript:location.href='myAccountBook'">스케쥴러</div>
				<div class="my_statistics" onclick="javascript:location.href='myAccountList'">My 통계</div>
			</div>
			<div class="personal_list_wrap">
				<div class="personal_list_title">개인 지출 내역</div>
				<div class="personal_search_wrap">
					<select class="personal_category">
						<option value="all" <c:if test="${param.cate == 'all'}">selected</c:if>>&nbsp&nbsp전체</option>
						<option value="FOOD" <c:if test="${param.cate == 'FOOD'}">selected</c:if>>&nbsp&nbsp식비</option>
						<option value="TRAFFIC" <c:if test="${param.cate == 'TRAFFIC'}">selected</c:if>>&nbsp&nbsp교통비</option>
						<option value="MEDICAL" <c:if test="${param.cate == 'MEDICAL'}">selected</c:if>>&nbsp&nbsp의료</option>
						<option value="FINANCE" <c:if test="${param.cate == 'FINANCE'}">selected</c:if>>&nbsp&nbsp금융</option>
						<option value="SHOPPING" <c:if test="${param.cate == 'SHOPPING'}">selected</c:if>>&nbsp&nbsp쇼핑</option>
						<option value="LEISURE" <c:if test="${param.cate == 'LEISURE'}">selected</c:if>>&nbsp&nbsp여가</option>
						<option value="LIVING" <c:if test="${param.cate == 'LIVING'}">selected</c:if>>&nbsp&nbsp생활</option>
						<option value="EVENT" <c:if test="${param.cate == 'EVENT'}">selected</c:if>>&nbsp&nbsp경조사비</option>
						<option value="OTHERS" <c:if test="${param.cate == 'OTHERS'}">selected</c:if>>&nbsp&nbsp기타</option>
					</select>
					<div class="line"></div>
					<label class="year" onclick="showYear()"><input type="radio" class="year_radio" name="year" id="choice" value="1">연간 통계</label> 
					<label class="month" onclick="showMonth()"><input type="radio" checked class="month_radio" name="month" id="choice" value="1">월간 통계</label> 
					<input type="text" id ="thismonth" name='thismonth' class="calendar1"> 
					<select id ="thisyear" name='thisyear' class="calendar" style="display:none">
					    <option id="y1" selected></option>
					    <option id="y2"></option>
					    <option id="y3"></option>
					    <option id="y4"></option>
					</select>       
			        <button onclick="searchfilter()" class="search_btn">조회</button>
				</div>
				<div class='personal_paper' id='list'>
					<div class='personal_txt'>
						<label id='idx'>No</label> 
						<label id='cate'>구분</label> 
						<label id='content'>내용</label> 
						<label id='money'>금액</label>
						<label id='date'>날짜</label>
						<label id='tatal_pay'>누적금액</label>
					</div>
					<c:forEach items="${ExpenseList}" var="el" varStatus="status">
						<div class='personal_content'>
							<label id='idx'>${status.count}</label> 
							<label id='cate'>${el.category}</label> 
							<label id='content'>${el.content}</label> 
							<label id='money'>${el.comPrice}</label>
							<label id='date'>${el.expDate}</label>
							<label id='tatal_pay'>${el.comAccPrice}</label>
						</div>
					</c:forEach>
					
				</div>
				<div class="personal_total">
						조회하신 내역의 합계는<div style="color: orange;">&nbsp${EsumPrice}원&nbsp</div>을 사용했습니다.
					</div>
			</div>
			<div class="list_line"></div>
			<div class="fixed_list_wrap">
				<div class="fixed_list_title">고정 지출 내역</div>
				<div class='fixed_paper' id='list'>
					<div class='fixed_txt'>
						<label id='idx'>No</label> 
						<label id='cate'>내역</label> 
						<label id='content'>금액</label> 
						<label id='money'>고정주기</label>
						<label id='date'>시작 일자</label>
						<label id='tatal_pay'>마감일자</label>
					</div>
					<c:forEach items="${FExpenseList}" var="fl" varStatus="status">
						<div class='fixed_content'>
							<label id='idx'>${status.count}</label> 
							<label id='cate'>${fl.content}</label> 
							<label id='content'>${fl.comPrice}</label> 
							<label id='content'>${fl.days}${fl.cycle}</label> 
							<label id='date'>${fl.startDate}</label>
							<label id='tatal_pay'>${fl.endDate}</label>
						</div>
					</c:forEach>
				</div>
				<div class="fixed_total">
					고정지출의 합계는<div style="color: orange;">&nbsp${FsumPrice}원&nbsp</div>입니다.
				</div>
			</div>

		</div>
		
		<footer style="height: 200px;">
		
		</footer>
	</div>
	<%@ include file="/WEB-INF/views/include/chat/chat.jsp" %>
</body>
<script type="text/javascript" src="${contextPath}/resources/js/include/chat/chat.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/management/myAccountList.js"></script>
</html>
