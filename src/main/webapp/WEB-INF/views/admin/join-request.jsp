<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head/admin-head.jsp" %>
<link rel="stylesheet" href="${contextPath}/resources/css/admin/join-request.css">
</head>
<body>
	<div class='main'>
	
		<!-- 사이트 메뉴(조회해협 & MY 해협) -->
		<!-- <aside> -->
		<div class='aside'>
			<button class="join_list">가입 요청</button>
			<button class="revision_list">수정 요청</button>
			<button class="finished_list">완료 목록</button>
		</div>
		<!-- </aside> -->
		<div class='section'>
			<div class='wrapper'>
				<div class='wrap_list'>
					<div class='list'>
						<table>
							<thead>
								<tr>
									<th>아이디</th>
									<th>업체명</th>
									<th>요청일</th>
									<th>자세히</th>
								</tr>
							</thead>
							<tbody>
								<tr><td>syaanc</td><td>싱크싱크</td><td>2021/10/16</td><td><button class='check'>조회</button></td>
								<tr><td>sync</td><td>싱크싱크</td><td>2021/10/16</td><td><button class='check'>조회</button></td>
								<tr><td>sync</td><td>싱크싱크</td><td>2021/10/16</td><td><button class='check'>조회</button></td>
								<tr><td>sync</td><td>싱크싱크</td><td>2021/10/16</td><td><button class='check'>조회</button></td>
							</tbody>
						</table>
					</div>
					<div class='page'>
						<i class="fas fa-caret-left"></i>
						<div><span>1</span><span>2</span><span>3</span><span>4</span><span>5</span></div>
						<i class="fas fa-caret-right"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class='back'></div>
		
</body>
</html>