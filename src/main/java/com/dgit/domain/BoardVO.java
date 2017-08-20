package com.dgit.domain;

import java.util.Arrays;
import java.util.Date;

public class BoardVO {
	private Integer bno;
	private String title;
	private String content;
	private String userid;
	private String nickname;
	private Date regdate;
	private int viewcnt;
	private int recomcnt;
	private String kindboard;
	private int replyCnt;
	private String bookname;
	private int isbest;
	private double scoreavg;
	private String[] files;
	private Integer bebno;
	
	public Integer getBno() {
		return bno;
	}
	
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
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
	
	public int getViewcnt() {
		return viewcnt;
	}
	
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	
	public int getRecomcnt() {
		return recomcnt;
	}
	
	public void setRecomcnt(int recomcnt) {
		this.recomcnt = recomcnt;
	}
	
	public String getKindboard() {
		return kindboard;
	}
	
	public void setKindboard(String kindboard) {
		this.kindboard = kindboard;
	}
	
	public int getReplyCnt() {
		return replyCnt;
	}
	
	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}
	
	public String getBookname() {
		return bookname;
	}

	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	
	public int getIsbest() {
		return isbest;
	}

	public void setIsbest(int isbest) {
		this.isbest = isbest;
	}

	public double getScoreavg() {
		return scoreavg;
	}

	public void setScoreavg(double scoreavg) {
		this.scoreavg = scoreavg;
	}

	public String[] getFiles() {
		return files;
	}
	
	public void setFiles(String[] files) {
		this.files = files;
	}
	
	public Integer getBebno() {
		return bebno;
	}

	public void setBebno(Integer bebno) {
		this.bebno = bebno;
	}

	@Override
	public String toString() {
		return String.format(
				"BoardVO [bno=%s, title=%s, content=%s, userid=%s, nickname=%s, regdate=%s, viewcnt=%s, recomcnt=%s, kindboard=%s, replyCnt=%s, bookname=%s, isbest=%s, scoreavg=%s, files=%s, bebno=%s]",
				bno, title, content, userid, nickname, regdate, viewcnt, recomcnt, kindboard, replyCnt, bookname,
				isbest, scoreavg, Arrays.toString(files), bebno);
	}

}
