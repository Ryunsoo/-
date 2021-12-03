<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="../../../resources/css/include/head/menu_head.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="../../../resources/css/community/style.css"/>
<link rel="stylesheet" href="../../../resources/css/community/search_page.css"/>
<link rel='stylesheet' href="../../../resources/css/include/chat/chat.css">


<style type="text/css">
#search{
	cursor: pointer;
}

.tr_inner_container {
	cursor: pointer;
}

.board_title {
	width: 495px;
	margin: 5px 20px 0 10px; 
	font-size: 25px;
	color: navy;
}

.board_kinds {
	margin: 7px 10px 0 10px;
	width: 35px;
}

.board_title {
	width: 521px;
	margin: 5px 20px 0 10px; 
	font-size: 18px;
	font-weight: normal;
	color: navy;
}

#nickname_date_count_wrapper {
	width: 285px;
	display: flex;
	justify-content: flex-end;
}
.board_writer {
	margin: 10px 0px 0 8px;
}


</style>

</head>
<body>
<%@ include file="/WEB-INF/views/include/chat/chat.jsp" %>
<div class="wrap">
   	<%@ include file="/WEB-INF/views/include/head/menu-head.jsp" %>
     <!--nav와 header 끝-->
    <div id="search_case">
        <div id="search_case_inner_div_1"><h3 style="line-height: 2">소통해협</h3><img class="bee" src="../../../resources/image/bee3.png"></div>
        <div id="search_case_inner_div_3">
        <form action="/community/search">
	        <SELECT NAME="boardCategory" id="selectCategory" SIZE=1 onchange="changeList()">
	            <OPTION VALUE="" <c:if test="${boardCategory eq ''}">selected</c:if>>카테고리 선택</OPTION>
	            <OPTION VALUE="음식" <c:if test="${boardCategory eq '음식'}">selected</c:if>>음식</OPTION>
	            <OPTION VALUE="잡담" <c:if test="${boardCategory eq '잡담'}">selected</c:if>>잡담</OPTION>
	            <OPTION VALUE="나눔" <c:if test="${boardCategory eq '나눔'}">selected</c:if>>나눔</OPTION>
	            <OPTION VALUE="추천" <c:if test="${boardCategory eq '추천'}">selected</c:if>>추천</OPTION>
          	</SELECT>
	        <input type="text" name="searchKeyword" id="searchKeyword" <c:if test="${not empty searchKeyword}">value="${searchKeyword}"</c:if>> 
        	<i id="search" class="far fa-search" onclick="changeList()"></i>
        </form>
        </div>
    </div>
    <!--index페이지 body작업시작-->
    <div id="index_body_container">
	    <div id="result_letter">
            <!--spring으로 작성시 전부 div로 갈아끼워야함 ex) [카테고리명] = [{인자값}]-->
            <div id="title_line"></div>
            <p>카테고리 : ${boardCategory}  |  키워드 : "${searchKeyword}"에 대한 검색 결과 [${searchCount}]</p>
            <div id="title_line_two"></div>
	    </div>
	    
	    <c:forEach items="${commuList}" var="commuList">
    	<div class="tr_inner_container" onclick="location.href = '/community/view?boardIdx=${commuList.boardIdx}'">
    		<div class="tr_inner_up_div">
    			<div class="board_kinds">${commuList.boardCategory}</div>
                <c:if test="${commuList.isPrivate eq 1}">
                   	<div class="board_title">${commuList.title} <i style="margin: 11px 0 0 10px;" class="fas fa-lock"></i></div>
		        </c:if>
		        <c:if test="${commuList.isPrivate eq 0}">
                   	<div class="board_title">${commuList.title}</div>
		        </c:if>
		        <div id="nickname_date_count_wrapper">
	                <div class="board_writer">${commuList.nickname}</div>
	                <div class="board_date">${commuList.parseDate}</div>
	                <div class="board_view_cnt">${commuList.viewCnt}</div>
                </div>
    		</div>
    		<div class="tr_inner_under_div">
    			<div id="test" class="tr_inner_under_div_contents">
    				${commuList.content}
    			</div> 
    		</div>
    	</div>
		</c:forEach>
    	
    </div>
    

    <!--footer은 글쓰기 페이지엔 존재하지 않으니 index, view_board에만 사용-->
    <c:if test="${searchCount ne '0'}">
    <div class='page'>
		<c:if test="${paging.nowPage != 1}">
			<i style="margin-right:20px;"  class="fas fa-caret-left" onclick="location.href = '/community/search?nowPage=${paging.nowPage-1}&cntPerPage=${paging.cntPerPage}&boardCategory=${boardCategory}&searchKeyword=${searchKeyword}'"></i>
		</c:if>
		<div>
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage}">
					<span style="color:lightgray">${p}</span>
				</c:when>
				<c:otherwise>
					<span onclick="location.href= '/community/search?nowPage=${p}&cntPerPage=${paging.cntPerPage}&boardCategory=${boardCategory}&searchKeyword=${searchKeyword}'">${p}</span>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		</div>
		<c:if test="${paging.nowPage != paging.lastPage}">
			<i class="fas fa-caret-right" onclick="location.href= '/community/search?nowPage=${paging.nowPage + 1}&cntPerPage=${paging.cntPerPage}&boardCategory=${boardCategory}&searchKeyword=${searchKeyword}'"></i>
		</c:if>
	</div>
	</c:if>
   </div>
   <script type="text/javascript" src="../../../resources/js/include/chat/chat.js"></script>
   <script type="text/javascript">
   
   function changeList(){
		let category = document.getElementById("selectCategory").value;
		let searchKeyword = document.getElementById("searchKeyword").value;
		
		location.href = "/community/search?boardCategory="+category+"&searchKeyword="+searchKeyword;
	}
   
   document.querySelectorAll("#test").forEach(e => {
		console.dir(e);
		let originText = e.innerHTML;
		let newText= originText.replace(/(<([^>]+)>)/ig,"");
		
		e.innerHTML = newText;
	});
   
   
   </script>
</body>
</html>