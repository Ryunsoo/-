<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../../../resources/css/community/style2.css"/>
<link rel="stylesheet" href="../../../resources/css/community/write_board.css"/>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.4/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.4/summernote.js"></script>
<link href="../../../resources/css/include/head/menu_head.css" type="text/css" rel="stylesheet">
<link rel='stylesheet' href="../../../resources/css/include/chat/chat.css">
<script>

	$(document).ready(function() {
		$('#content').summernote({
			height: 700,
			fontNames : [ '맑은고딕', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', ],
			fontNamesIgnoreCheck : [ '맑은고딕' ],
			focus: true
		});
	});
</script>
</head>
<body>

   <!--//헤더자리-->
    <div class="wrap">
    <%@ include file="/WEB-INF/views/include/chat/chat.jsp" %>
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
    
    <div class="write_body">
    
    
    <!--index페이지 body작업시작-->
    <div id="write_body_container">
         <div id="exp_of_write">
            <p>------ 게시글 등록하기 ---------------------------------------------------------</p>
         </div>
         
         <div id="write_form">
            <form>
            <!--카테고리,제목-->
               <div id="form_inner_top">
                  
                  <!--select-->
                     <div id="form_inner_select">
                        <SELECT NAME=sltSample SIZE=1>
                        <OPTION VALUE=1 SELECTED>카테고리를 선택하세요</OPTION>
                        <OPTION VALUE=2>[음식]</OPTION>
                        <OPTION VALUE=3>[잡담]</OPTION>
                        <OPTION VALUE=4>4번 보기</OPTION>
                        </SELECT>
                     </div>

                     <div id="form_write_title">
                        <input type="text" placeholder="제목을 입력하세요"/>
                     </div>
                  <!--select 끝-->
               </div>
            <!--카테고리,제목 끝-->
            <!--카테고리 밑 글쓰는공간 시작-->
               <div id="cover_form">
                  
                  <div style="background-color:black; display:inline-flex important!;">
                     <textarea name="board_content" id="content"></textarea>
                  </div>
                  <div align="right">
                     <input type="hidden" name="section" value="${ param.section }">
                     <input type="hidden" name="id" value="${ id }">
                     <input type="button" id="bt" value="게시글 등록" onclick="history.go(-1)">
                  </div>
                  

               </div>
            <!--카테고리 밑 글쓰는공간 끝-->
            </form>
         </div>

         
    </div>
    <!--//index페이지 body작업 끝-->
    </div>
   </div>
   <!--wrap == container 끝-->
<script type="text/javascript" src="../../../resources/js/include/chat/chat.js"></script>
</body>
</html>