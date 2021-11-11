package com.kh.hehyeop.common.code;

public enum Config {

	//DOMAIN("http://pclass.ga"),
	DOMAIN("http://localhost:9090"),
	COMPANY_EMAIL("alssgo70051@gmail.com"),
	SMTP_AUTHENTICATION_ID("alssgo70051@gmail.com"),
	SMTP_AUTHENTICATION_PASSWORD("wkdrhffk1!"),
	UPLOAD_PATH("C:\\CODE\\upload\\");
	
	public final String DESC;
	
	Config(String desc) {
		this.DESC = desc;
	}
	
}
