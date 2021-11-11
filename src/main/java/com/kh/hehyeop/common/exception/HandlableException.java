package com.kh.hehyeop.common.exception;

import com.kh.hehyeop.common.code.ErrorCode;

public class HandlableException extends RuntimeException{

	private static final long serialVersionUID = -4868904722143673702L;
	public ErrorCode error;
	
	public HandlableException(ErrorCode error) {
		this.error = error;
		this.setStackTrace(new StackTraceElement[0]);
	}
	
	public HandlableException(ErrorCode error, Exception e) {
		this.error = error;
	}
}
