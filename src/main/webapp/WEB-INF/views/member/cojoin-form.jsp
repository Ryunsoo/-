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
  margin: 2px 0px 0px 5px;
}

input:focus {outline:none;}

</style>
</head>
<body>
<div class="wrap">
	<div class="topBar">
		<div class="leftBox">
			<div class="MainLogoHelp" style="cursor: pointer;" onclick="location.href='/'"></div>
			<div class="login-page-left"></div>
		</div>

		<div class="rightBox">
			<div class="loginTitle">
				<div class="loginTopBlank"></div>
					<div>
						<form:form modelAttribute="joinForm" class="form-signin"
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
								<label>* 아이디 &nbsp&nbsp 
								<span style="font-size: 13px; color: red;" id="idCheck"></span>
								<form:errors path="id" cssClass="valid-msg"/></label><br> 
									<input type="text" id="id" class="form-control_id" name="id"
									placeholder="아이디를 입력해주세요." required autocomplete="off" 
									<c:if test="${empty error.id}">
										value = "${joinForm.id}"
									</c:if>/>
									<div class="check">
										<button type="button" id="btnIdCheck" class="button_check">중복확인</button>
									</div>
							</div>
							
							<div class="passwordMargin">
								<div class='pw_top'>
									<label>* 비밀번호</label>
									<div class='pw_validator_bar'>
										<div class='low'></div>
										<div class='middle'></div>
										<div class='high'></div>
									</div>
									<div class="level">
										<label id="validator_bar_text" style="font-weight: 1000"></label>
									</div>
									<span style="font-size: 13px; color: red; margin-top: 2px; margin-left: 10px;" id="pwCheck"></span>
									<form:errors path="password" cssClass="valid-msg"/>
								</div>
								<input type="password" id="password" class="form-control-pw-top" name="password"
								placeholder="비밀번호(영문 + 숫자 + 특수문자 8자 이상)" required/>
								<input type="password" id="password_check" class="form-control-pw-btm" placeholder="비밀번호 확인" required/>
							</div>
							
							<div class=nameMargin>
								<label>* 대표자명
								<form:errors path="name" cssClass="valid-msg"/></label><br>
									<input type="text" class="form-control_all" id="name" name="name" placeholder="이름을 입력해주세요." 
									<c:if test="${empty error.name}">
										value = "${joinForm.name}"
									</c:if>
									required autocomplete="off" /><br><br>
							</div>
							
							<div class=tellMargin>
								<label>* 전화번호<form:errors path="tell" cssClass="valid-msg"/></label><br>
									<input type="text" class="form-control_all" id="tell" name="tell" 
									<c:if test="${empty error.tell}">
										value = "${joinForm.tell}"
									</c:if>
									placeholder="숫자만 입력해주세요." required autocomplete="off" /><br>
							</div>
						</div>
						
						
						<div class="next">
							<button class="button_next" id="next_btn" type="submit">다음 ></button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript" src="${contextPath}/resources/js/member/cojoin-form.js"></script>

</body>
</html>