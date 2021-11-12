<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head/main-head.jsp" %>
<link rel='stylesheet' href="../../../resources/css/member/cojoin-form.css">
<style type="text/css">

.valid-msg{
  font-size: 13px; 
  color: red;
}

</style>
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
						<form:form modelAttribute="cjoinForm" class="form-signin"
						 method="post" action="/member/cojoin-form-next">
							<div class='progress_wrapper'>
								<div class='progress_bar'>
									<div class='progress'></div>
								</div>
							</div>
						<label style="float: right; margin-right: 40px; margin-top: 5px;">33%</label><br>
						<div class="hr-sect">전문 &nbsp해협</div>
						<div class='input_wrapper'>
							<div class="idMargin">
								<label>* 아이디</label>
								<form:errors path="id" cssClass="valid-msg"/><br> 
									<input type="text" class="form-control_id" name="id" 
									placeholder="아이디를 입력해주세요." required autocomplete="off"/>
									
									<div class="check">
										<button class="button_check">중복확인</button>
									</div>
							</div>
							
							<div class="passwordMargin">
								<div class='pw_top'>
									<label>* 비밀번호 
									<form:errors path="password" cssClass="valid-msg"/></label>
									<div class='pw_validator_bar'>
										<div class='low'></div><div class='middle'></div><div class='high'></div>
									</div>
									<div class="level">
										<label style="color: red; font-weight: 1000">낮음</label>
										<label style="color: #FBB117; font-weight: 1000">보통</label>
										<label style="color: #4CC417; font-weight: 1000">높음</label>
									</div>
								</div>
								<input type="password" class="form-control-pw-top" name="password" 
								placeholder="비밀번호(영문 + 숫자 + 특수문자 8자 이상)" required="" autofocus="" />
								
								<input type="password" class="form-control-pw-btm" name="confirmPw" 
								placeholder="비밀번호 확인" required=""autofocus="" />
							</div>
							
							<div class=nameMargin>
								<label>* 대표자명</label><br>
									<input type="text" class="form-control_all" name="name" placeholder="이름을 입력해주세요." required="" autofocus="" /><br><br>
							</div>
							
							<div class=tellMargin>
								<label>* 전화번호<form:errors path="tell" cssClass="valid-msg"/></label><br>
									<input type="text" class="form-control_all" name="tell" placeholder="010-1234-5678" required="" autofocus="" /><br>
							</div>
						</div>
						
						<div class="next">
							<button class="button_next" type="submit">다음 ></button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>