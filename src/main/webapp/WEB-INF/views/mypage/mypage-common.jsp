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
<link rel='stylesheet' href="../../../resources/css/chat/chat.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id='modal'></div>
<div class="wrap">
	<%@ include file="/WEB-INF/views/include/head/menu-head.jsp" %>
	<div class="main">
		<div class="box1">
			<img src="../../../resources/image/돼지저금통.png" class="pig">
			<div id="infoicon"><i class="fas fa-clipboard-user"></i></div>
			<div class="myinfo">
				<div id="name">
					<div id="nameicon"><i class="far fa-user"></i></div>
					<div id="user_name">권구현님&nbsp(GuHyun)</div>
					<div><button type="button" class="btn btn-info" id="namebtn">내정보&nbsp<i class="fas fa-chevron-down"></i></button></div>
				</div>
				<div id="grade">
					<div id="gold">GOLD</div>
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
							<div id="basic">25,000</div>
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
							<div id="basic">13,000</div>
						</div>
					</div>
				</div>
				<div id="account">
					<div id="myaccount" style="display:flex">
						<div id="accounttext">my계좌</div>
						<input id="accountinput" placeholder="&nbsp&nbsp계좌 인증/등록이 필요합니다"></input>
					</div>
					<div id="accountbtn">
						<div id="charge">
							<div id="plusicon" type="button" onclick="createChargingModal()"><i class="far fa-plus-square"></i></div>
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
								<div id="listbody"><div id="address">성남시 중원구 성남동</div></div>
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
	</div>

</div>
<div style="display:none" class="temp_address"></div>

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
<script type="text/javascript" src="../../../resources/js/mypage/common_modal.js"></script>
<script type="text/javascript" src="../../../resources/js/chat/chat.js"></script>
</html>