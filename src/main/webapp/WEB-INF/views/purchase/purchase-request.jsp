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





/* form wrapper */
.form-wrapper{
	display: flex;
}



/* 제목 파트 */

.title {
	margin-top: 30px;
	margin-bottom: 20px;
	margin-left: 50px;
	margin-right: 50px;
/* 	color: #b57033; */
	font-size: 21px;
	font-weight: bold;
}

/* 구분선 */
.title> #line-wrapper{
	width: 100%;
}

.title> .line-wrapper> #seprate-line {
	color: black;
	width: 100%;
}

/* 제목파트 끝 */






/* 사진, 사진업로드, 어필해협 파트 */

.image-and-appeal-wrapper {
	display: flex;
	margin-top: 50px;
	margin-left:70px;
	width: 430px;
	height: 700px;
	flex-direction: column;
	justify-content: space-between;
}

.image-and-appeal-wrapper> #uploaded-image{
	width: 100%;
	height: 430;
}

.image-and-appeal-wrapper> #uploaded-image> #product-image {
	height: 100%;
	width: 100%;
}

/* 어필해협, 제품명 등등 title */
.submit-input-title {
	width: 100%;
	font-weight: bold;
	font-size: 19px;
	padding-top: 5px;
	padding-bottom: 5px;
	color: #e67e22;
}
/* 어필해협 내용 */
#appeal-help-content {
	height: 200px;
	border: 2px solid;
	border-color: #9a9a9a;
	border-radius: 7px 7px 7px 7px; 
	padding: 15px;   /* 테두리랑 글자 간격을 벌리기 위해 */
	color: #404040;
}




/* 제품명, 제품링크, 거래위치 등등 입력, submit버튼 */

.product-info-submit{
	margin-left: 70px;
	width: 440px;
	line-height: 170%;  /* <br> 태그의 간격 조절 */
}


.input-content-wrapper> .text-input,
.input-content-wrapper> .text-output {
	width: 436px;  /* border가 좌우로 2픽셀씩 잡아먹어서.. */
	height: 39px;  /* border가 4px 잡아먹어서 실제 높이는 43px 가 됨 */
	font-size: 17px;
	color: #868686;
	border: 2px solid;
	border-radius: 5px 5px 5px 5px; 
	border-color: #9a9a9a;
	padding: 0px;   /* input, output 간의 패딩값을 통일해서 높이를 맞춤 */
	display: flex;
	align-items: center;   /* 텍스트 상하 간격을 일정하게 함 */
}

.text-input> p,
.text-output> p {
	margin-left: 10px;   /* text-io div 안의 모든 p태그 텍스트들이 왼쪽으로 10px 간격 띄움*/
	color: #808080;
	font-weight: bold;
}




/* 중간에 절반 사이즈 input wrapper */
.half-size-content-wrapper {
	display: flex;
	justify-content: space-between;
}

.half-size-content-wrapper> .input-content-wrapper> .text-input, 
.half-size-content-wrapper> .input-content-wrapper> .text-output {
	display: flex;
	align-items: center;
	width: 200px;
	padding: 0px;
}




.submit-button {
	width:440px;
	height: 50px;
	font-size: 25px;
	color: white;
	background-color: #34495e; 
	border: 1px solid;
	border-color: 868686;
	border-radius: 5px 5px 5px 5px; 
	transition: all, 0.2s;
}
/* submit 버튼 호버 */
.submit-button:hover {
	background-color: #4888c8;
	cursor: pointer;
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
		
		<!-- 작성해협 제목 -->
		<div class="title">
			<div id="this-page-name">&nbsp&nbsp신청해협</div>
			
			<!-- 구분선 -->
			<div id="line-wrapper">
				<hr id="seprate-line">
			</div>
			
		</div>
		
		
		
		<!-- 이미지 & 어필해협 -->
		<form class="form-wrapper">
			<div class="image-and-appeal-wrapper">
				<div id="uploaded-image">
					<img id="product-image" src = "../../../resources/image/product-image.png">
				</div>
				<div class="submit-input-title">*어필해협</div>
				<div id="appeal-help-content">
					"내용을 입력해주세요 ex)물 3개씩 구매하실 분만 신청해주세요 쌀: 구매개수 1개 = 1kg"
				</div>
			</div>
			
			
			
			<!-- 제품명 ~금액~ 제출까지 -->
			<div class="product-info-submit">
			<br><br>
				<div class="input-content-wrapper">
					<div class="submit-input-title">*제품명</div>
						<div class="text-output">
							<p>탐사수 (2Lx12개)</p>
						</div>
				</div>
				<br>
				
				<div class="input-content-wrapper">
					<div class="submit-input-title">*거래위치</div>
						<div class="text-output">
							<p>강남 kh정보교육원</p>
						</div>
				</div>
				<br>
				
				<div class="half-size-content-wrapper">
					<div class="input-content-wrapper">
						<div class="submit-input-title">*거래시간</div>
						<div class="text-output">
							<p>12월 7일 오후 3:20</p>
						</div>
					</div>
					
					<div class="input-content-wrapper">
						<div class="submit-input-title">*마감시간</div>
						<div class="text-output">
							<p>12월 7일 오후 3:40</p>
						</div>
					</div>
				</div>
				<br>
				
				
				<div class="input-content-wrapper">
					<div class="submit-input-title">*금액</div>
					<div class="text-output">
							<p>565원</p>
					</div>
				</div>
				<br>
				
				<div class="half-size-content-wrapper">
					<div class="input-content-wrapper">
						<div class="submit-input-title">*남은 개수</div>
						<div class="text-output">
							<p>15개</p>
						</div>
					</div>
					
					<div class="input-content-wrapper">
						<div class="submit-input-title">*내가 구매할 개수</div>
						<input class="text-input" type="text" placeholder="  수량을 입력하세요" name="file"/>
					</div>
				</div>
				<br>
				
				<div class="half-size-content-wrapper">
					<div class="input-content-wrapper">
						<div class="submit-input-title">*내 포인트</div>
						<div class="text-output">
							<p>3,000P</p>
						</div>
					</div>
				</div>
				<br>
				
				
				<button class="submit-button">
					SUBMIT!
				</button>
				
				
			</div>
		</form>
		

		
	
	</div>
	<!-- 섹션 끝 -->
	
	
	<!-- 후터 -->
	<div class="hooter">
	</div>






</body>
</html>