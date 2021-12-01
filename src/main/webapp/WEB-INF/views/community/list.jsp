<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../../../resources/css/community/style.css"/>
<link rel="stylesheet" href="../../../resources/css/community/index_css.css"/>
<link href="../../../resources/css/include/head/menu_head.css" type="text/css" rel="stylesheet">
<link rel='stylesheet' href="../../../resources/css/include/chat/chat.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

function alert(msg){
	let modal = initModal('modal', 3);
	appendTitle(modal, '');
	setButton(modal, '닫기');
	setContent(modal, true, true);
	modalBlock();
	
	let modalBody = $('<div class="alert">'+msg+'</div><br>')
	.addClass('send_modal_content');
	
	$('.modal_content').append(modalBody);
	
	$('.modal_left_btn').click(function() {
		modalNone();
	})
}

</script>
<style type="text/css">
.alert {
	text-align: center;
	font-size: 20px;
	font-weight: bold;
}

.modal_content{
	justify-content: center;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/chat/chat.jsp" %>
<div id='modal'></div>
 <div class="wrap">
     <%@ include file="/WEB-INF/views/include/head/menu-head.jsp" %>
     <!--nav와 header 끝-->
    <div id="search_case">
        <div id="search_case_inner_div_1"><h3 style="line-height: 2">소통해협</h3><img class="bee" src="../../../resources/image/bee3.png"></div>
        <div id="search_case_inner_div_3">
           <SELECT NAME=sltSample SIZE=1>
              <OPTION VALUE="" disabled selected>카테고리 선택</OPTION>
              <OPTION VALUE="음식">음식</OPTION>
              <OPTION VALUE="잡담">잡담</OPTION>
              <OPTION VALUE="나눔">나눔</OPTION>
              <OPTION VALUE="추천">추천</OPTION>
           </SELECT>
           <input type="text">
           <i id="search" class="far fa-search"></i>
        </div>
    </div>
    
    <div class="write_body">
    
    <!--index페이지 body작업시작-->
    <div id="index_body_container">
    <i class="fas fa-pen-square" onclick="location.href = '/community/write'"></i>
        <table>
            <!--여기에 나중에 spring로 forEach문-->
            <!-- tr 샘플따기 시작 -->
            <c:forEach items="${commuList}" var="cl">
            <tr>
                <td>
                    <div class="tr_inner_container" onclick="location.href = '/community/view?boardIdx=${cl.boardIdx}'">
                        <div class="tr_inner_up_div">
                        	<div class="title_wrap">
		                        <div class="board_kinds">${cl.boardCategory}</div>
		                        <c:if test="${cl.isPrivate eq 1}">
		                        	<div class="board_title">${cl.title} <i style="margin: 8px 0 0 10px;" class="fas fa-lock"></i></div>
		                        </c:if>
		                        <c:if test="${cl.isPrivate eq 0}">
		                        	<div class="board_title">${cl.title}</div>
		                        </c:if>
		                    </div>
		                    <div class="id_wrap">
		                        <div class="board_writer">${cl.nickname}</div>
		                        <div class="board_date">${cl.parseDate}</div>
		                        <div class="board_view_cnt">${cl.viewCnt}</div>
		                    </div>
                        </div>

                        <div class="tr_inner_under_div">
                            <div class="tr_inner_under_div_contents">
                                ${cl.content}
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
            </c:forEach>
        </table>
    </div>
   </div>

    <!--footer은 글쓰기 페이지엔 존재하지 않으니 index, view_board에만 사용-->
    <div class='page'>
		<c:if test="${paging.nowPage != 1}">
			<i style="margin-right:20px;"  class="fas fa-caret-left" onclick="location.href = '/community/list?nowPage=${paging.nowPage-1}&cntPerPage=${paging.cntPerPage}'"></i>
		</c:if>
		<div>
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage}">
					<span style="color:lightgray">${p}</span>
				</c:when>
				<c:otherwise>
					<span onclick="location.href= '/community/list?nowPage=${p}&cntPerPage=${paging.cntPerPage}'">${p}</span>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		</div>
		<c:if test="${paging.nowPage != paging.lastPage}">
			<i class="fas fa-caret-right" onclick="location.href= '/community/list?nowPage=${paging.nowPage + 1}&cntPerPage=${paging.cntPerPage}'"></i>
		</c:if>
	</div>
   </div>
   
   	<c:if test="${not empty message}">
		<script>alert('${message}')</script>
	</c:if>
   <!--wrap == container 끝-->
   <script type="text/javascript" src="../../../resources/js/include/chat/chat.js"></script>
</body>
</html>