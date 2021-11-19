package com.kh.hehyeop.help.validator;

public class RequestForm {
	
	private String reqName;
	private String reqTell;
	private String reqTime;
	private int reqPay;
	private String reqContent;
	
	public String getReqName() {
		return reqName;
	}
	public void setReqName(String reqName) {
		this.reqName = reqName;
	}
	public String getReqTell() {
		return reqTell;
	}
	public void setReqTell(String reqTell) {
		this.reqTell = reqTell;
	}
	public String getReqTime() {
		return reqTime;
	}
	public void setReqTime(String reqTime) {
		this.reqTime = reqTime;
	}
	public int getReqPay() {
		return reqPay;
	}
	public void setReqPay(int reqPay) {
		this.reqPay = reqPay;
	}
	public String getReqContent() {
		return reqContent;
	}
	public void setReqContent(String reqContent) {
		this.reqContent = reqContent;
	}
	@Override
	public String toString() {
		return "RequestForm [reqName=" + reqName + ", reqTell=" + reqTell + ", reqTime=" + reqTime + ", reqPay="
				+ reqPay + ", reqContent=" + reqContent + "]";
	}
	
	
}
