<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head/main-head.jsp" %>
<link rel='stylesheet' href="../../../resources/css/member/cojoin-form-last.css">
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
						<form class="form-signin" action="/member/cjoin" method="post" enctype="multipart/form-data">
							<progress class="signUpProgressBar" value='100' max='100'></progress><br>
							<label style="float: right; margin-right: 70px; margin-top: 5px;">100%</label><br>
							
						<div class="hr-sect">전문 &nbsp해협</div><br>
							<div class="select_wrap" id="onepage">
								<div id="prev_page" style="cursor: pointer; visibility: hidden;"><</div>
								<div class="select_form">
									<div class="field">
										<label style="font-size: 13px">* 전문 분야</label><br>
									</div>
									
									<c:forEach items="${categoryList}" var="cl" end="2">
										<div class="category">
											<label>${cl}</label>
										</div>
										
										<div class="bathroom_check">
											<c:forEach items="${fieldList}" var="fl">
												<c:if test="${cl eq fl.fieldCategory}">
														<label><input type="checkbox" name="fieldName" 
														value="${fl.field}"> ${fl.field}</label>							
												</c:if>
											</c:forEach>
										</div>
									</c:forEach>
								</div>
								<div id="next_page" style="cursor: pointer" onclick="next()">></div>
							</div>
							
							<div class="next_select_wrap" id="twopage">
								
								<div id="prev_page" style="cursor: pointer" onclick="prev()"><</div>
								<div class="select_form">
								<div class="field">
									<label style="font-size: 13px">* 전문 분야</label><br>
								</div>
								
								<c:forEach items="${categoryList}" var="cl" begin="3">
										<div class="category">
											<label>${cl}</label>
										</div>
										
										<div class="bathroom_check">
											<c:forEach items="${fieldList}" var="fl">
												<c:if test="${cl eq fl.fieldCategory}">
														<label><input type="checkbox" name="fieldName" value="${fl.field}"> ${fl.field}</label>							
												</c:if>
											</c:forEach>
										</div>
								</c:forEach>
								
							</div>
							<div id="next_page" style="cursor: pointer; visibility: hidden;" >></div>
							</div>
				
							<div class="businessRegistration">
									<label style="font-size: 13px">* 사업자 등록증 및 자격증명서</label>
									<div class="inputMargin">
										<input type="text" class="form-control_id" id="filename" name="username" 
											placeholder="파일을 첨부해주세요" required autofocus readonly />
									</div>
									
									<div>
										<div class="check">
											<button type="button" id="fileCheck" class="button_adress_check" onclick="document.all.file.click()">파일 첨부</button>
										</div>
										<input type="file" style="display: none" id='file' name='files' multiple/>
									</div>
							</div>
							
							<div>
								<div>
									<button type="submit" class="custom-btn btn-1">J O I N &nbsp U S</button>
								</div>
								<div class="before_left">
									<button class="button_next">< 이전</button>
								</div>
							</div>
							
						</form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>

<script type="text/javascript">

	function next(){
		document.getElementById("onepage").style.display = "none";
		document.getElementById("twopage").style.display = "flex";
	}
	
	function prev(){
		document.getElementById("onepage").style.display = "flex";
		document.getElementById("twopage").style.display = "none";
	}
	
	document.getElementById("file").addEventListener("change", e => {
		document.getElementById("filename").value = e.target.files[0].name;
	});
	

	
</script>
</html>