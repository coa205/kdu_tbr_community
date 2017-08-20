package com.dgit.domain;

import java.util.Date;

public class MessageVO {
	private String addresser;
	private String addressee;
	private String title;
	private String message;
	private Date regdate;
	private String nickname;
	
	public String getAddresser() {
		return addresser;
	}
	
	public void setAddresser(String addresser) {
		this.addresser = addresser;
	}
	
	public String getAddressee() {
		return addressee;
	}
	
	public void setAddressee(String addressee) {
		this.addressee = addressee;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getMessage() {
		return message;
	}
	
	public void setMessage(String message) {
		this.message = message;
	}
	
	public Date getRegdate() {
		return regdate;
	}
	
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	public String getNickname() {
		return nickname;
	}
	
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	@Override
	public String toString() {
		return String.format("MessageVO [addresser=%s, addressee=%s, title=%s, message=%s, regdate=%s, nickname=%s]",
				addresser, addressee, title, message, regdate, nickname);
	}
	
}
