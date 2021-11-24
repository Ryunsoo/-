package com.kh.hehyeop.common.util.file;

import java.util.Date;

import com.kh.hehyeop.common.code.Config;

public class FileDTO {

	private String fileIdx;
	private String fileCategory;
	private String originName;
	private String reName;
	private String savePath;
	private Date regDate;
	private int isDel;
	private String typeIdx;

	public String getFileIdx() {
		return fileIdx;
	}

	public void setFileIdx(String fileIdx) {
		this.fileIdx = fileIdx;
	}

	public String getFileCategory() {
		return fileCategory;
	}

	public void setFileCategory(String fileCategory) {
		this.fileCategory = fileCategory;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getReName() {
		return reName;
	}

	public void setReName(String reName) {
		this.reName = reName;
	}

	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getIsDel() {
		return isDel;
	}

	public void setIsDel(int isDel) {
		this.isDel = isDel;
	}

	public String getTypeIdx() {
		return typeIdx;
	}

	public void setTypeIdx(String typeIdx) {
		this.typeIdx = typeIdx;
	}
	
	public String getLink() {
		return Config.DOMAIN.DESC + "/file/" + savePath + reName;
	}

	@Override
	public String toString() {
		return "FileDTO [fileIdx=" + fileIdx + ", fileCategory=" + fileCategory + ", originName=" + originName
				+ ", reName=" + reName + ", savePath=" + savePath + ", regDate=" + regDate + ", isDel=" + isDel
				+ ", typeIdx=" + typeIdx + "]";
	}

}
