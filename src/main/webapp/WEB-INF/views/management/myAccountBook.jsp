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
		<c:if test="${not empty message}">
			<script>
				alert('${message}');
			</script>
		</c:if>
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
			<i class="fas fa-bell"></i>
				<div id="popup" style="display:none">
					<c:forEach items="${todayList}" var="list">
						<div>오늘은 '${list}' 지출 날입니다!</div>
					</c:forEach>
				</div>
				
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
					
					<form:form modelAttribute="personalForm" method="get" action="/management/personal-spend/save" class='personal_form'>
						<div class="personal_input_wrap" id="personal_hidden"
							<c:choose>
								<c:when test="${not empty personalError}">
									style="display: flex;"
								</c:when>
								<c:otherwise>
									style="display: none;"
								</c:otherwise>
							</c:choose>
						>
							<div class="personal_title">
								개인 지출 입력
							</div>
								<select name='category' class="personal_category" required style="width: 240px; height: 45px; cursor: pointer;
									<c:if test="${not empty personalError.category}">
										border: 1px solid red;
									</c:if>
								">
									<option selected disabled>항목을 선택하세요.</option>
									<option value='FOOD'
										<c:if test="${empty personalError.category and personalForm.category eq 'FOOD'}">
											selected
										</c:if>
									>식비</option>
									<option value='TRAFFIC'
										<c:if test="${empty personalError.category and personalForm.category eq 'TRAFFIC'}">
											selected
										</c:if>
									>교통비</option>
									<option value='MEDICAL'
										<c:if test="${empty personalError.category and personalForm.category eq 'MEDICAL'}">
											selected
										</c:if>
									>의료</option>
									<option value='FINANCE'
										<c:if test="${empty personalError.category and personalForm.category eq 'FINANCE'}">
											selected
										</c:if>
									>금융</option>
									<option value='SHOPPING'
										<c:if test="${empty personalError.category and personalForm.category eq 'SHOPPING'}">
											selected
										</c:if>
									>쇼핑</option>
									<option value='LEISURE'
										<c:if test="${empty personalError.category and personalForm.category eq 'LEISURE'}">
											selected
										</c:if>
									>여가</option>
									<option value='LIVING'
										<c:if test="${empty personalError.category and personalForm.category eq 'LIVING'}">
											selected
										</c:if>
									>생활</option>
									<option value='EVENT'
										<c:if test="${empty personalError.category and personalForm.category eq 'EVENT'}">
											selected
										</c:if>
									>경조사비</option>
									<option value='OTHERS'
										<c:if test="${empty personalError.category and personalForm.category eq 'OTHERS'}">
											selected
										</c:if>
									>기타</option>
								</select>
							<input type="text" class="personal_category personal_content" name='content'
								<c:choose>
									<c:when test="${not empty personalError.content}">
										style="border: 1px solid red;"
									</c:when>
									<c:when test="${empty personalError.content}">
										value="${personalForm.content}"
									</c:when>
								</c:choose>
							placeholder="제목을 입력하세요." autocomplete="off" required>
							<input type="text" class="personal_category date personal_expDate" name='expDate' id="date1"
								<c:choose>
									<c:when test="${not empty personalError.expDate}">
										style="border: 1px solid red;"
									</c:when>
									<c:when test="${empty personalError.expDate}">
										value="${personalForm.expDate}"
									</c:when>
								</c:choose>
							placeholder="날짜를 입력하세요." autocomplete="off" required>
							<input type="number" class="personal_category personal_price" name='price'
								<c:choose>
								<c:when test="${not empty personalError.price}">
									style="border: 1px solid red;"
								</c:when>
								<c:when test="${empty personalError.price}">
									value="${personalForm.price}"
								</c:when>
								</c:choose>
							placeholder="금액을 입력하세요." autocomplete="off" min='0' required>
							<div class="personal_btn"
								<c:if test="${empty save}">
									style="display: none"
								</c:if>
							>
								<button class="personal_save">저장</button>
							</div>
							<div class="personal_btn_modify"
								<c:if test="${not empty save}">
									style="display: none"
								</c:if>
							>
								<button type="button" class="personal_delete" onclick="deletePersonal()">삭제</button>
								<button type="button" class="personal_save" onclick="modifyPersonal()">수정</button>
								<input type="hidden" class='personal_expIdx' name='expIdx'>
							</div>
						</div>
					</form:form>
					<form:form modelAttribute="fixedForm" method="get" action="/management/fixed-spend/save" class='fixed_form'>
						<div class="fixed_input_wrap" id="fixed_hidden"
							<c:choose>
								<c:when test="${not empty fixedError}">
									style="display: flex;"
								</c:when>
								<c:otherwise>
									style="display: none;"
								</c:otherwise>
							</c:choose>
						>
							<div class="fixed_title">
								고정 지출 입력
							</div>
							<input type="text" class="fixed_category fixed_content" name='content'
								<c:choose>
									<c:when test="${not empty fixedError.content}">
										style="border: 1px solid red;"
									</c:when>
									<c:when test="${empty fixedError.content}">
										value="${fixedForm.content}"
									</c:when>
								</c:choose>
							placeholder="제목을 입력하세요." autocomplete="off" required>
							<div class="category">
								<div class='text'>매 월 </div>
								<input type="text" class="fixed_category date fixed_fixedDate" name="fixedDate" id="date4"
									<c:choose>
										<c:when test="${not empty fixedError.fixedDate}">
											style="border: 1px solid red;"
										</c:when>
										<c:when test="${empty fixedError.fixedDate}">
											value="${fixedForm.fixedDate}"
										</c:when>
									</c:choose>
								autocomplete="off" style="width: 50px;" required>
								<div class='text'> 일</div>
							</div>
							
							<input type="text" class="fixed_category date fixed_startDate" id="date2" name='startDate'
								<c:choose>
									<c:when test="${not empty fixedError.startDate}">
										style="border: 1px solid red;"
									</c:when>
									<c:when test="${empty fixedError.startDate}">
										value="${fixedForm.startDate}"
									</c:when>
								</c:choose>
							placeholder="시작날짜를 입력하세요." autocomplete="off" required>
							<input type="text" class="fixed_category date fixed_endDate" id="date3" name='endDate'
								<c:choose>
									<c:when test="${not empty fixedError.endDate}">
										style="border: 1px solid red;"
									</c:when>
									<c:when test="${empty fixedError.endDate}">
										value="${fixedForm.endDate}"
									</c:when>
								</c:choose>
							placeholder="마감날짜를 입력하세요." autocomplete="off">
							<input type="number" class="fixed_category fixed_price" name='price'
								<c:choose>
									<c:when test="${not empty fixedError.price}">
										style="border: 1px solid red;"
									</c:when>
									<c:when test="${empty fixedError.price}">
										value="${fixedForm.price}"
									</c:when>
								</c:choose>
							placeholder="금액 입력하세요." min='0' required>
							<div class="fixed_btn"
								<c:if test="${empty save}">
									style="display: none"
								</c:if>
							>
								<button class="fixed_save">저장</button>
							</div>
							<div class="fixed_btn_modify"
								<c:if test="${not empty save}">
									style="display: none"
								</c:if>
							>
								<button type="button" class="fixed_delete" onclick="deleteFixed()">삭제</button>
								<button type="button" class="fixed_save" onclick="modifyFixed()">수정</button>
								<input type="hidden" class='fixed_expIdx' name='fExpIdx'>
							</div>
						</div>
					</form:form>
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
