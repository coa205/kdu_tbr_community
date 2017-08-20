package com.dgit.service;

import java.util.List;

import com.dgit.domain.MemberVO;

public interface MemberService {
public String readTime() throws Exception;
	
	public int createMember(MemberVO vo) throws Exception;
	
	public void updateMember(MemberVO vo) throws Exception;
	
	public void deleteMember(String id) throws Exception;
	
	public List<MemberVO> readMemberAll() throws Exception;
	
	public MemberVO readMember(String userid) throws Exception;
	
	public MemberVO login(String userid, String userpw) throws Exception;
	
	public int isAdmin(String userid) throws Exception;
}
