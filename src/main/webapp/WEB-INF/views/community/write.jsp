<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../../../resources/css/community/style2.css"/>
<link rel="stylesheet" href="../../../resources/css/community/write_board.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/text-edit/summernote-ko-KR.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<link href="../../../resources/css/include/head/menu_head.css" type="text/css" rel="stylesheet">
<link rel='stylesheet' href="../../../resources/css/include/chat/chat.css">
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
         	<div id="title_line"></div>
         	<p>게시글 등록하기</p>
         	<div id="title_line_two"></div>
         </div>
         
         <div id="write_form">
            <form>
            <!--카테고리,제목-->
               <div id="form_inner_top">
                  
                  <!--select-->
                     <div id="form_inner_select">
                        <SELECT NAME="cate" SIZE=1>
	                        <OPTION VALUE="" disabled selected>카테고리 선택</OPTION>
	                        <OPTION VALUE=1>[음식]</OPTION>
	                        <OPTION VALUE=2>[잡담]</OPTION>
	                        <OPTION VALUE=3>4번 보기</OPTION>
                        </SELECT>
                     </div>

                     <div id="form_write_title">
                        <input type="text" name="title" placeholder="제목을 입력하세요"/>
                     </div>
                  <!--select 끝-->
               </div>
            <!--카테고리,제목 끝-->
            <!--카테고리 밑 글쓰는공간 시작-->
               <div id="cover_form">
                  
                  <textarea style="background-color: white !important;" name="content" id="summernote"></textarea>
                  <div align="right">
                     <input type="hidden" value="${param.section}">
                     <input type="hidden" name="id" value="${authentication.id}">
                     <div id="write_btn" onclick="history.go(-1)">게시글 등록</div>
                  </div>
                  

               </div>
            <!--카테고리 밑 글쓰는공간 끝-->
            </form>
         </div>

         
    </div>
    <!--//index페이지 body작업 끝-->
    </div>
   </div>
   <script>
      $('#summernote').summernote({
    	lang: 'ko-KR',
        placeholder: '게시글 내용을 입력해주세요.',
        tabsize: 2,
        height: 560,
        minHeight: 300,
        maxHeight: 560,
        disableResizeEditor: true,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
      
      var markupStr = $('#summernote').summernote('code');
    </script>
   <!--wrap == container 끝-->
<script type="text/javascript" src="../../../resources/js/include/chat/chat.js"></script>
</body>
</html>