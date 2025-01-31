<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head/main-head.jsp"%>
<link href="../../../resources/css/mypage/mypage_company_css.css"
	type="text/css" rel="stylesheet">
<link href="../../../resources/css/mypage/modal.css" type="text/css"
	rel="stylesheet">
<link href="../../../resources/css/mypage/bootstrap.css" type="text/css"
	rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/4.12.0/d3.js"
	integrity="sha512-SuXpPdajLF/GkLBHndpO/A05M1yY4UXJjeeYSbuXRat6E2AUmnG5CVQ0xPtI7IxfXjRmAHoOuOsCqd8yoPup+g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.20/c3.js"
	integrity="sha512-11Z4MD9csmC3vH8Vd0eIPJBQu3uEHEqeznWEt3sLBCdQx3zm9mJbBcJH8WTcyGY9EXDE81BNpjE2vLosPK8cFQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link href="../../../resources/css/reset.css" type="text/css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel='stylesheet'
	href="../../../resources/css/include/chat/chat.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#normal {
	font-weight: bolder;
	color: black;
	margin-left: 30px;
}

#bronze {
	font-weight: bolder;
	color: bronze;
	margin-left: 30px;
}

#silver {
	font-weight: bolder;
	color: silver;
	margin-left: 30px;
}

#gold {
	font-weight: bolder;
	color: gold;
	margin-left: 30px;
}

#dia {
	font-weight: bolder;
	color: blue;
	margin-left: 30px;
}

#address2-remove-button, #address3-remove-button {
	cursor: pointer;
}

.alertMessage {
	text-align: center;
	font-size: 20px;
	font-weight: bold;
}

.hidden{
	display: none;
}

.modifyInfo_btn{
	background-color: rgb(246, 199, 124);
}
.delete_user_btn{
	background-color: rgb(244, 166, 159); 
}
.modifyInfo_btn:hover{
	background-color: rgb(222, 184, 135);
}

.delete_user_btn:hover{
	background-color: #c2787b;
}

</style>
<script type="text/javascript">

function alertMessage(msg){
	let modal = initModal('modal', 3);
	appendTitle(modal, '');
	setButton(modal, '닫기');
	setContent(modal, true, true);
	modalBlock();
	
	let modalBody = $('<div class="alertMessage">'+msg+'</div><br>')
	.addClass('send_modal_content');
	
	$('.modal_content').append(modalBody);
	
	$('.modal_left_btn').click(function() {
		modalNone();
	})
}

</script>
</head>
<body>
	<div id='modal'></div>
	<div id="bg" class="hidden"></div>
	<%@ include file="/WEB-INF/views/include/chat/chat2.jsp"%>
	<%@ include file="/WEB-INF/views/include/head/company-head.jsp"%>
	<div class="wrap">
		<div class="main">
			<div class="box1">
				<img src="../../../resources/image/돼지저금통.png" class="pig">
				<div id="infoicon">
					<i class="fas fa-clipboard-user"></i>
				</div>
				<div id="push">
					<div id="bell">
						<i class="fas fa-bell"></i>
					</div>
					<div id="basic">푸시알림</div>
					<div id="setting" onclick="createPushModal()">
						<i class="fas fa-cog"></i>
					</div>
					<div id="push_info">
						<i class="fas fa-question-circle"></i>
						<div class="balloon3">
							푸시알림 설정은 현재 접속환경의 설정만 <br> 변경하실 수 있습니다. <br>
							<br> *버튼이 동작하지 않을 시 새로고침을 눌러주세요.
						</div>
					</div>
				</div>
				<div id="company_user">업체 회원</div>
				<div class="myinfo">
					<div id="name">
						<div id="nameicon">
							<i class="far fa-user"></i>
						</div>
						<div id="user_name">${authentication.name}님</div>
						<div class="btn-info_wrap">
							<button type="button" class="btn btn-info open" id="myInfo_btn">
								내정보&nbsp<i class="fas fa-chevron-down"></i>
							</button>
							<button type="button" class="btn btn-info hidden modifyInfo_btn"
								id="modifyInfo_btn">정보수정</button>
							<button type="button" class="btn btn-info hidden delete_user_btn"
								id="delete_user_btn">회원탈퇴</button>
						</div>
						<div>
							<c:choose>
								<c:when test="${not empty linked}">
									<button type="button" class="btn btn-info" id="namebtn2"
										onclick="goMember()">일반전환</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="btn btn-info" id="namebtn2"
										onclick="changeNomal()">일반전환</button>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div id="grade">
						<c:choose>
							<c:when test="${authentication.grade eq 'NORMAL'}">
								<div id="normal">${authentication.grade}</div>
							</c:when>
							<c:when test="${authentication.grade eq 'BRONZE'}">
								<div id="bronze">${authentication.grade}</div>
							</c:when>
							<c:when test="${authentication.grade eq 'SILVER'}">
								<div id="silver">${authentication.grade}</div>
							</c:when>
							<c:when test="${authentication.grade eq 'GOLD'}">
								<div id="gold">${authentication.grade}</div>
							</c:when>
							<c:when test="${authentication.grade eq 'DIA'}">
								<div id="dia">${authentication.grade}</div>
							</c:when>
						</c:choose>
						<div id="gradetext">회원</div>
						<div id="gradeicon" type="button">
							<i class="fas fa-question-circle"></i>
							<div class="balloon">
								등급선정 기준 <br> <br> 1. 해협매칭 완료 후 거래완료 +3 <br> 2.
								서비스 후 평점에 따라 추가 점수 획득 <br> <br> ※ BRONZE:50점
								SILVER:100점 GOLD:200점 DIA:300점
							</div>
						</div>
					</div>
					<div id="infobox" onclick="location.href='/company/my'">
						<div id="infobox1">
							<div id="infobox1-1">해협</div>
							<div id="infobox1-2">
								<div id="orange">견적</div>
								<div id="basic">전달</div>
							</div>
							<div id="infobox1-3">${responseCntList[0]}건</div>
						</div>
						<div id="infobox2">
							<div id="infobox2-1">해협</div>
							<div id="infobox2-2">
								<div id="sky">완료</div>
								<div id="basic">성공</div>
							</div>
							<div id="infobox2-3">${responseCntList[1]}건</div>
						</div>
					</div>
				</div>


				<div id="line"></div>


				<div class="wallet">
					<div id="mywallet">
						<div id="walleticon">
							<i class="fas fa-wallet"></i>
						</div>
						<div id="wallettext">my월렛</div>
					</div>
					<div id="cash">
						<div id="cash_con">
							<div id="cashicon">
								<i class="fas fa-dollar-sign"></i>
							</div>
							<div>
								<div id="sky">현재 보유 캐시</div>
								<div id="basic" class="currentCash">${walletInfo.cash}</div>
							</div>
						</div>
						<div id="lock_con">
							<div id="lockicon">
								<i class="far fa-lock-alt"></i>
							</div>
							<div>
								<div id="lock_con-1">
									<div id="orange">거래 중 캐시</div>
									<div id="questionicon" type="button">
										<i class="fas fa-question-circle"></i>
										<div class="balloon2">
											거래 중 캐시는 진행 중인 서비스가 완료되면 <br> 현재 보유 캐쉬로 이전됩니다.
										</div>
									</div>
								</div>
								<div id="basic">${walletInfo.cashLock}</div>
							</div>
						</div>
					</div>
					<div id="account">
						<div id="myaccount" style="display: flex">
							<div id="accounttext">my계좌</div>
							<c:choose>
								<c:when test="${not empty walletInfo.bank}">
									<input id="accountinput"
										value=" [${walletInfo.bank}] ${walletInfo.bankNum}" readonly></input>
								</c:when>
								<c:otherwise>
									<input id="accountinput"
										placeholder="&nbsp&nbsp계좌 인증/등록이 필요합니다" readonly></input>
								</c:otherwise>
							</c:choose>
						</div>
						<div id="accountbtn">
							<div id="charge">
								<div id="plusicon">
									<i class="far fa-plus-square"></i>
								</div>
								<div class="accountbtntext" id="empty">충전하기</div>
							</div>
							<div id="send">
								<div id="minusicon" type="button"
									<c:choose>
								<c:when test="${not empty walletInfo.bank}">
									onclick="afterSendModal()"
								</c:when>
								<c:otherwise>
									onclick="beforeSendModal()"
								</c:otherwise>
							</c:choose>>
									<i class="far fa-minus-square"></i>
								</div>
								<div class="accountbtntext" id="basic">송금하기</div>
							</div>
						</div>
					</div>

				</div>
			</div>


			<div class="box2">
				<div class="box2_head">
					<div class="townhead">
						<div id="box2icon_town">
							<i class="fas fa-map-marker-alt"></i>
						</div>
						<div id="title1">my동네</div>
					</div>
					<div class="checklisthead">
						<div id="box2icon_check">
							<i class="fas fa-clipboard-check"></i>
						</div>
						<div id="title2" type="button">체크 리스트</div>
					</div>
				</div>
				<div class="box2_body">
					<div class="town">
						<div id="towninfo">
							<div id="towninfotext">
								탐색할 동네를 선택하세요<br>(최대 3개)
							</div>
							<div id="addtown_wrap">
								<div id="basic">동네 추가하기</div>
								<div id="addtown" type="button"
									onclick="createAddressFirstModal()">
									<i class="fal fa-plus-circle"></i>
								</div>
							</div>
						</div>
						<div id="townlist">
							<div id="townlist_con">
								<div id="list_wrap">
									<div id="listidx">1</div>
									<div id="listbody">
										<div id="address">${authentication.oldAddress}</div>
									</div>
									<div id="empty" type="button">
										<i class="fas fa-times-circle"></i>
									</div>
								</div>
								<c:if test="${not empty myAddress.address2}">
									<div id="list_wrap">
										<div id="listidx">2</div>
										<div id="listbody">
											<div id="address">${myAddress.address2}</div>
										</div>
										<i class="fas fa-trash" id="address2-remove-button"></i>
									</div>
								</c:if>

								<c:if test="${not empty myAddress.address3}">
									<div id="list_wrap">
										<div id="listidx">3</div>
										<div id="listbody">
											<div id="address">${myAddress.address3}</div>
										</div>
										<i class="fas fa-trash" id="address3-remove-button"></i>
									</div>
								</c:if>
							</div>
						</div>
					</div>
					<div class="checklist">
						<div id="checklist_wrap">
							<div id="score">
								<div id="score_head">
									<div id="tagicon">
										<i class="fas fa-tags"></i>
									</div>
									<!-- 나중에 버튼 다 빼기 -->
									<div class="temp_btn" type="button" id="basic">my평점</div>
								</div>
								<div id="score_star">
									<div id="score_num">${avgScore}</div>
									<div class="wrap-star">
										<div class='star-rating'>
											<span class="control_star" id="contorl_star"></span>
										</div>
									</div>
								</div>
								<div id="score_body">
									<div class="score_chart" id="chart"></div>
								</div>
							</div>
							<div id="specialty">
								<div id="specialty_head">
									<div id="tagicon">
										<i class="fas fa-tags"></i>
									</div>
									<div id="basic">my전문분야</div>
									<c:if test="${authentication.isPermit ne 1}">
									<div id="field_info">
										<i class="fas fa-exclamation-circle"></i>&nbsp; Look
										<div class="balloon4">
											승인 대기 중인 전문분야는 <br>
											<br> 관리자 승인 후 이용이 가능합니다.
										</div>
									</div>
									</c:if>
								</div>
							 <div id="specialty_body">
									<c:forEach items="${myField}" var="mf">
										<div id="item_wrap">
											<button type="button" id="specialty_item"
												class="btn btn-info">${mf}</button>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="delete_user hidden">
				<div class="delete_user_title">회원탈퇴</div>
				<div class="alert_wrap">
					<div class="alert_title" style="font-size: 19px;">※ 회원 탈퇴 시
						주의 사항</div>
					<div class="alert_title">
						1. 회원 탈퇴 후 재 가입 시,
						<div>&nbsp회원 등급이 초기화&nbsp</div>
						됩니다.
					</div>
					<div class="alert_title">
						2. 회원 탈퇴 시,
						<div>&nbsp작성한 모든 게시 글 및 댓글이 유지&nbsp</div>
						됩니다.
					</div>
					<div class="alert_title">
						3. 회원 탈퇴 시,
						<div>&nbsp현재 보유하고 있는 캐시가 소멸&nbsp</div>
						됩니다.
					</div>
				</div>
				<div class="check">
					<label><a>※ 1번 항목에 동의 하십니까?</a><input type="checkbox"
						id="check"></label> <label><a>※ 2번 항목에 동의 하십니까?</a><input
						type="checkbox" id="check2"></label> <label><a>※ 3번
							항목에 동의 하십니까?</a><input type="checkbox" id="check3"></label>
				</div>
				<div id="alert_check" class="hidden"
					style="color: red; margin-left: 348px; padding-top: 15px;">*
					탈퇴 진행을 원하신다면 모든 체크 박스를 선택해주세요.</div>
				<div class="delete_user_button">
					<button class="cancel">취소</button>
					<button class="confirm">회원탈퇴</button>
				</div>
			</div>
		</div>
		<c:if test="${not empty message}">
			<script>alertMessage('${message}')</script>
		</c:if>
	</div>
	<c:forEach items="${reviewCountMap}" var="rmap" varStatus="status">
			<input class="rmap" type="hidden" id="rev" value="${rmap.RE_CONTENT}">
			<input type="hidden" class="rcnt" id="cnt" value="${rmap.COUNT}">
	</c:forEach>
	<script type="text/javascript"
		src="../../../resources/js/include/head/menu_head.js"></script>
</body>
<script type="text/javascript" src="../../../resources/js/mypage/mypage_company.js"></script>
<script type="text/javascript"
	src="../../../resources/js/mypage/company_address_modal.js"></script>
<script type="text/javascript"
	src="../../../resources/js/mypage/push.js"></script>
<script type="text/javascript"
	src="../../../resources/js/include/chat/chat2.js"></script>

<script type="text/javascript"
	src="../../../resources/js/mypage/company_modal.js"></script>
<script type="text/javascript"
	src="../../../resources/js/mypage/requestToken.js"></script>
<script type="text/javascript"
	src="../../../resources/js/mypage/requestDelete.js"></script>
<!-- 토큰발급 -->
<script src="https://www.gstatic.com/firebasejs/5.5.9/firebase.js"></script>
<script src="../../../resources/js/include/push/getToken.js"></script>
<script src="../../../resources/js/include/push/tokenFetch.js"></script>
<script src="../../../resources/js/include/push/deleteFetch.js"></script>
<script type="text/javascript"
	src="../../../resources/js/mypage/resultPush.js"></script>
</html>