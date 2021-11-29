package com.kh.hehyeop.purchase.validator;

import java.time.LocalDateTime;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class RegisterForm {

	private String id;
	private String itemName;
	private String itemLink;
	private String dealLoc;
	private String endTime;
	private String dealTime;
	private String content;
	private String oldAddr;
	private int price;
	private int totalNum;
	private int buyNum;
	private int restNum;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getItemLink() {
		return itemLink;
	}

	public void setItemLink(String itemLink) {
		this.itemLink = itemLink;
	}

	public String getDealLoc() {
		return dealLoc;
	}

	public void setDealLoc(String dealLoc) {
		this.dealLoc = dealLoc;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getDealTime() {
		return dealTime;
	}

	public void setDealTime(String dealTime) {
		this.dealTime = dealTime;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getOldAddr() {
		return oldAddr;
	}

	public void setOldAddr(String oldAddr) {
		this.oldAddr = oldAddr;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getTotalNum() {
		return totalNum;
	}

	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}

	public int getBuyNum() {
		return buyNum;
	}

	public void setBuyNum(int buyNum) {
		this.buyNum = buyNum;
	}

	public int getRestNum() {
		return restNum;
	}

	public void setRestNum(int restNum) {
		this.restNum = restNum;
	}

	@Override
	public String toString() {
		return "RegisterForm [id=" + id + ", itemName=" + itemName + ", itemLink=" + itemLink + ", dealLoc=" + dealLoc
				+ ", endTime=" + endTime + ", dealTime=" + dealTime + ", content=" + content + ", oldAddr=" + oldAddr
				+ ", price=" + price + ", totalNum=" + totalNum + ", buyNum=" + buyNum + ", restNum=" + restNum + "]";
	}

}
