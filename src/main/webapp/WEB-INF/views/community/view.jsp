<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="../../../resources/css/include/head/menu_head.css" type="text/css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel='stylesheet' href="../../../resources/css/community/style.css">
<link rel='stylesheet' href="../../../resources/css/include/chat/chat.css">
<style type="text/css">
.header{
	margin-left: 15px;
}

.header_right{
	flex-wrap: wrap;
	align-content: flex-start;
}
</style>
</head>
<body>
<div id="modal"></div>
<%@ include file="/WEB-INF/views/include/chat/chat.jsp" %>
    <!--헤더자리-->
    <div class="wrap">
      <c:choose>
 	 	<c:when test="${authentication.grade eq SUPER}">
 	 		<%@ include file="/WEB-INF/views/include/head/admin-head.jsp" %>
 	 	</c:when>
 	 	<c:otherwise>
 	 		<%@ include file="/WEB-INF/views/include/head/menu-head.jsp" %>
 	 	</c:otherwise>
 	 </c:choose>
      <link rel="stylesheet" href="../../../resources/css/community/view_board.css"/>
      
      <div id="search_case">
        <div id="search_case_inner_div_1"><h3 style="line-height: 2">소통해협</h3><img class="bee" src="../../../resources/image/bee3.png"></div>
   	</div>
     <!--nav와 header 끝-->
     <div class="view_body">
     <!--write페이지 body작업시작-->
    <div id="view_body_container" style="display:block;">
        
    
    <!--index페이지 body작업 끝-->
    <!--view페이지 맨위 사용자 정보 -->
    <div id="view_content">
    	<div id="view_page_top_user_info">
    		<div id="content_title">
    			<div id="medal_img">${board.boardCategory}</div>
	      		<div id="title_box">${board.title}</div>
    		</div>
    		
    		<div id="content_info">
    			<div id="username">${board.nickname}</div>
			    <div id="date">${board.parseDate}</div>
			    <div id="view_cnt">${board.viewCnt}</div>
			    <c:if test="${authentication.id eq board.id}">
			    	<div id="dib">|</div>
			    	<div id="modify" onClick="location.href ='http://localhost:9090/community/modify?boardIdx=${board.boardIdx}'">수정</div>
			   	 	<div id="delete" style="cursor: pointer;" onclick="deleteModal('${board.boardIdx}')">삭제</div> 
			    </c:if>
    		</div>
	    </div>
	    <!--view 페이지 맨위 사용자 정보끝-->
	
	   <!--댓글전 사용자 글내용-->
	   <div id="view_contents">${board.content}</div>
    </div>
     </div>   	
   </div>
   <!--댓글전 사용자 글내용끝-->
   <!--댓글시작-->
   <div class="view_body">
		<div id="comment_wrap">
			<c:if test="${not empty replyList}">
				<div id="view_comment_notice">
					<div id="com_line"></div>
					<div id="comment_cnt">댓글 [${replyCnt}]</div>
					<div id="com_line_two"></div>
				</div>
			</c:if>
			<!--댓글모음시작-->
			<div id="view_comments2">
				<c:forEach items="${replyList}" var="rl">
					<div id="comment_item">
						<div id="comment_user">${rl.nickname}</div>
						<div id="item_line"></div>
						<div id="${rl.replyIdx}" class="comment_content">${rl.content}</div>
						<c:choose>
							<c:when test="${authentication.id eq rl.id}"> 
								<form id="form-${rl.replyIdx}" style="display: none;"
									class="comment_content" action="/community/modify-reply"
									method="post">
									<input style="display: none;" type="text" name="boardIdx"
										value="${board.boardIdx}" /> <input style="display: none;"
										type="text" name="replyIdx" value="${rl.replyIdx}"> <input
										id="modify-reply-form" type="text" name="content">
									<button id="modify-reply_btn" type="submit">수정</button>
								</form>
								<div class="comment-func">
									<div id="edit_date">${rl.parseDate}</div>
									<div id="edit_item">
										<div id="comment_modify"
											onclick="modifyReply('${rl.replyIdx}')">수정</div>
										<div id="comment_delete"
											onclick="location.href='/community/delete-reply?replyIdx=${rl.replyIdx}&boardIdx=${board.boardIdx}'">삭제</div>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<form id="form-${rl.replyIdx}" style="display: none;"
									class="comment_content" action="/community/re-reply"
									method="post">
									<input style="display: none;" type="text" name="boardIdx"
										value="${board.boardIdx}" /> <input style="display: none;"
										type="text" name="replyIdx" value="${rl.replyIdx}"> <input
										id="modify-reply-form" type="text" name="content"> <input
										style="display: none;" type="text" name="id"
										value="${authentication.id}" />
									<button id="modify-reply_btn" type="submit">답글 달기</button>
								</form>
								<div class="comment-func">
									<div id="edit_date">${rl.parseDate}</div>
									<div id="edit_item">
										<div id="comment_reply"
											onclick="modifyReply('${rl.replyIdx}')">답글</div>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
					<c:forEach items="${reReplyList}" var="rrl">
						<c:if test="${rl.replyIdx eq rrl.replyIdx}">
						<div class="reply_flex_wrap">
							<i class="fas fa-reply fa-rotate-180"></i>
								<div id="reply_item">
									<div id="comment_user">${rrl.nickname}</div>
									<div id="item_line"></div>
									<div class="reply_content">${rrl.content}</div>
									<c:choose>
										<c:when test="${authentication.id eq rrl.id}">
											<div class="comment-func">
												<div id="edit_date">${rrl.parseDate}</div>
												<div id="edit_item">
													<div id="comment_modify">수정</div>
													<div id="comment_delete"
														onclick="location.href='/community/delete-reReply?reReplyIdx=${rrl.reReplyIdx}&boardIdx=${board.boardIdx}'">삭제</div>
												</div>
											</div>
										</c:when>
										<c:otherwise>
											<div class="comment-func">
												<div id="edit_date">${rl.parseDate}</div>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</c:forEach>
			</div>
			<div id="write_comment_notice">
				<div id="com_line"></div>
				<div id="comment_cnt">댓글 등록</div>
				<div id="com_line_two"></div>
			</div>
			<form action="/community/write-reply" method="post">
				<textarea id="write_comment" name="content"></textarea>
				<div id="submit_wrap">
					<input style="display: none;" type="text" name="boardIdx"
						value="${board.boardIdx}" /> <input style="display: none;"
						type="text" name="id" value="${authentication.id}" />
					<button type="submit" id="submit_comment">등록</button>
				</div>
			</form>
			<!--댓글모음끝-->
			<!--댓글 끝-->
			<!--view_body_container끝-->
			
		</div>
</div>
		<footer style="height: 100px;"></footer>
   </div>

   	<c:if test="${not empty message}">
		<script>alert('${message}')</script>
	</c:if>

   <!--wrap == container 끝-->
  
  <script type="text/javascript">
  
  function deleteModal(idx) {
      let sendModal = initModal('modal', 3);
      appendTitle(sendModal, '게시글을 삭제하시겠습니까?', true);
      setButton(sendModal, '취소', '삭제');
      setContent(sendModal, true, true);
      modalBlock();
      	
      $('.modal_left_btn').click(function() {
      	modalNone();
      })
      
      $('.modal_right_btn').click(function () {
    	  modalNone();
    	  location.href = '/community/delete-board?boardIdx='+idx;
      })
      
  }
  
  </script>
  <script type="text/javascript" src="../../../resources/js/include/chat/chat.js"></script>
</body>
<script type="text/javascript">

function modifyReply(id){
	
	if (document.getElementById("form-"+id).style.display == 'none'){
		document.getElementById(id).style.display = 'none';
		document.getElementById("form-"+id).style.display = 'block';
	} else {
		document.getElementById(id).style.display = 'block';
		document.getElementById("form-"+id).style.display = 'none';
	}
	
}

</script>
</html>