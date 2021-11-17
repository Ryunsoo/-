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
							<div id="basic">${walletInfo.cash}</div>
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
								<input id="accountinput" value=" [${walletInfo.bank}] ${walletInfo.bankNum}"></input>
							</c:when>
							<c:otherwise>
								<input id="accountinput" placeholder="&nbsp&nbsp계좌 인증/등록이 필요합니다" readonly></input>
							</c:otherwise>
						</c:choose>
					</div>
					<div id="accountbtn">
						<div id="charge">
							<div id="plusicon" type="button" onclick="beforeSendModal()"><i class="far fa-plus-square"></i></div>
							<div class="accountbtntext" id="basic">충전하기</div>
						</div>
						<div id="send">
							<div id="minusicon" type="button" onclick="afterSendModal()"><i class="far fa-minus-square"></i></div>
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
								<div id="empty" type="button"><i class="fas fa-times-circle"></i></div>
							</div>
						</div>	
					</div>
				</div>
				<div class="neighbor">
					<div id="neighbor_list">
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
</div>
<div style="display:none" class="temp_address"></div>
<div id="token" style="display:none"></div>
<script type="text/javascript">
/* 이웃리스트 추가  */
document.querySelector("#title2").addEventListener('click', e => {
	/* 새로운 이웃wrap */
	let newNeighbor = document.createElement("div");
	newNeighbor.setAttribute("id", 'neighbor_wrap');
	document.querySelector("#neighbor_list").appendChild(newNeighbor);
	/* 새로운 이웃icon */
	let newNeighborIcon = document.createElement("div");
	newNeighborIcon.setAttribute("id", 'neighboricon');
	newNeighborIcon.innerHTML = '<i class="fas fa-tags"></i>';
	newNeighbor.appendChild(newNeighborIcon);
	/* 새로운 이웃name */
	let newNeighborName = document.createElement("div");
	newNeighborName.setAttribute("id", 'neighborname');
	newNeighborName.innerHTML = '구짱';
	newNeighbor.appendChild(newNeighborName);
	/* 새로운 이웃memo */
	let newNeighborMemo = document.createElement("div");
	newNeighbor.appendChild(newNeighborMemo);
	/* memo만들기 */
	let memo = document.createElement("button");
	memo.setAttribute("id","memo");
	memo.setAttribute("class","btn btn-info");
	memo.innerHTML = '메모';
	newNeighborMemo.appendChild(memo);
	memo.addEventListener('click', () => {
		inputMemoWrap.setAttribute("style","display:block");
	})
	/* textarea_wrap만들기 */
	let inputMemoWrap = document.createElement("div");
	inputMemoWrap.setAttribute("id","input_memo_wrap");
	inputMemoWrap.setAttribute("style","display:none");
	newNeighborMemo.appendChild(inputMemoWrap);
	/* 새로운 이웃memo_textarea */
	let newTextarea = document.createElement("textarea");
	newTextarea.setAttribute("id", "input_memo");
	newTextarea.setAttribute("cols", '30');
	newTextarea.setAttribute("rows", '3');
	inputMemoWrap.appendChild(newTextarea);
	/* 새로운 이웃memo_button */
	let newTextButton = document.createElement("button");
	newTextButton.setAttribute("class", "btn btn-info");
	newTextButton.setAttribute("id", 'confirm');
	newTextButton.innerHTML = '저장';
	inputMemoWrap.appendChild(newTextButton);
	newTextButton.addEventListener('click', () => {
		inputMemoWrap.setAttribute("style","display:none");
	})
	/* 새로운 이웃chat */
	let newNeighborChat = document.createElement("div");
	newNeighborChat.innerHTML = '<button type="button" id="chat" class="btn btn-warning">채팅</button>';
	newNeighbor.appendChild(newNeighborChat);
	/* 새로운 이웃delete */
	let newNeighborDelete = document.createElement("div");
	newNeighborDelete.innerHTML = '<button type="button" id="delete" class="btn btn-secondary">삭제</button>';
	newNeighbor.appendChild(newNeighborDelete);
	newNeighborDelete.addEventListener('click', () => {
		newNeighbor.remove();
	})
})

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

/* document.querySelector("#addtown").addEventListener('click', e => {
	let idx = document.querySelectorAll('#list_wrap').length + 1;
	if(idx > 3) {
		alert("동네는 최대 3개까지만 추가할 수 있습니다.");
	}else {
		let inputAddress = prompt("주소를 입력하세요");
		if(inputAddress == "") {
			alert("주소를 입력해주세요.");
		}else if(inputAddress != "") {
			let listWrap = document.createElement("div");
			listWrap.setAttribute("id", 'list_wrap');
			document.querySelector("#townlist_con").appendChild(listWrap);
			let listIdx = document.createElement("div");
			listIdx.setAttribute("id", 'listidx');
			listIdx.innerHTML = `${idx}`;
			listWrap.appendChild(listIdx);
			let listBody = document.createElement("div");
			if(idx == 2) {
				listBody.setAttribute("id", 'listbody2');
			}else if(idx == 3) {
				listBody.setAttribute("id", 'listbody3');
			}
			listBody.innerHTML = `<div id="address">${inputAddress}</div>`;
			listWrap.appendChild(listBody);
			let listDelete = document.createElement("div");
			listDelete.setAttribute("id", 'listdelete');
			listDelete.setAttribute("type", 'button');
			listDelete.innerHTML = '<i class="fas fa-times-circle"></i>';
			listWrap.appendChild(listDelete);
			listDelete.addEventListener('click', () => {
				listWrap.remove();
			})
		}
	}
}) */ 

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
</html>