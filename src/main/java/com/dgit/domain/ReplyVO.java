package com.dgit.domain;

import java.util.Date;

public class ReplyVO {
	private Integer rno;
	private Integer bno;
	private String replytext;
	private String userid;
	private String nickname;
	private Date regdate;
	private Date updatedate;
	private double score;
	private String kindboard;
	private String memberpic;
	
	public Integer getRno() {
		return rno;
	}
	
	public void setRno(Integer rno) {
		this.rno = rno;
	}
	
	public Integer getBno() {
		return bno;
	}
	
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	
	public String getReplytext() {
		return replytext;
	}
	
	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
	
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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
	
	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}
	
	public String getKindboard() {
		return kindboard;
	}

	public void setKindboard(String kindboard) {
		this.kindboard = kindboard;
	}
	
	public String getMemberpic() {
		return memberpic;
	}

	public void setMemberpic(String memberpic) {
		this.memberpic = memberpic;
	}

	@Override
	public String toString() {
		return String.format(
				"ReplyVO [rno=%s, bno=%s, replytext=%s, userid=%s, nickname=%s, regdate=%s, updatedate=%s, score=%s, kindboard=%s, memberpic=%s]",
				rno, bno, replytext, userid, nickname, regdate, updatedate, score, kindboard, memberpic);
	}

}
