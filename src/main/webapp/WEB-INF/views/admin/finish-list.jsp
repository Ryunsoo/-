<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head/admin-head.jsp" %>
<link rel="stylesheet" href="${contextPath}/resources/css/admin/finish-list.css">
</head>
<body>
   <div class='main'>
   
      <!-- 사이트 메뉴(조회해협 & MY 해협) -->
      <!-- <aside> -->
      <div class='aside'>
         <button class="join_list" onclick="location.href='/admin/join-request'">가입 요청</button>
         <button class="revision_list" onclick="location.href='/admin/modify-request'">수정 요청</button>
         <button class="finished_list" onclick="location.href='/admin/finish-list'">완료 목록</button>
      </div>
      <!-- </aside> -->
      <div class='section'>
         <div class='wrapper'>
            <div class='select_wrapper'>
               <div class='sub_menu'>
                  <!-- 현재 선택된 메뉴에 selected class를 추가해주면 자동으로 css 바뀝니다!! -->
                  <div><button class='selected'>승인</button></div>
                  <div><button>거절</button></div>
               </div>
               <div class='desc'>* 최근 3일 이내에 승인된 업체 목록입니다.</div>
            </div>
				<div class='wrap_list'>
					<div class='list'>
						<table>
							<thead>
								<tr>
									<th>구분</th>
									<th>아이디</th>
									<th>업체명</th>
									<th>요청일</th>
									<th>승인일</th>
									<th>승인취소</th>
								</tr>
							</thead>
							 <c:if test="${not empty finishList}">
								<c:forEach items="${finishList}" var="fl">
									<tbody>
										<tr>
											<td>가입</td>
											<td>${jl.id}</td>
											<td>${jl.company}</td>
											<td>${jl.parseDate}</td>
											<td></td>
											<td><button class='cancel'>취소</button></td>
										<tr>
									</tbody>
								</c:forEach>
							</c:if>
						</table>
					</div>
					<div class='page'>
						<c:if test="${paging.startPage != 1}">
							<i class="fas fa-caret-left"
								onclick="location.href = '/admin/finish-list?nowPage=1&cntPerPage=${paging.cntPerPage}'"></i>
						</c:if>
						<div>
							<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
								var="p">
								<c:choose>
									<c:when test="${p == paging.nowPage}">
										<span>${p}</span>
									</c:when>
									<c:otherwise>
										<span>${p}</span>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
						<c:if test="${paging.endPage != paging.lastPage}">
							<i class="fas fa-caret-right"
								onclick="location.href = '/admin/finish-list?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}'"></i>
						</c:if>
					</div>
				</div>
			</div>
      </div>
   </div>
   
      
</body>
</html>