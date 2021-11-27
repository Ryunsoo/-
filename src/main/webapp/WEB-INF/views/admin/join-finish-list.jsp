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
         <button class="finished_list" onclick="location.href='/admin/join-finish-list'">완료 목록</button>
      </div>
      <!-- </aside> -->
      <div class='section'>
         <div class='wrapper'>
            <div class='select_wrapper'>
               <div class='sub_menu'>
                  <!-- 현재 선택된 메뉴에 selected class를 추가해주면 자동으로 css 바뀝니다!! -->
                  <div id='join_btn' onclick="location.href='/admin/join-finish-list'"><button class='selected'>가입 승인</button></div>
                  <div id='modify_btn'  onclick="location.href='/admin/modify-finish-list'"><button>수정 승인</button></div>
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
							 <c:if test="${not empty joinFinishList}">
								<c:forEach items="${joinFinishList}" var="jfl">
									<tbody id="join" >
										<tr>
											<td>가입</td>
											<td >${jfl.id}</td>
											<td>${jfl.company}</td>
											<td>${jfl.regParseDate}</td>
											<td>${jfl.parseDate}</td>
											<td>
											<c:if test="${jfl.isPermit eq 1}">
												<button class='cancel' onclick="location.href = '/admin/cancel-approval?id=${jfl.id}'">
												취소
												</button>
											</c:if>
											<c:if test="${jfl.isPermit eq 3}">
												취소 완료
											</c:if>
											</td>
										<tr>
									</tbody>
								</c:forEach>
							</c:if>
						</table>
					</div>
					<div class='page'>
						<c:if test="${paging.startPage != 1}">
							<i class="fas fa-caret-left"
								onclick="location.href = '/admin/join-finish-list?nowPage=1&cntPerPage=${paging.cntPerPage}'"></i>
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
								onclick="location.href = '/admin/join-finish-list?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}'"></i>
						</c:if>
					</div>
				</div>
			</div>
      </div>
   </div>
   
      
</body>
</html>