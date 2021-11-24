<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head/main-head.jsp" %>
    
<header id="header">
   <nav class="navbar">
      <!-- 상단 메뉴바 시작-->
      <div id="mouse_off">
         <div class="gnb__sub-category-wrap">
            <div>
               <div class="gnb__sub-category-img-wrap">
                  <div class="gnb__sub-category-img">
                     <img src="../../../resources/image/bee1.png" class="bee1">
                  </div>
               </div>
               
               <ul class="gnb__2depth-wrap">
                  <li class="gnb-2depth">
                     <ul class="gnb-2depth__list">
                        <li class="gnb-2depth__item">
                           <a href="/help/main">카테고리</a>
                        </li>
                        <li class="gnb-2depth__item">
                           <a href="/help/my-hehyeop">마이해협</a>
                        </li>
                        <li class="gnb-2depth__item">
                           <a href="/help/review">리뷰해협</a>
                        </li>
                     </ul>
                  </li>
                  <li class="gnb-2depth">
                     <ul class="gnb-2depth__list">
                        <li class="gnb-2depth__item">
                           <a href="/purchase/main">구매해협</a>
                        </li>
                        <li class="gnb-2depth__item">
                           <a href="/purchase/regist">작성해협</a>
                        </li>
                        <li class="gnb-2depth__item">
                           <a href="/purchase/my-purchase">마이공구</a>
                        </li>
                     </ul>
                  </li>
                  <li class="gnb-2depth">
                     <ul class="gnb-2depth__list">
                        <li class="gnb-2depth__item">
                           <a href="/management/myIcebox">나의 냉장고</a>
                        </li>
                        <li class="gnb-2depth__item">
                           <a href="/management/myAccountBook">나의 가계부</a>
                        </li>
                     </ul>
                  </li>
                  <li class="gnb-2depth">
                     <ul class="gnb-2depth__list">
                        <li class="gnb-2depth__item">
                           <a href="/community/list"><div>소통해협</div></a>
                        </li>
                     </ul>
                  </li>
               </ul>
            </div>   
         </div>
      </div>   
      <!-- 상단 메뉴바 끝 -->
      <div class="logo">
         <a href="/"><img src="../../../resources/image/main-logo.png" class="logo"></a>
      </div>
      <div class="nav_group">
         <c:if test="${not empty authentication}">
					<div class="nav_info">
				    	<div class="userName">${authentication.id}</div>
				        <div class="nim">님</div>
				        <div class="medal">
				        	<i class="fas fa-medal"></i>
				        </div>
				        <div class="mypage" style="cursor:pointer" onclick="location.href='/mypage/mypage-common'">마이페이지</div>
				        <div class="logout" style="cursor:pointer" onclick="location.href='/member/logout'">LOGOUT</div>
	        		</div>
				</c:if>
				<c:if test="${empty authentication}">
					<div class="nav_info">
						<div class="join_btn" onclick="location.href='/member/joinin-form'">
							회원가입
						</div>
						<div class="login_btn" onclick="location.href='/member/login-form'">
							LOGIN
						</div>
					</div>
				</c:if>
         <div class="nav_title">
            <div class="help" onclick="location.href='/help/main'">해협신청</div>
            <div class="together" onclick="location.href='/purchase/main'">공구해협</div>
            <div class="manage" onclick="location.href='/management/myIcebox'">관리해협</div>
           <div class="talk" onclick="location.href='/community/list'">소통해협</div>
         </div>
      </div>
   </nav>
</header>
<script type="text/javascript" src="../../../resources/js/include/head/menu_head.js"></script>