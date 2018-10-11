package com.itbank.pet.member;

public class MemberDTO {
	private String id;
	private String pw;
	private String nickname;
	private String name;
	private String address;
	private String tel;
	private String birth;
	private String pethospital;
	
	public String getPethospital() {
		return pethospital;
	}
	public void setPethospital(String pethospital) {
		this.pethospital = pethospital;
	}
	public String getId() {
		return id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String addr) {
		this.address = addr;
	}
}
