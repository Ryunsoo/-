package com.kh.hehyeop.member.validator;

public class CoJoinForm {

	private String id;
	private String password;
	private String tell;
	private String email;
	private String company;
	private String address;
	private String oldAddress;
	private String cIdx;

	public String getId() {
		return id;
	}

	public void setId(String cId) {
		this.id = cId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTell() {
		return tell;
	}

	public void setTell(String tell) {
		this.tell = tell;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getOldAddress() {
		return oldAddress;
	}

	public void setOldAddress(String oldAddress) {
		this.oldAddress = oldAddress;
	}

	public String getcIdx() {
		return cIdx;
	}

	public void setcIdx(String cIdx) {
		this.cIdx = cIdx;
	}

	@Override
	public String toString() {
		return "CoJoinForm [id=" + id + ", password=" + password + ", tell=" + tell + ", email=" + email
				+ ", company=" + company + ", address=" + address + ", oldAddress=" + oldAddress + ", cIdx=" + cIdx
				+ "]";
	}

}
