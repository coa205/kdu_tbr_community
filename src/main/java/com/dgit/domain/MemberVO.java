package com.dgit.domain;

import java.util.Arrays;
import java.util.Date;

public class MemberVO {
	private String userid;
	private String userpw;
	private String nickname;
	private String email;
	private String memberpic;
	private Date regdate;
	private Date updatedate;
	
	public MemberVO() {}

	public String getUserid() {
		return userid;
	}
	
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	public String getUserpw() {
		return userpw;
	}
	
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	
	public String getNickname() {
		return nickname;
	}
	
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getMemberpic() {
		return memberpic;
	}

	public void setMemberpic(String memberpic) {
		this.memberpic = memberpic;
	}

	public Date getRegdate() {
		return regdate;
	}
	
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	public Date getUpdatedate() {
		return updatedate;
	}
	
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}

	@Override
	public String toString() {
		return String.format(
				"MemberVO [userid=%s, userpw=%s, nickname=%s, email=%s, memberpic=%s, regdate=%s, updatedate=%s]",
				userid, userpw, nickname, email, memberpic, regdate, updatedate);
	}

}
