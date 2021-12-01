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
<%@ include file="/WEB-INF/views/include/chat/chat.jsp" %>
<div class="wrap">
    <%@ include file="/WEB-INF/views/include/head/menu-head.jsp" %>
     <!--nav와 header 끝-->
    <div id="search_case">
        <div id="search_case_inner_div_1"><h3>소통해협</h3></div>
    </div>
    
    <div class="write_body">
    
    
    <!--index페이지 body작업시작-->
    <div id="write_body_container">
         <div id="exp_of_write">
            <p>게시글 수정하기</p>
         </div>
         
         <div id="write_form">
            <form action="/community/modify-board" method="post">
            <!--카테고리,제목-->
               <div id="form_inner_top">
                  
                  <!--select-->
                     <div id="form_inner_select">
                        <SELECT NAME="boardCategory" SIZE=1>
	                        <OPTION VALUE="" disabled>카테고리 선택</OPTION>
	                        <OPTION VALUE="음식" <c:if test="${board.boardCategory eq '음식'}">selected</c:if>>음식</OPTION>
	                        <OPTION VALUE="잡담" <c:if test="${board.boardCategory eq '잡담'}">selected</c:if>>잡담</OPTION>
	                        <OPTION VALUE="나눔" <c:if test="${board.boardCategory eq '나눔'}">selected</c:if>>나눔</OPTION>
	                        <OPTION VALUE="추천" <c:if test="${board.boardCategory eq '추천'}">selected</c:if>>추천</OPTION>
                        </SELECT>
                     </div>

                     <div id="form_write_title">
                        <input type="text" name="title" placeholder="제목을 입력하세요." value="${board.title}"/>
                     </div>
                  <!--select 끝-->
               </div>
            <!--카테고리,제목 끝-->
            <!--카테고리 밑 글쓰는공간 시작-->
               <div id="cover_form">
                  
                 
                 

                  	  <textarea style="background-color: white !important;" name="content" id="summernote">${board.content}</textarea>
                  	 <div class="private_txt" id="public">공개</div>
                  	 <div class="private_txt" style="display: none;" id="private">비공개</div>
                  	 <label class="switch">
				  		<input type="checkbox" id="checkArea" name="isPrivate" onchange="viewTxt()" value="1">
				  		<span class="slider round"></span>
					 </label>
                     <input type="hidden" value="${param.section}">
                     <input type="hidden" name="boardIdx" value="${board.boardIdx}">
                     <input type="hidden" name="id" value="${authentication.id}">
                     <button id="write_btn" type="submit">게시글 수정</button>
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
   
   <script>
      $('#summernote').summernote({
    	lang: 'ko-KR',
        placeholder: '게시글 내용을 입력해주세요.',
        height: 560,
        minHeight: 300,
        maxHeight: 560,
        disableResizeEditor: true,
        toolbar: [
          ['style', ['style']],
          ['fontname', ['fontname']],
          ['fontsize', ['fontsize']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ],
        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
      });
      
      var markupStr = $('#summernote').summernote('code').replace("/<\/?[^>]+(>|$)/g", "");
      console.dir(markupStr);
    </script>
   
   <script type="text/javascript" src="../../../resources/js/include/chat/chat.js"></script>
   
   <script type="text/javascript">

   function viewTxt(){
   	
   	if (document.getElementById("private").style.display == "none"){
   		document.getElementById("private").style.display = "block";
   		document.getElementById("public").style.display = "none";
   	} else {
   		document.getElementById("private").style.display = "none";
   		document.getElementById("public").style.display = "block";
   	}
   	
   </script>
</body>
</html>