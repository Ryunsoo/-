<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head/main-head.jsp" %>
<link rel='stylesheet' href="../../../resources/css/member/join-form-next.css">
</head>
<body>
<div class="wrap">
	<div class="topBar">
		<div class="leftBox">
			<div class="MainLogoHelp"></div>
			<div class="login-page-left"></div>
		</div>

		<div class="rightBox">
			<div class="loginTitle">
				<div class="loginTopBlank"></div>
					<div>
						<form class="form-signin">
							<div class='progress_wrapper'>
                                <div class='progress_bar'>
                                    <div class='progress'></div>
                                </div>
                            </div>
							<label style="float: right; margin-right: 40px; margin-top: 5px;">100%</label><br>
						<div class="hr-sect">함께 &nbsp해협</div>
						
						<div class="idMargin">
							<label>* 이메일</label><br> 								
								<input type="text" class="form-control_all" name="username" placeholder="이메일을 입력하세요." 
									required="" autofocus="" /><br><br>
						</div>
						
						<div class="idMargin">
							<label>* 닉네임</label><br> 
								<input type="text" class="form-control_id" name="username" 
								placeholder="닉네임을 입력해주세요." required="" autofocus="" />
								
								<div class="check">
									<button class="button_check">중복확인</button>
								</div>
						</div>
						
						<div class="adressMargin">
							<label>* 주소</label><br> 
								<input type="text" class="form-control_adress" name="username" 
								placeholder="기본 주소를 입력해주세요." required="" autofocus="" />
								
								<input type="text" class="form-control_adress_check" name="username" 
								placeholder="우편번호	" required="" autofocus="" />
								
								<div class="check">
									<button class="button_adress_check">주소 찾기</button>
								</div>
								
								<input type="text" class="form-control_detail_adress" name="username" 
								placeholder="상세 주소를 입력해주세요." required="" autofocus="" />
						</div>
						
						<div>
							<button class="custom-btn btn-1">J O I N &nbsp U S</button>
						</div>
						
						
						<div class="next">
							<button class="button_next">< 이전</button>
						</div>
						
				</form>
			</div>
		</div>
	</div>
</div>
</div>
</body>
</html>