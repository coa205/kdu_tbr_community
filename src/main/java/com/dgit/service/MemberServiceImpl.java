package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.MemberVO;
import com.dgit.persistence.MemberDao;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao dao;
	
	@Override
	public String readTime() throws Exception {
		return dao.readTime();
	}

	@Override
	public int createMember(MemberVO vo) throws Exception {
		return dao.createMember(vo);
	}

	@Override
	public void updateMember(MemberVO vo) throws Exception {
		dao.updateMember(vo);
	}

	@Override
	public void deleteMember(String id) throws Exception {
		dao.deleteMember(id);
	}

	@Override
	public List<MemberVO> readMemberAll() throws Exception {
		return dao.readMemberAll();
	}

	@Override
	public MemberVO readMember(String userid) throws Exception {
		return dao.readMember(userid);
	}

	@Override
	public MemberVO login(String userid, String userpw) throws Exception {
		return dao.login(userid, userpw);
	}

	@Override
	public int isAdmin(String userid) throws Exception {
		return dao.isAdmin(userid);
	}

}
