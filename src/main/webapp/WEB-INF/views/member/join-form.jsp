<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head/main-head.jsp" %>
<link rel='stylesheet' href="../../../resources/css/member/join-form.css">

<style type="text/css">

.valid-msg{
  font-size: 13px; 
  color: red;
}

input:focus {outline:none;}

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
						<form:form modelAttribute="joinForm"
						class="form-signin" action="/member/join-form-next" method="post">
							<div class='progress_wrapper'>
								<div class='progress_bar'>
									<div class='progress'></div>
								</div>
							</div>
						<label style="float: right; margin-right: 40px; margin-top: 5px;">50%</label><br>
						<div class="hr-sect">함께 &nbsp해협</div>
						<div class='input_wrapper'>
							<div class="idMargin">
								<label>* 아이디 &nbsp&nbsp 
								<span style="font-size: 13px; color: red;" id="idCheck"></span>
								<form:errors path="id" cssClass="valid-msg"/></label><br> 
									<input type="text" id="id" class="form-control_id" name="id" value="15151515151"
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
								<input type="password" id="password" class="form-control-pw-top" name="password" value="asdf1234!@#$"
								placeholder="비밀번호(영문 + 숫자 + 특수문자 8자 이상)" required/>
								<input type="password" id="password_check" class="form-control-pw-btm" placeholder="비밀번호 확인" value="asdf1234!@#$" required/>
							</div>
							
							<div class=nameMargin>
								<label>* 이름</label><br>
									<input type="text" id="name" class="form-control_all" name="name" placeholder="이름을 입력해주세요." required autocomplete="off" value="123"/><br><br>
							</div>
							
							<div class=tellMargin>
								<label>* 전화번호 <form:errors path="tell" cssClass="valid-msg"/></label><br>
									<input type="text" id="tell" class="form-control_all" name="tell" placeholder="숫자만 입력해주세요." required autocomplete="off" value="01011111111"/><br>
							</div>
						</div>
						
						<div class="form_bottom">
							<button class='switch_company_join' onclick="location.href = '/member/cojoin-form'"><div></div></button>
							<button type="submit" class="button_next" id="next_btn">다음 ></button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>



<script type="text/javascript" src="${contextPath}/resources/js/member/joinForm.js"></script>


</body>


</html>