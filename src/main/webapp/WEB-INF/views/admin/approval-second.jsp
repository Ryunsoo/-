<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head/admin-head.jsp" %>
<link rel="stylesheet" href="${contextPath}/resources/css/admin/approval-second.css">
</head>
<body>
	<form class='main' method="post" action="/admin/permit">
		<div class='menu_title'>승인페이지</div>
		<div class='edit_field'><button type="button">수정</button></div>
		<div class='content'>
			<div class='content_left'>
				<div class="fileList" style="display: none;">/file/${memberInfo.files[0].savePath}${memberInfo.files[0].reName}</div>
				<div class='reduce'><i class="fas fa-times-circle"></i></div>
				<div class='file'></div>
				<div class='expand'><i class="fas fa-search-plus"></i></div>
			</div>
			<div class='content_right'>
				<div class='input'>
					<div class='inp_title'>* 전문분야</div>
						<div class='check_box'>
						<c:forEach items="${categoryList}" var="cl">
							<div class='field_cate'><label>${cl}</label></div>
							<div class="field">
								<c:forEach items="${fieldList}" var="fl">
									<c:if test="${cl eq fl.fieldCategory}">
											<label><input class="checkBox" id="checkBox" 
											<c:forEach items="${myField}" var="mf">
												<c:if test="${mf eq fl.field}">
													checked
												</c:if>
											</c:forEach>
											 type="checkbox" name="field" value="${fl.field}"> ${fl.field}</label>
									</c:if>
								</c:forEach>
							</div>
						</c:forEach>
						<input style="display: none;" name="cate" value="${memberInfo.cate}">
						</div>
				</div>
			</div>
			<div class='prev_btn'><button type="button" onclick="history.back()">&lt 이전</button></div>
			<div class='decision_btn'><button onclick="/admin/reject?id=${memberInfo.member.id}" type="button">거절</button><button type="submit">승인</button></div>
		</div>
	</form>
</body>
<script type="text/javascript" src="${contextPath}/resources/js/admin/file-expand-viewer.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/admin/approval-second.js"></script>
</html>