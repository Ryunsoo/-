<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<div class="hidden" id="popup">
				<div class="bell_title_wrap">
					<div class="bell_title">
						<div>알림</div>
					</div>
					<div class="bell_cancel" id="exit"><i class="fas fa-times-circle"></i></div>
				</div>
				
				<c:forEach items="${iceboxBellList}" var="bellList">
				<div class="bell_txt_wrap">
					<div class="bell_txt">- ${bellList.item}의 유통기한이 
						<div style="color:rgb(192, 57, 43); ">
						<c:if test="${bellList.resDay >= 0}">&nbsp${bellList.resDay}일</div>&nbsp남았습니다.</c:if>
						<c:if test="${bellList.resDay < 0}">&nbsp${bellList.resDay*(-1)}일</div>&nbsp지났습니다.</c:if>
					</div>
				</div>		
				</c:forEach>
			</div>
</body>
</html>