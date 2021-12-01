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
        <div id="search_case_inner_div_1"><h3 style="line-height: 2">소통해협</h3><img class="bee" src="../../../resources/image/bee3.png"></div></div>
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
            <form action="/community/write-board" method="post">
            <!--카테고리,제목-->
               <div id="form_inner_top">
                  
                  <!--select-->
                     <div id="form_inner_select">
                        <SELECT NAME="boardCategory" SIZE=1>
	                        <OPTION VALUE="" disabled selected>카테고리 선택</OPTION>
	                        <OPTION VALUE="음식">음식</OPTION>
	                        <OPTION VALUE="잡담">잡담</OPTION>
	                        <OPTION VALUE="나눔">나눔</OPTION>
	                        <OPTION VALUE="추천">추천</OPTION>
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
                  <div class="footer">
                  	 <div class="private_txt" id="public">공개</div>
                  	 <div class="private_txt" style="display: none;" id="private">비공개</div>
                  	 <label class="switch">
				  		<input type="checkbox" id="checkArea" name="isPrivate" onchange="viewTxt()" value="1">
				  		<span class="slider round"></span>
					 </label>
                     <input type="hidden" value="${param.section}">
                     <input type="hidden" name="id" value="${authentication.id}">
                     <button id="write_btn" type="submit">게시글 등록</button>
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
   <!--wrap == container 끝-->
<script type="text/javascript" src="../../../resources/js/include/chat/chat.js"></script>
</body>
<script type="text/javascript">

function viewTxt(){
	
	if (document.getElementById("private").style.display == "none"){
		document.getElementById("private").style.display = "block";
		document.getElementById("public").style.display = "none";
	} else {
		document.getElementById("private").style.display = "none";
		document.getElementById("public").style.display = "block";
	}
	
}


</script>
</html>