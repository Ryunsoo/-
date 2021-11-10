<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head/main-head.jsp" %>
<style type="text/css">
body, html{
	/* heigth: 690px; */
	position: relative;
	min-height: 690px;
	weight: 1130px;
	min-width: 1130px;
	display: flex;
	flex-direction: column;
	align-items: center;
	font-family: 'Han Sans, 본고딕';
}

div{
	/* border: 1px solid grey; */
	/* box-shadow: 1px 1px 5px 0px #444; */
}

a {
  text-decoration: none;
}
  
a:hover, a:focus {
    color: #3b98c8;
}

button{
	cursor: pointer;
}

.header{
	display: flex;
	height: 130px;
	width: 1100px;
}

.logo{
	height: 100%;
	width: 260px;
	margin: 0 50px 0 50px;
	background-image: url("../../../resources/image/main-logo.png");
	background-repeat: no-repeat;
	background-size: contain;
	background-position: center;
}

.header_right{
	width: 740px;
}

.user_menu{
	display: flex;
	height: 20px;
	width: 100%;
	justify-content: flex-end;
	margin: 0 5px 0 0;
}

.admin_mode{
	margin: 0 5px 0 5px;
	color: #d35400;
	font-weight: bold;
}

.logout{
	margin: 0 20px 0 5px;
}

.logout>a{
	color: #e67e00;
	font-weight: bold;
}


.main_menu{
	width: 280px;
	height: 30px;
	display: flex;
	justify-content: space-between;
	margin: 40px 0 0 0px;
	padding-left: 50px;
	font-size: 20px;
	font-weight: bold;
}

.main_menu>div>a{
	color: #262626;
	text-shadow: 2px 2px 4px #a6a6a6;
}

.main_menu>.current_page>a{
	color: #2980b9;
}

.main_menu>div>a:hover{
	color: #174869;
	font-size: 22px;
}

.main{
	display: flex;
	height: 830px;
	width: 1130px;
}

.aside{
	height: 100%;
	width: 230px;
}

.join_list{
	border: none;
	padding-left: 10px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	margin: 80px 0 20px 0;
	height: 80px;
	width: 170px;
	font-size: 28px;
	color: white;
	font-weight: bold;
	box-shadow: 0px 10px 10px #808080;
	text-shadow: 2px 2px 5px #808080;
	border-bottom-right-radius: 20px;
	border-top-right-radius: 20px;
	background-color: rgba(52, 73, 94, 0.33);
}

.join_list:hover{
    box-shadow: inset 0 0 5px 1px #808080;
}

.revision_list{
	border: none;
	padding-left: 8px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	margin: 30px 0 0 0;
	height: 60px;
	width: 130px;
	font-size: 25px;
	color: white;
	font-weight: bold;
	box-shadow: 0px 10px 10px #808080;
	text-shadow: 2px 2px 5px #808080;
	border-bottom-right-radius: 15px;
	border-top-right-radius: 15px;
	background-color: rgba(52, 73, 94, 0.98);
}

.finished_list{
	border: none;
	padding-left: 8px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	margin: 30px 0 0 0;
	height: 60px;
	width: 130px;
	font-size: 25px;
	color: white;
	font-weight: bold;
	box-shadow: 0px 10px 10px #808080;
	text-shadow: 2px 2px 5px #808080;
	border-bottom-right-radius: 15px;
	border-top-right-radius: 15px;
	background-color: rgba(52, 73, 94, 0.98);
}

.revision_list:hover, .finished_list:hover{
    box-shadow: inset 0 0 5px 1px #243342;
}

.section{
	display: flex;
	justify-content: flex-start;
	height: 100%;
	width: 900px;
}

.wrapper{
	width: 860px;
}

.wrap_list{
	height: 680px;
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	align-content: space-around;
	margin-top: 90px;
	border-color: #bfbfbf;
	border-width: 2.5px;
	border-style: solid;
	border-radius: 30px;
	background-color: white;
}

.list{
	width: 780px;
	height: 560px;
}

table{
	width: 100%;
	border-collapse: collapse;
	table-layout: fixed;
	white-space: nowrap;
}

tr{
	border-bottom: 1px solid grey;
	text-align: center;
	font-family: '나눔바른고딕';
	font-weight: bold;
}

tbody>tr:hover{
	background-color: #e6e6e6;
	cursor: pointer;
}

tr>th{
	font-size: 18px;
	line-height: 3;
	color: rgb(52, 73, 94);
}

tr>td{
	font-size: 14px;
	line-height: 3.3;
}

tr>td>.check{
	height: 30px;
	width: 60px;
	position: relative;
	transform: translateY(8%);
	border-radius: 8px;
	border: none;
	/* Lumen 템플릿 주황색 : rgb(255, 133, 27) / #ff851b */
	background-color: #ffad66;
	color: black;
	font-weight: bold;
	box-shadow: 0 0 5px 1px #808080;
}

tr>td>.check:hover{
	box-shadow: inset 0 0 5px 1px #808080;
}

.page{
	width: 300px;
	height: 50px;
	display: flex;
	justify-content: space-around;
	align-items: center;
	font-weight: bold;
	font-size: 18px;
}

.page>i{
	font-size: 25px;
	color: #cccccc;
}

.page>i:hover{
	color: #b3b3b3;
	cursor: pointer;
}

.page>div{
	display: flex;
	width: 130px;
	justify-content: space-around;
}

.page>div>span:hover{
	color: #bfbfbf;
	cursor: pointer;
}

.back{
	position: absolute;
	width: 100%;
	height: 510px;
	background-color: #f2f2f2;
	bottom: 0;
	z-index: -1
}

</style>
</head>
<body>
	<!-- 외원정보 / 마이페이지 & 로그아웃 버튼 / 로고 -->
	<!-- <header> -->
	<div class='header'>
		<div class='logo'></div>
		<div class='header_right'>
			<div class='user_menu'>
				<div class='admin_mode'>관리자모드</div>
				<div class='logout'><a href='#'>LOGOUT</a></div>
			</div>
			<div class='main_menu'>
				<!-- current_page class 지정하면 css 바로 적용!! -->
				<div class='member_approval current_page'><a href='#'>회원승인</a></div>
				<div class='community'><a href='#'>커뮤니티</a></div>
			</div>
		</div>
	</div>
	<!-- </header> -->
	
	<!-- 검색 / 날짜 및 금액 검색 -->
	<!-- <main> -->
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
<script type="text/javascript">






</script>
</html>