<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head/main-head.jsp" %>
<%@ include file="/WEB-INF/views/include/head/menu-head.jsp" %>
<link href="../../../resources/css/include/head/menu_head.css" type="text/css" rel="stylesheet">
<link rel='stylesheet' href="../../../resources/css/purchase/purchase-main.css">
<link rel='stylesheet' href="../../../resources/css/include/chat/chat.css">
<meta charset="UTF-8">
</head>
<body>
<%@ include file="/WEB-INF/views/include/chat/chat.jsp" %>
<c:if test="${not empty message}">
	<script>
		alert('${message}');
	</script>
</c:if>

	<!-- 섹션 시작 -->
	<div class="section">
		
		<!-- 검색파트 wrapper -->
		<div class="search-wrapper">
		
			<!-- 서치 파트-->
			<div class="search">
				<div class="this-page-name">구매해협</div>
				
				<div class="search-form">
					<input id="search-input" type="text" placeholder="검색어를 입력하세요." onkeypress="if(event.keyCode==13){changeList()}">
					<div id="search-submit" onclick="changeList()">
						<i class="fas fa-search"></i>
					</div>
				</div>
			</div>
			
			<!-- 필터 파트 -->
			<div class="search-filter">
				
				<div>등급</div>
			
				<!-- 등급 선택 -->
				<select id="grade-dropdown" name="grade" onchange="changeList()">
					<option value="all" <c:if test="${param.grade eq 'all'}">selected</c:if>>전체</option>
					<option value="DIA" <c:if test="${param.grade eq 'DIA'}">selected</c:if>>다이아</option>
					<option value="GOLD" <c:if test="${param.grade eq 'GOLD'}">selected</c:if>>골드</option>
					<option value="SILVER" <c:if test="${param.grade eq 'SILVER'}">selected</c:if>>실버</option>
					<option value="BRONZE" <c:if test="${param.grade eq 'BRONZE'}">selected</c:if>>브론즈</option>
					<option value="NORMAL" <c:if test="${param.grade eq 'NORMAL'}">selected</c:if>>노말</option>
				</select>
				
				<div>우리 동네만</div>
				
				<!-- toggle switch -->
				<label class="switch">
				  <c:choose>
				  	<c:when test="${btn eq 'on'}">
				  		<input type="checkbox" id="checkArea" name="area" value="on" checked onchange="changeList()">
				  	</c:when>
				  	<c:otherwise>
				  		<input type="checkbox" id="checkArea" name="area" value="on" onchange="changeList()">
				  	</c:otherwise>
				  </c:choose>
				  <span class="slider round"></span>
				</label>
			
			</div>		

		</div>
		
		
		<!-- 물품 list wrapper-->
		<div class="item-list-wrapper">	
			<!-- 물품 list 첫번째 줄 -->
			<div class="item-list-line">
				<c:forEach items="${registerMap}" var="rm">
					<div class="item" 
					<c:choose>
						<c:when test="${rm.registerInfo.id eq authentication.id}">
							onclick="location.href = '/purchase/detail-writer?regIdx=${rm.registerInfo.regIdx}';"
						</c:when>
						<c:otherwise>
							onclick="location.href = '/purchase/detail?regIdx=${rm.registerInfo.regIdx}';"
						</c:otherwise>
					</c:choose>
					>
						<div class="item-image"><img style="width: 100%; height: 100%;" src="${rm.registerInfo.link}"></div>
						<div class="item-title-wrapper">
							<span id="title">${rm.registerInfo.itemName}</span> <span>(${rm.count}명)</span>
						</div>

						<div class="item-price">가격 : ${rm.registerInfo.price}</div>
						<div class="item-stock">남은수량 : ${rm.registerInfo.restNum}개</div>
					</div>
				</c:forEach>
			</div>
		</div>
		
		<!-- 물품 list 끝 -->
		
		
		
		<!-- 물품 list 페이징 -->
		<div class="pg_wrap" style="display: block; text-align: center;">
			<c:if test="${paging.startPage != 1 }">
				<a class="pg_start" href="/purchase/main?nowPage=1&cntPerPage=${paging.cntPerPage}&grade=${grade}&area=${area}&keyword=${keyword}">&lt;&lt;</a>
				<a class="pg_prev" href="/purchase/main?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&grade=${grade}&area=${area}&keyword=${keyword}">&lt;</a>
			</c:if>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage }">
						<a class="pg_current">${p }</a>
					</c:when>
					<c:when test="${p != paging.nowPage }">
						<a class="pg_page" href="/purchase/main?nowPage=${p }&cntPerPage=${paging.cntPerPage}&grade=${grade}&area=${area}&keyword=${keyword}">${p }</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<a class="pg_next" href="/purchase/main?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&grade=${grade}&area=${area}&keyword=${keyword}">&gt;</a>
				<a class="pg_end" href="/purchase/main?nowPage=${paging.lastPage}&cntPerPage=${paging.cntPerPage}&grade=${grade}&area=${area}&keyword=${keyword}">&gt;&gt;</a>
			</c:if>
		</div>
		
		
	
	</div>
	<!-- 섹션 끝 -->

	
	<!-- 후터 -->
	<div class="hooter">
	</div>
</body>
<script type="text/javascript">

function changeList(){
	let gradeVal = document.getElementById("grade-dropdown").value;
	let areaVal = document.getElementById("checkArea").checked;
	let keyword = document.getElementById("search-input").value;
	
	location.href = "/purchase/main?grade="+gradeVal+"&area="+areaVal+"&keyword="+keyword;
}

</script>
<script type="text/javascript" src="../../../resources/js/include/chat/chat.js"></script>
</html>