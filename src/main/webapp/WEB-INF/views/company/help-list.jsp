<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head/company-head.jsp" %>
<link rel="stylesheet" href="${contextPath}/resources/css/company/help-list.css">
<link rel='stylesheet' href="../../../resources/css/chat/chat.css">
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
				<div class='search_area'>
					<div>
						<input name='area' placeholder='지역 검색'>
						<i class="fas fa-search"></i>
					</div>
				</div>
				<div class='search_num'>
					<div class='date'>
						<input type="date"><span> - </span><input type="date">
					</div>
					<div class='amount'>
						<input type="text" placeholder="최소 금액"><span> ~ </span><input type="text" placeholder="최대 금액">
					</div>
					<div class='search'>
						<button>조회</button>
					</div>
				</div>
				<div class='wrap_list'>
					<div class='list'>
						<table>
							<thead>
								<tr>
									<th>신청 분야</th>
									<th>지역</th>
									<th>요청일</th>
									<th>희망 금액</th>
								</tr>
							</thead>
							<tbody>
								<tr><td>[수리 | 보수]   가전</td><td>서울시 강남구 역삼동</td><td>2021/10/16</td><td>50,000 원</td></tr>
								<tr><td>[수리 | 보수]   가전</td><td>서울시 강남구 역삼동</td><td>2021/10/16</td><td>50,000 원</td></tr>
								<tr><td>[수리 | 보수]   가전</td><td>서울시 강남구 역삼동</td><td>2021/10/16</td><td>50,000 원</td></tr>
								<tr><td>[수리 | 보수]   가전</td><td>서울시 강남구 역삼동</td><td>2021/10/16</td><td>50,000 원</td></tr>
								<tr><td>[수리 | 보수]   가전</td><td>서울시 강남구 역삼동</td><td>2021/10/16</td><td>50,000 원</td></tr>
								<tr><td>[수리 | 보수]   가전</td><td>서울시 강남구 역삼동</td><td>2021/10/16</td><td>50,000 원</td></tr>
								<tr><td>[수리 | 보수]   가전</td><td>서울시 강남구 역삼동</td><td>2021/10/16</td><td>50,000 원</td></tr>
								<tr><td>[수리 | 보수]   가전</td><td>서울시 강남구 역삼동</td><td>2021/10/16</td><td>50,000 원</td></tr>
								<tr><td>[수리 | 보수]   가전</td><td>서울시 강남구 역삼동</td><td>2021/10/16</td><td>50,000 원</td></tr>
								<tr><td>[수리 | 보수]   가전</td><td>서울시 강남구 역삼동</td><td>2021/10/16</td><td>50,000 원</td></tr>
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
	<script type="text/javascript" src="../../../resources/js/chat/chat2.js"></script>
</body>
</html>