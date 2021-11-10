<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<style type="text/css">
	.valid-msg{color:red; font-size:0.5vw;}
</style>
<body>

<h1 style="text-align: center;">PCLASS TOY PROJECT</h1>

	<span class="valid-msg">${message}</span>

	<h2><a href="/member/login">login</a></h2>
	<h2><a href="/member/join">회원가입</a></h2>

	<h1>${authentication.userId}님 안녕?</h1>
	<h2><a href="/member/logout">logout</a></h2>
	<h2><a href="/member/mypage">마이페이지</a></h2>
	<h2><a href="/board/board-form">게시글 작성</a></h2>



</body>
</html>