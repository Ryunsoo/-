<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="../../../resources/css/mypage/modal.css" type="text/css" rel="stylesheet">
<link href="../../../resources/css/include/head/menu_head.css" type="text/css" rel="stylesheet">
<link href="../../../resources/css/mypage/mypage_common_css.css" type="text/css" rel="stylesheet">
<link href="../../../resources/css/mypage/bootstrap.css" type="text/css" rel="stylesheet">
<link href="../../../resources/css/reset.css" type="text/css" rel="stylesheet">
<link rel='stylesheet' href="../../../resources/css/include/chat/chat.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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

.btn-info_wrap{
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	height: 100px;
	position: absolute;
	left: 260px;
	top: 50px;
}
.btn-info_wrap>button{
	border: thin;
}

.hidden{
	display: none;
}

.delete_user{
	position: absolute;
	z-index: 10;
	border: solid thin lightgray;
	border-radius: 15px;
	width: 800px;
	height: 600px;
	background-color: white;
	display: flex;
	flex-direction: column;
	color: black;
	font-weight: bold;
	left:50%; 
	transform:translateX(-50%);
	top:10%; 
	z-index: 2000;
	position: fixed;
}

.delete_user_title{
	font-weight: bold;
	text-align: center;
	font-size: 25px;
	color: black;
	margin-top: 15px;
}
.alert_wrap{
	border: solid thin lightgray;
	border-radius: 15px;
	width: 730px;
	height: 270px;
	background-color: white;
	margin-top: 20px;
	align-self: center;
	display: flex;
	flex-direction: column;
	justify-content: space-around;
}
.alert_wrap>div{
	display: flex;
	margin-left: 20px;
}
.alert_wrap>div>div{
	color: red;
}
.check{
	display: flex;
	flex-direction: column;
	align-self: flex-end;
	margin-right: 50px;
	margin-top: 20px;
	font-size: 19px;
	line-height: 2;
}

.check input{
	width: 15px;
	height: 15px;
	margin-top: 5px;
	margin-left: 15px;
}

.delete_user_button{
	align-self: flex-end;
	margin-right: 46px;
	display: flex;
	margin-top: 25px;
}
.delete_user_button>button{	
	border-radius: 10px;
	width: 100px;
	height: 40px;
	align-self: flex-end;
	font-size: 17px;
	margin-left: 20px;
	font-weight: bold;
	color: white;
}


.cancel{
	background-color: rgb(41, 128, 185);
}

.confirm{
	background-color: #de4434;
}

.cancel:focus{
  color: white;
  background-color: rgb(87, 153, 167);
  border-color: rgb(87, 153, 167);
  box-shadow: 0 0 0 0.25rem rgba(211, 212, 213, 0.5);
}

.cancel:hover{
  color: white;
  background-color: rgb(87, 153, 167);
  border-color: rgb(87, 153, 167);
}

.cancel:checked{
  color: white;
  background-color: rgb(87, 153, 167);
  border-color: rgb(87, 153, 167);
}

.confirm:hover {
	color: #fff;
	background-color: #c2787b;
	border-color: #b67174;
}
.confirm:focus {
	color: #fff;
	background-color: #cf8083;
	border-color: #c2787b;
	box-shadow: 0 0 0 0.25rem rgba(245, 166, 169, 0.5);
}
.confirm:checked {
	color: #fff;
	background-color: #c2787b;
	border-color: #b67174;
}

#bg{
	position: fixed;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background-color: rgb(0, 0, 0, 0.5);
	z-index: 2000;
}
.hidden {
	display: none;
}

.delete_modal{
	display: none;
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	border: 1px solid gray;
	border-radius: 15px;
	background-color: white;
	box-shadow: 0 0 5px 3px #999999;
	z-index: 999;
}
.bye{
	text-align: center;
	font-weight: bold;
	font-size: 20px;
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
.modal_left_btn {
	/* margin-right: 30px; */
}

.alertMessage {
	text-align: center;
	font-size: 20px;
	font-weight: bold;
}

#address2-remove-button, 
#address3-remove-button {
	cursor: pointer;
}

.friend_btn_wrap {
    display: flex;
    width: 190px;
    justify-content: space-around;
    margin-left: 10px;
}

</style>
</head>
<body>
<div id='modal'></div>
<div id="bg" class="hidden"></div>
<div class="wrap">
	<%@ include file="/WEB-INF/views/include/head/menu-head.jsp" %>
	<div class="main">
		<div class="box1">
			<img src="../../../resources/image/돼지저금통.png" class="pig">
			<div id="infoicon"><i class="fas fa-clipboard-user"></i></div>
			<div id="push">
				<div id="bell"><i class="fas fa-bell"></i></div>
				<div id="basic">푸시알림</div>
				<div id="setting" onclick="createPushModal()"><i class="fas fa-cog"></i></div>
				<div id="push_info">
					<i class="fas fa-question-circle"></i>
					<div class="balloon3">
						푸시알림 설정은 현재 접속환경의 설정만
						<br>
						변경하실 수 있습니다.
						<br><br>
						*버튼이 동작하지 않을 시 새로고침을 눌러주세요.
					</div>
				</div>
			</div>
			<div class="myinfo">
				<div id="name">
					<div id="nameicon"><i class="far fa-user"></i></div>
					<div id="user_name">${authentication.name} 님</div>
					<div class="btn-info_wrap">
						<button type="button" class="btn btn-info open" id="myInfo_btn">내정보&nbsp<i class="fas fa-chevron-down"></i></button>
						<button type="button" class="btn btn-info hidden modifyInfo_btn" id="modifyInfo_btn" onclick="modif()">정보수정</button>

						<button type="button" class="btn btn-info hidden delete_user_btn" id="delete_user_btn">회원탈퇴</button>
					
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
							등급선정 기준
							<br>
							<br>
							1. 공동구매 거래 참여 후 완료시 +1
							<br>
							2. 공동구매 거래 모집 후 완료시 +3
							<br>
							<br>
							※ BRONZE:50점      SILVER:100점      GOLD:200점      DIA:300점
						</div>
					</div>
				</div>
				<div id="infobox">
					<div id="infobox1">
						<div id="infobox1-1">공구</div>
						<div id="infobox1-2">
							<div id="orange">모집</div>
							<div id="basic">성공</div>
						</div>
						<div id="infobox1-3">2건</div>
					</div>
					<div id="infobox2">
						<div id="infobox2-1">공구</div>
						<div id="infobox2-2">
							<div id="sky">참여</div>
							<div id="basic">성공</div>
						</div>
						<div id="infobox2-3">5건</div>
					</div>
				</div>
			</div>
			
			
			<div id="line"></div>
			
			
			<div class="wallet">
				<div id="mywallet">
					<div id="walleticon"><i class="fas fa-wallet"></i></div>
					<div id="wallettext">my월렛</div>
				</div>
				<div id="cash">
					<div id="cash_con">
						<div id="cashicon"><i class="fas fa-dollar-sign"></i></div>
						<div>
							<div id="sky">현재 보유 캐시</div>
							<div id="basic" class="currentCash">${walletInfo.cash}</div>
						</div>
					</div>
					<div id="lock_con">
						<div id="lockicon"><i class="far fa-lock-alt"></i></div>
						<div>
							<div id="lock_con-1">
								<div id="orange">거래 중 캐시</div>
								<div id="questionicon" type="button">
									<i class="fas fa-question-circle"></i>
									<div class="balloon2">
										현재 진행중인 공동구매, 혹은 해협이 있어
										<br>
										해당 금액은 송금하실 수 없습니다.
									</div>
								</div>
							</div>
							<div id="basic">${walletInfo.cashLock}</div>
						</div>
					</div>
				</div>
				<div id="account">
					<div id="myaccount" style="display:flex">
						<div id="accounttext">my계좌</div>
						<c:choose>
							<c:when test="${not empty walletInfo.bank}">
								<input id="accountinput" value=" [${walletInfo.bank}] ${walletInfo.bankNum}" readonly></input>
							</c:when>
							<c:otherwise>
								<input id="accountinput" placeholder="&nbsp&nbsp계좌 인증/등록이 필요합니다" readonly></input>
							</c:otherwise>
						</c:choose>
					</div>
					<div id="accountbtn">
						<div id="charge">
							<div id="plusicon" type="button" 
							<c:choose>
								<c:when test="${not empty walletInfo.bank}">
									onclick="createChargingModal()"
								</c:when>
								<c:otherwise>
									onclick="beforeSendModal()"
								</c:otherwise>
							</c:choose>><i class="far fa-plus-square"></i></div>
							<div class="accountbtntext" id="basic">충전하기</div>
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
							</c:choose>><i class="far fa-minus-square"></i></div>
							<div class="accountbtntext" id="basic">송금하기</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
		
		
		<div class="box2">
			<div class="box2_head">
				<div class="townhead">
					<div id="box2icon"><i class="fas fa-map-marker-alt"></i></div>
					<div id="title1">my동네</div>
				</div>
				<div class="neighborhead">
					<div id="box2icon"><i class="fas fa-user-plus"></i></div>
					<div id="title2" type="button">이웃 리스트</div>
				</div>
			</div>
			<div class="box2_body">
				<div class="town">
					<div id="towninfo">
						<div id="towninfotext">탐색할 동네를 선택하세요<br>(최대 3개)</div>
						<div id="addtown_wrap">
							<div id="basic">동네 추가하기</div>
							<div id="addtown" type="button" onclick="createAddressFirstModal()"><i class="fal fa-plus-circle"></i></div>
						</div>
					</div>
					<div id="townlist">
						<div id="townlist_con">
								<div id="list_wrap">
									<div id="listidx">1</div>
									<div id="listbody"><div id="address">${authentication.oldAddress}</div></div>
									<i class="fas fa-trash" id="address1-remove-button" style="color: white"></i>
								</div>
								
								<c:if test="${not empty myAddress.address2}"> 
									<div id="list_wrap">
										<div id="listidx">2</div>
										<div id="listbody"><div id="address">${myAddress.address2}</div></div>
										<i class="fas fa-trash" id="address2-remove-button"></i>
									</div>
								</c:if>
								
								<c:if test="${not empty myAddress.address3}"> 
									<div id="list_wrap">
										<div id="listidx">3</div>
										<div id="listbody"><div id="address">${myAddress.address3}</div></div>
										<i class="fas fa-trash" id="address3-remove-button"></i>
									</div>
								</c:if>
						</div>	
					</div>
				</div>
				<div class="neighbor">
					<div id="neighbor_list">
						<c:forEach items="${friendList}" var="fl">
							<div id="neighbor_wrap">
								<div id="neighboricon">
									<i class="fas fa-tags"></i>
								</div>
                              	<div id="neighborname">${fl.nickname}</div>   
                              	<div class="friend_btn_wrap">                  
								<div>
									<button id="memo" class="btn btn-info">메모</button>
									<form action="/mypage/memo" method="post">
										<div id="input_memo_wrap" class="hidden">
                              				<textarea id="input_memo" name="memo" cols="30" rows="3">${fl.memo}</textarea>                 
                              				<textarea class="hidden" id="freindId" name="friendId" cols="30" rows="3">${fl.friendId}</textarea>                 
											<button class="btn btn-info" id="confirm" type="submit">저장</button>
										</div>
									</form>
								</div>
								<div>
									<button type="button" id="chat" class="btn btn-warning">채팅</button>
								</div>
								<div>
									<button type="button" id="delete" class="btn btn-secondary">삭제</button>
								</div>
								</div>
							</div>	
						</c:forEach>
					</div>
				</div>
			</div>	
		</div>
		<div class="delete_user hidden">
			<div class="delete_user_title">회원탈퇴</div>
			<div class="alert_wrap">
				<div class="alert_title" style="font-size: 19px;">※ 회원 탈퇴 시 주의 사항</div>
				<div class="alert_title">1. 회원 탈퇴 후 재 가입 시, <div>&nbsp회원 등급이 초기화&nbsp</div> 됩니다.</div>
				<div class="alert_title">2. 회원 탈퇴 시, <div>&nbsp작성한 모든 게시 글 및 댓글이 유지&nbsp</div>됩니다.</div>
				<div class="alert_title">3. 회원 탈퇴 시, <div>&nbsp현재 보유하고 있는 캐시가 소멸&nbsp</div>됩니다.</div>
			</div>
			<div class="check">
				<label><a>※ 1번 항목에 동의 하십니까?</a><input id="check" type="checkbox"></label>
				<label><a>※ 2번 항목에 동의 하십니까?</a><input id="check2" type="checkbox"></label>
				<label><a>※ 3번 항목에 동의 하십니까?</a><input id="check3" type="checkbox"></label>
			</div>
			<div id="alert_check" class="hidden" style="color: red;margin-left:348px; padding-top:15px;">* 탈퇴 진행을 원하신다면 모든 체크 박스를 선택해주세요.</div>
			<div class="delete_user_button">
				<button class="cancel" >취소</button>
				<button class="confirm">회원탈퇴</button>
			</div>
		</div>
	</div>
	<c:if test="${not empty message}">
		<script>alertMessage('${message}')</script>
	</c:if>
</div>
<div style="display:none" class="temp_address"></div>
<div id="token" style="display:none"></div>
<script type="text/javascript">


		let memo = document.querySelectorAll('#input_memo_wrap');
		let memo_btn = document.querySelectorAll("#memo");
		let save_memo_btn = document.querySelectorAll("#confirm");
		let delete_btn = document.querySelectorAll("#delete");
		let neighborname = document.querySelectorAll("#neighborname");

		
		/* memo */
		console.dir(memo);
		console.dir(memo_btn);
		
		for(let i = 0; i <memo.length; i++){
			let friendId = neighborname[i].innerText;
			
			memo_btn[i].addEventListener("click", () => {
				memo[i].classList.remove("hidden");
			})
			
			delete_btn[i].addEventListener("click", () => {
				
				console.dir("얄루 : " + friendId);
				
				 fetch('/mypage/delete-friend?friendId=' + friendId)
				  .then(res=> res.text())
					.then(text=> {
						if(text) {
							
								let modal = initModal('modal', 3);
								appendTitle(modal, '');
								setButton(modal, '닫기');
								setContent(modal, true, true);
								modalBlock();
								
								let modalBody = $('<div class="alertMessage">삭제 되었습니다.</div><br>')
								.addClass('send_modal_content');
								
								$('.modal_content').append(modalBody);
								
								$('.modal_left_btn').click(function() {
									modalNone();
									location.href='mypage-common';
								})
							}
				 	
		})
	})
}
		const myInfo_btn = document.querySelector("#myInfo_btn");
        const modifyInfo_btn = document.querySelector("#modifyInfo_btn");
        const delete_user_btn = document.querySelector("#delete_user_btn");
        const bg = document.querySelector("#bg");
        const delete_user = document.querySelector(".delete_user");
		const cancel = document.querySelector(".cancel");
        const confirm = document.querySelector(".confirm");
        const wrap = document.querySelector(".wrap");
        
        /* 내정보 하위 버튼 */
        myInfo_btn.addEventListener("mouseover",function(){
        	modifyInfo_btn.classList.remove("hidden");
        	delete_user_btn.classList.remove("hidden");
        });
        
        /* 정보 수정 버튼 */
        modifyInfo_btn.addEventListener("click",function(){
        	location.href='/mypage/modify-info';
        });
        
        /* div class wrap부분 누르면 하위 버튼들 사라짐 */
        wrap.addEventListener("click",function(){
        	modifyInfo_btn.classList.add("hidden");
        	delete_user_btn.classList.add("hidden");
        });
        
        /* 탈퇴 버튼 */
        delete_user_btn.addEventListener("click",function(){
        	bg.classList.remove("hidden");
        	modifyInfo_btn.classList.add("hidden");
        	delete_user_btn.classList.add("hidden");
        	delete_user.classList.remove("hidden");
        });	
        
        /* 탈퇴취소 */
        cancel.addEventListener("click",function(){
        	bg.classList.add("hidden");
        	delete_user.classList.add("hidden");
        });	
    	
        	  
        /* 탈퇴 가즈아 */
        confirm.addEventListener("click",function(){
        	
        	const isChecked = document.querySelector("#check").checked;
        	const isChecked2 = document.querySelector("#check2").checked;
        	const isChecked3 = document.querySelector("#check3").checked;
        	const alert_check = document.querySelector("#alert_check");	
        	
        	/* 3가지 항목이 모두 체크되었을 때 탈퇴진행 */
  			console.dir(isChecked);
        		if(isChecked == true & isChecked2 == true & isChecked3 == true){
        			location.href='/member/delete-user';
        			bg.classList.add("hidden");
                	delete_user.classList.add("hidden");
        	    }else{
        	        const alert_check = document.querySelector("#alert_check");
        	        alert_check.classList.remove("hidden");
					console.dir("할루");
        	    }
        });


</script>
<%@ include file="/WEB-INF/views/include/chat/chat.jsp" %>
</body>
<script type="text/javascript" src="../../../resources/js/mypage/address_modal.js"></script>
<script type="text/javascript" src="../../../resources/js/include/chat/chat.js"></script>

<script type="text/javascript" src="../../../resources/js/mypage/common_modal.js"></script>
<script type="text/javascript" src="../../../resources/js/mypage/requestToken.js"></script>
<script type="text/javascript" src="../../../resources/js/mypage/requestDelete.js"></script>
<!-- 토큰발급 -->
<script src="https://www.gstatic.com/firebasejs/5.5.9/firebase.js"></script>
<script src="../../../resources/js/include/push/getToken.js"></script>
<script src="../../../resources/js/include/push/tokenFetch.js"></script>
<script src="../../../resources/js/include/push/deleteFetch.js"></script>
<script type="text/javascript" src="../../../resources/js/mypage/resultPush.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</html>