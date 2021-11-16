<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head/main-head.jsp" %>
<link rel='stylesheet' href="../../../resources/css/main/main.css">
<link rel='stylesheet' href="../../../resources/css/include/chat/chat.css">
<link rel="stylesheet" type="text/css" href="../../../resources/slick/slick.css">
<link rel="stylesheet" type="text/css" href="../../../resources/slick/slick-theme.css">
<script type="text/javascript" src="../../../resources/js/main/weather.js?ver=1"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.css"/>
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
				<img id="main_logo" src="../../../resources/image/main-logo.png">
				<div class="info_wrap">
				
				<c:if test="${not empty authentication}">
					<div class="nav_info">
				    	<div class="userName">${authentication.id}</div>
				        <div class="nim">님</div>
				        <div class="medal">
				        	<i class="fas fa-medal"></i>
				        </div>
				        <div class="mypage">마이페이지</div>
				        <div class="logout">LOGOUT</div>
	        		</div>
				</c:if>
				<div class="search_div">
					<div class="searchBox">
						<input id="main_search" placeholder="세면대 뚫는 법을 검색해보세요." >
						<i class="fas fa-search"></i>
					</div>
					<span id="top_res">인기 검색어 | 1. 세면대 뚫는 법   2. 자취 필수템   3. 흰 옷에 얼룩 지우기</span>
				</div>
				</div>
				<c:if test="${empty authentication}">
					<div class="login_btn" onclick="location.href='/member/login-form'">
						LOGIN
					</div>
					<div class="join_btn">
						회원가입
					</div>
				</c:if>
			</div>
			<div class="cate_wrap">
				<div>신청해협</div>
				<div>공구해협</div>
				<div>관리해협</div>
				<div>소통해협</div>
			</div>
		</div>
	</div>
	<div class="wrap_body">
		<div class="info_section">
				<div class="ad_list">
					<div class="adds">
						<div id="add_item"><img src="../../../resources/image/ad_img.jpg"></div>
						<div id="add_item"><img src='../../../resources/image/엠마.jpg'></div>
						<div id="add_item"><img src='../../../resources/image/IU.jpg'></div>
						<div id="add_item"><img src='../../../resources/image/jo.jpg'></div>
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
						<div>
							오늘
							<div class="forecast_icon"></div>
						</div>
						<div>
							오늘
							<div class="forecast_icon"></div>
						</div>
						<div>
							오늘
							<div class="forecast_icon"></div>
						</div>
						<div>
							오늘
							<div class="forecast_icon"></div>
						</div>
						<div>
							오늘
							<div class="forecast_icon"></div>
						</div>
						<div>
							오늘
							<div class="forecast_icon"></div>
						</div>
						<div>
							오늘
							<div class="forecast_icon"></div>
						</div>
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
						<div class="content">
							<div style="cursor:pointer;" class="content_title">싱크대 배수관 막혔어요ㅜㅜ <img src="../../../resources/image/new_icon.png"></div>
							<div class="content_loc">| 서울시 도봉구</div>
						</div>
						<div class="content">
							<div style="cursor:pointer;" class="content_title">침대 조립 도와주세요!! <img src="../../../resources/image/new_icon.png"></div>
							<div class="content_loc">| 서울시 강남구</div>
						</div>
						<div class="content">
							<div style="cursor:pointer;" class="content_title">싱크대 배수관 막혔어요ㅜㅜ <img src="../../../resources/image/new_icon.png"></div>
							<div class="content_loc">| 서울시 도봉구</div>
						</div>
						<div class="content">
							<div style="cursor:pointer;" class="content_title">침대 조립 도와주세요!! <img src="../../../resources/image/new_icon.png"></div>
							<div class="content_loc">| 서울시 강남구</div>
						</div>
						
					</div>
					<div class="review_content">
						<div class="content">
							<div style="cursor:pointer;" class="content_title">싱크싱크 <img src="../../../resources/image/new_icon.png"></div>
							<div class="content_loc">| 서울시 강남구</div>
							<div class="content_score">★★★★★</div>
						</div>
						<div class="content">
							<div style="cursor:pointer;" class="content_title">정말 감사드립니다!! <img src="../../../resources/image/new_icon.png"></div>
							<div class="content_loc">| 서울시 종로구</div>
							<div class="content_score">★★★★☆</div>
						</div>
						<div class="content">
							<div style="cursor:pointer;" class="content_title">와..덕분에 살았어요ㅜㅜ <img src="../../../resources/image/new_icon.png"></div>
							<div class="content_loc">| 서울시 강남구</div>
							<div class="content_score">★★★★★</div>
						</div>
						<div class="content">
							<div style="cursor:pointer;" class="content_title">정말 감사드립니다!! <img src="../../../resources/image/new_icon.png"></div>
							<div class="content_loc">| 서울시 도봉구</div>
							<div class="content_score">★★★★☆</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="buy_section">
			<div class="buy_div">
				<div class="buy_title">
					<i class="far fa-shopping-cart"></i>
					<div class="buy_name">공동구매</div>
				</div>
				<div class="buy_body">
					<div class="buy_content">
						<img src='../../../resources/image/IU.jpg'>
						<div class="buy_label">아이유입니다</div>
					</div>
					<div class="buy_content">
						<img src='../../../resources/image/jo.jpg'>
						<div class="buy_label">조정석입니다</div>
					</div>
					<div class="buy_content">
						<img src="../../../resources/image/ad_img.jpg">
						<div class="buy_label">공동구매의 제목이 이렇게도 길수 있구나를 보여주고 싶어요</div>
					</div>
					<div class="buy_content">
						<img src="../../../resources/image/bee1.png">
						<div class="buy_label">이호준</div>
					</div>
					<div class="buy_content">
						<img src="../../../resources/image/bee2.png">
						<div class="buy_label">이경민</div>
					</div>
					<div class="buy_content">
						<img src="../../../resources/image/bee3.png">
						<div class="buy_label">황륜수</div>
					</div>
				</div>
				<div class="detail_view">
					<i class="fas fa-plus">  더보기</i>
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
							<div>인기글1</div>
							<div>인기글2</div>
							<div>인기글3</div>
						</div>	
					</div>
					<div id="mate_div" class="child_title">
						<div id="mate_title">
							<i id="comu_icon" class="fas fa-utensils-alt"> 밥메이트</i>
						</div>
						<div id="mate_list" class="child_list">
							<div>인기글1</div>
							<div>인기글2</div>
							<div>인기글3</div>
						</div>
					</div>
					<div id="interior_div" class="child_title">
						<div id="interior_title">
							<i id="comu_icon" class="fas fa-home"> 인테리어</i>
						</div>
						<div id="interior_list" class="child_list">
							<div>인기글1</div>
							<div>인기글2</div>
							<div>인기글3</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class='footer'>
	      <div class='footer_logo'><img src="../../../resources/image/footer_logo.png" class='logo-icon'></div>
	      
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
</script>
<script type="text/javascript" src="../../../resources/js/include/chat/chat.js"></script>
</html>