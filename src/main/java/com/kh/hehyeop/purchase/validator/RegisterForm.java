package com.kh.hehyeop.purchase.validator;

import java.util.Date;

public class RegisterForm {

	private String id;
	private String itemName;
	private String itemLink;
	private String dealLoc;
	private Date endTime;
	private Date dealTime;
	private int price;
	private int totalNum;
	private int buyNum;
	private String content;


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

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public Date getDealTime() {
		return dealTime;
	}

	public void setDealTime(Date dealTime) {
		this.dealTime = dealTime;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "RegisterForm [id=" + id + ", itemName=" + itemName + ", itemLink=" + itemLink
				+ ", dealLoc=" + dealLoc + ", endTime=" + endTime + ", dealTime=" + dealTime + ", price=" + price
				+ ", totalNum=" + totalNum + ", buyNum=" + buyNum + ", content=" + content + "]";
	}

}
