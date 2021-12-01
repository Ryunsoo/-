<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head/main-head.jsp" %>
<link rel='stylesheet' href="../../../resources/css/main/main.css">
<link rel='stylesheet' href="../../../resources/css/main/c3.min.css">
<link rel='stylesheet' href="../../../resources/css/include/chat/chat.css">
<link rel="stylesheet" type="text/css" href="../../../resources/slick/slick.css">
<link rel="stylesheet" type="text/css" href="../../../resources/slick/slick-theme.css">
<script type="text/javascript" src="../../../resources/js/main/weather.js?ver=1"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
.nav_info {
   display: flex;
   justify-content: flex-end;
   margin-right: 75px;
   font-size: 17px;
   width: 870px;
}

.userName {
   margin-right: 6px;
   font-weight: bolder;
}

.nim {
   margin-right: 10px;
   font-size: 13px;
   align-self: center;
   margin-top: 4px;
   font-weight: bolder;
}

.medal {
   margin-right: 20px;
   align-self: center;
   color: #e6bc14;
}

.mypage {
   margin-right: 20px;
   font-weight: bolder;
   cursor: pointer;
}

.logout {
   font-weight: bolder;
   color: #e67e00;
   cursor: pointer;
}

.info_wrap{
	display: flex;
	flex-direction: column;
}

</style>
</head>

<body>
<%@ include file="/WEB-INF/views/include/chat/chat.jsp" %>
<div class="wrap_content">
	<div class="wrap_head">
		<div class="main_bar">
			<div class="main_header">
				<img id="main_logo" src="../../../resources/image/main-logo.png" onclick="location.href='/'">
				<div class="info_wrap">
					<div class="nav_info">
						<c:if test="${not empty authentication}">
							
						    	<div class="userName">${authentication.nickname}</div>
						        <div class="nim">님</div>
						        <c:choose>
									<c:when test="${authentication.grade eq 'BRONZE'}">
										<div class='medal' style="color: #cc9900"><i class="fas fa-medal"></i></div>
									</c:when>
									<c:when test="${authentication.grade eq 'SILVER'}">
										<div class='medal' style="color: silver"><i class="fas fa-medal"></i></div>
									</c:when>
									<c:when test="${authentication.grade eq 'GOLD'}">
										<div class='medal' style="color: gold"><i class="fas fa-medal"></i></div>
									</c:when>
									<c:when test="${authentication.grade eq 'DIA'}">
										<div class='medal' style="color: silver"><i class="fas fa-gem"></i></div>
									</c:when>
								</c:choose>
						        <div class="mypage" onclick="location.href='/mypage/mypage-common'">마이페이지</div>
						        <div class="logout" onclick="logout()">LOGOUT</div>
			        		
						</c:if>
						<c:if test="${empty authentication}">
							<div class="join_btn" onclick="location.href='/member/join-form'">
								회원가입
							</div>
							<div class="login_btn" onclick="location.href='/member/login-form'">
								LOGIN
							</div>
						</c:if>
					</div>
					<div class="cate_wrap">
						<div onclick = "location.href = '/help/main'">신청해협</div>
						<div onclick = "location.href='/purchase/main'">공구해협</div>
						<div onclick="location.href='/management/myIcebox'">관리해협</div>
						<div onclick="location.href='/community/list'">소통해협</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="wrap_body">
		<div class="info_section">
				<div class="ad_list">
					<div class="adds">
						<div id="add_item"><img src="../../../resources/image/메인1.jpg"></div>
						<div id="add_item"><img src='../../../resources/image/메인2.jpg'></div>
						<div id="add_item"><img src='../../../resources/image/메인3.jpg'></div>
						<div id="add_item"><img src='../../../resources/image/메인4.jpg'></div>
					</div>
				</div>
			<div class="today_weather_btn">
				<div style="display: block;" class="date_wrap" id="today_weather">
					<div class='location' id="today_loc"></div>
					<div class="weather_wrap">
						<div class="weather_icon" id="today_icon"></div>
						<div class="weather_info">
							<div class='weather_temp'></div>
							<div class="weather_statu"></div>
						</div>
					</div>
					<div class="hover_weather" onmouseenter="enterWeather()">마우스를 올려보세요</div>
				</div>
				<div style="display:none;" id="detail_weather" onmouseleave="outWeather()">
					<div id="detail_head">
						<p style="cursor: pointer;" onclick="viewWeakWeather()"> > 이번주 날씨가 궁금하다면 클릭! </p>
						<div class='location' id="detail_loc"></div>
					</div>
					<div class="detail_title">우리동네 오늘 날씨</div>
					<div id="detail_body">
						<div class="weather_icon" id="detail_icon"></div>
						<div id="detail_temp">
							<div class="weather_min"></div>
							<div class="separate"></div>
							<div class="weather_max"></div>
						</div>	
					</div>
					<div id="detail_footer">
						<img src="../../../resources/image/notice.png">
						<div id="footer_msg">"추우니까 집 밖으로 <br>나오지 마세요!"</div>
					</div>
				</div>
				<div style="display: none;" id="weak_weather">
					<div class="weak_title">
						<div id="weak_name">우리동네 이번주 날씨</div>
						<i style="cursor: pointer;" id="exit" class="fas fa-times" onclick="noneWeather()"></i>
						<div id="weak_loc"></div>
					</div>
					<div class="iconList">
						<c:forEach items="${weekList}" var="wl">
							<div>
								${wl}
								<div class="forecast_icon"></div>
							</div>
						</c:forEach>
					</div>
					<div class="chart">
						<div id='chart'></div>
					</div>
				</div>
			</div>
		</div>
		<div class="help_section">
			<div class="help_div">
				<div class="title_list">
					<div class="join_div">
						<i class="far fa-edit"></i>
						<div class="join_title">해협신청</div>
					</div>
					<div class="review_div">
						<i class="far fa-thumbs-up"></i>
						<div class="review_title">해협후기</div>
					</div>
				</div>
				<div class="content_list">
					<div class="join_content">
						<c:forEach items="${requestList}" var="request">
							<div class="content">
								<div class="content_title">${request.reqContent} <img src="../../../resources/image/new_icon.png"></div>
								<div class="content_loc">| ${request.oldAddress}</div>
							</div>
						</c:forEach>
						
					</div>
					<div class="review_content">
						<c:forEach items="${reviewList}" var="review">
							<div class="content">
								<div class="content_title">${review.company} <img src="../../../resources/image/new_icon.png"></div>
								<div class="content_loc">| ${review.oldAddress}</div>
								<div class="content_score">★ ${review.score}</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="request_view">
					<i class="fas fa-plus" style="cursor: pointer;" onclick="location.href='/help/main'">  신청하기</i>
			</div>
		</div>
		<div class="buy_section">
			<div class="buy_div">
				<div class="buy_title">
					<i class="far fa-shopping-cart"></i>
					<div class="buy_name">공동구매</div>
				</div>
				<div class="buy_body">
					<c:forEach items="${purchaseList}" var="purchase">
						<div class="buy_content">
							<img src='/file/' + ${purchase.savePath} + ${purchase.reName} onclick="location.href='/purchase/detail?regIdx=' + ${purchase.regIdx}">
						<div class="buy_label">${purchase.itemName}</div>
					</div>
					</c:forEach>
				</div>
				<div class="detail_view">
					<i class="fas fa-plus" onclick="location.href='/purchase/main'">  더보기</i>
				</div>
			</div>
		</div>
		<div class="comu_section">
			<div class="comu_div">
				<div class="comu_title">
					<i class="far fa-users"></i>
					<div class="comu_name">커뮤니티</div>
				</div>
				<div class="comu_body">
					<div id="frac_div" class="child_title">
						<div id="frac_title">
							<i id="comu_icon" class="fas fa-gift"> 나눔</i>
						</div>
						<div id="frac_list" class="child_list">
							<c:forEach items="${boardList}" var="board">
							<c:if test="${board.boardCategory eq '나눔'}">
								<div class="board_title" onclick="location.href='/community/view?boardIdx=' + ${board.boardIdx}">${board.title}</div>
							</c:if>
							</c:forEach>
						</div>	
					</div>
					<div id="mate_div" class="child_title">
						<div id="mate_title">
							<i id="comu_icon" class="fas fa-utensils-alt"> 음식</i>
						</div>
						<div id="mate_list" class="child_list">
							<c:forEach items="${boardList}" var="board">
							<c:if test="${board.boardCategory eq '음식'}">
								<div class="board_title" onclick="location.href='/community/view?boardIdx=' + ${board.boardIdx}">${board.title}</div>
							</c:if>
							</c:forEach>
						</div>
					</div>
					<div id="recommend_div" class="child_title">
						<div id="recommend_title">
							<i id="comu_icon" class="fas fa-thumbs-up"> 추천</i>
						</div>
						<div id="recommend_list" class="child_list">
							<c:forEach items="${boardList}" var="board">
							<c:if test="${board.boardCategory eq '추천'}">
								<div class="board_title" onclick="location.href='/community/view?boardIdx=' + ${board.boardIdx}">${board.title}</div>
							</c:if>
							</c:forEach>
						</div>
					</div>
					<div id="free_div" class="child_title">
						<div id="free_title">
							<i id="comu_icon" class="fas fa-paper-plane"> 잡담</i>
						</div>
						<div id="free_list" class="child_list">
							<c:forEach items="${boardList}" var="board">
							<c:if test="${board.boardCategory eq '잡담'}">
								<div class="board_title" onclick="location.href='/community/view?boardIdx=' + ${board.boardIdx}">${board.title}</div>
							</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="comu_view">
					<i class="fas fa-plus" onclick="location.href='/community/list'">  더보기</i>
				</div>
			</div>
		</div>
		<!-- 자취해협 정보 footer -->
	<%@ include file="/WEB-INF/views/include/footer/footer.jsp" %>
		
		
	</div>
		
	</div>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script type="text/javascript" src="../../../resources/slick/slick.min.js"></script>
	<script src="https://d3js.org/d3.v3.min.js"></script>  
	<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.js"></script>
	<script type="text/javascript">

		$('.buy_body').slick({
			dots: true,
		 	infinite: true,
		  	slidesToShow: 3,
		  	slidesToScroll: 3
		});
		
		$('.adds').slick({
			slidesToShow: 1,
	  		slidesToScroll: 1,
		  	autoplay: true,
		  	autoplaySpeed: 2000
		});
		
	</script>
</body>

<script type="text/javascript">
	function enterWeather(){
		document.getElementById("today_weather").style.display = "none";
		document.getElementById("detail_weather").style.display = "flex";
		
		document.getElementById("detail_loc").innerHTML += document.getElementById("today_loc").innerHTML;
		document.getElementById("detail_icon").innerHTML += document.getElementById("today_icon").innerHTML;
	}
	
	function outWeather(){
		document.getElementById("today_weather").style.display = "block";
		document.getElementById("detail_weather").style.display = "none";
		document.getElementById("detail_loc").innerHTML = "";
		document.getElementById("detail_icon").innerHTML = "";
	}
	
	function viewWeakWeather(){
		document.getElementById("detail_weather").style.display = "none";
		document.getElementById("today_weather").style.display = "none";
		document.getElementById("weak_weather").style.display = "flex";
		document.getElementById("weak_loc").innerHTML += document.getElementById("today_loc").innerHTML;
	}
	
	function noneWeather(){
		document.getElementById("weak_weather").style.display = "none";
		document.getElementById("detail_loc").innerHTML = "";
		document.getElementById("detail_icon").innerHTML = "";
		document.getElementById("weak_loc").innerHTML = "";
	}
	
	function logout(){
		location.href='/member/logout';
	}
	
	
</script>
<script type="text/javascript" src="../../../resources/js/include/chat/chat.js"></script>
</html>