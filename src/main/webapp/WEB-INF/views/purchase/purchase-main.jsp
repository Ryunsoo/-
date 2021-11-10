<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head/main-head.jsp" %>
<%@ include file="/WEB-INF/views/head/head.jsp" %>
<link href="../../../resources/css/include/head/menu_head.css" type="text/css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	
body, html{
   /* heigth: 690px; */
   position: relative;
   min-height: 690px;
   width: 1130px;
   display: flex;
   flex-direction: column;
   align-items: center;
   font-family: 'Han Sans, 본고딕';
}

/* 섹션 시작*/

.section{
	height: 100%;
	width: 95%;
}




/* 검색 파트 */

.search-wrapper {
	display: flex;
	justify-content: space-between;
	margin-bottom: 20px;
}

.search{
	display: flex;
	width: 400px;
	justify-content: space-between;
	margin-top: 30px;
	margin-left: 50px;
}
.search> .this-page-name {
	color: #b57033;
	font-size: 19px;
	font-weight: bold;
}

.search> .search-form {
	display:flex;
	width: 300px;
	font-size: 19px;
	justify-content: space-between;
}

.search> .search-form> #search-input{
	width: 250px;
	height: 22px;
}





/* 여기서부터 toggle switch Css임. w3schools 에서 퍼움*/
/* https://www.w3schools.com/howto/howto_css_switch.asp */
.switch {
  position: relative;
  display: inline-block;
  width: 52px;
  height: 26px;
}

/* Hide default HTML checkbox */
.switch input {
  opacity: 0;
  width: 0;
  height: 0;
}

/* The slider */
.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 18px;
  width: 18px;
  left: 3.7px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #34cb73;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}

/* toggle switch css 끝 */






/* 검색 필터 */
.search-filter {
	height: 30px;
	width : 330px;
	display: flex;
	justify-content: space-between;
	margin-top: 35px;
	margin-right: 50px;
}

.search-filter> div{
	font-size: 17px;
}

.search-filter> #grade-dropdown{
	height: 23px;
	width: 100px;
}







/* 상품목록 */

.item-list-wrapper {
	display: flex;
	flex-direction: column;
}

.item-list-wrapper> .item-list-line {
	display: flex;
	justify-content: space-around;
	margin-top: 20px;
	margin-bottom: 20px;
}

.item-list-line> .item{
	display: flex;
	flex-direction: column;
	justify-content: space-evenly;
	align-items: center;
	height: 250px;
}

.item-list-line> .item> .item-image{
	width: 200px;
	height: 150px;
	border: groove;
}




/* 상품목록 페이징 */

.list-paging-wrapper{
	padding-top: 20px;
	padding-bottom: 20px;
	display: flex;
	justify-content: center;
}

.list-paging-wrapper> .list-paging {
	width: 150px;
	display: flex;
	justify-content: space-between;
	font-size: 20px;
	
}

/* 페이징 처리 호버이벤트 */

.list-paging-wrapper> .list-paging> div{
	font-weight: bold;
	transition: all 0.2s;
	color: #868686;
}

.list-paging-wrapper> .list-paging> div:hover{
	color: #3498db;
}








/* 섹션 끝 */




/* 후터 */
.hooter {
	height: 200px;
}



</style>



</head>






<body>


	
	
	
	<!-- 섹션 시작 -->
	<div class="section">
		
		<!-- 검색파트 wrapper -->
		<div class="search-wrapper">
		
			<!-- 서치 파트-->
			<div class="search">
				<div class="this-page-name">구매해협</div>
				
				<form class="search-form">
					<input id="search-input" type="text" placeholder="검색어를 입력하세요.">
					<div id="search-submit">
						<i class="fas fa-search"></i>
					</div>
				</form>
			</div>
			
			<!-- 필터 파트 -->
			<div class="search-filter">
				
				<div>등급</div>
			
				<!-- 등급 선택 -->
				<select id="grade-dropdown" name="grade">
					<option selected>전체</option>
					<option value="dia">다이아</option>
					<option value="gold">골드</option>
					<option value="silber">실버</option>
					<option value="bronze">브론즈</option>
				</select>
				
				<div>우리 동네만</div>
				
				<!-- toggle switch -->
				<label class="switch">
				  <input type="checkbox">
				  <span class="slider round"></span>
				</label>
			
			</div>		

		</div>
		
		
		<!-- 물품 list wrapper-->
		<div class="item-list-wrapper">
			
			<!-- 물품 list 첫번째 줄 -->
			<div class="item-list-line">
			
				<div class="item">
					<div class="item-image"></div>
					<div class="item-title-wrapper">
						<span id="title">상품 제목</span> <span>(예약된 인원수)</span>
					</div>
					<div class="item-price">가격 : 150000원</div>
					<div class="item-stock">남은수량 : 15개</div>
				</div>
				
				<div class="item">
					<div class="item-image"></div>
					<div class="item-title-wrapper">
						<span id="title">상품 제목</span> <span>(예약된 인원수)</span>
					</div>
					<div class="item-price">가격 : 150000원</div>
					<div class="item-stock">남은수량 : 15개</div>
				</div>
				
				<div class="item">
					<div class="item-image"></div>
					<div class="item-title-wrapper">
						<span id="title">상품 제목</span> <span>(예약된 인원수)</span>
					</div>
					<div class="item-price">가격 : 150000원</div>
					<div class="item-stock">남은수량 : 15개</div>
				</div>
				
			</div>
			
			<!-- 물품 list 두번째 줄 -->
			<div class="item-list-line">
			
				<div class="item">
					<div class="item-image"></div>
					<div class="item-title-wrapper">
						<span id="title">상품 제목</span> <span>(예약된 인원수)</span>
					</div>
					<div class="item-price">가격 : 150000원</div>
					<div class="item-stock">남은수량 : 15개</div>
				</div>
				
				<div class="item">
					<div class="item-image"></div>
					<div class="item-title-wrapper">
						<span id="title">상품 제목</span> <span>(예약된 인원수)</span>
					</div>
					<div class="item-price">가격 : 150000원</div>
					<div class="item-stock">남은수량 : 15개</div>
				</div>
				
				<div class="item">
					<div class="item-image"></div>
					<div class="item-title-wrapper">
						<span id="title">상품 제목</span> <span>(예약된 인원수)</span>
					</div>
					<div class="item-price">가격 : 150000원</div>
					<div class="item-stock">남은수량 : 15개</div>
				</div>
				
			</div>
			
			<!-- 물품 list 세번째 줄 -->
			<div class="item-list-line">
			
				<div class="item">
					<div class="item-image"></div>
					<div class="item-title-wrapper">
						<span id="title">상품 제목</span> <span>(예약된 인원수)</span>
					</div>
					<div class="item-price">가격 : 150000원</div>
					<div class="item-stock">남은수량 : 15개</div>
				</div>
				
				<div class="item">
					<div class="item-image"></div>
					<div class="item-title-wrapper">
						<span id="title">상품 제목</span> <span>(예약된 인원수)</span>
					</div>
					<div class="item-price">가격 : 150000원</div>
					<div class="item-stock">남은수량 : 15개</div>
				</div>
				
				<div class="item">
					<div class="item-image"></div>
					<div class="item-title-wrapper">
						<span id="title">상품 제목</span> <span>(예약된 인원수)</span>
					</div>
					<div class="item-price">가격 : 150000원</div>
					<div class="item-stock">남은수량 : 15개</div>
				</div>
				
			</div>
			
		</div>
		
		<!-- 물품 list 끝 -->
		
		
		
		<!-- 물품 list 페이징 -->
		<div class="list-paging-wrapper">
			<div class="list-paging">
				<div>
					<i class="fas fa-chevron-left"></i>
				</div>
				<div>1</div>
				<div>2</div>
				<div>3</div>
				<div>4</div>
				<div>5</div>
				<div>
					<i class="fas fa-chevron-right"></i>
				</div>
			</div>
		</div>
		
		
	
	</div>
	<!-- 섹션 끝 -->
	
	
	<!-- 후터 -->
	<div class="hooter">
	</div>





</body>
</html>