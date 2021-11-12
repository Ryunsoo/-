<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="../../../resources/css/include/head/menu_head.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="../../../resources/css/community/style.css"/>
<link rel="stylesheet" href="../../../resources/css/community/search_page.css"/>
<link rel='stylesheet' href="../../../resources/css/include/chat/chat.css">
</head>
<body>
<%@ include file="/WEB-INF/views/include/chat/chat.jsp" %>
<div class="wrap">
   	<%@ include file="/WEB-INF/views/include/head/menu-head.jsp" %>
     <!--nav와 header 끝-->
    <div id="search_case">
        <div id="search_case_inner_div_1"><h3>소통해협</h3></div>
        <div id="search_case_inner_div_3">
	        <SELECT NAME=sltSample SIZE=1>
	        	<option value="" disabled selected hidden>카테고리 선택</option>
		        <OPTION VALUE=1>[음식]</OPTION>
		        <OPTION VALUE=2>[잡담]</OPTION>
		        <OPTION VALUE=3>3번 보기</OPTION>
		        <OPTION VALUE=4>4번 보기</OPTION>
	        </SELECT>
	        <input type="text">
        	<i id="search" class="far fa-search"></i>
        </div>
    </div>
    <!--index페이지 body작업시작-->
    <div id="index_body_container">
	    <div id="result_letter">
            <!--spring으로 작성시 전부 div로 갈아끼워야함 ex) [카테고리명] = [{인자값}]-->
            <div id="title_line"></div>
            <p>카테고리 : [카테고리] | "<검색어>"에 대한 검색 결과 [숫자]</p>
            <div id="title_line_two"></div>
	    </div>
	    
    	<div class="tr_inner_container">
    		<div class="tr_inner_up_div">
    			<div class="board_kinds">음식</div>
                <div class="board_title"><strong style="margin-right: 10px;">스프링</strong> 공부 내용 [2]</div>
                <div class="board_writer">작성자</div>
                <div class="board_date">21-11-04</div>
                <div class="board_view_cnt">101</div>
    		</div>
    		<div class="tr_inner_under_div">
    			<div class="tr_inner_under_div_contents">피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 ...피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 ...피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 ...</div>
    		</div>
    	</div>
    	
    	<div class="tr_inner_container">
    		<div class="tr_inner_up_div">
    			<div class="board_kinds">음식</div>
                <div class="board_title"><strong style="margin-right: 10px;">스프링</strong> 공부 내용 [2]</div>
                <div class="board_writer">작성자</div>
                <div class="board_date">21-11-04</div>
                <div class="board_view_cnt">101</div>
    		</div>
    		<div class="tr_inner_under_div">
    			<div class="tr_inner_under_div_contents">피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 ...</div>
    		</div>
    	</div>
    	
    	<div class="tr_inner_container">
    		<div class="tr_inner_up_div">
    			<div class="board_kinds">음식</div>
                <div class="board_title"><strong style="margin-right: 10px;">스프링</strong> 공부 내용 [2]</div>
                <div class="board_writer">작성자</div>
                <div class="board_date">21-11-04</div>
                <div class="board_view_cnt">101</div>
    		</div>
    		<div class="tr_inner_under_div">
    			<div class="tr_inner_under_div_contents">열락의 새가 운다사랑의 ...</div>
    		</div>
    	</div>
    	
    	<div class="tr_inner_container">
    		<div class="tr_inner_up_div">
    			<div class="board_kinds">음식</div>
                <div class="board_title"><strong style="margin-right: 10px;">스프링</strong> 공부 내용 [2]</div>
                <div class="board_writer">작성자</div>
                <div class="board_date">21-11-04</div>
                <div class="board_view_cnt">101</div>
    		</div>
    		<div class="tr_inner_under_div">
    			<div class="tr_inner_under_div_contents">피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 ...피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 ...피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 ...</div>
    		</div>
    	</div>
    </div>
    

    <!--footer은 글쓰기 페이지엔 존재하지 않으니 index, view_board에만 사용-->
    <footer>
        <div id="footer">
                <div class='page'>
						<i class="fas fa-caret-left"></i>&nbsp;
						<div><span>1</span>&nbsp;<span>2</span>&nbsp;<span>3</span>&nbsp;<span>4</span>&nbsp;<span>5</span>&nbsp;<span>6</span>&nbsp;<span>7</span></div>&nbsp;
						<i class="fas fa-caret-right"></i>
				</div>
        </div>
        
    </footer>

   </div>
   <script type="text/javascript" src="../../../resources/js/include/chat/chat.js"></script>
</body>
</html>