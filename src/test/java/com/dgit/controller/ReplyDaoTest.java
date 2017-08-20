package com.dgit.controller;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dgit.domain.ReplyVO;
import com.dgit.persistence.ReplyDao;
import com.dgit.service.ReplyService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ReplyDaoTest {
	
	@Autowired
	private ReplyDao dao;
	
	@Autowired
	private ReplyService service;
	
	//@Test
	public void testCreate() throws Exception{
		ReplyVO vo = new ReplyVO();
		vo.setBno(100);
		vo.setReplytext("댓글을 달았습니다.");
		vo.setUserid("user00");
		vo.setNickname("nick00");
		vo.setKindboard("voca");
		dao.create(vo);
	}
	
	//@Test
	public void testUpdate() throws Exception{
		ReplyVO vo = new ReplyVO();
		vo.setRno(1);
		vo.setBno(100);
		vo.setReplytext("댓글을 수정하였습니다.");
		vo.setKindboard("voca");
		dao.update(vo);
	}
	
	//@Test
	public void testList() throws Exception{
		List<ReplyVO> list = dao.list(100, "voca");
		for(ReplyVO vo : list){
			System.out.println("댓글 번호 : " + vo.getBno());
			System.out.println("댓글 내용 : " + vo.getReplytext());
			System.out.println("댓글 작성자 : " + vo.getNickname());
		}
	}
	
	//@Test
	public void testDelete() throws Exception{
		dao.delete(1, 2, "voca");
	}
	
	//@Test
	public void testRemove() throws Exception{
		service.removeReply(1, 2, "lc");
	}
	
}
