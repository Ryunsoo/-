<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head/company-head.jsp" %>
<link rel="stylesheet" href="${contextPath}/resources/css/company/help-join.css">
<link rel='stylesheet' href="../../../resources/css/include/chat/chat.css">
</head>
<body>
<%@ include file="/WEB-INF/views/include/chat/chat2.jsp" %>
	<div class='main'>
	
		<!-- 사이트 메뉴(조회해협 & MY 해협) -->
		<!-- <aside> -->
		<div class='aside'>
			<button class="help_list">조회 해협</button>
			<button class="my_help">MY 해협</button>
		</div>
		<!-- </aside> -->
		<div class='section'>
			<div class='wrapper'>
				<div class='menu_title'>해협 참가 신청</div>
				<form:form modelAttribute="responseForm" action="/company/upload-estimate?reqIdx=${reqIdx}" method="post" enctype="multipart/form-data">
					<div class='content_wrapper'>
						<div class='content_left'>
							<div class='file_img'>
								<div class='file'></div>
								<div class='deco'></div>
							</div>
							<div class='upload'>
								<label class='upload_icon' for="input-file"><img src='../../../resources/image/upload-folder.png'><!-- <i class="fas fa-folder-plus"></i> --></label>
								<label class='upload_label' for="input-file">견적서 업로드</label>
								<form:errors path="files" cssClass="upload_valid"></form:errors>
							</div>
								<input type="file" name='files' id='input-file' accept="image/*,.pdf" onchange='setPreview(event);' style="visibility: hidden;">
						</div>
						<div class='content_right'>
							<div class='inp_title'>* 업체명</div>
							<input type="text" value='${authentication.company}' readonly>
							<div class='inp_title'>* 연락처</div><form:errors path="resTell" cssClass="valid_msg"></form:errors>
							<input type="tel" name='resTell' placeholder="연락 가능한 전화번호를 입력하세요."
								<c:if test="${empty error.resTell}">
									value="${responseForm.resTell}"
								</c:if>
							required>
							<div class='inp_title'>* 원하는 시간</div><form:errors path="resTime" cssClass="valid_msg"></form:errors>
							<input type="datetime-local" name='resTime'
								<c:if test="${empty error.resTime}">
									value="${responseForm.resTime}"
								</c:if>
							required>
							<div class='inp_title'>* 견적금액</div><form:errors path="resPrice" cssClass="valid_msg"></form:errors>
							<input type="number" name='resPrice' min="0"
								<c:if test="${empty error.resPrice}">
									value="${responseForm.resPrice}"
								</c:if>
							required>
						</div>
					</div>
					<div class='content_bottom'>
						<div class='inp_title'>* 업체의 어필</div>
						<textarea rows="10" cols="50" name='resContent' placeholder="어필하고자 하는 내용을 적어보세요.">${responseForm.resContent}</textarea>
						<button>견적서 제출</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	
	<!-- 자취해협 정보 footer -->
	<!-- <footer> -->
	<div class='footer'>
		<div class='footer_logo'><img src="../../../resources/image/logo-icon.png" class='logo-icon'></div>
		
		<div class='footer_text'>
			<div class='footer_title'><pre>project  자취해협  |  team  help!</pre></div>
			
			<div class='footer_content'>
			<pre>Gwon Gu Hyun   |   kwon41147406@gmail.com
Kim Hyun Soo   |   oooklyt@naver.com
Hwang Ryun Soo   |   babyfox225@gmail.com
Lee Kyung Min   |   alssgo70051@naver.com</pre>
			<pre>Lee Joo Hyun   |   carinae4717@gmail.com
Lee Ho Jun   |   lhj132824@naver.com
Ko Hyuck Joon   |   akhj123akhj@naver.com
Choi Min Seok   |   dktlfem3333@gmail.com</pre>
			</div>
		</div>
	</div>
	<!-- </footer> -->
	<script type="text/javascript" src="../../../resources/js/include/chat/chat2.js"></script>
</body>
<script type="text/javascript" src="${contextPath}/resources/js/common/file-upload-viewer.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/company/help-join.js"></script>
</html>