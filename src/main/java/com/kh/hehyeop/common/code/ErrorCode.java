package com.kh.hehyeop.common.code;

public enum ErrorCode {
	
	DATABASE_ACCESS_ERROR("데이터베이스와 통신 중 에러가 발생하였습니다."),
	VALIDATOR_FAIL_ERROR("부적절한 양식의 데이터 입니다."),
	MAIL_SEND_FAIL_ERROR("이메일 발송 중 에러가 발생하였습니다."),
	HTTP_CONNECT_ERROR("HTTP 통신 중 에러가 발생하였습니다."),
	AUTHENTICATION_FAILED_ERROR("유효하지 않은 인증입니다."),
	UNAUTHORIZED_PAGE_ERROR("접근 권한이 없는 페이지 입니다."),
	FAILED_FILE_UPLOAD_ERROR("파일업로드에 실패하였습니다."),
	BEFORE_LOGIN_ERROR("로그인 후 이용 가능합니다.", "/member/login-form"),
	COMPANY_LOGIN_ERROR("일반회원 전용 페이지입니다.", "/company/main"),
	NORMAL_LOGIN_ERROR("업체회원 전용 페이지입니다."),
	MATCH_BOARD_ERROR("글 작성자가 아닙니다.", "/purchase/main"),
	MATCH_BOARD_ERROR_WRITER("글 작성자는 접근 할 수 없습니다.", "/purchase/main"),
	MATCH_DATE_ERROR("거래 시간 이전에는 누를 수 없습니다.", "/purchase/main"),
	EMPTY_JOIN_ERROR("이미 구매 확정이 완료된 게시글입니다.", "/purchase/main"),
	ADMIN_LOGIN_ERROR("관리자만 이용 가능합니다.", "/member/login-form"),
	MYPAGE_ACCESS_ERROR("승인 요청 상태일 때는 수정을 할 수 없습니다.", "/mypage/mypage-company"),
	PRIVATE_ACCESS_ERROR("비밀글은 관리자만 접근할 수 있습니다.", "/community/list"),
	REDIRECT("");
	
	public final String MESSAGE;
	public String URL;
	
	private ErrorCode(String msg) {
		this.MESSAGE = msg;
		this.URL = "/";
	}
	
	private ErrorCode(String msg, String url) {
		this.MESSAGE = msg;
		this.URL = url;
	}

	public ErrorCode setURL(String uRL) {
		URL = uRL;
		return this;
	}
	
	
}
